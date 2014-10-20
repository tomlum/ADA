

idle1 = love.graphics.newImage("me/idle/idle1.png")
idle2 = love.graphics.newImage("me/idle/idle2.png")
idle3 = love.graphics.newImage("me/idle/idle3.png")
idle4 = love.graphics.newImage("me/idle/idle4.png")
walk1 = love.graphics.newImage("me/walk/walk51.png")
walk2 = love.graphics.newImage("me/walk/walk52.png")
walk3 = love.graphics.newImage("me/walk/walk53.png")
walk4 = love.graphics.newImage("me/walk/walk54.png")
walk5 = love.graphics.newImage("me/walk/walk55.png")
slide = love.graphics.newImage("me/walk/slide.png")
fade1 = love.graphics.newImage("me/attack/fade1.png")
fade2 = love.graphics.newImage("me/attack/fade2.png")
fade3 = love.graphics.newImage("me/attack/fade3.png")
fade4 = love.graphics.newImage("me/attack/fade4.png")
fade5 = love.graphics.newImage("me/attack/fade5.png")
fade6 = love.graphics.newImage("me/attack/fade6.png")
fade7 = love.graphics.newImage("me/attack/fade7.png")
fade8 = love.graphics.newImage("me/attack/fade8.png")




jumprise = love.graphics.newImage("me/jump/jumprise.png")
jumpfalling = love.graphics.newImage("me/jump/jumpfalling.png")
landing = love.graphics.newImage("me/jump/landing.png")
slowdown = love.graphics.newImage("me/jump/slowdown.png")
arm = love.graphics.newImage("me/jump/arm.png")
lightson = love.graphics.newImage("enviro/lightson.png")
lightsoff = love.graphics.newImage("enviro/lightsoff.png")
lighttimer = 0
lights = function ()
	if lighttimer < 31
		then enviro.light = lightson
		lighttimer = lighttimer + 1
	elseif lighttimer >= 31 and lighttimer < 36
		then enviro.light = lightsoff
		lighttimer = lighttimer + 1
	elseif lighttimer >= 36 and lighttimer < 50
		then enviro.light = lightson
		lighttimer = lighttimer + 1
		elseif lighttimer >= 50 and lighttimer < 70
		then enviro.light = lightsoff
		lighttimer = lighttimer + 1
		elseif lighttimer >= 70
		then
		lighttimer = - 120


end
end



spines = {}


retryupdate = function()

	

	controller1.a1 = love.keyboard.isDown("f")
	controller1.a2 = love.keyboard.isDown("t")
	controller1.a3 = love.keyboard.isDown("h")
	controller1.block = love.keyboard.isDown("g")


	controller2.a1 = love.keyboard.isDown("left")
	controller2.a2 = love.keyboard.isDown("up")
	controller2.a3 = love.keyboard.isDown("right")
	controller2.block = love.keyboard.isDown("down")

	joysticks()



if waitforitplay > 0 then waitforitplay = waitforitplay - 1
elseif fadeupretry == 2 and waitforitplay == 0 then
	MENU = "prepan"
	loadmeandyou2()
	fadeupretry = 0
elseif fadeupretry == 3 and waitforitplay == 0 then
	MENU = "prechoose"
	loadmeandyou()
	fadeupretry = 0
elseif playfadeout >= 250 and fadeupretry == 2 or fadeupretry == 3  then
	waitforitplay = 120
	retryfade = 0
	playfadeout = 255
elseif fadeupretry == 2 then retryfade = retryfade - 5
	playfadeout = playfadeout + 5
elseif fadeupretry == 3 then retryfade = retryfade - 5
	playfadeout = playfadeout + 5
elseif (controller1.block or controller2.block) and retryfade >= 250
then fadeupretry = 2
elseif (controller1.a1 or controller2.a1 or controller1.a2 or controller2.a2 or controller1.a3 or controller2.a3) and retryfade >= 250
then fadeupretry = 3

elseif fadeupretry == 1 and retryfade <255 then 
	retryfade = retryfade + 1
elseif me.im == fade8 or you.im == fade8 then
fadeupretry = 1

end


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


end



retry = function()



if you.dead and me.dead then 
love.graphics.setColor(0, 0, 0, retryfade)
love.graphics.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255, 255, 255, 255)

