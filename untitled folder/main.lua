--DODGING DURING ATTACKS FOR SOME REASON WORKS NO
--DODGING DURING ATTACKS FOR SOME REASON WORKS NO
--DODGING DURING ATTACKS FOR SOME REASON WORKS NO
--DODGING DURING ATTACKS FOR SOME REASON WORKS NO
--DODGING DURING ATTACKS FOR SOME REASON WORKS NO
--classic mode doesnt work!!!
--is green purp decrease too small?
--pause doesnt stop tornado
--charge purple than dodge
--sprint function?, shakes, screen, cant attack
--make blue yellow more powerful
--maybe do stuff with dt
--sound distance Purple
--stage select bug
--an attack that causes self damage too, maybe the elec one
--BLUE UP GOES TOO HIGH
--bug that reset characters on library, p1
--Also maybe make ynl and mnl work based on velocity
--some attacks lower gravity or something
--purple climbs up rafters
--Charge attack if it's a charge then me.charge and also you have to flip the stick in the opposite direction for it to work!
--breaking through walls lowers velocity if greater than the reduction rate
--^ for that have the function take in a value for if it's a me or a you and then reduce the v that way
math.randomseed(11)
--success = love.window.setMode(1440, 900, {resizable=true, fullscreen = true, vsync=true})
success = love.window.setMode(304, 215, {resizable=true, fullscreen = false, vsync=true})


--colorcontrol, go, size,menu




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



require "Music"
require "DamageTable"
require "camera"
require "meandyou"
require "FIZIX"
require "Animation"
require "ATTACK"
require "Joysticks"
require "At/Purple"
require "At/Green"
require "At/Blue"
require "At/Yellow"
require "At/Sand"
require "colorcontrol"
loader = require "love-loader"








function love.load()


finishedLoading = false

stagey = 0
stagenum = 0
modenum = 0
themode = "none"





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
cfhold = 0
cfup = true

mbb,mgg,mpp,myy,ybb,ygg,ypp,yyy,mss,yss = 0,0,0,0,0,0,0,0,0,0
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


 local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
    joystick2 = joysticks[2]
  

x = 11
lefty = true
rightme = true
f = false
actionshot = false
actiontimer = 0
youactiontimer = 0

end









function love.update()

if not finishedLoading then
    loader.update()   end





whatlevel()



if MENU == "play" then 
	spines={}



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
	controller1.a4 = love.keyboard.isDown("g")
	controller1.block = love.keyboard.isDown("e")



controller2.up = love.keyboard.isDown("i")
	controller2.down = love.keyboard.isDown("k")
	controller2.left = love.keyboard.isDown("j")
	controller2.right = love.keyboard.isDown("l")
	controller2.a1 = love.keyboard.isDown("left")
	controller2.a2 = love.keyboard.isDown("up")
	controller2.a3 = love.keyboard.isDown("right")
	controller2.a4 = love.keyboard.isDown("down")
	controller2.block = love.keyboard.isDown("o")
	controller2.start = love.keyboard.isDown("u")




end


joysticks()


onlytwoattacks()


colorassign()


colorcontrol(mb,mg,mp,yb,yg,yp,my,yy,ms,ys)

clicks()




if MENU == "title" then
openingsong:play()

openingsong:setPitch(sfade/255)



if c1accept() or c2accept() then
		MENU = "modes"
		modesound:play()


end


elseif MENU == "modes"
	then 
	mov:setVolume(SFXV - .3)
	openingsong:setPitch(sfade/255)

	if (controller1.right or controller2.right) and modenum < 1 then modenum = modenum + 1 mov:play()
	elseif (controller1.left or controller2.left) and modenum > 0 then modenum = modenum - 1 mov:play()	
	end

	if modenum == 0 then 
		themode = "roulette"
		facade = mode2

	elseif modenum == 1 then 
		themode = "classic"
		facade = mode1
	end

	if c1accept() or c2accept() then 
		MENU ="prestage"
		wavesound:play()
		end

