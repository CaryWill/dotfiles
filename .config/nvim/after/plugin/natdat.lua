local status, plugin = pcall(require, "cmp_natdat")
if not status then
	return
end

plugin.setup({ cmp_kind_text = "NatDat", highlight_group = "Red" })
