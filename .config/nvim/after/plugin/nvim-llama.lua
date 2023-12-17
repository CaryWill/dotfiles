local status, plugin = pcall(require, "nvim-llama")
if (not status) then return end

plugin.setup {
  -- See plugin debugging logs
  debug = false,
  -- The model for ollama to use. This model will be automatically downloaded.
  model = 'llama2',
}
