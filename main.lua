local LMM = require 'LMM' -- Include the module

function love.load()
	LMM.init() 	-- Include a seed, otherwise its os.time()
end

-- Thats it, just call functions as needed.