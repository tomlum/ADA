
idle1 = love.graphics.newImage("me/idle/idle1.png")
idle2 = love.graphics.newImage("me/idle/idle2.png")
idle3 = love.graphics.newImage("me/idle/idle3.png")
idle4 = love.graphics.newImage("me/idle/idle4.png")
walk1 = love.graphics.newImage("me/walk/walk51.png")
walk2 = love.graphics.newImage("me/walk/walk52.png")
walk3 = love.graphics.newImage("me/walk/walk53.png")
walk4 = love.graphics.newImage("me/walk/walk54.png")
walk5 = love.graphics.newImage("me/walk/walk55.png")
run1 = love.graphics.newImage("me/walk/run1.png")
run2 = love.graphics.newImage("me/walk/run2.png")
run3 = love.graphics.newImage("me/walk/run3.png")
run4 = love.graphics.newImage("me/walk/run4.png")
slide = love.graphics.newImage("me/walk/slide.png")
fade1 = love.graphics.newImage("me/attack/fade1.png")
fade2 = love.graphics.newImage("me/attack/fade2.png")
fade3 = love.graphics.newImage("me/attack/fade3.png")
fade4 = love.graphics.newImage("me/attack/fade4.png")
fade5 = love.graphics.newImage("me/attack/fade5.png")
fade6 = love.graphics.newImage("me/attack/fade6.png")
fade7 = love.graphics.newImage("me/attack/fade7.png")
fade8 = love.graphics.newImage("me/attack/fade8.png")
morph1 = love.graphics.newImage("me/attack/morph1.png")
morph2 = love.graphics.newImage("me/attack/morph2.png")
morph3 = love.graphics.newImage("me/attack/morph3.png")
morph4 = love.graphics.newImage("me/attack/morph4.png")
morph5 = love.graphics.newImage("me/attack/morph5.png")
morph6 = love.graphics.newImage("me/attack/morph6.png")
morph7 = love.graphics.newImage("me/attack/morph7.png")
triangle = love.graphics.newImage("enviro/triangle.png")
wallgrab = love.graphics.newImage("me/attack/wallgrab.png")
partition = love.graphics.newImage("enviro/partition2.png")
partition:setFilter("nearest")

jumprise = love.graphics.newImage("me/jump/jumprise.png")
jumpfalling = love.graphics.newImage("me/jump/jumpfalling.png")
landing = love.graphics.newImage("me/jump/landing.png")
slowdown = love.graphics.newImage("me/jump/slowdown.png")
paper1 = love.graphics.newImage("enviro/paper1.png")
paper2 = love.graphics.newImage("enviro/paper2.png")
paper3 = love.graphics.newImage("enviro/paper3.png")
paper4 = love.graphics.newImage("enviro/paper4.png")
mytriangles = {}
yourtriangles = {}



whatlevel = function()
  
if placespeople then
	placespeople = false
finishedloading = false
	
if themode == "roulette" then 
	you.lives = 5
	me.lives = 5
	maxhealth = 70
elseif themode == "classic" then 
	maxhealth = 380
end
me.health = maxhealth
you.health = maxhealth

if themap == "fightclub" then
  
loader.start(function()
    finishedLoading = true
  end)

enviro.rightwall = 2000

loader.newImage(enviro,'floor', "enviro/fightclub.png")
loader.newImage(enviro,"paralax","enviro/READY.png")
loader.newImage(enviro,"sky","enviro/ready.png")
		me.x = 1000
		you.x = 1040
		floor = 896
		me.y = floor - 60
		you.y = floor - 60



elseif themap == "street" then
loader.newImage(enviro,'floor', "enviro/astreet.png")
  loader.start(function()
    finishedLoading = true
  end)
loader.newImage(enviro,"paralax","enviro/paralax.png")
loader.newImage(enviro,"sky","enviro/sky.png")
loader.newImage(enviro,'lightson',"enviro/lightson.png")
loader.newImage(enviro,'lightsoff', "enviro/lightsoff.png")
loader.newImage(enviro,'floor', "enviro/astreet.png")
loader.newImage(enviro,'partitionwall',"enviro/partition2.png")
loader.newImage(enviro,'rafters',"enviro/rafters.png")
loader.newImage(enviro,'buildingwall',"enviro/buildingwall.png")

-- 	enviro.sky = love.graphics.newImage("enviro/sky.png")
-- lightson = love.graphics.newImage("enviro/lightson.png")
-- lightsoff = love.graphics.newImage("enviro/lightsoff.png")
-- 	enviro.floor = love.graphics.newImage("enviro/astreet.png")
-- 	enviro.paralax = love.graphics.newImage("enviro/paralax.png")
-- 	enviro.partitionwall = love.graphics.newImage("enviro/partition2.png")
-- enviro.rafters = love.graphics.newImage("enviro/rafters.png")
-- enviro.buildingwall = love.graphics.newImage("enviro/buildingwall.png")
		lighttimer = 0
		me.x = 1000
		you.x = 6000
		floor = 1900 - 3
		me.y = floor - 60
		you.y = floor - 60
		enviro.rightwall = 6600-20
		enviro.ds = 5
thesong = song1
end
-- enviro.paralax = love.graphics.newImage("enviro/libraryparalax.png")
-- enviro.sky = love.graphics.newImage("enviro/librarysky.png")
-- enviro.librarylpartition = love.graphics.newImage("enviro/librarylpartition.png")
-- enviro.libraryrpartition = love.graphics.newImage("enviro/libraryrpartition.png")
-- enviro.plibrary = love.graphics.newImage("enviro/libraryplayer.png")
-- enviro.thelibraryveneer = love.graphics.newImage("enviro/libraryveneer.png")
-- enviro.paralax2 = love.graphics.newImage("enviro/libraryparalax2.png")
-- enviro.paralax = love.graphics.newImage("enviro/libraryparalax.png")
-- enviro.floor = love.graphics.newImage("enviro/library2.png")

if themap == "library" then
  loader.start(function()
    finishedLoading = true
  end)
loader.newImage(enviro,'paralax',"enviro/libraryparalax.png")
loader.newImage(enviro,'paralax2', "enviro/libraryparalax2.png")
loader.newImage(enviro,'floor', "enviro/library2.png")
loader.newImage(enviro,'sky',"enviro/librarysky.png")
loader.newImage(enviro,'librarylpartition', "enviro/librarylpartition.png")
loader.newImage(enviro,'libraryrpartition', "enviro/libraryrpartition.png")
loader.newImage(enviro,'plibrary', "enviro/libraryplayer.png")
loader.newImage(enviro, 'thelibraryveneer',"enviro/libraryveneer.png")

		me.x = 700
		you.x = 2000
		floor = 1900 - 2
		me.y = 300
		you.y = 300
		enviro.rightwall = 3700 
		enviro.ds = 2
    
    thesong = song2
	
end

if themap == "floors" then
  loader.start(function()
    finishedLoading = true
  end)
loader.newImage(enviro,'paralax',"enviro/floorsparalax.png")
loader.newImage(enviro,'floor', "enviro/floors.png")
loader.newImage(enviro,'sky',"enviro/floorssky.png")
loader.newImage(enviro,'pfloors', "enviro/floorsplayer.png")
loader.newImage(enviro, 'floorsveneer2',"enviro/floorsveneer2.png")
loader.newImage(enviro, 'floorsveneer1',"enviro/floorsveneer1.png")
		me.x = 500
		you.x = 3000
		floor = 5898
		me.y = 300
		you.y = 300
		enviro.rightwall = 5000
		enviro.ds = 5
thesong = song2
	
end

end
end
ma1fade= 100
ma2fade= 100
ma3fade= 100
ma4fade= 100
ya1fade= 100
ya2fade= 100
ya3fade= 100
ya4fade= 100
basefade = 80
function drawmyroulette()
--swaps the a2r and a3r if both 
if MENU == "play" then
  if flip1 < 0 then 
    a21r, a31r, a21g, a31g, a21b, a31b  = a31r, a21r, a31g, a21g, a31b, a21b
    end
  if flip2 < 0 then
    a22r, a32r, a22g, a32g, a22b, a32b  = a32r, a22r, a32g, a22g, a32b, a22b
end
end
if themode == "roulette" and not me.dead then
  
