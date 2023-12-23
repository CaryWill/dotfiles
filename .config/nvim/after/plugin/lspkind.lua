local status, indentscope = pcall(require, "lspkind")
if not status then
	return
end

require("lspkind").init({
	symbol_map = {
		NatDat = "📅 ",
	},
})
