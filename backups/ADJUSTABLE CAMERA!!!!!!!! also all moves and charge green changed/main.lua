success = love.window.setMode(800, 700, {resizable=true, fullscreen = false, vsync=true})
--when dead, flash white, background cuts to black, characters are stark white



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



require "DamageTable"
require "camera"
require "meandyou"
require "FIZIX"
require "Animation"
require "ATTACK"
require "Music"
require "Joysticks"
require "At/Purple"
require "At/Green"
require "At/Blue"

function love.load()



--love.audio.play(background)

 local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
  

x = 11
lefty = true
rightme = true
f = false
actionshot = false
actiontimer = 0
youactiontimer = 0

end

function love.update()

	screenwidth = love.graphics.getWidth()
	screenheight = love.graphics.getHeight()
	enviro.screenheight = screenheight - barheight
	healthratio = (screenwidth/2)/maxhealth

	
blues:setPitch(.8 + (math.random() * .3) )
blues2:setPitch(.8 + (math.random() * .3) )
blues3:setPitch(.8 + (math.random() * .3) )
blues4:setPitch(.8 + (math.random() * .3) )



if me.flinch then me.jstop = false mebjstop = false end
if you.flinch then you.jstop = false youbjstop = false end







if 
love.keyboard.isDown("e")
then x = x
else 
	SlowRate = 20
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

if youactiontimer == 1 
	then youactionshot = false youactiontimer = 0
elseif youactionshot == true and youactiontimer == 0 
	then youactiontimer = 30
elseif youactiontimer > 0 
	then youactiontimer = youactiontimer - 1
else youactiontimer = 0
end




if x == SlowRate and not actionshot and not youactionshot
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

joysticks()


--if not flinch?  maybe
megreen = controller1.a2
yougreen = controller2.a2
meblue = controller1.a1
youblue = controller2.a1
mepurple = controller1.a3
youpurple = controller2.a3


--make it so purple and green false until release both

if youblue and yougreen and not yougree and not youblu then 
	youbreen = true
	ygcancel = true
	ypcancel = true
	youpurple = false
	yougreen = false
	youblue = false 
	ybcancel = true
elseif not yougreen and not youblue then youbreen = false
end


if meblue and megreen and not megree and not meblu then 
	mebreen = true
	mgcancel = true
	mpcancel = true
	mepurple = false
	megreen = false
	meblue = false 
	mbcancel = true
elseif not megreen and not meblue then mebreen = false
end

if meblue and mepurple and not mepurp and not meblu then 
	meburple = true
	mgcancel = true
	mpcancel = true
	mepurple = false
	megreen = false
	meblue = false 
	mbcancel = true
elseif not mepurple and not meblue then meburple = false
end


if youblue and youpurple and not youpurp and not youblu then 
	youburple = true
	ygcancel = true
	ypcancel = true
	youpurple = false
	yougreen = false
	youblue = false 
	ybcancel = true
elseif not youpurple and not youblue then youburple = false
end



if megreen and mepurple and not mepurp then 
	megurple = true
	mgcancel = true
	mpcancel = true
	mepurple = false
	megreen = false
	meblue = false 
	mbcancel = true
elseif not mepurple and not megreen then megurple = false
end

if yougreen and youpurple and not youpurp then 
	yougurple = true
	ygcancel = true
	ypcancel = true
	youpurple = false
	yougreen = false
	youblue = false 
	ybcancel = true
elseif not youpurple and not yougreen then yougurple = false
end



--gree ncharge problem is due to this
if mepurp or mepurple then
meblue = false
megreen = false
mpcancel = false
end

if meblu or meblue then
	mepurple = false
	megreen = false
	mbcancel = false
	megurple = false
end

if megree or megreen then
	mepurple = false
	meblue = false
	mgcancel = false
end


if youpurp or youpurple then
youblue = false
yougreen = false
ypcancel = false
end

if youblu or youblue then
	youpurple = false
	yougreen = false
	ybcancel = false
end

if yougree or yougreen then
	youpurple = false
	youblue = false
	ygcancel = false
end


if megurple or megur then
meblue = false
mepurple = false
megreen = false
mgcancel = true
mpcancel = true
mbcancel = true
end

if meburple or mebur then
meblue = false
mepurple = false
megreen = false
mgcancel = true
mpcancel = true
mbcancel = true
end