elseif MENU == "prestage" or MENU == "stage" then
	mov:setVolume(SFXV - .3)
	openingsong:setPitch(sfade/255)
	if MENU == "prestage" then 
	if stagey == 0 then adastartfade = true end
	if stagey > 80 then stagey = stagey + .5
		oscillator = -screenheight/90
	elseif stagey > 50 then stagey = stagey + 1
		oscillator = -screenheight/100
	else
	stagey = stagey + 1.5
	oscillator = -screenheight/90
	end

	if stagey > 100 then MENU = "stage" oscillator = 5
	end

	end

	if not controller1.left and not controller1.right and not controller2.left and not controller2.right then r2ss = true
	end

	if (controller1.left or controller2.left) and MENU == "stage" and not startsfade and stagenum > 0 and r2ss then stagenum = stagenum - 1	mov:play() r2ss = false
	elseif (controller1.right or controller2.right) and MENU == "stage" and not startsfade and stagenum < 2 and r2ss then stagenum = stagenum + 1	 mov:play() r2ss = false
end

	if sfade - 10 <= 0 then MENU = "prechoose" 
		sfade = 0
		mov:setVolume(SFXV - .7)
	elseif startsfade then sfade = sfade - 10
	elseif (c1accept() or c2accept()) and MENU == "stage" then
		if stagenum == 0 then themap = "street"
		elseif stagenum == 1 then themap = "library"
		elseif stagenum == 2 then themap = "floors"
		end
	startsfade = true
	startb:play()
	end

	if stagenum == 0 then themap = "street"
		elseif stagenum == 1 then themap = "library"
		elseif stagenum == 2 then themap = "floors"
		end


elseif MENU == "prechoose" or MENU == "choose" or MENU == "postchoose" then
	if MENU == "prechoose" then MENU = "choose"

	end

	openingsong:stop()

	if controller1.block or controller2.block then
		backtimer = backtimer + 1
		if backtimer > 50 then backtostage() 
		end
	else backtimer = 0
	end



if cflicker == 255 then cfhold = cfhold + 1
elseif cflicker <= 0 then cfup = true
end

if cfhold > 60 then cfhold = 0 cfup = false
end


if cfup and cfhold == 0 then cflicker = cflicker + 15
elseif not cfup then cflicker = cflicker - 15
end

icflicker = cflicker

if MENU == "postchoose" then
	rset = true
	lset = true
	if juststartedpost then juststartedpost = false
		placespeople = true


	rn = 1
	ln = 1
	elseif not juststartedpost then 
	rn = rn + (rn*.08)
	ln = ln + (ln*.08)
	end
end

	if not lset and lcx < 0 then lcx = lcx + screenwidth/30
	else lset = true
		lcx = 0
	end 

	if not rset and rcx > screenwidth/2 then rcx = rcx - screenwidth/30
	else rset = true
		rcx = screenwidth/2
	end

if rn > 1000020 and ln > 1000020 and finishedLoading then MENU = "prepan"
	yoffset = 0
	 finishedLoading = false
end




elseif MENU == "prepan" or MENU == "pan" then 
	MENU = "pan"
	rset = false
	lset = false


	if enviro.dolly == 0 then
		song1:rewind()
		song1:play()
	elseif streetfadehold <= 0 then MENU = "preplay"
	elseif streetfade <= 0 then streetfadehold = streetfadehold - 1
	elseif streetfadestart then streetfade = streetfade - 5
	elseif enviro.dolly + screenwidth > enviro.rightwall/2
		or controller1.a1
		or controller1.a2
		or controller1.a3
		or controller2.a1
		or controller2.a2
		or controller2.a3 
		then 
		streetfadestart = true	
	end

	enviro.dolly = enviro.dolly + enviro.ds


elseif MENU == "preplay" or MENU == "play" then 
MENU = "play"





platforming()

moveme()

moveyou()

if themap == "library" then libwallbreak() end



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

me.jstop = false
you.jstop = false
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



spikes.update(mepurple)
youspikes.update(youpurple)

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

flinchingyou()
flinchingme()


dodgeme()
dodgey()
climbs()

facemovement()

crestmovement()

walls()

isanyonedead()
death()

miscsounds()



if (themode == "classic" and (you.dead or me.dead))or (themode == "roulette" and (you.lives <= 0 or me.lives <= 0))then
	song1:stop()
	retryupdate()
