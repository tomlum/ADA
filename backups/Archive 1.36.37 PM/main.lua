require "camera"
require "meandyou"
require "FIZIX"
require "Animation"

function love.load()

end

function love.update()

groundhuhy(you.feet)
you.g = garb

moveme()

moveyou()

you.y = you.y - you.j
me.y = me.y - me.j
you.x = you.x + you.v
me.x = me.x + me.v

camera.x = me.x - 259
camera.y = me.y - 259

camera2.x = you.x - 767
camera2.y = you.y - 259

animatey()

orient()

meyoux()

end

function love.draw()

	love.graphics.setScissor(12, 12, 494, 500)
	camera:set()
	love.graphics.draw(enviro.back, -1000, -1000)
	love.graphics.setColor(255,255,255)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	camera:unset()
	love.graphics.setScissor()

	love.graphics.setScissor(518, 12, 494, 500)
	camera2:set()
	love.graphics.draw(enviro.back, -1000, -1000)
	love.graphics.setColor(255,255,255)
	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	camera2:unset()
	love.graphics.setScissor()


end
