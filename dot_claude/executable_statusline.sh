#!/bin/bash
input=$(cat)

# --- 顏色定義 ---
CYAN='\033[1;36m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; RED='\033[1;31m'
GRAY='\033[0;90m'; MAGENTA='\033[1;35m'; BLUE='\033[1;34m'; RESET='\033[0m'

# --- 1. 數據提取 ---
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // "unknown"' | xargs basename)

# 直接向系統抓 Git 分支 (解決 none 的問題)
REAL_BRANCH=$(git branch --show-current 2>/dev/null)
[ -z "$REAL_BRANCH" ] && REAL_BRANCH=$(echo "$input" | jq -r '.worktree.branch // "none"')

SID=$(echo "$input" | jq -r '.session_id // "N/A"' | cut -c1-8)
IN_TK=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
OUT_TK=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0' | xargs printf "%.2f")

# 超過 200k 警告 (Boolean)
EXC200=$(echo "$input" | jq -r '.exceeds_200k_tokens // false')

# 各項百分比與重置時間
CTX_P=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | awk '{print int($1+0.5)}')
RL5_P=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // 0' | awk '{print int($1+0.5)}')
RL5_T=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // 0')
RL7_P=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // 0' | awk '{print int($1+0.5)}')
RL7_T=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // 0')

# 時間格式化
fmt_t() { [ "$1" -eq 0 ] && echo "--:--" || (date -r "$1" +"$2" 2>/dev/null || date -d @"$1" +"$2"); }

# 5h 保持只顯示時間 (例如: 14:00)
T5=$(fmt_t "$RL5_T" "%H:%M")

# 7d 加入月與日 (例如: 03/26 14:00)
T7=$(fmt_t "$RL7_T" "%m/%d %H:%M")

# --- 2. 進度條產生器 ---
make_bar() {
    local p=$1 width=$2 color=$GREEN
    [ $p -ge 50 ] && color=$YELLOW
    [ $p -ge 80 ] && color=$RED
    local filled=$(( (p * width + 50) / 100 ))
    [ $filled -gt $width ] && filled=$width
    local empty=$(( width - filled ))
    printf "${color}$(printf "%${filled}s" | tr ' ' '█')${GRAY}$(printf "%${empty}s" | tr ' ' '░')${RESET}"
}

# --- 3. 輸出儀表板 ---

# 第一行：模型 | 📁 目錄 | 🌿 分支 (直接抓系統) | 🆔 SID
echo -e "  ${CYAN}[$MODEL]${RESET}  📁 $DIR  |  🌿 ${GREEN}${REAL_BRANCH}${RESET}  |  ${GRAY}ID:${RESET} $SID"

# 進度條統一設定為 10 格
BAR_CTX=$(make_bar $CTX_P 10)
BAR_RL5=$(make_bar $RL5_P 10)
BAR_RL7=$(make_bar $RL7_P 10)

# 超過 200k 時顯示警告燈
WARN_LIGHT=""
if [ "$EXC200" = "true" ]; then
    WARN_LIGHT=" | ${RED}⚠️ >200k${RESET}"
fi

# 第二行：🧠 記憶 | ⚠️ 200k (如果有) | ⚡ RL5 | 📅 RL7
echo -e "  🧠 ${BAR_CTX} ${CTX_P}%${WARN_LIGHT} | ${MAGENTA}⚡5h:${BAR_RL5}${RL5_P}%($T5)${RESET} | ${MAGENTA}📅7d:${BAR_RL7}${RL7_P}%($T7)${RESET}"

# 第三行：📊 圖示對齊 | 🔼/🔽 Token | 💰 費用
echo -e "  📊 ${BLUE}🔼${IN_TK} ${GRAY}/${RESET} 🔽${OUT_TK}${RESET} | ${YELLOW}💰\$${COST}${RESET}"
