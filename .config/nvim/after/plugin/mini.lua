local status, indentscope = pcall(require, "mini.indentscope")
if status then
	indentscope.setup({})
end

-- TODO: how to disable on certain filetypes
-- https://gitcode.net/sunn4gh/astrocommunity/-/blob/1c67074be443bfc101807e0239317ef175de70a2/lua/astrocommunity/indent/mini-indentscope/init.lua

local status1, pairs = pcall(require, "mini.pairs")
if status1 then
	pairs.setup()
end

local status2, surround = pcall(require, "mini.surround")
if status2 then
	surround.setup()
end

local status3, ai = pcall(require, "mini.ai")
if status3 then
	ai.setup()
end

local status4, comment = pcall(require, "mini.comment")
if status4 then
	comment.setup()
end
