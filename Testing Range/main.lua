themap = "floors"

--TESTINROOM
--TESTINROOM
--TESTINROOM
--TESTINROOM
--TESTINROOM
--TESTINROOM
--TESTINROOM


success = love.window.setMode(400, 400, {resizable=true, fullscreen = false, vsync=true})
MENU = "play"

require "TRDamageTable"
require "camera"
require "TRmeandyou"
require "TRFIZIX"
require "TRAnimation"
require "TRATTACK"
require "TRMusic"
require "TRJoysticks"
require "At/Purple"
require "At/Green"
require "At/Blue"
require "At/Yellow"
--transfer
require "At/Sand"
require "TRcolorcontrol"

enviro.floor = love.graphics.newImage("enviro/floors.png")

floor = 5898



function love.load()

mexoffset = 0
	youxoffset = 0


finishedLoading = false

stagey = 0
stagenum = 0






collide = true

mechooseface = false
youchooseface = false
mechoosecolor = true
youchoosecolor = true

mefaceselector = 0
youfaceselector = 0
juststartedpost = true
ln = 0
rn = 0

retryfade = 0
fadeupretry = 0

cflicker = 0
cfup = true

--transfer
mbb,mgg,mpp,myy,ybb,ygg,ypp,yyy,mss,yss = 0,0,0,0,0,0,0,0,0,0
--transfer
mb,mg,mp,yb,yg,yp,ms,ys = false,false,false,false,false,false,false,false
r1,r2,g1,g2,b1,b2 = 0,0,0,0,0,0

mf1r,mf1g,mf1b = 255,255,255
mf2r,mf2g,mf2b = 255,255,255
mf3r,mf3g,mf3b = 255,255,255
mf4r,mf4g,mf4b = 255,255,255
mf5r,mf5g,mf5b = 255,255,255
mf6r,mf6g,mf6b = 255,255,255

yf1r,yf1g,yf1b = 255,255,255
yf2r,yf2g,yf2b = 255,255,255
yf3r,yf3g,yf3b = 255,255,255
yf4r,yf4g,yf4b = 255,255,255
yf5r,yf5g,yf5b = 255,255,255
yf6r,yf6g,yf6b = 255,255,255






sfade = 5
startsfade = false

	lcx = -screenwidth 
	rcx = screenwidth*1.5
	lset = false
	rset = false
	msy = 0
	ysy = 0
	mr2c = true
	yr2c = true

	meseleccurrent = 0
	youseleccurrent = 0

	mecurrentframe = enviro.bframe
	youcurrentframe = enviro.bframe


adafade = 0

backtowhite = false




x = 11
lefty = true
rightme = true
f = false
actionshot = false
actiontimer = 0
youactiontimer = 0

end









function love.update()







if MENU == "play" then 

	controller2.start = love.keyboard.isDown("u")
  if joystick then
       controller1.start = joystick:isGamepadDown("start")
       controller2.start = joystick2:isGamepadDown("start") 
    end 

if r2unpause and (controller1.start or controller2.start) and pause 
	then pause = false
r2unpause = false
song1:resume()
elseif (controller1.start or controller2.start) and r2unpause then 
	pause = true
	r2unpause = false
	song1:pause()
elseif not (controller1.start or controller2.start) then r2unpause = true 
end
end


meprevhealth = me.health
youprevhealth = you.health


	screenwidth = love.graphics.getWidth()
	screenheight = love.graphics.getHeight()
	enviro.screenheight = screenheight - barheight
	healthratio = (screenwidth/2)/maxhealth

	
randomizepitch()


if me.flinch then me.jstop = false mebjstop = false end
if you.flinch then you.jstop = false youbjstop = false end







if 
love.keyboard.isDown("e")
then x = x
else 
	SlowRate = 10
	x = SlowRate
end



if actiontimer == 1 
	then actionshot = false actiontimer = 0
	song1:setPitch(1)
	if not pause then
	deathsound:play()
	collides:play()
	bcs:play()
end
elseif actionshot == true and actiontimer == 0 
	then actiontimer = 60
elseif actiontimer > 0 
	then actiontimer = actiontimer - 1
	song1:setPitch(actiontimer/60)
else actiontimer = 0
end

if youactiontimer == 1 
	then youactionshot = false youactiontimer = 0
	song1:setPitch(1)
	deathsound:play()
	collides:play()
elseif youactionshot == true and youactiontimer == 0 
	then youactiontimer = 60
elseif youactiontimer > 0 
	then youactiontimer = youactiontimer - 1
	song1:setPitch(youactiontimer/60)
else youactiontimer = 0
end



if x == SlowRate and not actionshot and not youactionshot and not pause
	then

	if me.health<0 or you.health<0 then

	controller1.up = false
	controller1.down = false
	controller1.left = false
	controller1.right = false
	
	controller1.a1 = false
	controller1.a2 = false
	controller1.a3 = false
	controller1.block = false


	controller2.up = false
	controller2.down = false
	controller2.left = false
	controller2.right = false
	controller2.a1 = false
	controller2.a2 = false
	controller2.a3 = false
	controller2.block = false

else

	controller1.start = love.keyboard.isDown("q")
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
	controller2.start = love.keyboard.isDown("u")



end


joysticks()

	
	onlytwoattacks()