elseif you.dead then 
love.graphics.setColor(r1, g1, b1, retryfade)
love.graphics.draw(enviro.v, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(r2, g2, b2, retryfade)
love.graphics.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255, 255, 255, 255)
elseif me.dead then
love.graphics.setColor(r2, g2, b2, retryfade)
love.graphics.draw(enviro.v, screenwidth, 0, 0, -screenwidth/1440, screenheight/900)
love.graphics.setColor(r1, g1, b1, retryfade)
love.graphics.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255, 255, 255, 255)
end


end






oscillator = 0
oup=true
soscillator = 0
soup=true
first = true


drawspine = function()
if table.getn(spines) < 1
then

n = 10
sosfirst = true

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=48, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=47, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=46, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=45, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=44, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=43, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=42, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=41, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=40, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=39, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=38, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=37, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=36, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=35, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=34, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=33, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=32, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=31, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=30, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=29, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=28, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=27, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=26, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=25, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=24, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=23, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=22, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=21, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=20, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=19, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=18, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=17, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=16, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=15, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=14, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=13, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=12, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=11, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=10, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=9, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=8, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=7, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=6, v=0})

table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=5, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=4, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=3, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=2, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=1, v=0})
table.insert(spines, {x=(695/1440)*screenwidth, y=0, n=0, v=0})








end


oddeven = oddeven + 1



if soscillator == 0 and soup then n = 10
 elseif soscillator == 1.5*n then soup = false
 elseif sosfirst and soscillator == n then soup = false
 elseif soscillator == -1.5*n then soup = true sosfirst = false
 end
--this works
-- if soscillator == 0 and soup then n = 10
-- elseif soscillator == 1.5*n then soup = false
-- elseif sosfirst and soscillator == n then soup = false
-- elseif soscillator == -1.5*n then soup = true sosfirst = false
-- end

if soup then soscillator = soscillator + .5
else soscillator = soscillator - .5
end


for i,v in ipairs(spines) do
if MENU ~= "postchoose" then
v.y = v.n * (screenheight/48) - (screenheight/47)

if oddeven%5 == 1 then
	if v.n >= 1 then 
		v.v = spines[i+1].v
		v.x = v.x + v.v 
	else
		v.v = soscillator 
		v.x = v.x + v.v
	end
end
end

love.graphics.draw(enviro.spine, v.x, v.y, 0, screenwidth/1440, screenheight/1400)


end


end




waves = {}
table.insert(waves, {x=0, y=0, n=23, v=0})
table.insert(waves, {x=0, y=0, n=22, v=0})
table.insert(waves, {x=0, y=0, n=21, v=0})

table.insert(waves, {x=0, y=0, n=20, v=0})
table.insert(waves, {x=0, y=0, n=19, v=0})
table.insert(waves, {x=0, y=0, n=18, v=0})
table.insert(waves, {x=0, y=0, n=17, v=0})
table.insert(waves, {x=0, y=0, n=16, v=0})

table.insert(waves, {x=0, y=0, n=15, v=0})
table.insert(waves, {x=0, y=0, n=14, v=0})
table.insert(waves, {x=0, y=0, n=13, v=0})
table.insert(waves, {x=0, y=0, n=12, v=0})
table.insert(waves, {x=0, y=0, n=11, v=0})

table.insert(waves, {x=0, y=0, n=10, v=0})
table.insert(waves, {x=0, y=0, n=9, v=0})
table.insert(waves, {x=0, y=0, n=8, v=0})
table.insert(waves, {x=0, y=0, n=7, v=0})
table.insert(waves, {x=0, y=0, n=6, v=0})

table.insert(waves, {x=0, y=0, n=5, v=0})
table.insert(waves, {x=0, y=0, n=4, v=0})
table.insert(waves, {x=0, y=0, n=3, v=0})
table.insert(waves, {x=0, y=0, n=2, v=0})
table.insert(waves, {x=0, y=0, n=1, v=0})
table.insert(waves, {x=0, y=0, n=0, v=0})



oddeven = 0


drawwaves = function()

oddeven = oddeven + 1


if oscillator >= 4 then oup = false
elseif oscillator <= -4                                                                                                                then oup = true
end

if oup then oscillator = oscillator + .1 + math.random()/10
else  oscillator = oscillator - .1 - math.random()/10
end


