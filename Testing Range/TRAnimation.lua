papertime = 100

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

morph1 = love.graphics.newImage("me/attack/morph1.png")
morph2 = love.graphics.newImage("me/attack/morph2.png")
morph3 = love.graphics.newImage("me/attack/morph3.png")
morph4 = love.graphics.newImage("me/attack/morph4.png")
morph5 = love.graphics.newImage("me/attack/morph5.png")
morph6 = love.graphics.newImage("me/attack/morph6.png")
morph7 = love.graphics.newImage("me/attack/morph7.png")




jumprise = love.graphics.newImage("me/jump/jumprise.png")
jumpfalling = love.graphics.newImage("me/jump/jumpfalling.png")
landing = love.graphics.newImage("me/jump/landing.png")
slowdown = love.graphics.newImage("me/jump/slowdown.png")
arm = love.graphics.newImage("me/jump/arm.png")

paper1 = love.graphics.newImage("enviro/paper1.png")
paper2 = love.graphics.newImage("enviro/paper2.png")
paper3 = love.graphics.newImage("enviro/paper3.png")
paper4 = love.graphics.newImage("enviro/paper4.png")

papers = {}




function drawpapers()
  
for i = #papers, 1, -1 do
  local temp = papers[i]
if platformcheck(temp.x,temp.y-30,temp.j) or temp.y > 100000 or temp.x < -10 or temp.x > 10000 then table.remove(papers,i) end
 
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
  if you.j == 0 then v.j = v.j + 3
    else
  v.j = v.j + you.j*.01 + .1
  end
 end

if v.n < papertime then
v.n = v.n + 1
else v.n = 0
v.lr = -v.lr
end

end





if v.n < 10 then love.graphics.draw(paper1,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
elseif v.n < 20 then love.graphics.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
elseif v.n < 30 then love.graphics.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
elseif v.n < papertime -20 then love.graphics.draw(paper4,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
elseif v.n < papertime -10 then love.graphics.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
elseif v.n < papertime then love.graphics.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1.5, 1.5)
end


end
end



function makepapers(ex,why,vee,en)
for i = en, 1, -1 do
  if math.random() > .5 then 
    elar = 1
  else elar = -1
  end
  if vee > 0 then
     table.insert(papers,{x = ex, y = why, v=vee/2 + math.random()*5, j = math.random()*7,n = math.random(papertime),lr = elar})
  elseif vee < 0 then
   table.insert(papers,{x = ex, y = why, v=vee/2 - math.random()*5, j = math.random()*7,n = math.random(papertime),lr = elar})
 else
   table.insert(papers,{x = ex, y = why, v=vee/2 + math.random()*5*elar, j = math.random()*7,n = math.random(papertime),lr = elar})
   end
  
  
  
  
end
end


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


if themap == "street" then



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

	
end
end
end

function drawmyroulette()

if themode == "roulette" and not me.dead then
love.graphics.setColor(r1,g1,b1)
love.graphics.draw(enviro.ma1, me.x-8.25, me.y-8, 0, .5, .5)

love.graphics.setColor(a21r,a21g,a21b)
love.graphics.draw(enviro.ma2, me.x - (29/2), me.y + 6.75-8, 0, .5,.5)

love.graphics.setColor(a31r,a31g,a31b)
love.graphics.draw(enviro.ma3, me.x + 30, me.y + 6.75-8, 0, .5,.5)

love.graphics.setColor(a41r,a41g,a41b)
love.graphics.draw(enviro.ma4, me.x-8.25, me.y + 50-8, 0, .5, .5)

love.graphics.setColor(255,255,255)
end
end

function drawyourroulette()

if themode == "roulette" and not you.dead then
love.graphics.setColor(r2,g2,b2)
love.graphics.draw(enviro.ma1, you.x-8.25, you.y-8, 0, .5, .5)

love.graphics.setColor(a22r,a22g,a22b)
love.graphics.draw(enviro.ma2, you.x - (29/2), you.y + 6.75-8, 0, .5,.5)

love.graphics.setColor(a32r,a32g,a32b)
love.graphics.draw(enviro.ma3, you.x + 30, you.y + 6.75-8, 0, .5,.5)

love.graphics.setColor(a42r,a42g,a42b)
love.graphics.draw(enviro.ma4, you.x-8.25, you.y + 50-8, 0, .5, .5)

love.graphics.setColor(255,255,255)
end
end






lights = function ()
if lighttimer >= 70
		then
		lighttimer = - 120
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


drawstreetstuff = function()
lights()

love.graphics.draw(enviro.floorfloor, 0, floor-1, 0, 1, 20)
	love.graphics.draw(enviro.light, 4448, 1125+500)
	drawrubble()
	love.graphics.draw(enviro.rafters,5608-502, 1536)
	love.graphics.draw(enviro.buildingwall,-1500, 0)
	love.graphics.draw(enviro.partitionwall,7027-500-128, 0)


end

drawlibrarystuff = function()
		drawrubble()
		love.graphics.draw(enviro.plibrary,0,0)
		love.graphics.draw(enviro.librarylpartition,-1630, -61)
		love.graphics.draw(enviro.libraryrpartition,enviro.rightwall-210, -61)
		libraryveneer()
end


enviro.rubble = love.graphics.newImage("enviro/rubble.png")
rubble = {}
blackn = 0
function drawrubble()
for i,v in ipairs(rubble)do
if table.getn(rubble) > 500 then table.remove(rubble,i) end
if not actionshot and not youactionshot and not pause then
v.y = v.y - v.j
v.x = v.x + v.v
v.j = v.j - .3
blackn = math.random(200)
end
if platformcheck(v.x,v.y) or v.y > 100000 or v.x < 0 or v.x > 10000 then table.remove(rubble,i) end
love.graphics.setColor(blackn,blackn,blackn)
love.graphics.draw(enviro.rubble,v.x,v.y,70/(v.v+v.y),1.5,1.5)
love.graphics.setColor(255,255,255)

end

end

function makerubble(ex,why,vee,jay)
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
blackn = math.random(200)






end
function makefloorrubble(ex,why,vee,jay)
	if jay > 0 then miscjay = 1
		why = why - 60
		jay = jay/2
		else miscjay = -1
	end
		table.insert(rubble,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})

