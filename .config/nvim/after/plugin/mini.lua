local status, indentscope = pcall(require, "mini.indentscope")
if (not status) then return end
indentscope.setup()

local status1, pairs = pcall(require, "mini.pairs")
if (not status1) then return end
pairs.setup()

local status2, surround = pcall(require, "mini.surround")
if (not status2) then return end
surround.setup()

local status3, ai = pcall(require, "mini.ai")
if (not status3) then return end
ai.setup()