for i,v in ipairs(waves) do

	v.x = (screenwidth/24) * v.n

	if oddeven%8 == 1 then

	if v.n >= 1 then v.v = waves[i+1].v
		v.y = v.y - v.v
	else 
		v.v = oscillator 
		v.y = v.y - v.v
end
end

love.graphics.draw(enviro.wave, v.x, v.y+(screenheight*.7), 0, screenwidth/1440, screenheight/700)


end
end





gotimer = 0
function go()
if gotimer < 40 then
gotimer = gotimer + 1
love.graphics.draw(enviro.go,screenwidth/4 -5 + math.random(10),screenheight/4-5 + math.random(10),0,screenwidth/1440,screenheight/900)
gosound:play()
end
end



medeathclock = 0
youdeathclock = 0

death = function()
	if you.health<0 then 
	you.dead = true
	r2, g2, b2 = 0,0,0
	youdeathclock = youdeathclock + 1

	if youdeathclock > 104+ 30 then you.im = invis
	elseif youdeathclock > 101+ 30 then you.im = fade8 
	elseif youdeathclock > 98+ 30 then you.im = fade7
	elseif youdeathclock > 95+ 30 then you.im = fade6
	elseif youdeathclock > 92+ 30 then you.im = fade5
	elseif youdeathclock > 89+ 30 then you.im = fade4
	elseif youdeathclock > 86+ 30 then you.im = fade3
	elseif youdeathclock > 83+ 30 then you.im = fade2
	elseif youdeathclock > 80+ 30 then you.im = fade1
	end
end

	if me.health<0 then 
	me.dead = true
	r1, g1, b1 = 0,0,0
	medeathclock = medeathclock + 1

	if medeathclock > 104+ 30 then me.im = invis
	elseif medeathclock > 101+ 30 then me.im = fade8 
	elseif medeathclock > 98+ 30 then me.im = fade7
	elseif medeathclock > 95+ 30 then me.im = fade6
	elseif medeathclock > 92+ 30 then me.im = fade5
	elseif medeathclock > 89+ 30 then me.im = fade4
	elseif medeathclock > 86+ 30 then me.im = fade3
	elseif medeathclock > 83+ 30 then me.im = fade2
	elseif medeathclock > 80 + 30 then me.im = fade1
	end



end


end

--function that adjusts the x for flipping left and right
meyoux = function ()
	me.xleft = me.x + 30
	me.mid = me.x + 15
	you.xleft = you.x + 30
	you.mid = you.x + 15

	

	if lefty 
	then you.xanimate = you.xleft
		 you.leftface = true
	elseif righty 
	then you.xanimate = you.x
		 you.leftface = false

	end
	

	if leftme 
	then me.xanimate = me.xleft
		me.leftface = true
	elseif rightme 
	then me.xanimate = me.x
		me.leftface = false

	end

end

idley = 0
idleme = 0
ay = 0
walktimerme = 0
walktimery = 0

orient = function ()
	if not you.slowdown and not you.slide and not you.stop and not you.pause
		then
	rightyy = controller2.right
	leftyy = controller2.left
end

	if rightyy and not leftyy then righty = true
				lefty = false
		elseif leftyy and not rightyy then lefty = true
				righty = false
			else righty = righty 
				 lefty = lefty
	end


	if not me.slowdown and not me.slide and not me.stop and not me.pause
		then
	rightmeme = controller1.right
	leftmeme = controller1.left
end

	if rightmeme and not leftmeme then rightme = true
				leftme = false
		elseif leftmeme and not rightmeme then leftme = true
				rightme = false
			else rightme = rightme
				 leftme = leftme
	end



	if lefty
	then 
	you.lr = -1
	elseif righty
	then you.lr = 1
	else you.lr = you.lr
		end

	if leftme 
	then me.lr = -1
	elseif rightme
	then me.lr = 1
		end
end




idleanimatey = function ()
	if idley < 17 then 
		idley = idley + 1
		if you.health<maxhealth/2 then
		you.im = idle3
		else
		you.im = idle1
		end
	elseif idley >= 17 and idley < 33 then
		idley = idley + 1
		if you.health<maxhealth/2 then
		you.im = idle4
		else
		you.im = idle2
		end
	elseif idley >=33 then
		idley = 0
	end
end