end

elseif x == SlowRate + 1 
	then x = 0
end

--down here to allow facemovement even during actionshot


x = x + 1

end

facemovement()

crestmovement()

end


function love.draw()

mexoffset = mexoffset * me.lr
youxoffset = youxoffset * you.lr



if MENU == "title" or MENU == "prestage" or MENU == "stage" or MENU == "modes"
then 

if sfade + 5 <= 255 then
sfade = sfade + 5
end

if sfade == 255 and adafade <255 and (MENU == "title" or MENU == "modes") then adafade = adafade + 2.5  end

if MENU == "prestage" and adafade - 3 < 0 then adafade = 0 adastartfade = false
elseif adastartfade then adafade = adafade - 3
end

love.graphics.setColor(sfade,sfade,sfade,255)
love.graphics.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
love.graphics.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)
if MENU == "stage" then
if stagenum == 0 then love.graphics.draw(enviro.stage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
else love.graphics.draw(enviro.bwstage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
end
if stagenum == 1 then love.graphics.draw(enviro.stage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
else love.graphics.draw(enviro.bwstage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
end
if stagenum == 2 then love.graphics.draw(enviro.stage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
else love.graphics.draw(enviro.bwstage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
end
end
drawwaves()
love.graphics.setColor(255,255,255,adafade)
love.graphics.draw(enviro.ada, 0, 0, 0,screenwidth/1440,screenheight/900)




elseif MENU == "choose" or MENU == "postchoose" then
love.graphics.setColor(255,255,255,255)
love.graphics.draw(enviro.lselect, ((lcx - ln)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)	
love.graphics.setColor(155, 155, 155, 255)
love.graphics.draw(enviro.rselect, ((720-lcx + rn)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

if lset then 

	if myy<=0 then 
	love.graphics.setColor(yer,yeg,yeb,255)
	else love.graphics.setColor(255,255,255,255)
	end
	if meseleccurrent == 3 then love.graphics.draw(enviro.sytile, ((70-ln)/1440)*screenwidth, screenheight * .65, 0, screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.ytile, ((70-ln)/1440)*screenwidth, screenheight * .65, 0, screenwidth/1440, screenheight/900)
	end


	if mbb<=0 then 
	love.graphics.setColor(br,bg,bb,255)
	else love.graphics.setColor(255,255,255,255)
	end
	if meseleccurrent == 0 then love.graphics.draw(enviro.sbtile, ((70-ln)/1440)*screenwidth, screenheight * .2, 0, screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.btile, ((70-ln)/1440)*screenwidth, screenheight * .2, 0, screenwidth/1440, screenheight/900)
	end


	if mgg<=0 then 
	love.graphics.setColor(gr,gg,gb,255)
	else love.graphics.setColor(255,255,255,255)
	end
	if meseleccurrent == 1 then love.graphics.draw(enviro.sgtile, ((70-ln)/1440)*screenwidth, screenheight * .35, 0, screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.gtile, ((70-ln)/1440)*screenwidth, screenheight * .35, 0, screenwidth/1440, screenheight/900)
	end


	if mpp<=0 then 
	love.graphics.setColor(pr,pg,pb,255)
	else love.graphics.setColor(255,255,255,255)
	end
	if meseleccurrent == 2 then love.graphics.draw(enviro.sptile, ((70-ln)/1440)*screenwidth, screenheight * .5, 0, screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.ptile, ((70-ln)/1440)*screenwidth, screenheight * .5, 0, screenwidth/1440, screenheight/900)
	end


	if mss<=0 then 
	love.graphics.setColor(sr,sg,sb,255)
	else love.graphics.setColor(255,255,255,255)
	end
	if meseleccurrent == 4 then love.graphics.draw(enviro.sstile, ((70-ln)/1440)*screenwidth, screenheight * .8, 0, screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.stile, ((70-ln)/1440)*screenwidth, screenheight * .8, 0, screenwidth/1440, screenheight/900)
	end

	if mechoosecolor then
		if controller1.down and mr2c and msy < (screenheight * .46) then 
	msy = msy + (screenheight * .15)
	mr2c = false
	meseleccurrent = meseleccurrent + 1
	mov:play()
		elseif controller1.up and mr2c and msy > (screenheight * .14)  then 
	msy = msy - (screenheight * .15)
	meseleccurrent = meseleccurrent - 1
	mr2c = false
	mov:play()
		elseif not controller1.down and not controller1.up then mr2c = true
		end
	end


	

end

if rset then 

	if yyy<=0 then 
	love.graphics.setColor(yer,yeg,yeb,255)
	else love.graphics.setColor(255,255,255,255)
end
	if youseleccurrent == 3 then love.graphics.draw(enviro.sytile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .65, 0, -screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.ytile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .65, 0, -screenwidth/1440, screenheight/900)
	end


	if ypp<=0 then 
	love.graphics.setColor(pr,pg,pb,255)
	else love.graphics.setColor(255,255,255,255)
end
	if youseleccurrent == 2 then love.graphics.draw(enviro.sptile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .5, 0, -screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.ptile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .5, 0, -screenwidth/1440, screenheight/900)
	end


	if ygg<=0 then 
	love.graphics.setColor(gr,gg,gb,255)
	else love.graphics.setColor(255,255,255,255)
end
	if youseleccurrent == 1 then love.graphics.draw(enviro.sgtile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .35, 0, -screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.gtile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight * .35, 0, -screenwidth/1440, screenheight/900)
	end


	if ybb<=0 then 
	love.graphics.setColor(br,bg,bb,255)
	else love.graphics.setColor(255,255,255,255)
end
	if youseleccurrent == 0 then love.graphics.draw(enviro.sbtile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight *.2, 0, -screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.btile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight *.2, 0, -screenwidth/1440, screenheight/900)
	end


if yss<=0 then 
	love.graphics.setColor(sr,sg,sb,255)
	else love.graphics.setColor(255,255,255,255)
end
	if youseleccurrent == 4 then love.graphics.draw(enviro.sstile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight *.8, 0, -screenwidth/1440, screenheight/900)
	else love.graphics.draw(enviro.stile, screenwidth - ((70-rn)/1440)*screenwidth, screenheight *.8, 0, -screenwidth/1440, screenheight/900)
	end

if youchoosecolor then
if controller2.down and yr2c and ysy < (screenheight * .46) then 
	ysy = ysy + (screenheight * .15)
	yr2c = false
	youseleccurrent = youseleccurrent+1
	mov2:play()
	elseif controller2.up and yr2c and ysy > (screenheight * .14) then 
	ysy = ysy - (screenheight * .15)
	yr2c = false
	youseleccurrent = youseleccurrent - 1
	mov2:play()
	elseif not controller2.down and not controller2.up then yr2c = true
end
end





end

if r1 + g1 + b1 == 765 then a11flick = icflicker
else a11flick = 255 end
if a21g + a21r + a21b == 765 then a21flick = icflicker
else a21flick = 255 end
if a31g + a31r + a31b == 765 then a31flick = icflicker
else a31flick = 255 end
if a41g + a41r + a41b == 765 then a41flick = icflicker
else a41flick = 255 end

if r2 + g2 + b2 == 765 then a12flick = icflicker
else a12flick = 255 end
if a22g + a22r + a22b == 765 then a22flick = icflicker
else a22flick = 255 end
if a32g + a32r + a32b == 765 then a32flick = icflicker
else a32flick = 255 end
if a42g + a42r + a42b == 765 then a42flick = icflicker
else a42flick = 255 end



if rset and lset then


love.graphics.setColor(r1,g1,b1,a11flick)
love.graphics.draw(enviro.a1, ((252+33-ln)/1440)*screenwidth, ((65)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((141)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a21r,a21g,a21b,a21flick)
love.graphics.draw(enviro.a2, ((232+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.vert, ((388+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a31r,a31g,a31b,a31flick)
love.graphics.draw(enviro.a3, ((336+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.vert, ((401+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a41r,a41g,a41b,a41flick)
love.graphics.draw(enviro.a4, ((252+33-ln)/1440)*screenwidth, ((170)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((154)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)


love.graphics.setColor(r2,g2,b2,a12flick)
love.graphics.draw(enviro.a1, ((252 + 720+rn)/1440)*screenwidth, (65/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (141/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a22r,a22g,a22b,a22flick)
love.graphics.draw(enviro.a2, ((232 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.vert, ((388 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a32r,a32g,a32b,a32flick)
love.graphics.draw(enviro.a3, ((336 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.vert, ((401 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)

love.graphics.setColor(a42r,a42g,a42b,a42flick)
love.graphics.draw(enviro.a4, ((252 + 720+rn)/1440)*screenwidth, (170/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (154/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255,255,255,255)


love.graphics.draw(mecurrentframe, ((232-7-ln)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(155, 155, 155, 255)
love.graphics.draw(youcurrentframe, ((488 + 720 +7+rn)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)
	love.graphics.setColor(a31r,a31g,a31b,255)
	if mecurrentframe == enviro.pframe then 
	love.graphics.draw(me.face, ((240-7 + 45-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	elseif mecurrentframe == enviro.bframe then 
	love.graphics.draw(me.face, ((232-7 + 47-ln)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	elseif mecurrentframe == enviro.sframe then 
	love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)

	else
	love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	end

	love.graphics.setColor(a22r,a22g,a22b,255)
	if youcurrentframe == enviro.pframe then
	love.graphics.draw(you.face, ((1440-240-45-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	elseif youcurrentframe == enviro.bframe then
	love.graphics.draw(you.face, ((1440-232-47-13.5+7+rn)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	elseif youcurrentframe == enviro.sframe then
	love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)
	else
	love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
end
--why is this here? love.graphics.draw(face1, ((232+720)/1440)*screenwidth, (600/900)*screenheight, 0, screenwidth, screenheight)

wa = 36 + 18




love.graphics.setColor(yf1r, yf1g, yf1b, 255)
love.graphics.draw(face1, ((193+720+rn)/1440)*screenwidth, (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(yf2r, yf2g, yf2b, 255)
love.graphics.draw(face2, ((193+720+wa+rn)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(yf3r, yf3g, yf3b, 255)
love.graphics.draw(face3, ((193+720+wa*2+rn)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(yf4r, yf4g, yf4b, 255)
love.graphics.draw(face4, ((193+720+wa*3+rn)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(yf5r, yf5g, yf5b, 255)
love.graphics.draw(face5, ((193+720+wa*4+rn)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(yf6r, yf6g, yf6b, 255)
love.graphics.draw(face6, ((193+720+wa*5+rn)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)


love.graphics.setColor(mf1r, mf1g, mf1b, 255)
love.graphics.draw(face1, ((226-ln)/1440)*screenwidth, (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(mf2r, mf2g, mf2b, 255)
love.graphics.draw(face2, ((226+wa-ln)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(mf3r, mf3g, mf3b, 255)
love.graphics.draw(face3, ((226+wa*2-ln)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(mf4r, mf4g, mf4b, 255)
love.graphics.draw(face4, ((226+wa*3-ln)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(mf5r, mf5g, mf5b, 255)
love.graphics.draw(face5, ((226+wa*4-ln)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(mf6r, mf6g, mf6b, 255)
love.graphics.draw(face6, ((226+wa*5-ln)/1440)*screenwidth , (600/900)*screenheight, 0, screenwidth/360, screenheight/225)
love.graphics.setColor(255,255,255, 255)


if mechooseface and not mereadytoplay then
love.graphics.draw(faceselector, ((226-4 + (wa * mefaceselector))/1440)*screenwidth, (596/900)*screenheight, 0, screenwidth/1440, screenheight/900)
end

--22
if youreadytoplay then
love.graphics.draw(ready, ((267 + 720 +rn)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
end

if mereadytoplay then
love.graphics.draw(ready, ((300-ln)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
end



if youchooseface and not youreadytoplay then
love.graphics.draw(faceselector, ((193+720-4 + (wa * youfaceselector))/1440)*screenwidth, (596/900)*screenheight, 0, screenwidth/1440, screenheight/900)
end



drawspine()

--drawtriangles()

end



elseif MENU == "pan" or MENU == "preplay" then 
love.graphics.setColor(math.abs(streetfade),math.abs(streetfade),math.abs(streetfade,255))
love.graphics.draw(enviro.sky, 0, 0, 0, 100, screenheight/1500)
if themap == "library" then 
	love.graphics.draw(enviro.paralax2, enviro.dolly/3 -100,((-floor-100)/2)/1.5 + screenheight-400, 0, 1, 2)
		end
love.graphics.draw(enviro.paralax, -(enviro.dolly/2) -100, ((-floor-30)/4)/2 + screenheight - 655, 0, .5, .5)
love.graphics.draw(enviro.floor, -enviro.dolly, (-floor-30)/2 + screenheight, 0, .5, .5)
me.im = idle
you.im = idle

elseif MENU == "play"

	then



	if (themode == "classic" and (you.health < 0 or me.health < 0)) or (themode == "roulette" and (you.lives <= 0 or me.lives <= 0)) then 
		if not backtowhite then
			deathsound:play()
			deathsound2:play()
		end


		if backtowhite then 
			love.graphics.setColor(225,225,225)
		end
		
		love.graphics.setColor(255-playfadeout,255-playfadeout,255-playfadeout)
		love.graphics.draw(enviro.white, 0, 0, 0, screenwidth, screenheight)
		love.graphics.setColor(0, 0, 0, 255)
		backtowhite = true



	
	love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
	camera:set()
	love.graphics.setColor(a31r,a31g,a31b,255-playfadeout)
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	armanimateme()
	love.graphics.setColor(255,255,255)

	love.graphics.setColor(a22r,a22g,a22b,255-playfadeout)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(255,255,255)

	camera:unset()
	love.graphics.setScissor()




	
	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
	camera2:set()

	love.graphics.setColor(a31r,a31g,a31b,255-playfadeout)
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	armanimateme()
	love.graphics.setColor(255,255,255)

	love.graphics.setColor(a22r,a22g,a22b,255-playfadeout)
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

	love.graphics.draw(enviro.sky, camera.x, 0, 0, 500, 1.1)
	--love.graphics.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)
	if themap == "library" then 
	love.graphics.draw(enviro.paralax2, camera.x/1.5 + (screenwidth/4)/1.5 - 400,camera.y/1.2 + enviro.screenheight / 1.2 - 12 - paralaxoffset-940)
		end
	love.graphics.draw(enviro.paralax, camera.x / 2 + (screenwidth/4)/2 - 350, camera.y / 2 + enviro.screenheight / 2 - 12 - paralaxoffset - 800)
	love.graphics.draw(enviro.floor, 0, 0)

	if me.flinch then 
	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else
	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	drawmyroulette()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()
end
	
	medrawmines()
	spikes.draw()
	bolts.draw()
	drawtornado()


	love.graphics.setColor(220,220,220)
	youdrawmines()
	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	youdrawtornado()
	love.graphics.setColor(255, 255, 255, 255)
	

	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()
	elseif themap == "floors" then
		drawfloorsstuff()
	end
	camera:unset()
	love.graphics.setScissor()















	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
	camera2:set()

	love.graphics.draw(enviro.sky, camera.x, 0, 0, 500, 1.1)
	--love.graphics.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)
	if themap == "library" then 
	love.graphics.draw(enviro.paralax2, camera2.x/1.5 + (screenwidth/4)/1.5 - 400,camera2.y/1.2 + enviro.screenheight / 1.2 - 12 - paralaxoffset-940)
		end
	--paralax only follows camera 1
	love.graphics.draw(enviro.paralax, camera2.x / 2 + (screenwidth/4)/2 - 350, camera2.y / 2 + enviro.screenheight / 2 - 12 - paralaxoffset - 800)
	love.graphics.draw(enviro.floor,0, 0)

	if me.flinch then 
	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-youxoffset, you.y-you.yoffset, 0, you.lr, 1)
	armanimatey()
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-mexoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	armanimateme()
end
	medrawmines()
	spikes.draw()
	bolts.draw()
	drawtornado()
	love.graphics.setColor(220,220,220)
	youdrawmines()

	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	youdrawtornado()
	love.graphics.setColor(255, 255, 255, 255)
	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()
	elseif themap == "floors" then
		drawfloorsstuff()

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
	go()
	drawroulettenumbers()



end
end



end
