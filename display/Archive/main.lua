require "camera"
require "meandyou"
require "FIZIX"
require "Animation"


function love.load()

end

function love.update()



platforming()

moveme()

moveyou()

you.y = you.y - you.j
me.y = me.y - me.j
you.x = you.x + you.v
me.x = me.x + me.v
you.next = you.feet - you.j
me.next = me.feet - me.j




cammovement()


walls()

animate()

orient()

meyoux()

you.feet = you.y + 60
me.feet = me.y + 60

facemovement()

crestmovement()


camerafol()

lights()


end

function love.draw()

	love.graphics.setScissor(12, 12, 494, 500)
	camera:set()

	love.graphics.draw(enviro.sky, camera.x + 12, 0)
	love.graphics.draw(enviro.paralax, camera.x / 2 + 261 / 2, camera.y / 2 + 513 / 2)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)
	love.graphics.setColor(255,255,255)

	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	armanimatey()

	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()
	camera:unset()
	love.graphics.setScissor()




	love.graphics.setScissor(518, 12, 494, 500)
	camera2:set()
	
	love.graphics.draw(enviro.sky, camera2.x + 518, 0)
	love.graphics.draw(enviro.paralax, camera2.x / 2 + 767 / 2, camera2.y / 2 + 513 / 2)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)
	love.graphics.setColor(255,255,255)

	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()

	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	armanimatey()
	camera2:unset()
	love.graphics.setScissor()


end