idleanimateme = function ()

	if idleme < 17 then 
		idleme = idleme + 1
		if me.health<maxhealth/2 then
		me.im = idle3
		else
		me.im = idle1
		end
	elseif idleme >= 17 and idleme < 33 then
		idleme = idleme + 1
		if me.health<maxhealth/2 then
		me.im = idle4
		else
		me.im = idle2
		end
	elseif idleme >=33 then
		idleme = 0
	end

end



walky = function ()
	if walktimery < 7 then 
		you.im = walk1
		walktimery = walktimery + 1
	elseif walktimery >= 7 and walktimery < 14 then
		you.im = walk2
		walktimery = walktimery + 1
	elseif walktimery >= 14 and walktimery < 21 then
		you.im = walk3
		walktimery = walktimery + 1
	elseif walktimery >= 21 and walktimery < 28 then
		you.im = walk4
		walktimery = walktimery + 1
	elseif walktimery >= 28 and walktimery < 35 then
		you.im = walk5
		walktimery = walktimery + 1
	else
		walktimery = 0
	end
end

walkme = function ()
	if walktimerme < 7 then 
		me.im = walk1
		walktimerme = walktimerme + 1
	elseif walktimerme >= 7 and walktimerme < 14 then
		me.im = walk2
		walktimerme = walktimerme + 1
	elseif walktimerme >= 14 and walktimerme < 21 then
		me.im = walk3
		walktimerme = walktimerme + 1
	elseif walktimerme >= 21 and walktimerme < 28 then
		me.im = walk4
		walktimerme = walktimerme + 1
	elseif walktimerme >= 28 and walktimerme < 35 then
		me.im = walk5
		walktimerme = walktimerme + 1
	else
		walktimerme = 0
	end
end

jumpy = function ()
	if you.j > 0 then 
		you.im = jumprise
	else you.im = jumpfalling
end
end

jumpme = function ()
	if me.j > 0 then 
		me.im = jumprise
	else me.im = jumpfalling
end
end

landycheck = function ()
	if you.landingcounter <= 0	
	then you.landing = false
	else
	you.landingcounter = you.landingcounter - 1

end
end

landmecheck = function ()
	if me.landingcounter <= 0	
	then me.landing = false
	else
	me.landingcounter = me.landingcounter - 1

end
end

slidetimery = 0
slidetimerme = 0

slideycheck = function ()
	if slidetimery < 6
	then 
	slidetimery = slidetimery + 1
	elseif slidetimery >= 6
	then you.slide = false
		
	end
end

slidemecheck = function ()
	if slidetimerme < 6
	then 
	slidetimerme = slidetimerme + 1
	elseif slidetimerme >= 6
	then me.slide = false
		
	end
end



animate = function ()
	landycheck()
	slideycheck()
	if you.slide 
	then you.im = slide

	elseif you.slowdown
	then you.im = slowdown

	elseif you.landing
	then you.im = landing

	elseif you.g and you.v == 0 and not you.slide 
	then idleanimatey()
	walktimery = 0

	elseif not you.g
	then
	jumpy()

	else
		walky()

	end




	landmecheck()
	slidemecheck()
	if me.slide 
	then me.im = slide

	elseif me.slowdown
	then me.im = slowdown

	elseif me.landing
	then me.im = landing

	elseif me.g and me.v == 0 and not me.slide 
	then idleanimateme()
	walktimerme = 0

	elseif not me.g
	then
	jumpme()

	else
		walkme()

	end


end