colorcontrol(mb,mg,controller1.a1,love.keyboard.isDown("v"),love.keyboard.isDown("b"),love.keyboard.isDown("n"),controller1.a2,love.keyboard.isDown("m"),controller1.a3,love.keyboard.isDown(" "))
--transfer
-- colorcontrol(mb,mg,mp,yb,yg,yp,my,yy,ms,ys)










platforming()

moveme()

moveyou()

you.y = you.y - you.j*.9
me.y = me.y - me.j*.9
you.x = you.x + you.v + you.push
me.x = me.x + me.v + me.push
you.next = you.feet - you.j*.9
me.next = me.feet - me.j*.9
if you.push > 0 then you.push = you.push - 1
elseif you.push < 0 then you.push = you.push + 1
end

if me.push > 0 then me.push = me.push - 1
elseif me.push < 0 then me.push = me.push + 1
end






cammovement()

animate()

orient()

meyoux()

you.feet = you.y + 60
me.feet = me.y + 60

camerafol()



blocknbusy()


melimitbreak= false
youlimitbreak = false

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

yougreenpurple(yougurple)
greenpurple(megurple)

memines(meyellow)
youmines(youyellow)

youpy(youpellow)
mepy(mepellow)

megy(megellow)
yougy(yougellow)

meby(mebellow)
youby(youbellow)

--transfer
mewings(mesand)
mebluesand(mebland)
megreensand(megrand)
mepurpsand(mepund)
mesandmines(meyend)

youwings(yousand)
youbluesand(youbland)
yougreensand(yougrand)
youpurpsand(youpund)
yousandmines(youyend)



spikes.update(mepurple)
youspikes.update(youpurple)

flinchingyou()
flinchingme()


dodgeme()
dodgey()

facemovement()

crestmovement()

walls()

isanyonedead()
death()

miscsounds()



if findIntersect(1000,2710,1033,2753,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30,true,true) then
    makepapers(me.mid,me.y,me.v,10)
end


if you.dead or me.dead then
	song1:stop()
	retryupdate()
end

elseif x == SlowRate + 1 
	then x = 0
end

--down here to allow facemovement even during actionshot


x = x + 1



facemovement()

crestmovement()

end


function love.draw()

mexoffset = mexoffset * me.lr
youxoffset = youxoffset * you.lr



	if you.health < 0 or me.health < 0 then 
		if not backtowhite then
			deathsound:play()
			deathsound2:play()
		end


		if backtowhite then 
			love.graphics.setColor(225,225,225)
		end
		
		love.graphics.setColor(255-playfadeout,255-playfadeout,255-playfadeout)
		love.graphics.setColor(0, 0, 0, 255)
		backtowhite = true



	
	love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
	camera:set()
	love.graphics.setColor(r1,g1,b1,255-playfadeout)
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	armanimateme()
	love.graphics.setColor(255,255,255)

	love.graphics.setColor(r2,g2,b2,255-playfadeout)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255,255,255)

	camera:unset()
	love.graphics.setScissor()




	
	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
	camera2:set()

	love.graphics.setColor(r1,g1,b1,255-playfadeout)
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	armanimateme()
	love.graphics.setColor(255,255,255)

	love.graphics.setColor(r2,g2,b2,255-playfadeout)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255,255,255)

	camera2:unset()
	love.graphics.setScissor()

	retry()







	else

	love.graphics.setColor(255,255,255)
	love.graphics.draw(enviro.gray, 0, 0, 10, 10)
	love.graphics.draw(enviro.healthbar, ((me.health - maxhealth)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, screenwidth/1440,1)
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(enviro.healthbar, screenwidth + ((maxhealth - you.health)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, -screenwidth/1440, 1)
	love.graphics.setColor(255, 255, 255, 255)
 
	love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
	camera:set()

	love.graphics.draw(enviro.floor, 0, 0)

	if me.flinch then 
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(r1,g1,b1,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(r2, g2, b2, 255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(r2, g2, b2, 255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(r1,g1,b1,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()
end
	
	medrawmines()
	spikes.draw()
	bolts.draw()
	--transfer
	drawtornado() drawpapers()
	youdrawtornado() drawpapers()


	love.graphics.setColor(220,220,220)
	youdrawmines()
	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	love.graphics.setColor(255, 255, 255, 255)
	

	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()
	end
	camera:unset()
	love.graphics.setScissor()















	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
	camera2:set()

love.graphics.draw(enviro.floor,0, 0)

	if me.flinch then 
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(r1,g1,b1,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(r2, g2, b2, 255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else

	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(r2, g2, b2, 255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(r1,g1,b1,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()
end
	medrawmines()
	spikes.draw()
	bolts.draw()
	drawtornado() drawpapers()
	youdrawtornado() drawpapers()
	love.graphics.setColor(220,220,220)
	youdrawmines()

	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	love.graphics.setColor(255, 255, 255, 255)
	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()

	end
	camera2:unset()
	love.graphics.setScissor()
	love.graphics.setColor(255, 255, 255)


	love.graphics.draw(enviro.wall, wallx, 0, 0, width, enviro.screenheight)
	love.graphics.draw(enviro.beige, beigex, 0, 0, bwidth/2, bheight)
	love.graphics.draw(enviro.beige, beigex, enviro.screenheight, 0, bwidth/2, -bbheight)
	love.graphics.setColor(255, 255, 255, 255)


	you.yoffset = 0
	me.yoffset = 0
	mexoffset = 0
	youxoffset = 0

	-- go()



end




end
