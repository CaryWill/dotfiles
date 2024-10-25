local status, plugin = pcall(require, "hardtime")
if not status then
	return
end
require("hardtime").setup()
