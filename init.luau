--!strict
--!optimize 2
--!native

local mathpp = {}
local RAND_SEED = 0

--// Interpolates a value with a smoothstep function.
mathpp.smoothstep = function(x: number, start: number, finish: number): number
	local t = math.clamp((x - start) / (finish - start), 0, 1)
	local smooth = t * t * (3 - 2 * t)

	return smooth
end

--// Interpolates a value with a smootherstep function
mathpp.smootherstep = function(x: number, start: number, finish: number): number
	local t = math.clamp((x - start) / (finish - start), 0, 1)

	return t ^ 3 * (t * (t * 6 - 15) + 10)
end

-- Works like Unity's Mathf.PingPong function.
mathpp.pingpong = function(x: number, length: number): number
	local double = length * 2
	local mod = x % double

	return length - math.abs(mod - length)
end

-- Removes the decimals and returns only the integer of the passed argument.
mathpp.trunc = function(x: number): number
	if x > 0 then
		return math.floor(x)
	elseif x < 0 then
		return math.ceil(x)
	end

	return 0
end

-- Returns only the fraction of the passed number.
mathpp.frac = function(x: number): number
	return x - mathpp.trunc(x)
end

-- Sets the mathpp.rand() seed value.
mathpp.randseed = function(seed: number)
	RAND_SEED = seed
end

-- Returns a Pseudo-random number within the minimum and maximum values passed.
mathpp.rand = function(min: number?, max: number?, seed: number?): number
	local useSeed = seed or RAND_SEED
	useSeed = (1103515245 * useSeed + 12345) % 2 ^ 31

	if not seed then
		RAND_SEED = useSeed
	end

	min = min or 0
	max = max or 1

	local r = useSeed / 2 ^ 31

	return min + (max - min) * r
end

export type MathPP = typeof(mathpp)

return mathpp :: MathPP
