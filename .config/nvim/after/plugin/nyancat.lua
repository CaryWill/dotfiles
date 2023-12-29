-- local api = require("image")

-- local counter = 1
-- local interval_duration = 100 -- in milliseconds
-- local max_repetitions = 12

-- local function myIntervalFunction()
-- 	print(counter)

-- 	local geometry = {
-- 		x = 300,
-- 		y = 320,
-- 		width = 100,
-- 		height = 10,
-- 	}

-- 	local file = "/Users/cary/workspace/github/dotfiles/assets/nc/" .. counter .. ".png"
-- 	local image = api.from_file(file, {
-- 		x = 75,
-- 		y = 30,
-- 		width = 10,
-- 		height = 3,
-- 		geometry,
-- 		buffer = 0,
-- 		-- window = vim.api.nvim_get_current_win(),
-- 	})

-- 	image:clear()
-- 	image:render()

-- 	counter = counter + 1

-- 	if counter > max_repetitions then
-- 		counter = 1 -- Reset the counter
-- 	end

-- 	vim.defer_fn(myIntervalFunction, interval_duration)
-- end

-- -- Start the interval
-- vim.defer_fn(myIntervalFunction, interval_duration)

-- -- image:render(geometry) update image geometry and render it
-- -- image:clear()

-- -- image:move(x, y) -- move image
-- -- image:brightness(value) -- change brightness
-- -- image:saturation(value) -- change saturation
-- -- image:hue(value) -- change hue
