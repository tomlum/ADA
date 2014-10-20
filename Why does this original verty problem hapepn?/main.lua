




--sound for bolt whiffing by?
--assign mecolor and youcolor to the a's, a1, a2 etc
--HAVE A RUN FUNCTION? CANT ATTACK BUT RUN FASTER?

--HEY, MAYBE MAKE IT SO THAT WHEN THE TWO ARE CLOSE ENOUGH IT'S ONE SCREEN AND THEN if the right goes left he takes the left screen over

--backgrounds be a bit more fadey?  A tiny bit less color?

--base random seed on movement during one part?  or have it be entered, or just time spent on opening screen

--iphone bluetooth controller?


--if a12 then in that function have accomodations for dont let go of this module until there are no buttons pressed!!!!!!
--check for a1 and a2
--if a1 and a2 then bla if a1 then bla else nokeys, use this to identify for the above command






--when flinch background frame turns white?
--PAPER PHYSICS
--SPEED LOWERS AS THEY GET CLOSER, maybe towards is also faster hypotenuse of x-x y-y 
--fall damage?
--one attack does more damage the longer its in the air
--have the 12:00 flash
--charge punch off screen doesnt hit wall
--dodge and stick arm air slowdown
--special barry final attack



require "camera"
require "meandyou"
require "FIZIX"
require "Animation"
require "ATTACK"
require "DamageTable"


function love.load()

x = 11
lefty = true
rightme = true
f = false
actionshot = false
actiontimer = 0

end

function love.update()

if 
love.keyboard.isDown("e")
then x = x
else 
	SlowRate = 10
	x = SlowRate
end



if actiontimer == 1 
	then actionshot = false actiontimer = 0
elseif actionshot == true and actiontimer == 0 
	then actiontimer = 30
elseif actiontimer > 0 
	then actiontimer = actiontimer - 1
else actiontimer = 0
end

if x == SlowRate and not actionshot
	then
controller1.up = love.keyboard.isDown("w")
	controller1.down = love.keyboard.isDown("s")
	controller1.left = love.keyboard.isDown("a")
	controller1.right = love.keyboard.isDown("d")
	controller1.a1 = love.keyboard.isDown("f")
	controller1.a2 = love.keyboard.isDown("t")
	controller1.a3 = love.keyboard.isDown("h")
	controller1.block = love.keyboard.isDown("g")


controller2.up = love.keyboard.isDown("i")
	controller2.down = love.keyboard.isDown("k")
	controller2.left = love.keyboard.isDown("j")
	controller2.right = love.keyboard.isDown("l")
	controller2.a1 = love.keyboard.isDown("left")
	controller2.a2 = love.keyboard.isDown("up")
	controller2.a3 = love.keyboard.isDown("right")
	controller2.block = love.keyboard.isDown("down")





--if not flinch?  maybe
megreen = controller1.a2
yougreen = controller2.a2
meblue = controller1.a1
youblue = controller2.a1
mepurple = controller1.a3
youpurple = controller2.a3


--gree ncharge problem is due to this
if mepurp then
meblue = false
megreen = false
end

if meblu then
	mepurple = false
	megreen = false
end

if megree then
	mepurple = false
	meblue = false
end

--if bla then greenreceiver = controller1.a1
--and put greenreceiver into the green function












platforming()

moveme()

moveyou()

you.y = you.y - you.j
me.y = me.y - me.j
you.x = you.x + you.v
me.x = me.x + me.v
you.next = you.feet - you.j
me.next = me.feet - me.j


--if controller1.a1 or me.attack == spike or me.attack == chargespike then
--
--else
--all the functions





cammovement()


walls()

animate()


orient()

meyoux()

you.feet = you.y + 60
me.feet = me.y + 60




camerafol()

lights()



attackme(f)
blueblade(controller1.a1)
attackyou(youblue)


flinchcheckme()




bolts.shoot(megreen)
bolts.update()
youbolts.shoot(yougreen)
youbolts.update()

attacktimerme()
attacktimeryou()

spikes.shoot(mepurple, mepurp)
--add functinos that determine truth of mepurp, essentially mepurp = true but in the else mepurp=false
spikes.update()

flinchingyou()
flinchingme()


dodgeme()
dodgey()






facemovement()

crestmovement()



elseif x == SlowRate + 1 
	then x = 0
end

x = x + 1


end

function love.draw()


	love.graphics.draw(enviro.gray, 0, 0)
	love.graphics.draw(enviro.healthbar, 12 - (100 - me.health), 524)
	love.graphics.draw(enviro.healthbar, 1012 + (100 - you.health), 524, 0, -1, 1)

	love.graphics.setScissor(12, 12, 500, enviro.screenheight)
	camera:set()

	love.graphics.draw(enviro.sky, camera.x + 12, 0)
	love.graphics.draw(enviro.paralax, camera.x / 2 + 250 / 2, camera.y / 2 + enviro.screenheight / 2 + 2)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)

	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()
	throwme()
	throwyou()
	spikes.draw()
	bolts.draw()

	youbolts.draw()

	love.graphics.draw(enviro.floorfloor, 0, floor)
	camera:unset()
	love.graphics.setScissor()




	love.graphics.setScissor(512, 12, 500, enviro.screenheight)
	camera2:set()
	
	love.graphics.draw(enviro.sky, camera2.x + 512, 0)
	--paralax only follows camera 1
	love.graphics.draw(enviro.paralax, camera2.x / 2 + 250 / 2, camera2.y / 2 + enviro.screenheight / 2 + 2)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)

	love.graphics.setColor(155,155,155)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	

	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()
	throwme()
	throwyou()
	spikes.draw()
	bolts.draw()

	youbolts.draw()
	love.graphics.draw(enviro.floorfloor, 0, floor)
	camera2:unset()
	love.graphics.setScissor()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(enviro.wall, wallx, 12, 0, width, 1.5)
	love.graphics.setColor(255, 255, 255, 255)



end