if not(r1 == 255 and g1 == 255 and b1 == 255) then  
love.graphics.setColor(r1,g1,b1)
love.graphics.draw(enviro.ma1, me.x-8.25, me.y-8, 0, .5, .5)
end
if not(a21r == 255 and a21g == 255 and a21b == 255) then  
love.graphics.setColor(a21r,a21g,a21b)
love.graphics.draw(enviro.ma2, me.x - (29/2), me.y + 6.75-8, 0, .5,.5)
end
if not(a31r == 255 and a31g == 255 and a31b == 255) then  
love.graphics.setColor(a31r,a31g,a31b)
love.graphics.draw(enviro.ma3, me.x + 30, me.y + 6.75-8, 0, .5,.5)
end
if not(a41r == 255 and a41g == 255 and a41b == 255) then  
love.graphics.setColor(a41r,a41g,a41b)
love.graphics.draw(enviro.ma4, me.x-8.25, me.y + 50-8, 0, .5, .5)
end
love.graphics.setColor(255,255,255)
end

if themode == "classic" and not me.dead then
  
  if controller1.a1 then ma1fade = 255 else ma1fade = basefade end
  
  if flip1 > 0 then
  
  if controller1.a2 then ma2fade = 255 else ma2fade = basefade end
  if controller1.a3 then ma3fade = 255 else ma3fade = basefade end
elseif flip1 < 0 then
  if controller1.a3 then ma2fade = 255 else ma2fade = basefade end
  if controller1.a2 then ma3fade = 255 else ma3fade = basefade end
 end
  
  if controller1.a4 then ma4fade = 255 else ma4fade = basefade end
  
if not(r1 == 255 and g1 == 255 and b1 == 255) then 
love.graphics.setColor(r1,g1,b1,ma1fade)
love.graphics.draw(enviro.ma1, me.x-8.25, me.y-8, 0, .5, .5)
end
if not(a21r == 255 and a21g == 255 and a21b == 255) then 
love.graphics.setColor(a21r,a21g,a21b,ma2fade)
love.graphics.draw(enviro.ma2, me.x - (29/2), me.y + 6.75-8, 0, .5,.5)
end
if not(a31r == 255 and a31g == 255 and a31b == 255) then 
love.graphics.setColor(a31r,a31g,a31b,ma3fade)
love.graphics.draw(enviro.ma3, me.x + 30, me.y + 6.75-8, 0, .5,.5)
end
if not(a41r == 255 and a41g == 255 and a41b == 255) then 
love.graphics.setColor(a41r,a41g,a41b,ma4fade)
love.graphics.draw(enviro.ma4, me.x-8.25, me.y + 50-8, 0, .5, .5)
end

love.graphics.setColor(255,255,255)
end
--swaps the a2r and a3r if both 
if MENU == "play" then
  if flip1 < 0 then 
    a21r, a31r, a21g, a31g, a21b, a31b  = a31r, a21r, a31g, a21g, a31b, a21b
  end
  if flip2 < 0 then
    a22r, a32r, a22g, a32g, a22b, a32b  = a32r, a22r, a32g, a22g, a32b, a22b
end
end
end

function drawyourroulette()
--swaps the a2r and a3r if both 
if MENU == "play" then
  if flip1 < 0 then 
    a21r, a31r, a21g, a31g, a21b, a31b  = a31r, a21r, a31g, a21g, a31b, a21b
    end
  if flip2 < 0 then
    a22r, a32r, a22g, a32g, a22b, a32b  = a32r, a22r, a32g, a22g, a32b, a22b
end
end
if themode == "roulette" and not you.dead then
if not(r2 == 255 and g2 == 255 and b2 == 255) then  
love.graphics.setColor(r2,g2,b2)
love.graphics.draw(enviro.ma1, you.x-8.25, you.y-8, 0, .5, .5)
end
if not(a22r == 255 and a22g == 255 and a22b == 255) then 
love.graphics.setColor(a22r,a22g,a22b)
love.graphics.draw(enviro.ma2, you.x - (29/2), you.y + 6.75-8, 0, .5,.5)
end
if not(a32r == 255 and a32g == 255 and a32b == 255) then 
love.graphics.setColor(a32r,a32g,a32b)
love.graphics.draw(enviro.ma3, you.x + 30, you.y + 6.75-8, 0, .5,.5)
end
if not(a42r == 255 and a42g == 255 and a42b == 255) then 
love.graphics.setColor(a42r,a42g,a42b)
love.graphics.draw(enviro.ma4, you.x-8.25, you.y + 50-8, 0, .5, .5)
end
love.graphics.setColor(255,255,255)
end
if themode == "classic" and not you.dead then
  
   if controller2.a1 then ya1fade = 255 else ya1fade = basefade end
   
if flip2 > 0 then
   
  if controller2.a2 then ya2fade = 255 else ya2fade = basefade end
  if controller2.a3 then ya3fade = 255 else ya3fade = basefade end
  
elseif flip2 < 0 then 
  if controller2.a2 then ya3fade = 255 else ya3fade = basefade end
  if controller2.a3 then ya2fade = 255 else ya2fade = basefade end
  
 end
  
  if controller2.a4 then ya4fade = 255 else ya4fade = basefade end
  
if not(r2 == 255 and g2 == 255 and b2 == 255) then  
love.graphics.setColor(r2,g2,b2,ya1fade)
love.graphics.draw(enviro.ma1, you.x-8.25, you.y-8, 0, .5, .5)
end
if not(a22r == 255 and a22g == 255 and a22b == 255) then 
love.graphics.setColor(a22r,a22g,a22b,ya2fade)
love.graphics.draw(enviro.ma2, you.x - (29/2), you.y + 6.75-8, 0, .5,.5)
end
if not(a32r == 255 and a32g == 255 and a32b == 255) then 
love.graphics.setColor(a32r,a32g,a32b,ya3fade)
love.graphics.draw(enviro.ma3, you.x + 30, you.y + 6.75-8, 0, .5,.5)
end
if not(a42r == 255 and a42g == 255 and a42b == 255) then 
love.graphics.setColor(a42r,a42g,a42b,ya4fade)
love.graphics.draw(enviro.ma4, you.x-8.25, you.y + 50-8, 0, .5, .5)
end
love.graphics.setColor(255,255,255)
end

--swaps the a2r and a3r if both 
if MENU == "play" then
  if flip1 < 0 then 
    a21r, a31r, a21g, a31g, a21b, a31b  = a31r, a21r, a31g, a21g, a31b, a21b
    end
  if flip2 < 0 then
    a22r, a32r, a22g, a32g, a22b, a32b  = a32r, a22r, a32g, a22g, a32b, a22b
end
end
end


