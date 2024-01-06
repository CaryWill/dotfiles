local dbpath = vim.loop.cwd() .. "/tests/lua/test.db"
local sqlite = require("sqlite")
local table_name = "example_table"

describe("sql", function()
	it("test", function()
		local db = sqlite:open(dbpath)
		-- db:insert(table_name, { name = "test", id = 12345 })
		local records = db:select(table_name, { where = { name = "test" } })
		db:close()
		assert.equals(records == nil, false)
	end)
end)
