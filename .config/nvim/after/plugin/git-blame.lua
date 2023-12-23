local status, plugin = pcall(require, "gitblame")
if (not status) then return end

require('gitblame').setup {
  --Note how the `gitblame_` prefix is omitted in `setup`
  enabled = true,
}
