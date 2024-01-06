local dbpath = vim.loop.cwd() .. "/tests/lua/test.db"
local sqlite = require("sqlite")
local table_name = "example_table"

describe("sql", function()
	it("test", function()
		local db = sqlite:open(dbpath)
		db:insert(table_name, { { name = "test", id = 1234 } })
		db:close()
		assert.equals(vim.loop.cwd(), 6)
	end)
end)
