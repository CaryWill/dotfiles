local status, indentscope = pcall(require, "mini.indentscope")
if (not status) then return end

-- TODO: how to disable on certain filetypes
-- https://gitcode.net/sunn4gh/astrocommunity/-/blob/1c67074be443bfc101807e0239317ef175de70a2/lua/astrocommunity/indent/mini-indentscope/init.lua
indentscope.setup({
})

local status1, pairs = pcall(require, "mini.pairs")
if (not status1) then return end
pairs.setup()

local status2, surround = pcall(require, "mini.surround")
if (not status2) then return end
surround.setup()

local status3, ai = pcall(require, "mini.ai")
if (not status3) then return end
ai.setup()