--can add me
facemovement = function ()
	




	if you.im == slide
	then you.facedis = 1
	elseif you.im == blue33
	then you.facedis = 0
	elseif you.im == dodgeback
		then you.facedis = 7
	elseif you.im == dodgeback then you.facedis = 10
	elseif you.im == bluecharging or you.im == invis then you.facedis = 100000000
	elseif you.im == bc1 or you.im==bc2 or you.im==bc3 or you.im==bcend 
		or you.im == boltcharged or you.im == spikeland 
		or you.im == dodge
		then you.facedis = 4
	elseif you.im == blue21 or you.im == stomp2 or you.im == dig or you.im==idle3 or you.im==idle4
		then you.facedis = 3
	elseif you.im == blue22 or you.im == blue23 or you.im == landing
		then you.facedis = 5 
	elseif you.im == stomp1 or you.im == stomps 
		then you.facedis = -1
	elseif you.im==boltrelease then 
		you.facedis = -2
	elseif you.im==dodge21 then you.facedis = 20
		elseif you.im==dodge2 then you.facedis = 19
	
	
	else you.facedis = 2
	end




	if you.im == "blafuck"
		then facedis = -2
	elseif you.im == brise 
		then you.facey = -54
	elseif you.im == briseend or you.im==aby2 or you.im==aby3 or you.im==aby4 then you.facey = 1000000000
	elseif you.im == dig 
		then you.facey = -26
	elseif you.im == dodge 
		then you.facey = -31
	elseif you.im == dodge2
		then you.facey = -37
	elseif you.im == dodge21
		then you.facey = -34
	elseif you.im == bluepurphit
		then you.facey = -44
	elseif you.im == spikeland
		then you.facey = -42
	elseif you.im == idle2 or you.im == bc1 or you.im == idle4 or you.j < 0 or you.im ==stomp2
		then you.facey = - 53
	elseif you.im == landing
	then you.facey = - 42
	elseif you.im==bc2 or you.im==bc3 or you.im==bcend then you.facey = - 51
	elseif you.j > 0 then you.facey = - 56
	else you.facey = - 54
	end






	if me.im == slide
	then me.facedis = 1
	elseif me.im == blue33
	then me.facedis = 0
	elseif me.im == dodgeback
		then me.facedis = 7
	elseif me.im == dodgeback then me.facedis = 10
	elseif me.im == bluecharging or me.im == invis then me.facedis = 100000000
	elseif me.im == bc1 or me.im==bc2 or me.im==bc3 or me.im==bcend 
		or me.im == boltcharged or me.im == spikeland 
		or me.im == dodge
		then me.facedis = 4
	elseif me.im == blue21 or me.im == stomp2 or me.im == dig or me.im==idle3 or me.im==idle4
		then me.facedis = 3
	elseif me.im == blue22 or me.im == blue23 or me.im == landing
		then me.facedis = 5 
	elseif me.im == stomp1 or me.im == stomps
		then me.facedis = -1 
	elseif me.im==boltrelease then 
		me.facedis = -2
	elseif me.im==dodge21 then me.facedis = 20
		elseif me.im==dodge2 then me.facedis = 19
	
	
	else me.facedis = 2
	end




	if me.im == "blafuck"
		then facedis = -2
	elseif me.im == brise 
		then me.facey = -54
	elseif me.im == briseend or me.im==aby2 or me.im==aby3 or you.im==aby4 then me.facey = 1000000000
	elseif me.im == dig 
		then me.facey = -26
	elseif me.im == dodge 
		then me.facey = -31
	elseif me.im == dodge2
		then me.facey = -37
	elseif me.im == dodge21
		then me.facey = -34
		elseif me.im == bluepurphit
		then me.facey = -44
	elseif me.im == spikeland 
		then me.facey = -42
	elseif me.im == idle2 or me.im == bc1 or me.im == idle4 or me.j < 0 or me.im ==stomp2
		then me.facey = - 53
	elseif me.im == landing
	then me.facey = - 42
	elseif me.im==bc2 or me.im==bc3 or me.im==bcend then me.facey = - 51
	elseif me.j > 0 then me.facey = - 56
	else me.facey = - 54
	end






	if you.leftface
	then you.facex = you.mid - you.facedis - 3  
	else you.facex = you.mid + you.facedis - 6
	end

	if me.leftface
	then me.facex = me.mid - me.facedis - 3  
	else me.facex = me.mid + me.facedis - 6
	end


end


armanimatey = function ()
	if you.slowdown and not you.dodge and not you.pause and not you.stop and not youpurp and not youblu 
	then 
	if you.leftface then
	love.graphics.draw(arm, you.x + 21, you.y + 20)
else love.graphics.draw(arm, you.xleft - 21, you.y + 20, 0, -1, 1)
end
	end


	
end


armanimateme = function ()
	if me.slowdown and not me.dodge and not me.pause and not me.stop and not mepurp and not meblu 
	then 
	if me.leftface then
	love.graphics.draw(arm, me.x + 21, me.y + 20)
else love.graphics.draw(arm, me.xleft - 21, me.y + 20, 0, -1, 1)
end
	end


	
end



