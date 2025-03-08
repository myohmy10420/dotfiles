local setup, avante = pcall(require, "avante")

if not setup then
  return
end

avante.setup({
  provider = "openai",
  auto_suggestions_provider = "openai",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o-mini",
    temperature = 0,
    max_tokens = 4096,
  }
})