function settriangles()
mytriangles = {}
yourtriangles = {}
while table.getn(mytriangles) < 18
do 
table.insert(mytriangles, {(math.ceil(math.random(0,12))), (math.ceil(math.random(0,10))), (math.ceil(math.random(0,7)))})
table.insert(yourtriangles, {(math.ceil(math.random(0,12))), (math.ceil(math.random(0,10))), (math.ceil(math.random(0,7)))})
end
end
function drawtriangles()
for i,v in ipairs(mytriangles) do
	for p,q in ipairs(mytriangles[i])
		do 
			if p == 1 then love.graphics.setColor(a21r, a21g, a21b)
			elseif p == 2 then love.graphics.setColor(a31r, a31g, a31b)
			elseif p == 3 then love.graphics.setColor(a41r, a41g, a41b)
			end
			if q == 1 then
			love.graphics.draw(triangle, ((520 + (p * 50)-ln)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,0, screenwidth/1440, screenheight/900)
			elseif q == 2 then 
				
			love.graphics.draw(triangle, ((570 + (p * 50)-ln)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,1.57079633, screenwidth/1440, screenheight/900)
			elseif q == 3 then 
				
			love.graphics.draw(triangle, ((570 + (p * 50)-ln)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*2, screenwidth/1440, screenheight/900)
			elseif q == 4 then 
				
			love.graphics.draw(triangle, ((520 + (p * 50)-ln)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*3, screenwidth/1440, screenheight/900)
			end
	end
end
for i,v in ipairs(yourtriangles) do
	for p,q in ipairs(yourtriangles[i])
		do 
			if p == 1 then love.graphics.setColor(a22r, a22g, a22b)
			elseif p == 2 then love.graphics.setColor(a32r, a32g, a32b)
			elseif p == 3 then love.graphics.setColor(a42r, a42g, a42b)
			end
			if q == 1 then
			love.graphics.draw(triangle, ((1440 - 520 - 50 - (p * 50)+rn)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,0, screenwidth/1440, screenheight/900)
			elseif q == 2 then 
				
			love.graphics.draw(triangle, ((1440 - 470 - 50 - (p * 50)+rn)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,1.57079633, screenwidth/1440, screenheight/900)
			elseif q == 3 then 
				
			love.graphics.draw(triangle, ((1440 - 470 - 50 - (p * 50)+rn)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*2, screenwidth/1440, screenheight/900)
			elseif q == 4 then 
				
			love.graphics.draw(triangle, ((1440 - 520 - 50 - (p * 50)+rn)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*3, screenwidth/1440, screenheight/900)
			end
	end
end
love.graphics.setColor(255,255,255)
end

lights = function ()
if lighttimer >= 70
		then
		lighttimer = - math.random(100,300)
elseif lighttimer >= 50
		then enviro.light = enviro.lightsoff
		lighttimer = lighttimer + 1
elseif lighttimer >= 36 
		then enviro.light = enviro.lightson
		lighttimer = lighttimer + 1
elseif lighttimer >= 31 
		then enviro.light = enviro.lightsoff
		lighttimer = lighttimer + 1
	else enviro.light = enviro.lightson
		lighttimer = lighttimer + 1
	
	
		
		

end
end
mwjt = 0
initwy = 0
ywjt = 0
yinitwy = 0
--the x coord for either wall to walljump off of
wallwalljump = 45
--wallcheckhelper
function wch(x,v,wallx)
  if (x < wallx and x+v > wallx - walljumpdis) or (x > wallx and x+v < wallx + walljumpdis) then
   return true 
end
end

function wallcheck(ex,vee,why)
  if themap == "library" then
    if wch(ex, vee, 1610) and why > 893 and why < 1643 then 
    return 1610
    elseif wch(ex,vee,wallwalljump) 
    then return wallwalljump
    elseif wch(ex,vee,enviro.rightwall-40)  
    then return enviro.rightwall-40
    else return -1000
    end
  elseif themap == "street" then
    if wch(ex,vee,wallwalljump) 
    then return wallwalljump
    elseif wch(ex,vee,enviro.rightwall-40)  
    then return enviro.rightwall-40
    else return -1000
  end
  elseif themap == "fightclub" then
    if wch(ex,vee,wallwalljump) 
    then return wallwalljump
    elseif wch(ex,vee,enviro.rightwall)  
    then return enviro.rightwall
    else return -1000
  end
  elseif themap == "floors" then
    if wch(ex,vee,wallwalljump) 
    then return wallwalljump
    elseif wch(ex, vee, 2139) and ((why > 2763 and why < 5778) or(why > 1613 and why < 2183))  then 
    return 2139
    elseif wch(ex, vee, 419) and why > 1898 then 
    return 419
      elseif wch(ex, vee, 3159) and why > 2829 then 
    return 3159
    elseif wch(ex,vee,enviro.rightwall-wallwalljump)  
    then return enviro.rightwall-wallwalljump
    else return -1000
    end
    
  end
end
--when you do it from the right side it doesnt turn around, maybe check the lr
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
--CHANGE THIS SO THAT IT DOESNT DO DURING ANY ATTACKS
mwalllr = 0
mwallx = 0
ywalllr = 0
ywallx = 0
function walljump()
  if me.flinch or controller1.a1 or controller1.a2 or controller1.a3 or controller1.a4 then mwjt = 0 end
  if wallcheck(me.mid+15*me.lr,me.v,me.y+ 30-me.j) > -10 and ((controller1.left and me.v > minvforwalljump) or (controller1.right and me.v < -minvforwalljump)) and mwjt == 0 and not anyofmyprimes() and not anyofmycombos() and math.abs(me.j) > 0 and not me.flinch
  then
   mwjt = 1 
   initwy = me.y - me.j
   mwalllr = me.lr
   mwallx = wallcheck(me.mid+15*me.lr,me.v,me.y+ 30-me.j) -15 - 15*me.lr - 29*me.lr
end
if mwjt > 0 then 
  mwjt = mwjt + 1
  if mwjt > 8 then 
    mwjt = 0
    if me.v >= 0 then me.lr = 1
    else me.lr = -1
      end
  elseif mwjt > 7 then 
    mwjt = 0 
    me.lr = mwalllr
    if controller1.up then
    me.jt = me.jt + walljumpjt2
    me.j = walljumpvv2
    me.v = walljumpv2 *-mwalllr
  else
    me.jt = me.jt + walljumpjt
    me.j = walljumpvv
    me.v = walljumpv *-mwalllr
    end
   
  else 
    me.x = mwallx
    me.v = 0
    me.j = 0
    me.im = wallgrab
    me.y = initwy
    me.lr = mwalllr
    
     
  end
end

if you.flinch or controller2.a1 or controller2.a2 or controller2.a3 or controller2.a4 then ywjt = 0 end
  if wallcheck(you.mid+15*you.lr,you.v,you.y+ 30-you.j) > -10 and ((controller2.left and you.v > minvforwalljump) or (controller2.right and you.v < -minvforwalljump)) and ywjt == 0 and not anyofyourprimes() and not anyofyourcombos() and math.abs(you.j) > 0 and not you.flinch
  then
   ywjt = 1 
   yinitwy = you.y - you.j
   ywalllr = you.lr
   ywallx = wallcheck(you.mid+15*you.lr,you.v,you.y+ 30-you.j) -15 - 15*you.lr - 29*you.lr
end
if ywjt > 0 then 
  ywjt = ywjt + 1
  if ywjt > 8 then 
    ywjt = 0
    if you.v >= 0 then you.lr = 1
    else you.lr = -1
      end
  elseif ywjt > 7 then 
    ywjt = 0 
    you.lr = ywalllr
    if controller2.up then
    you.jt = you.jt + walljumpjt2
    you.j = walljumpvv2
    you.v = walljumpv2 *-ywalllr
  else
    you.jt = you.jt + walljumpjt
    you.j = walljumpvv
    you.v = walljumpv *-ywalllr
    end
  else 
    you.x = ywallx
    you.v = 0
    you.j = 0
    you.im = wallgrab
    you.y = yinitwy
    you.lr = ywalllr
    
     
  end
end


end
function drawstreetprestuff()
	love.graphics.draw(enviro.light, 4448, 1525)
lights()
  
end
drawstreetstuff = function()
love.graphics.draw(enviro.floorfloor, 0, floor-1, 0, 1, 20)
	drawrubble()
  drawdust()
	love.graphics.draw(enviro.rafters,5608-502, 1536)
	love.graphics.draw(enviro.buildingwall,-1500, 0)
	love.graphics.draw(enviro.partitionwall,7027-510, 0)

end
drawlibrarystuff = function()
		drawrubble()
    drawdust()
		love.graphics.draw(enviro.plibrary,0,0)
		love.graphics.draw(enviro.librarylpartition,-1630, -61)
		love.graphics.draw(enviro.libraryrpartition,enviro.rightwall-200, -61)
		libraryveneer()
end

drawfloorsstuff = function()
		drawrubble()
drawdust()
    drawglass()
    drawpapers()
		love.graphics.draw(enviro.pfloors,0,0)
		love.graphics.draw(partition,-1800+270, 1,0, 10,3.11)
    love.graphics.draw(partition,enviro.rightwall-270, 1,0, 10,3.11)
		floorsveneer()
end

enviro.rubble = love.graphics.newImage("enviro/rubble.png")
enviro.glass = love.graphics.newImage("enviro/glass.png")
rubble = {}
glasseses = {}
dust = {}
papers = {}
dustn = 0
blackn = 0
glassn = 0
glassclarity = 255
elar = frana
function drawpapers()
  
for i = #papers, 1, -1 do
  local temp = papers[i]
  --if paper hits the ceiling
  if platformcheck(temp.x,temp.y-temp.j-5,-temp.j) then
    temp.j = 0
    end
if platformcheck(temp.x,temp.y-5,temp.j) or temp.y > 100000 or temp.x < -10 or temp.x > 10000 then table.remove(papers,i) end
 
end
for i,v in ipairs(papers)do
if not actionshot and not youactionshot and not pause then
v.y = v.y - v.j
v.x = v.x + v.v
if v.v > 1 then v.v = v.v - .2
elseif v.v < -1 then v.v = v.v + .2
  end
if v.j > -1 then v.j = v.j - .1
end

if math.abs(me.mid-v.x) < 25 and math.abs(me.y+27 - v.y) < 50 and me.v+me.j > 7
then v.v = v.v + me.v*.025
  v.j = v.j + me.j*.01 + .1
 end
if math.abs(you.mid-v.x) < 25 and math.abs(you.y+27 - v.y) < 50 and you.v+you.j > 7
then v.v = v.v + you.v*.025
  v.j = v.j + you.j*.01 + .1
 end
 
 for p,q in ipairs(me.tornado)  do
 if math.abs(q.x-v.x) < 25 and math.abs(q.y - v.y) < 50 
then 
  if v.x < me.thecenter then
  v.v = math.random(-1,10)
  else
  v.v = math.random(-10,1)
  end
  v.j = math.random(5,10)
 end
end
for p,q in ipairs(you.tornado) do
 if math.abs(q.x-v.x) < 25 and math.abs(q.y - v.y) < 50 
then if v.x < you.thecenter then
  v.v = math.random(-1,10)
  else
  v.v = math.random(-10,1)
  end
  v.j = math.random(5,10)
 end
 end
if v.n < papertime then
v.n = v.n + 1
else v.n = 0
v.lr = -v.lr
end
end


if v.n < 10 then love.graphics.draw(paper1,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
elseif v.n < 20 then love.graphics.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
elseif v.n < 30 then love.graphics.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
elseif v.n < papertime -20 then love.graphics.draw(paper4,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
elseif v.n < papertime -10 then love.graphics.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
elseif v.n < papertime then love.graphics.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
end

end
end

function makepapers(ex,why,vee,jay,en)
for i = en, 1, -1 do
  if math.random() > .5 then 
    elar = 1
  else elar = -1
  end
  if vee > 0 then
     table.insert(papers,{x = ex, y = why, v=vee/3 + math.random()*5, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
  elseif vee < 0 then
   table.insert(papers,{x = ex, y = why, v=vee/3 - math.random()*5, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
 else
   table.insert(papers,{x = ex, y = why, v=vee/3 + math.random()*5*elar, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
   end
end
end


function drawglass()
  
for i = #glasseses, 1, -1 do
  local temp = glasseses[i]
if platformcheck(temp.x,temp.y,temp.j) or temp.y > 100000 or temp.x < -10 or temp.x > 10000 then table.remove(glasseses,i) end
 
end
for i,v in ipairs(glasseses)do
if #glasseses > 500 then table.remove(glasseses,500) end
if not actionshot and not youactionshot and not pause then
v.y = v.y - v.j
v.x = v.x + v.v
v.j = v.j - .3
glassn = math.random(155,255)
glassclarity = math.random(55,255)
end
love.graphics.setColor(glassn,255,255,classclarity)
love.graphics.draw(enviro.glass,v.x,v.y,70/(v.v+v.y),math.random(-1.5,1.5),math.random(-1.5,1.5))
love.graphics.setColor(255,255,255)

end
end

function drawdust()
  
 for i = #dust, 1, -1 do
  local temp = dust[i]
if platformcheck(temp.x,temp.y,temp.j) or temp.y > 100000 or temp.x < -10 or temp.x > 10000 then table.remove(dust,i) end
 
end
  
for i,v in ipairs(dust)do
if not actionshot and not youactionshot and not pause then
v.y = v.y - v.j
v.x = v.x + v.v
v.j = v.j - .2
dustn = math.random(100,200)
end
love.graphics.setColor(dustn,dustn,dustn)
love.graphics.draw(enviro.rubble,v.x,v.y,70/(v.v+v.y),1.2,1.2)
love.graphics.setColor(255,255,255)

end
end
function drawrubble()
  
    for i = #rubble, 1, -1 do
  local temp = rubble[i]
if platformcheck(temp.x,temp.y,temp.j) or temp.y > 100000 or temp.x < -10 or temp.x > 10000 then table.remove(rubble,i) end
 
end
  
for i,v in ipairs(rubble)do
if table.getn(rubble) > 500 then table.remove(rubble,500) end
if not actionshot and not youactionshot and not pause then
v.y = v.y - v.j
v.x = v.x + v.v
v.j = v.j - .3
blackn = math.random(80,150)
end
love.graphics.setColor(blackn,blackn,blackn)
love.graphics.draw(enviro.rubble,v.x,v.y,70/(v.v+v.y),2.2,2.2)
love.graphics.setColor(255,255,255)
end
end
function makerunrubble(why,ex,vee)
  if vee > 0 then
    table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = math.random(2,7)})
    else
  table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = math.random(2,7)})
  table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = math.random(2,7)})
end
end
function makeslidedust(why,ex,vee)
  if vee > 3 and math.random() > .5 then
  table.insert(dust,{x = ex, y = why, v=vee/3 + math.random(3), j = math.random(0,vee/4+2)})
elseif vee < 3 and math.random() > .5 then
   table.insert(dust,{x = ex, y = why, v=vee/3 - math.random(3), j = math.random(0,-vee/4+2)})
end
end
function makerubble(ex,why,vee,jay)
  if vee > 0 then
			table.insert(rubble,{x = ex, y = why, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+5, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+4, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+6, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+8, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+10, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+15, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+14, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+16, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+18, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+50, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+55, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+54, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+56, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+58, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+30, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+35, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+34, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+36, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+38, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+40, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+45, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+44, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+46, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+48, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+50, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+55, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+54, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+56, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+58, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+60, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+62, v=vee + math.random(5), j = jay-1*math.random(5)})
      else
      table.insert(rubble,{x = ex, y = why, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+5, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+4, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+6, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+8, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+10, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+15, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+14, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+16, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+18, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+50, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+55, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+54, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+56, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+58, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+30, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+35, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+34, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+36, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+38, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+40, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+45, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+44, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+46, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+48, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+50, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+55, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+54, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+56, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+58, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+60, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(rubble,{x = ex, y = why+62, v=vee - math.random(5), j = jay-1*math.random(5)})
end


end
function makeglass (ex,why,vee,jay)
  if vee > 0 then
			table.insert(glasseses,{x = ex, y = why, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+5, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+4, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+6, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+8, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+10, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+15, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+14, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+16, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+18, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+50, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+55, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+54, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+56, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+58, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+30, v=vee + math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+35, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+34, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+36, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+38, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+40, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+45, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+44, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+46, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+48, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+50, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+55, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+54, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+56, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+58, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+60, v=vee + math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+62, v=vee + math.random(5), j = jay-1*math.random(5)})
    else
      
			table.insert(glasseses,{x = ex, y = why, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+5, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+4, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+6, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+8, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+10, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+15, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+14, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+16, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+18, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+50, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+55, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+54, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+56, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+58, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+30, v=vee - math.random(5), j = jay+1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+35, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+34, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+36, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+38, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+40, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+45, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+44, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+46, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+48, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+50, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+55, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+54, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+56, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+58, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+60, v=vee - math.random(5), j = jay-1*math.random(5)})
			table.insert(glasseses,{x = ex, y = why+62, v=vee - math.random(5), j = jay-1*math.random(5)})
      
      end
glassn = math.random(200)

end

function makefloorrubble(ex,why,vee,jay)
	if jay > 0 then miscjay = 1
		why = why - 60
		jay = jay/2
		else miscjay = -1
	end
		
		table.insert(rubble,{x = ex-2, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-4, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-6, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-8, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-10, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-12, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-14, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-16, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-18, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+2, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+4, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+6, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+8, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+10, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+12, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+14, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+16, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+18, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
table.insert(rubble,{x = ex-2, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-4, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-6, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-8, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-10, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-12, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-14, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-16, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex-18, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+2, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+4, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+6, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+8, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+10, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+12, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+14, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+16, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
		table.insert(rubble,{x = ex+18, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
blackn = math.random(200)

end

function makefloorglass(ex,why,vee,jay)
	if jay > 0 then miscjay = 1
		why = why - 60
		jay = jay/2
		else miscjay = -1
	end
		table.insert(glasseses,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
table.insert(glasseses,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(glasseses,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
blackn = math.random(200)
end

lvfade = 255
lvfade2 = 255

function wallslowmehdown()
if me.v > 6 then me.v = me.v - 5
elseif me.v < -6 then me.v = me.v + 5
end
end
function wallslowyouhdown()
if you.v > 6 then you.v = you.v - 5
elseif you.v < -6 then you.v = you.v + 5
end
end
function wallslowyouvdown()
if you.j > 5 then you.j = you.j - 4
elseif you.j < -5 then you.j = you.j + 4
end
end
function wallslowmevdown()
if me.j > 5 then me.j = me.j - 4
elseif me.j < -5 then me.j = me.j + 4
end
end
function libraryveneer()
	if themap == "library" then
if lvfade > 0  and ((me.mid > 1605 and me.mid < 3202 and me.feet > 874) or (you.mid > 1605 and you.mid < 3202 and you.feet > 874))
then lvfade = lvfade - 5
elseif lvfade < 255 then lvfade = lvfade + 5
end
love.graphics.setColor(255,255,255,lvfade)
love.graphics.draw(enviro.thelibraryveneer, 0, 0)
love.graphics.setColor(255,255,255)
end
end

function floorsveneer()
	if themap == "floors" then
if lvfade > 0  and ((me.mid > 416 and me.mid < 2142 and me.feet > 1899) or (you.mid > 416 and you.mid < 2142 and you.feet > 1899))
then lvfade = lvfade - 5
elseif lvfade < 255 then lvfade = lvfade + 5
end
if lvfade2 > 0  and ((me.mid > 3157 and me.mid < 4896 and me.feet > 2829) or (you.mid > 3157 and you.mid < 4896 and you.feet > 2829))
then lvfade2 = lvfade2 - 5
elseif lvfade2 < 255 then lvfade2 = lvfade2 + 5
end
love.graphics.setColor(255,255,255,lvfade)
love.graphics.draw(enviro.floorsveneer1, 416, 1898)
love.graphics.setColor(255,255,255)
love.graphics.setColor(255,255,255,lvfade2)
love.graphics.draw(enviro.floorsveneer2, 3157, 2829)
love.graphics.setColor(255,255,255)
end
end

function libwallbreak()
	if me.mid < 1610 and me.mid + me.v > 1610 and me.y > 893 and me.y <1643 
		then repplay(wallbreaks)
		makerubble(me.mid,me.y,me.v,me.j)
		wallslowmehdown()
	end
	if me.mid > 1610 and me.mid + me.v < 1610 and me.y > 893 and me.y <1643 
		then repplay(wallbreaks)
		makerubble(me.mid,me.y,me.v,me.j)
		wallslowmehdown()
	end
	if me.mid > 1660 and me.mid < 3196 and me.y < 882 and me.y - me.j > 882
		then 
			repplay(wallbreaks)
			makefloorrubble(me.mid,me.y,me.v,me.j)
			wallslowmevdown()
	end
	if me.mid > 1660 and me.mid < 3196 and me.y > 882 and me.y - me.j < 882
		then 
			repplay(wallbreaks)
			makefloorrubble(me.mid,me.y,me.v,me.j)
			wallslowmevdown()
	end
	if you.mid < 1610 and you.mid + you.v > 1610 and you.y > 893 and you.y <1643 
		then repplay(wallbreaks)
		makerubble(you.mid,you.y,you.v,you.j)
		wallslowyouhdown()
	end
	if you.mid > 1610 and you.mid + you.v < 1610 and you.y > 893 and you.y <1643 
		then repplay(wallbreaks)
		makerubble(you.mid,you.y,you.v,you.j)
		wallslowyouhdown()
	end
	if you.mid > 1660 and you.mid < 3196 and you.y < 882 and you.y - you.j > 882
		then 
			repplay(wallbreaks)
			makefloorrubble(you.mid,you.y,you.v,you.j)
			wallslowyouvdown()
	end
	if you.mid > 1660 and you.mid < 3196 and you.y > 882 and you.y - you.j < 882
		then 
			repplay(wallbreaks)
			makefloorrubble(you.mid,you.y,you.v,you.j)
			wallslowyouvdown()
	end


	--if me.im = jump then a new shoulder jump?


end


  
function floorswallbreak()
  
  mespeed = math.sqrt((me.v*me.v)+(me.j*me.j))
youspeed = math.sqrt((you.v*you.v)+(you.j*you.j))
	if ((me.mid > 3159 and me.mid + me.v <= 3159) or (me.mid < 3159 and me.mid + me.v >= 3159)) and me.y > 2829 
		then repplay(wallbreaks)
		makerubble(me.mid,me.y,me.v,me.j)
		wallslowmehdown()
end
	if ((me.mid > 2140 and me.mid + me.v <= 2140) or (me.mid < 2140 and me.mid + me.v >= 2140)) and me.y > 1619 and me.y < 5586
		then repplay(glassbreaks)
		makeglass(me.mid,me.y,me.v,me.j)
	
end

if ((you.mid > 2140 and you.mid + you.v <= 2140) or (you.mid < 2140 and you.mid + you.v >= 2140)) and you.y > 1619 and you.y < 5586
		then repplay(glassbreaks)
		makeglass(you.mid,you.y,you.v,you.j)
	
end

if ((you.mid > 3159 and you.mid + you.v <= 3159) or (you.mid < 3159 and you.mid + you.v >= 3159)) and you.y > 2829 
		then repplay(wallbreaks)
		makerubble(you.mid,you.y,you.v,you.j)
		wallslowyouhdown()
end

	if ((me.mid > 419 and me.mid + me.v <= 419) or (me.mid < 419 and me.mid + me.v >= 419)) and me.y > 1905 and me.y < 5586
		then repplay(glassbreaks)
		makeglass(me.mid,me.y,me.v,me.j)
	
end

	if ((me.mid > 419 and me.mid + me.v <= 419) or (me.mid < 419 and me.mid + me.v >= 419)) and me.y < 1905
		then repplay(wallbreaks)
		makeglass(me.mid,me.y,me.v,me.j)
	
end

if ((you.mid > 419 and you.mid + you.v <= 419) or (you.mid < 419 and you.mid + you.v >= 419)) and you.y > 1905 and you.y < 5586
		then repplay(glassbreaks)
		makeglass(you.mid,you.y,you.v,you.j)
	
end
if ((you.mid > 419 and you.mid + you.v <= 419) or (you.mid < 419 and you.mid + you.v >= 419)) and you.y < 1905
		then repplay(wallbreaks)
		makeglass(you.mid,you.y,you.v,you.j)
	
end

if me.mid > 2183 and me.mid < 2723 and me.y > 2693 and me.y - me.j < 2693
		then 
			repplay(wallbreaks)
			makefloorglass(me.mid,me.y,me.v,me.j)
	end
  
  if me.mid > 2183 and me.mid < 2723 and me.feet < 2693 and me.feet - me.j > 2693
		then 
			repplay(wallbreaks)
			makefloorglass(me.mid,me.feet,me.v,me.j)
	end
  
  if you.mid > 2183 and you.mid < 2723 and you.y > 2693 and you.y - you.j < 2693
		then 
			repplay(wallbreaks)
			makefloorglass(you.mid,you.y,you.v,you.j)
	end
  
    if you.mid > 2183 and you.mid < 2723 and you.feet < 2693 and you.feet - you.j > 2693
		then 
			repplay(wallbreaks)
			makefloorglass(you.mid,you.feet,you.v,you.j)
	end
if ((you.mid > 2140 and you.mid + you.v <= 2140) or (you.mid < 2140 and you.mid + you.v >= 2140)) and you.feet > 5616 and you.feet < 5780
		then 
			repplay(wallbreaks)
			makerubble(you.mid,you.feet,you.v,you.j)
      wallslowyouhdown()
	end
  
if ((me.mid > 2140 and me.mid + me.v <= 2140) or (me.mid < 2140 and me.mid + me.v >= 2140)) and me.feet > 5616 and me.feet < 5780 
		then 
			repplay(wallbreaks)
			makerubble(me.mid,me.feet,me.v,me.j)
      wallslowmehdown()
	end

if findxIntersect(600,4419,633,4455,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 8)
end
if findxIntersect(1528,3574,1542,3587,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 2)
end
if findxIntersect(1882,4366,1965,4472,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 40)
end
if findxIntersect(1803,5002,1832,5019,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 5)
end
if findxIntersect(718,4994,751,5018,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 6)
end

if findxIntersect(838,5278,856,5304,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 5)
end
if findxIntersect(1524,5282,1538,5304,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 4)
end
if findxIntersect(1712,5269,1725,5278,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 1)
end
if findxIntersect(1558,5573,1581,5590,me.mid+me.v,me.y-me.j+30,me.mid,me.y+30) and mespeed > paperweight then
    makepapers(me.mid,me.y,me.v, me.j, 1)
end

if findxIntersect(600,4419,633,4455,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 8)
end
if findxIntersect(1528,3574,1542,3587,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 2)
end
if findxIntersect(1882,4366,1965,4472,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 40)
end
if findxIntersect(1803,5002,1832,5019,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 5)
end
if findxIntersect(718,4994,751,5018,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 6)
end
if findxIntersect(838,5278,856,5304,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 5)
end
if findxIntersect(1524,5282,1538,5304,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 4)
end
if findxIntersect(1712,5269,1725,5278,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 1)
end
if findxIntersect(1558,5573,1581,5590,you.mid+you.v,you.y-you.j+30,you.mid,you.y+30) and youspeed > paperweight then
    makepapers(you.mid,you.y,you.v,you.j, 1)
end

for p,q in ipairs(me.tornado) do
if math.random()>.5 then
if findxIntersect(600,4419,633,4455,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1528,3574,1542,3587,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1882,4366,1965,4472,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1803,5002,1832,5019,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(718,4994,751,5018,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(838,5278,856,5304,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1524,5282,1538,5304,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1712,5269,1725,5278,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1558,5573,1581,5590,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
end
for p,q in ipairs(you.tornado) do
 
 if findxIntersect(600,4419,633,4455,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1528,3574,1542,3587,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1882,4366,1965,4472,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1803,5002,1832,5019,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(718,4994,751,5018,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(838,5278,856,5304,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1524,5282,1538,5304,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1712,5269,1725,5278,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
if findxIntersect(1558,5573,1581,5590,q.x+q.v,q.y,q.x,q.y) then
    makepapers(q.x,q.y,q.v,windpush,1)
end
 
 end
end



end







spines = {}
function aboutso(x,y)
  if (x <= y and x + 2 > y) or (x >= y and x - 2 < y)
  then return true
else return false
  end
end
retryupdate = function()
	
	controller1.a1 = love.keyboard.isDown("f")
	controller1.a2 = love.keyboard.isDown("t")
	controller1.a3 = love.keyboard.isDown("h")
	controller1.block = love.keyboard.isDown("e")

	controller2.a1 = love.keyboard.isDown("left")
	controller2.a2 = love.keyboard.isDown("up")
	controller2.a3 = love.keyboard.isDown("right")
	controller2.block = love.keyboard.isDown("o")
	joystickss()

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
love.graphics.setColor(a31r,a31g,a31b, retryfade)
love.graphics.draw(enviro.v, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(a31r,a31g,a31b, retryfade)
love.graphics.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255, 255, 255, 255)
elseif me.dead then
love.graphics.setColor(a22r,a22g,a22b, retryfade)
love.graphics.draw(enviro.v, screenwidth, 0, 0, -screenwidth/1440, screenheight/900)
love.graphics.setColor(a22r,a22g,a22b, retryfade)
love.graphics.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
love.graphics.setColor(255, 255, 255, 255)
end

end



oscillator = 0
oup=true
soscillator = 0
soup=true
first = true
spineymove = 0
seperatespines = false
drawspine = function()
if table.getn(spines) < 1 and MENU ~= "postpostchoose"
then
spinen = 11
sosfirst = true
spinestartx = 680
spineymove = 0
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=26, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=25, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=24, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=23, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=22, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=21, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=20, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=19, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=18, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=17, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=16, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=15, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=14, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=13, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=12, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=11, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=10, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=9, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=8, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=7, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=6, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=5, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=4, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=3, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=2, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=1, v=0, spinecolor = 0, spinecolor2 = 0})
table.insert(spines, {x=(spinestartx/1440)*screenwidth, y=0, n=0, v=0, spinecolor = 0, spinecolor2 = 0})




end
if finishedLoading then seperateSpines = true
end

if seperateSpines then 
  if soscillator < -8 then soscillator = soscillator - 2
  elseif soscillator > 8 then  soscillator = soscillator + 2
    end
end

oddeven = oddeven + 1
spinecolor = 0

if soscillator == 0 and soup then spinen = 11
 elseif soscillator == 1.5*spinen then soup = false
 elseif sosfirst and soscillator == spinen then soup = false
 elseif soscillator == -1.5*spinen then soup = true sosfirst = false
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

	if oddeven%4 == 1 then
		if v.n >= 1 then 
			v.v = spines[i+1].v
			v.x = v.x + v.v 
			if math.abs(v.v) >= (15.6*screenwidth)/1440 and math.abs(v.v) <= (16.5*screenwidth)/1440  then 
				if v.v > 0 then 
				v.spinecolor = spines[i+1].spinecolor
				else
				v.spinecolor2 = spines[i+1].spinecolor2
				end
			end
		else
			if math.abs(v.v) >= (15.6*screenwidth)/1440 and math.abs(v.v) <= (16.5*screenwidth)/1440 then 
				if v.v > 0 then 
					if v.spinecolor < 3 then v.spinecolor = v.spinecolor + 1
					else v.spinecolor = 0
					end
				else
					if v.spinecolor2 < 3 then v.spinecolor2 = v.spinecolor2 + 1
					else v.spinecolor2 = 0
					end
				end
			end
			v.v = soscillator*screenwidth/1440 
			v.x = v.x + v.v
		end
	end

	if v.n > 0 then
	if v.v >= 0 then
		if v.spinecolor == 0 then 
		love.graphics.setColor(a32r,a32g,a32b)
		elseif v.spinecolor == 1 then 
		love.graphics.setColor(a42r,a42g,a42b)
		elseif v.spinecolor == 2 then 
		love.graphics.setColor(a22r,a22g,a22b)
		elseif v.spinecolor == 3 then 
		love.graphics.setColor(r2,g2,b2)
		end
	love.graphics.draw(enviro.spine, v.x, ((v.n * 40)/900)*screenheight-(50*screenheight/1000)+spineymove, 0, screenwidth/1440, screenheight/1100)
		if v.spinecolor2 == 0 then 
		love.graphics.setColor(a31r,a31g,a31b)
		elseif v.spinecolor2 == 1 then 
		love.graphics.setColor(a41r,a41g,a41b)
		elseif v.spinecolor2 == 2 then 
		love.graphics.setColor(a21r,a21g,a21b)
		elseif v.spinecolor2 == 3 then 
		love.graphics.setColor(r1,g1,b1)
		end
	love.graphics.draw(enviro.spine, screenwidth - v.x, ((v.n * 40)/900)*screenheight-(50*screenheight/1000)+spineymove, 0, -screenwidth/1440, screenheight/1100)
	else
		if v.spinecolor2 == 0 then 
		love.graphics.setColor(a31r,a31g,a31b)
		elseif v.spinecolor2 == 1 then 
		love.graphics.setColor(a41r,a41g,a41b)
		elseif v.spinecolor2 == 2 then 
		love.graphics.setColor(a21r,a21g,a21b)
		elseif v.spinecolor2 == 3 then 
		love.graphics.setColor(r1,g1,b1)
		end
	love.graphics.draw(enviro.spine, screenwidth - v.x, ((v.n * 40)/900)*screenheight-(50*screenheight/1000)+spineymove, 0, -screenwidth/1440, screenheight/1100)
		if v.spinecolor == 0 then 
		love.graphics.setColor(a32r,a32g,a32b)
		elseif v.spinecolor == 1 then 
		love.graphics.setColor(a42r,a42g,a42b)
		elseif v.spinecolor == 2 then 
		love.graphics.setColor(a22r,a22g,a22b)
		elseif v.spinecolor == 3 then 
		love.graphics.setColor(r2,g2,b2)
		end
	love.graphics.draw(enviro.spine, v.x, ((v.n * 40)/900)*screenheight-(50*screenheight/1000)+spineymove, 0, screenwidth/1440, screenheight/1100)
	end
end
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
  if gotimer==0 then gosound:rewind()
    end
if gotimer < 40 then
gotimer = gotimer + 1
love.graphics.draw(enviro.go,screenwidth/4 -5 + math.random(10),screenheight/4-5 + math.random(10),0,screenwidth/1440,screenheight/900)
gosound:play()
end
end

medeathclock = 0
youdeathclock = 0
function drawroulettenumbers()
	numshake = math.random(-5,5)
	if themode == "roulette" then
if youdeathclock < 5 and youdeathclock > 0 then
love.graphics.draw(enviro.x,0,0,0,screenwidth/1440,screenheight/900)
if you.lives == 4 then love.graphics.draw(enviro.iv,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif you.lives == 3 then love.graphics.draw(enviro.iii,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif you.lives == 2 then love.graphics.draw(enviro.ii,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif you.lives == 1 then love.graphics.draw(enviro.i,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
end
elseif medeathclock < 5 and medeathclock > 0 then
love.graphics.draw(enviro.x,0,0,0,screenwidth/1440,screenheight/900)
  if me.lives == 4 then love.graphics.draw(enviro.iv,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif me.lives == 3 then love.graphics.draw(enviro.iii,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif me.lives == 2 then love.graphics.draw(enviro.ii,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
 elseif me.lives == 1 then love.graphics.draw(enviro.i,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
end
end
end
end

death = function()
if themode == "classic" or (themode == "roulette" and (me.lives == 0 or you.lives == 0)) then
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

elseif themode == "roulette" then
		if you.health<0 then 
			if not you.dead then you.lives = you.lives - 1
			deathsound2:play() end
	you.dead = true
	youdeathclock = youdeathclock + 1
	if youdeathclock > 104- 30 then 
		you.dead = false
		youdeathclock = 0
		you.health = maxhealth
		you.v = 0
		you.j = 0
		myroulettespin()
		yourroulettespin()
		if themap == "street" then 
			if me.x > 3500 then you.x = 600 you.y = 600
			else you.x = 6000 you.y = 1000
			end
		elseif themap == "library" then 
			if me.x > 1000 then you.x = 700 you.y = 600
			else you.x = 2000 you.y = 600
			end
		end
			
	elseif youdeathclock > 101- 30 then you.im = fade8 
		me.im = morph7
	elseif youdeathclock > 98- 30 then you.im = fade7
		me.im = morph7
	elseif youdeathclock > 95- 30 then you.im = fade6
		me.im = morph6
	elseif youdeathclock > 92- 30 then you.im = fade5
		me.im = morph5
	elseif youdeathclock > 89- 30 then you.im = fade4
		me.im = morph4
	elseif youdeathclock > 86- 30 then you.im = fade3
		me.im = morph3
	elseif youdeathclock > 83- 30 then you.im = fade2
		me.im = morph2
	elseif youdeathclock > 80- 30 then you.im = fade1
		me.im = morph1
	end
end
if me.health<0 then 
	if not me.dead then me.lives = me.lives - 1 
	deathsound2:play()
	end
	me.dead = true
	medeathclock = medeathclock + 1

	if medeathclock > 104- 20 then 
		me.dead = false
		medeathclock = 0
		me.health = maxhealth
		me.v = 0
		me.j = 0
		myroulettespin()
		yourroulettespin()
		if themap == "street" then 
			if me.x > 3500 then me.x = 600 me.y = 600
			else me.x = 6000 me.y = 1000
			end
		elseif themap == "library" then 
			if me.x > 1000 then me.x = 700 me.y = 600
			else me.x = 2000 me.y = 600
			end
		end
			
	elseif medeathclock > 101- 30 then me.im = fade8 
		you.im = morph7
	elseif medeathclock > 98- 30 then me.im = fade7
		you.im = morph7
	elseif medeathclock > 95- 30 then me.im = fade6
		you.im = morph6
	elseif medeathclock > 92- 30 then me.im = fade5
		you.im = morph5
	elseif medeathclock > 89- 30 then me.im = fade4
		you.im = morph4
	elseif medeathclock > 86- 30 then me.im = fade3
		you.im = morph3
	elseif medeathclock > 83- 30 then me.im = fade2
		you.im = morph2
	elseif medeathclock > 80- 30 then me.im = fade1
		you.im = morph1
	end
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
me.walktimer = 0
you.walktimer = 0
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
	end

if ywjt <= 1 then
	if lefty
	then 
	you.lr = -1
	elseif righty
	then you.lr = 1
  end
 end
if mwjt <= 1 then
	if leftme 
	then me.lr = -1
	elseif rightme
	then me.lr = 1
  end
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
  
  
  if you.running then 
     you.walktimer = you.walktimer + 1
    
    if you.walktimer >= runpace+2 then you.im = run4 
    you.walktimer = 0 
     repplay(runsound2)
               makerunrubble(you.y+50,you.mid,-you.v)
    elseif you.walktimer >= runpace+1 then you.im = run4 
               makerunrubble(you.y+50,you.mid,-you.v)
    elseif you.walktimer >= runpace/2 + 2 then you.im = run3 
  elseif you.walktimer >= runpace/2 then you.im = run2 
               makerunrubble(you.y+50,you.mid,-you.v)
               repplay(runsound2)
    elseif you.walktimer >= 0 then you.im = run1 
    end  
  else
  
	if you.walktimer < 7 then 
		you.im = walk1
		you.walktimer = you.walktimer + 1
	elseif you.walktimer >= 7 and you.walktimer < 14 then
		you.im = walk2
		you.walktimer = you.walktimer + 1
	elseif you.walktimer >= 14 and you.walktimer < 21 then
		you.im = walk3
		you.walktimer = you.walktimer + 1
	elseif you.walktimer >= 21 and you.walktimer < 28 then
		you.im = walk4
		you.walktimer = you.walktimer + 1
	elseif you.walktimer >= 28 and you.walktimer < 35 then
		you.im = walk5
		you.walktimer = you.walktimer + 1
	else
		you.walktimer = 0
	end
  end
end
walkme = function ()
  
  
  if me.running then 
     me.walktimer = me.walktimer + 1
    
    if me.walktimer >= runpace+2 then me.im = run4 
    me.walktimer = 0
    repplay(runsound)
    makerunrubble(me.y+50,me.mid,-me.v)
    elseif me.walktimer >= runpace + 1 then me.im = run4 
    makerunrubble(me.y+50,me.mid,-me.v)
  elseif me.walktimer >= runpace/2 + 2 then me.im = run3 
    elseif me.walktimer >= runpace/2 then me.im = run2 
    makerunrubble(me.y+50,me.mid,-me.v)
    repplay(runsound)
    elseif me.walktimer >= 0 then me.im = run1 
    end  
  else
  
	if me.walktimer < 7 then 
		me.im = walk1
		me.walktimer = me.walktimer + 1
	elseif me.walktimer >= 7 and me.walktimer < 14 then
		me.im = walk2
		me.walktimer = me.walktimer + 1
	elseif me.walktimer >= 14 and me.walktimer < 21 then
		me.im = walk3
		me.walktimer = me.walktimer + 1
	elseif me.walktimer >= 21 and me.walktimer < 28 then
		me.im = walk4
		me.walktimer = me.walktimer + 1
	elseif me.walktimer >= 28 and me.walktimer < 35 then
		me.im = walk5
		me.walktimer = me.walktimer + 1
	else
		me.walktimer = 0
	end
  end
end
jumpy = function ()
   if ywjt == 0 then
	if you.j > 0 then 
		you.im = jumprise
	else you.im = jumpfalling
end
end
end
jumpme = function ()
  if mwjt == 0 then
	if me.j > 0 then 
		me.im = jumprise
	else me.im = jumpfalling
end
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
    makeslidedust(you.y+50,you.mid + 15 * you.lr,you.v)
	elseif you.slowdown
	then you.im = slowdown
    you.xoffset = 10
   
    
	elseif you.landing
	then you.im = landing
elseif you.g and aboutso(you.v, you.push) and not you.slide 
	then idleanimatey()
	you.walktimer = 0
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
  makeslidedust(me.y+50,me.mid + 20 * me.lr,me.v)
	elseif me.slowdown
	then me.im = slowdown
    me.xoffset = 10
 
	elseif me.landing
	then me.im = landing
	elseif me.g and aboutso(me.v, me.push) and not me.slide 
	then idleanimateme()
	me.walktimer = 0
	elseif not me.g
	then
	jumpme()
	else
		walkme()
	end

end

bla = 10
--can add me
facemovement = function ()
	



	if you.im == slide
	then you.facedis = 1
	elseif you.im == blue33 
	then you.facedis = 0 
  elseif you.im == run3
  then you.facedis = 9
elseif you.im == run1 or you.im == run2 or you.im == run4
then you.facedis = 8
elseif you.im == bsend
		then you.facedis = 10

		elseif you.im == fallback
		then you.facedis = -18 +3
      elseif you.im == fallback1
		then you.facedis = -12 + 15
		elseif you.im == fallforward1
		then you.facedis = 16 - 2 
		elseif you.im == gettingup2
		then you.facedis = 11 + 8
      elseif you.im == gettingup1
		then you.facedis = 11 - 8
		elseif you.im == fallforward
		then you.facedis = 37 + 4.5 + 4.5*you.lr 
  elseif you.im == wallgrab then
    you.facedis = -20
	elseif you.im == dodgeback 
		then you.facedis = 7
	elseif you.im == dodgeback then you.facedis = 10
	elseif you.im == bluecharging or you.im == invis then you.facedis = 100000000
	elseif you.im == bc1 or you.im==bc2 or you.im==bc3 or you.im==bcend 
		or you.im == boltcharged or you.im == spikeland 
		or you.im == dodge
    or you.im==walk1 or you.im==walk2 or you.im==walk3 or you.im==walk4 or you.im==walk5 
		then you.facedis = 4
	elseif you.im == blue21 or you.im == stomp2 or you.im == dig or you.im==idle3 or you.im==idle4
		then you.facedis = 3
	elseif you.im == blue22 or you.im == blue23 
		or you.im == landing 
		or you.im == sready or you.im == bigwings or you.im == purpwings  or you.im == sandboltready  or you.im == purpwings  or you.im == bsstart  or you.im == bigflap
		or you.im == wingslam or you.im == wingswing1 or you.im == wingswing2 or you.im == wingswing3 or you.im == upflap
		then you.facedis = 5 
	elseif you.im == stomp1 or you.im == stomps 
		then you.facedis = -1
	elseif you.im==boltrelease then 
		you.facedis = -2
	elseif you.im==dodge21 then you.facedis = 20
		elseif you.im==dodge2 then you.facedis = 19
	
	
	else you.facedis = 2
	end


	if you.im == brise 
		then you.facey = -54
	elseif you.im == briseend or you.im==aby2 or you.im==aby3 or you.im==aby4 or you.im == dying or you.im == fade1
	or you.im == fade2 or you.im == fade3 or you.im == fade4 or you.im == fade5 or you.im == fade6 or you.im == fade7 or you.im == fade8
	or you.im == airdying
	then you.facey = 1000000000
	elseif you.im == dig 
		then you.facey = -26
	elseif you.im == dodge 
		then you.facey = -31
		elseif you.im == fallback
		then you.facey = -54 + 23
		elseif you.im == gettingup1
		then you.facey = -45
		elseif you.im == gettingup2 then 
			you.facey = -50
			elseif you.im == fallforward then 
			you.facey = -54 + 37.5 - you.lr*4.5

	elseif you.im == dodge2
		then you.facey = -37
	elseif you.im == dodge21
		then you.facey = -34
	elseif you.im == bsend
		then you.facey = -45
	elseif you.im == bluepurphit
		then you.facey = -44
	elseif you.im == spikeland
		then you.facey = -42
	elseif you.im == idle2 or you.im == bc1 or you.im == idle4 or you.j < 0 or you.im ==stomp2 or you.im == sready or you.im == bigwings or you.im == purpwings  or you.im == sandboltready  or you.im == bsstart or you.im == bigflap
		or you.im == wingslam or you.im == wingswing1 or you.im == wingswing2 or you.im == wingswing3 or you.im == upflap
		then you.facey = - 53
	elseif you.im == landing
	then you.facey = - 42
elseif you.im==bc2 or you.im==bc3 or you.im==bcend 
or you.im == run2 or you.im == run4
then you.facey = - 51
	elseif you.j > 0 then you.facey = - 56
	else you.facey = - 54
	end



	if me.im == slide
	then me.facedis = 1
	elseif me.im == blue33 
	then me.facedis = 0 
  elseif me.im == run3
  then me.facedis = 9
elseif me.im == run1 or me.im == run2 or me.im == run4
then me.facedis = 8
elseif me.im == bsend
		then me.facedis = 10

		elseif me.im == fallback
		then me.facedis = -18 +3
      elseif me.im == fallback1
		then me.facedis = -12 + 15
		elseif me.im == fallforward1
		then me.facedis = 16 - 2 
		elseif me.im == gettingup2
		then me.facedis = 11 + 8
      elseif me.im == gettingup1
		then me.facedis = 11 - 8
		elseif me.im == fallforward
		then me.facedis = 37 + 4.5 + 4.5*me.lr 
  elseif me.im == wallgrab then
    me.facedis = -20

	elseif me.im == dodgeback 
		then me.facedis = 7
	elseif me.im == dodgeback then me.facedis = 10
	elseif me.im == bluecharging or me.im == invis then me.facedis = 100000000
	elseif me.im == bc1 or me.im==bc2 or me.im==bc3 or me.im==bcend 
		or me.im == boltcharged or me.im == spikeland 
		or me.im == dodge
    or me.im==walk1 or me.im==walk2 or me.im==walk3 or me.im==walk4 or me.im==walk5 
		then me.facedis = 4
	elseif me.im == blue21 or me.im == stomp2 or me.im == dig or me.im==idle3 or me.im==idle4
		then me.facedis = 3
	elseif me.im == blue22 or me.im == blue23 
		or me.im == landing 
		or me.im == sready or me.im == bigwings or me.im == purpwings  or me.im == sandboltready  or me.im == purpwings  or me.im == bsstart  or me.im == bigflap
		or me.im == wingslam or me.im == wingswing1 or me.im == wingswing2 or me.im == wingswing3 or me.im == upflap
		then me.facedis = 5 
	elseif me.im == stomp1 or me.im == stomps 
		then me.facedis = -1
	elseif me.im==boltrelease then 
		me.facedis = -2
	elseif me.im==dodge21 then me.facedis = 20
		elseif me.im==dodge2 then me.facedis = 19
	
	
	else me.facedis = 2
	end


	if me.im == brise 
		then me.facey = -54
	elseif me.im == briseend or me.im==aby2 or me.im==aby3 or me.im==aby4 or me.im == dying or me.im == fade1
	or me.im == fade2 or me.im == fade3 or me.im == fade4 or me.im == fade5 or me.im == fade6 or me.im == fade7 or me.im == fade8
	or me.im == airdying
	then me.facey = 1000000000
	elseif me.im == dig 
		then me.facey = -26
	elseif me.im == dodge 
		then me.facey = -31
		elseif me.im == fallback
		then me.facey = -54 + 23
		elseif me.im == gettingup1
		then me.facey = -45
		elseif me.im == gettingup2 then 
			me.facey = -50
			elseif me.im == fallforward then 
			me.facey = -54 + 37.5 - me.lr*4.5


	elseif me.im == dodge2
		then me.facey = -37
	elseif me.im == dodge21
		then me.facey = -34
	elseif me.im == bsend
		then me.facey = -45
	elseif me.im == bluepurphit
		then me.facey = -44
	elseif me.im == spikeland
		then me.facey = -42
	elseif me.im == idle2 or me.im == bc1 or me.im == idle4 or me.j < 0 or me.im ==stomp2 or me.im == sready or me.im == bigwings or me.im == purpwings  or me.im == sandboltready  or me.im == bsstart or me.im == bigflap
		or me.im == wingslam or me.im == wingswing1 or me.im == wingswing2 or me.im == wingswing3 or me.im == upflap
		then me.facey = - 53
	elseif me.im == landing
	then me.facey = - 42
elseif me.im==bc2 or me.im==bc3 or me.im==bcend 
or me.im == run2 or me.im == run4
then me.facey = - 51
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



crestmovementhelper = function (x)
	
	if x.im == dodge21
		then
		x.crestdis = 15
	elseif x.im == sready or x.im == bigwings or x.im == purpwings  or x.im == sandboltready  or x.im == purpwings  or x.im == bsstart  or x.im == bigflap
		or x.im == wingslam or x.im == wingswing1 or x.im == wingswing2 or x.im == wingswing3 or x.im == upflap
		then x.crestdis = 1
elseif x.im == landing or x.im == spikeland or x.im == bcend
or x.im==walk1 or x.im==walk2 or x.im==walk3 or x.im==walk4 or x.im==walk5 
	then x.crestdis = -1
    elseif x.im == wallgrab then
    x.crestdis = -30
	else x.crestdis = - 2
	end
	
	if x.im == idle2 
	then x.cresty = x.y + 28
	
	elseif x.im==walk1 or x.im==walk2 or x.im==walk3 or x.im==walk4 or x.im==walk5 
		or x.im==slide or x.im == idle1 or x.im==idle3 or x.im==idle4 or x.im == jumprise or x.im==jumpfalling or x.im == slowdown or x.im == jsflap
		or x.im==boltthrow or x.im == airbolt or x.im == airboltslow
		or x.im == stomp2  or x.im==airspike 
		or x.im==blue12 or x.im == blue1end or x.im == bluecharging or x.im == bcend or x.im==briseend or x.im==bfallend or x.im==bfallprep or x.im==bfall3 
		or x.im==greenpurpprep
		or x.im==airbluepurphit
 or x.im == wallgrab
		or x.im == ythrow or x.im ==jythrow
		or x.im ==jpythrow
		or x.im==yblue or x.im==yblue2 or x.im == yblue3 or x.im==yblue3 or x.im == yblue4 or x.im == yblue5 or x.im == yblueend or x.im == yblueend2
		or x.im==aby2 or x.im==aby3 or x.im==aby4
		or x.im == gythrow or x.im == jgythrow or x.im == gyready or x.im == jgyready 
		or x.im == ycthrow or x.im == jycthrow 
		or x.im == sready or x.im == bigwings or x.im == purpwings  or x.im == sandboltready  or x.im == purpwings  or x.im == bsstart  or x.im == bigflap
		or x.im == wingslam or x.im == wingswing1 or x.im == wingswing2 or x.im == wingswing3 
	then x.cresty = x.y + 27
	elseif x.im==spikeland or x.im==bluepurphit
		then x.cresty = x.y + 36
	elseif x.im == stomp1 or x.im==stomps
		then x.cresty = x.y + 26
		x.crestdis = -5
	elseif x.im==dig then x.cresty = x.y + 53
	elseif x.im == dodge
		then 
		x.crestdis = 0
		x.cresty = x.y + 46
	elseif x.im == dodge21
		then x.cresty = x.y + 43
		x.crestdis = 14
	elseif x.landing
	then x.cresty = x.y + 37
	else x.cresty = 100000
	end

	if x.leftface 
		then x.crestx = x.mid - x.crestdis - 3
	else 
	x.crestx = x.mid + x.crestdis
	end


if me.leftface 
		then me.crestx = me.mid - me.crestdis - 3
	else 
	me.crestx = me.mid + me.crestdis
end


	if you.leftface 
		then you.crestx = you.mid - you.crestdis - 3
	else 
	you.crestx = you.mid + you.crestdis
	end

end

crestmovement = function ()
  crestmovementhelper(me)
  crestmovementhelper(you)
  
  
  end

			