crestmovement = function ()

	
	if you.im == dodge21
		then
		you.crestdis = 15



	elseif you.im == landing or you.im == spikeland or you.im == bcend
	then you.crestdis = -1
	else you.crestdis = - 2
	end



	

	if you.im == idle2 
	then you.cresty = you.y + 28
	
	elseif you.im==walk1 or you.im==walk2 or you.im==walk3 or you.im==walk4 or you.im==walk5 
		or you.im==slide or you.im == idle1 or you.im==idle3 or you.im==idle4 or you.im == jumprise or you.im==jumpfalling
		or you.im==boltthrow or you.im == airbolt or you.im == airboltslow
		or you.im == stomp2  or you.im==airspike 
		or you.im==blue12 or you.im == blue1end or you.im == bluecharging or you.im == bcend or you.im==briseend or you.im==bfallend or you.im==bfallprep or you.im==bfall3 
		or you.im==greenpurpprep
		or you.im==airbluepurphit

		or you.im == ythrow or you.im ==jythrow
		or you.im ==jpythrow
		or you.im==yblue or you.im==yblue2 or you.im == yblue3 or you.im==yblue3 or you.im == yblue4 or you.im == yblue5 or you.im == yblueend or you.im == yblueend2
		or you.im==aby2 or you.im==aby3 or you.im==aby4
		or you.im == gythrow or you.im == jgythrow or you.im == gyready or you.im == jgyready 
		or you.im == ycthrow or you.im == jycthrow 

	then you.cresty = you.y + 27

	elseif you.im==spikeland or you.im==bluepurphit
		then you.cresty = you.y + 36
	elseif you.im == stomp1 or you.im==stomps
		then you.cresty = you.y + 26
		you.crestdis = -5
	elseif you.im==dig then you.cresty = you.y + 53

	elseif you.im == dodge
		then 
		you.crestdis = 0
		you.cresty = you.y + 46

	elseif you.im == dodge21
		then you.cresty = you.y + 43
		you.crestdis = 14
	elseif you.landing
	then you.cresty = you.y + 37

	else you.cresty = 100000
	end





	if you.leftface 
		then you.crestx = you.mid - you.crestdis - 3
	else 
	you.crestx = you.mid + you.crestdis
	end








	if me.im == dodge21
		then
		me.crestdis = 15



	elseif me.im == landing or me.im == spikeland or me.im == bcend
	then me.crestdis = -1
	else me.crestdis = - 2
	end



	

	if me.im == idle2 
	then me.cresty = me.y + 28
	
	elseif me.im==walk1 or me.im==walk2 or me.im==walk3 or me.im==walk4 or me.im==walk5 
		or me.im==slide or me.im == idle1 or me.im == jumprise or me.im==jumpfalling
		or me.im==boltthrow or me.im == airbolt or me.im == airboltslow
		or me.im == stomp2  or me.im==airspike 
		or me.im==blue12 or me.im == blue1end or me.im == bluecharging or me.im == bcend or me.im==briseend or me.im==bfallend or me.im==bfallprep or me.im==bfall3 
		or me.im==greenpurpprep
		or me.im==airbluepurphit

		or me.im == ythrow or me.im ==jythrow
		or me.im ==jpythrow
		or me.im==yblue or me.im==yblue2 or me.im == yblue3 or me.im==yblue3 or me.im == yblue4 or me.im == yblue5 or me.im == yblueend or me.im == yblueend2
		or me.im==aby2 or me.im==aby3 or me.im==aby4
		or me.im == gythrow or me.im == jgythrow or me.im == gyready or me.im == jgyready 
		or me.im == ycthrow or me.im == jycthrow 


	then me.cresty = me.y + 27

	elseif me.im==spikeland or me.im==bluepurphit
		then me.cresty = me.y + 36
	elseif me.im == stomp1 or me.im==stomps
		then me.cresty = me.y + 26
		me.crestdis = -5
	elseif me.im==dig then me.cresty = me.y + 53

	elseif me.im == dodge
		then 
		me.crestdis = 0
		me.cresty = me.y + 46

	elseif me.im == dodge21
		then me.cresty = me.y + 43
		me.crestdis = 14
	elseif me.landing
	then me.cresty = me.y + 37

	else me.cresty = 100000
	end





	if me.leftface 
		then me.crestx = me.mid - me.crestdis - 3
	else 
	me.crestx = me.mid + me.crestdis
	end
end



			