table.insert(rubble,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
		table.insert(rubble,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
blackn = math.random(200)



end


lvfade = 255

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

function libwallbreak()

	if me.mid < 1610 and me.mid + me.v > 1610 and me.y > 893 and me.y <1643 
		then repplay(wallbreaks)
		makerubble(me.mid,me.y,me.v,me.j)

	end
	if me.mid > 1610 and me.mid + me.v < 1610 and me.y > 893 and me.y <1643 
		then repplay(wallbreaks)
		makerubble(me.mid,me.y,me.v,me.j)
	end

	if me.mid > 1660 and me.mid < 3196 and me.y < 882 and me.y - me.j > 882
		then 
			repplay(wallbreaks)
			makefloorrubble(me.mid,me.y,me.v,me.j)
	end
	if me.mid > 1660 and me.mid < 3196 and me.y > 882 and me.y - me.j < 882
		then 
			repplay(wallbreaks)
			makefloorrubble(me.mid,me.y,me.v,me.j)
	end

	if you.mid < 1610 and you.mid + you.v > 1610 and you.y > 893 and you.y <1643 
		then repplay(wallbreaks)
		makerubble(you.mid,you.y,you.v,you.j)

	end
	if you.mid > 1610 and you.mid + you.v < 1610 and you.y > 893 and you.y <1643 
		then repplay(wallbreaks)
		makerubble(you.mid,you.y,you.v,you.j)
	end

	if you.mid > 1660 and you.mid < 3196 and you.y < 882 and you.y - you.j > 882
		then 
			repplay(wallbreaks2)
			makefloorrubble(you.mid,you.y,you.v,you.j)
	end
	if you.mid > 1660 and you.mid < 3196 and you.y > 882 and you.y - you.j < 882
		then 
			repplay(wallbreaks2)
			makefloorrubble(you.mid,you.y,you.v,you.j)
	end




	--if me.im = jump then a new shoulder jump?




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
	elseif you.im == bsend
		then you.facedis = 10
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
	elseif you.im==bc2 or you.im==bc3 or you.im==bcend then you.facey = - 51
	elseif you.j > 0 then you.facey = - 56
	else you.facey = - 54
	end






	if me.im == slide
	then me.facedis = 1
	elseif me.im == blue33
	then me.facedis = 0
	elseif me.im == bsend
		then me.facedis = 10
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
	if me.slowdown and not me.dodge and not me.pause and not me.stop and not nomedodge
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
	elseif you.im == sready or you.im == bigwings or you.im == purpwings  or you.im == sandboltready  or you.im == purpwings  or you.im == bsstart  or you.im == bigflap
		or you.im == wingslam or you.im == wingswing1 or you.im == wingswing2 or you.im == wingswing3 or you.im == upflap
		then you.crestdis = 1


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

		or you.im == sready or you.im == bigwings or you.im == purpwings  or you.im == sandboltready  or you.im == purpwings  or you.im == bsstart  or you.im == bigflap
		or you.im == wingslam or you.im == wingswing1 or you.im == wingswing2 or you.im == wingswing3 or you.im == upflap

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
	elseif me.im == sready or me.im == bigwings or me.im == purpwings  or me.im == sandboltready  or me.im == purpwings  or me.im == bsstart  or me.im == bigflap
		or me.im == wingslam or me.im == wingswing1 or me.im == wingswing2 or me.im == wingswing3 or me.im == upflap
		then me.crestdis = 1


	elseif me.im == landing or me.im == spikeland or me.im == bcend
	then me.crestdis = -1
	else me.crestdis = - 2
	end



	

	if me.im == idle2 
	then me.cresty = me.y + 28
	
	elseif me.im==walk1 or me.im==walk2 or me.im==walk3 or me.im==walk4 or me.im==walk5 
		or me.im==slide or me.im == idle1 or me.im==idle3 or me.im==idle4 or me.im == jumprise or me.im==jumpfalling
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

		or me.im == sready or me.im == bigwings or me.im == purpwings  or me.im == sandboltready  or me.im == purpwings  or me.im == bsstart  or me.im == bigflap
		or me.im == wingslam or me.im == wingswing1 or me.im == wingswing2 or me.im == wingswing3 or me.im == upflap

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



			