if youburple or youbur then
youblue = false
youpurple = false
yougreen = false
ygcancel = true
ypcancel = true
ybcancel = true
end



if yougurple or yougur then
youblue = false
youpurple = false
yougreen = false
ygcancel = true
ypcancel = true
ybcancel = true
end

if mebreen or mebre then
meblue = false
mepurple = false
megreen = false
mgcancel = true
mpcancel = true
mbcancel = true
end

if youbreen or youbre then
youblue = false
youpurple = false
yougreen = false
ygcancel = true
ypcancel = true
ybcancel = true
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



animate()


orient()

meyoux()

you.feet = you.y + 60
me.feet = me.y + 60




camerafol()

lights()



blocknbusy()

bluegreen(mebreen)
youbluegreen(youbreen)

bluepurple(meburple)
youbluepurple(youburple)

blueblade(meblue)
youblueblade(youblue)





bolts.shoot(megreen)
bolts.update()
youbolts.shoot(yougreen)
youbolts.update()


spikes.shoot(mepurple)
youspikes.shoot(youpurple)
--add functinos that determine truth of mepurp, essentially mepurp = true but in the else mepurp=false
spikes.update(mepurple)
youspikes.update(youpurple)

yougreenpurple(yougurple)
greenpurple(megurple)


flinchingyou()
flinchingme()


dodgeme()
dodgey()






facemovement()

crestmovement()

walls()

isanyonedead()



elseif x == SlowRate + 1 
	then x = 0
end

x = x + 1







end

function love.draw()

	
	love.graphics.draw(enviro.gray, 0, 0, 10, 10)
	love.graphics.draw(enviro.healthbar, (me.health - maxhealth), screenheight-barheight, 0, healthratio,1)
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(enviro.healthbar, screenwidth + (maxhealth - you.health), screenheight-barheight, 0, -healthratio, 1)
	love.graphics.setColor(255, 255, 255, 255)
 
	love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
	camera:set()

	love.graphics.draw(enviro.sky, camera.x, 0, 0, 100, 1)
	love.graphics.draw(enviro.paralax, camera.x / 2 + (screenwidth/4) / 2, camera.y / 2 + enviro.screenheight / 2 - 12 - paralaxoffset)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)

	if youactionshot then 
	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)

	else

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
end
	spikes.draw()
	love.graphics.setColor(155,155,155)
	youspikes.draw()
	love.graphics.setColor(255, 255, 255, 255)
	bolts.draw()

	love.graphics.setColor(155,155,155)
	youbolts.draw()
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(enviro.floorfloor, 0, floor, 0, 1, 3)
	camera:unset()
	love.graphics.setScissor()




	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
	camera2:set()

	love.graphics.draw(enviro.sky, camera.x, 0, 0, 100, 1)
	
	--paralax only follows camera 1
	love.graphics.draw(enviro.paralax, camera2.x / 2 + (screenwidth/4) / 2, camera2.y / 2 + enviro.screenheight / 2 - 12 - paralaxoffset)
	love.graphics.draw(enviro.floor, 0, 0)
	love.graphics.draw(enviro.light, 4448, 1125)

	if youactionshot then 
	love.graphics.draw(me.im, me.xanimate, me.y, 0, me.lr, 1)
	love.graphics.draw(me.face, me.facex, me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	armanimateme()

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate, you.y, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(you.face, you.facex, you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)

	else

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
end
	spikes.draw()
	love.graphics.setColor(155,155,155)
	youspikes.draw()
	love.graphics.setColor(255, 255, 255, 255)
	bolts.draw()

	spikes.draw()
	love.graphics.setColor(155,155,155)
	youbolts.draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(enviro.floorfloor, 0, floor, 0, 1, 3)
	camera2:unset()
	love.graphics.setScissor()
	love.graphics.setColor(255, 255, 255)


	love.graphics.draw(enviro.wall, wallx, 0, 0, width, enviro.screenheight)
	love.graphics.draw(enviro.beige, beigex, 0, 0, bwidth/2, bheight)
	love.graphics.draw(enviro.beige, beigex, enviro.screenheight, 0, bwidth/2, -bbheight)
	love.graphics.setColor(255, 255, 255, 255)



end
