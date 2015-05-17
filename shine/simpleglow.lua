--[[
The MIT License (MIT)

Copyright (c) 2015 Matthias Richter

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
]]--

-- unroll convolution loop
local function build_blur_shader(sigma)
	local support = math.floor(3*sigma + .5)
	local one_by_sigma_sq = 1 / (sigma * sigma)
	local norm = 0

	local code = {[[
		extern vec2 direction;
		vec4 effect(vec4 color, Image texture, vec2 tc, vec2 _)
		{ vec4 c = vec4(0.0f);
	]]}
	local blur_line = "c += vec4(%f) * Texel(texture, tc + vec2(%f) * direction);"

	for i = -support,support do
		local coeff = math.exp(-.5 * i*i * one_by_sigma_sq)
		norm = norm + coeff
		code[#code+1] = blur_line:format(coeff, i)
	end

	code[#code+1] = ("return c * vec4(%f) * color;}"):format(1 / norm)

	return lg.newShader(table.concat(code))
end

return {
requires = {'canvas', 'shader'},
description = "Simple glow shader based on gassian blurring",

new = function(self)
	self.canvas  = {lg.newCanvas(), lg.newCanvas()}
	self.shader_blur = build_blur_shader(5)
	self.shader_thresh = lg.newShader[[
	extern number min_luma;
	vec4 effect(vec4 color, Image texture, vec2 tc, vec2 _)
	{
		vec4 c = Texel(texture, tc);
		number luma = dot(vec3(0.299, 0.587, 0.114), c.rgb);
		return c * color * step(min_luma, luma);
	}
	]]
	self.shader_thresh:send('min_luma', 0.7)
end,

draw = function(self, func)
	local c = lg.getCanvas()
	local s = lg.getShader()
	local co = {lg.getColor()}

	-- draw scene to screen
	func()

	-- draw scene with brigthness treshold
	lg.setShader(self.shader_thresh)
	self.canvas[1]:clear()
	self.canvas[1]:renderTo(func)

	lg.setColor(co)
	local b = lg.getBlendMode()
	lg.setBlendMode('premultiplied')

	lg.setShader(self.shader_blur)
	-- first pass (horizontal blur)
	self.shader_blur:send('direction', {1 / lg.getWidth(), 0})
	self.canvas[2]:clear()
	self.canvas[2]:renderTo(function() lg.draw(self.canvas[1], 0,0) end)

	-- second pass (vertical blur)
	lg.setBlendMode('additive')
	self.shader_blur:send('direction', {0, 1 / lg.getHeight()})
	lg.draw(self.canvas[2], 0,0)

	-- restore blendmode, shader and canvas
	lg.setBlendMode(b)
	lg.setShader(s)
	lg.setCanvas(c)
end,

set = function(self, key, value)
	if key == "sigma" then
		self.shader_blur = build_blur_shader(tonumber(value))
	elseif key == "min_luma" then
		self.shader_thresh:send("min_luma", tonumber(value))
	else
		error("Unknown property: " .. tostring(key))
	end
	return self
end
}
