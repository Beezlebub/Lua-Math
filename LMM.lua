
local lMath = {
	_Version 		= 'lMath v0.2.4',
	_Author 		= 'Beelz',
	_Description 	= 'Lua Math Module',
	_URL         	= 'https://github.com/Beezlebub/Lua-Math',
	_LICENSE     	= 
	[[
		The MIT License (MIT)
		Copyright (c) 2016 Andrew Dean

		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:
		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
	]]
}

-- For random letters
local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

local LM = love.math

function lMath.init(seed) 	-- set seed
	LM.setRandomSeed(seed or os.time())
end

function lMath.number(low, high)	-- random num
	if low == nil and high == nil then return LM.random(0, 100) end
	if high == nil then return LM.random(low) end
	return LM.random(low, high)
end

function lMath.letter() 	-- random letter
	return letters[lMath.number(1, 26)]
end

function lMath.bool(chance) -- % chance of true
	chance = chance or 50
	if chance > 100 then return true end
	if chance < 1 then return false end
	return lMath.number() < chance
end

function lMath.item(tbl)	-- random value from a table
	return tbl[lMath.number(1, #tbl)]
end

function lMath.dice(val, rolls) 
	rolls = rolls or 1
	local results = {}
	for i = 1, rolls do
		results[i] = LM.random(1, val)
	end
	return results
end

function lMath.round(num, places)
	local pow = 10 ^ (places or 0)
    return math.floor(num * pow + .5) / pow
end

function lMath.color()
	local color = {
		r = lMath.number(255),
		g = lMath.number(255),
		b = lMath.number(255)
	}
	return color
end

function lMath.colorA()
	local color = {
		r = lMath.number(255),
		g = lMath.number(255),
		b = lMath.number(255),
		a = lMath.number(255)
	}
	return color
end

function lMath.rectArea(w, h)
	return w*h
end

function lMath.rectPerimeter(w, h)
	return (w*2) + (h*2)
end

function lMath.circleArea(radius)
	return math.pi * (radius^2)
end

function lMath.circumference(radius)
	return 2 * math.pi * radius
end

function lMath.distance(x1, y1, x2, y2) 
	return ((x2-x1)^2+(y2-y1)^2)^0.5 
end

function lMath.angle(x1, y1, x2, y2) 
	return math.atan2(y2-y1, x2-x1) 
end

function lMath.clamp(val, low, high) 
	return math.min(math.max(low, val), high) 
end

function lMath.toBool(val) 
	return (type(val) == "string" and val == "true") or (type(val) == "string" and val == "1") 
	or (type(val) == "number" and val ~= 0) or (type(val) == "boolean" and val) 
end



return lMath
