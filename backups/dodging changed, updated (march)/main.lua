--PAPER PHYSICS
--SPEED LOWERS AS THEY GET CLOSER, maybe towards is also faster
--fall damage?
--reverse direction slide dodge!
--one attac kdoes more damage the longer its in the air
--have the 12:00 flash
--fix moonwalking
--charge punch off screen doesnt hit wall



require "camera"
require "meandyou"
require "FIZIX"
require "Animation"
require "ATTACK"


function love.load()

end

function love.update()

controller1.up = love.keyboard.isDown("w")
	controller1.down = love.keyboard.isDown("s")
	controller1.left = love.keyboard.isDown("a")
	controller1.right = love.keyboard.isDown("d")
	controller1.a1 = love.keyboard.isDown("t")
	controller1.a2 = love.keyboard.isDown("f")
	controller1.a3 = love.keyboard.isDown("h")
	controller1.block = love.keyboard.isDown("g")

controller2.up = love.keyboard.isDown("i")
	controller2.down = love.keyboard.isDown("k")
	controller2.left = love.keyboard.isDown("j")
	controller2.right = love.keyboard.isDown("l")
	controller2.a1 = love.keyboard.isDown("up")
	controller2.a2 = love.keyboard.isDown("left")
	controller2.a3 = love.keyboard.isDown("right")
	controller2.block = love.keyboard.isDown("down")









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


--orient and meyox used to be here, if errors, put em back here


you.feet = you.y + 60
me.feet = me.y + 60




camerafol()

lights()

attackme()
attackyou()

flinchchecky()
flinchcheckme()


bolts.shoot()
bolts.update()
youbolts.shoot()
youbolts.update()

attacktimerme()
attacktimeryou()

dodgeme()
dodgey()

flinchingyou()
flinchingme()

orient()

meyoux()

facemovement()

crestmovement()

end

function love.draw()
	love.graphics.draw(enviro.gray, 0, 0)
	love.graphics.draw(enviro.healthbar, 12 - (100 - me.health), 524)
	love.graphics.draw(enviro.healthbar, 1012 + (100 - you.health), 524, 0, -1, 1)


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
	throwme()
	throwyou()
	bolts.draw()

	youbolts.draw()
	love.graphics.draw(enviro.floorfloor, 0, floor)
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
	throwme()
	throwyou()
	bolts.draw()

	youbolts.draw()
	love.graphics.draw(enviro.floorfloor, 0, floor)
	camera2:unset()
	love.graphics.setScissor()



end
