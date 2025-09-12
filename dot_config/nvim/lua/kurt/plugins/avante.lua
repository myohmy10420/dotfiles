local setup, avante = pcall(require, "avante")

if not setup then
  return
end

avante.setup({
  auto_suggestions_provider = "openai",
  opts = {
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0,
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  }
})
