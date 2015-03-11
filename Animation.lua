
walk1im = love.graphics.newImage("me/walk/walk51.png")
walk2im = love.graphics.newImage("me/walk/walk52.png")
walk3im = love.graphics.newImage("me/walk/walk53.png")
walk4im = love.graphics.newImage("me/walk/walk54.png")
walk5im = love.graphics.newImage("me/walk/walk55.png")
walk1c = love.graphics.newImage("me/walk/walk51c.png")
walk2c = love.graphics.newImage("me/walk/walk52c.png")
walk3c = love.graphics.newImage("me/walk/walk53c.png")
walk4c = love.graphics.newImage("me/walk/walk54c.png")
walk5c = love.graphics.newImage("me/walk/walk55c.png")
walk1 = {im = walk1im, c = walk1c}
walk2 = {im = walk2im, c = walk2c}
walk3 = {im = walk3im, c = walk3c}
walk4 = {im = walk4im, c = walk4c}
walk5 = {im = walk5im, c = walk5c}
run1im = love.graphics.newImage("me/walk/run1.png")
run2im = love.graphics.newImage("me/walk/run2.png")
run3im = love.graphics.newImage("me/walk/run3.png")
run4im = love.graphics.newImage("me/walk/run4.png")
run1c = love.graphics.newImage("me/walk/run1c.png")
run2c = love.graphics.newImage("me/walk/run2c.png")
run3c = love.graphics.newImage("me/walk/run3c.png")
run4c = love.graphics.newImage("me/walk/run4c.png")
run1 = {im = run1im, c = run1c}
run2 = {im = run2im, c = run2c}
run3 = {im = run3im, c = run3c}
run4 = {im = run4im, c = run4c}
slideim = love.graphics.newImage("me/walk/slide.png")
slidec = love.graphics.newImage("me/walk/slidec.png")
slide = {im = slideim, c = slidec}

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
wallgrab = {im = love.graphics.newImage("me/attack/wallgrab.png"),
  c = love.graphics.newImage("me/attack/wallgrabc.png")
}
partition = love.graphics.newImage("enviro/partition2.png")
partition:setFilter("nearest")

jumpriseim = love.graphics.newImage("me/jump/jumprise.png")
jumprisec = love.graphics.newImage("me/jump/jumprisec.png")
jumprise = {im = jumpriseim, c = jumprisec}
jumpfallingim = love.graphics.newImage("me/jump/jumpfalling.png")
jumpfallingc = love.graphics.newImage("me/jump/jumpfallingc.png")
jumpfalling = {im = jumpfallingim, c = jumpfallingc, exheight = 10}
landingim = love.graphics.newImage("me/jump/landing.png")
landingc = love.graphics.newImage("me/jump/landingc.png")
landing = {im = landingim, c = landingc}
slowdownim = love.graphics.newImage("me/jump/slowdown.png")
slowdownc = love.graphics.newImage("me/jump/slowdownc.png")
slowdown = {im = slowdownim, c = slowdownc}
paper1 = love.graphics.newImage("enviro/paper1.png")
paper2 = love.graphics.newImage("enviro/paper2.png")
paper3 = love.graphics.newImage("enviro/paper3.png")
paper4 = love.graphics.newImage("enviro/paper4.png")
mytriangles = {}
yourtriangles = {}



traillength = 4

me.trail={}
you.trail={}

function updatemytrail(xx)
  for i = #xx.trail, 1, -1 do
    cur = xx.trail[i]


    cur.t = cur.t + 1*rampspeed

    if cur.t >= traillength then 
      table.remove(xx.trail, i)
    end

  end

end

function drawmytrail(xx)


  for i = #xx.trail, 1, -1 do
    cur = xx.trail[i]


    if cur.im.xoff == nil then cur.im.xoff = 0 end
    if cur.im.yoff == nil then cur.im.yoff = 0 end
    love.graphics.setColor(cur.color.c.r,cur.color.c.g,cur.color.c.b,(255/traillength)*(traillength/cur.t))
    love.graphics.draw(cur.im.im, cur.xanimate-cur.im.xoff*cur.lr, cur.y-cur.im.yoff, 0, cur.lr, 1)
    love.graphics.setColor(255, 255, 255, 255)

  end


end

me.j = 0

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

    if themap.name == "fightclub" then

      loader.start(function()
          finishedLoading = true
        end)

      enviro.rightwall = 2000

      loader.newImage(enviro,'floor', "enviro/fightclub.png")
      loader.newImage(enviro,"paralax","enviro/READY.png")
      loader.newImage(enviro,"sky","enviro/ready.png")
      me.x = putmehere
      you.x = putyouhere
      floor = 896
      me.im =idle1
      you.im =idle1
      me.y = floor - 100
      you.y = floor - 100



    elseif themap.name == "street" then
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

    if themap.name == "library" then
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

    if themap.name == "floors" then
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


actionshotdur = 70

me.im = idle1
you.im = idle1

function p2shade()
  love.graphics.setColor(180, 180, 180)
  end

function drawa(xx)
  drawmytrail(xx)

  if xx.im.xoff == nil then xx.im.xoff = 0 end
  if xx.im.yoff == nil then xx.im.yoff = 0 end
  if xx.id == 2 then
  p2shade()
    else
  love.graphics.setColor(255, 255, 255, 255)
end
local xim = xx.im.im
local xxx = xx.xanimate-xx.im.xoff*xx.lr
local xxy = xx.y-xx.im.yoff
local xlr = xx.lr
love.graphics.draw(xim,xxx, xxy, 0, xlr, 1) 

  
  if xx.im.c ~= nil then 
    love.graphics.setColor(xx.color.c.r,xx.color.c.g,xx.color.c.b,255)
    love.graphics.draw(xx.im.c, xx.xanimate-xx.im.xoff*xx.lr, xx.y-xx.im.yoff, 0, xx.lr, 1)
  end
  love.graphics.setColor(255, 255, 255, 255)
  drawcolorstuff(xx)
  bolttraildraw(xx)
end


function actionshotstuff(xx)
  if xx.actionshot then
    xx.numofspikes = 0
    xx.uppercuthit = false
    xx.hitsomeonewithpurp = false

    if xx.color.n == xx.cchangeto.n and (xx.color.n~=xx.cantreturntothis) and (xx.a1b or xx.a2b or xx.a3b or xx.a4b) and xx.combo<xx.maxcombo then
      if xx.color.n == 2 and xx.a4b then
        xx.animcounter = 8
        xx.type = 2
        xx.im = greenk1
      else
        xx.repcounter = 0
        xx.currentanim = xx.color.n
        combo(xx)
        xx.actionshot = false
        xx.actiontimer = 0

      end
    end
    minzoom = minzoom + .02+((xx.actiontimer)^2)/300000 --(math.exp(1)^wobbletimer)*math.cos(2*math.pi*wobbletimer)
    maxzoom = maxzoom + .02+((xx.actiontimer)^2)/300000 --(math.exp(1)^wobbletimer)*math.cos(2*math.pi*wobbletimer)
  end

  ColorChange(xx)
  ColorChanging(xx)

  if xx.actiontimer == 1 
  then xx.actionshot = false 
    xx.actiontimer = 0
    if not musicmute then
      thesong:setPitch(1)
    end

    if not pause then
      --deathsound:play()
      collides:play()
      --bcs:play()




    end

  elseif xx.actionshot == true and xx.actiontimer == 0 
  then xx.actiontimer = actionshotdur
  elseif xx.actiontimer > 0 
  then xx.actiontimer = xx.actiontimer - 1
    if not musicmute then
      thesong:setPitch(xx.actiontimer/actionshotdur)
    end
  else xx.actiontimer = 0
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
me.wjt = 0
me.initwy = 0
you.wjt = 0
you.initwy = 0
--the x coord for either wall to walljump off of
wallwalljump = 45
--wallcheckhelper

--when you do it from the right side it doesnt turn around, maybe check the lr

me.walllr = 0
me.wallx = 0
you.walllr = 0
you.wallx = 0

function drawstreetprestuff()
  love.graphics.draw(enviro.light, 4448, 1525)
  lights()

end
drawstreetstuff = function()
  love.graphics.draw(enviro.floorfloor, 0, floor-1, 0, 1, 20)
  drawrubble()
  love.graphics.draw(enviro.rafters,5608-502, 1536)
  love.graphics.draw(enviro.buildingwall,-1500, 0)
  love.graphics.draw(enviro.partitionwall,7027-510, 0)

end
drawlibrarystuff = function()
  drawrubble()
  love.graphics.draw(enviro.plibrary,0,0)
  love.graphics.draw(enviro.librarylpartition,-1630, -61)
  love.graphics.draw(enviro.libraryrpartition,enviro.rightwall-200, -61)
  libraryveneer()
end

drawfloorsstuff = function()
  drawrubble()
  drawglass()
  drawpapers()
  love.graphics.draw(enviro.pfloors,0,0)
  love.graphics.draw(partition,-1800+270, 1,0, 10,3.11)
  love.graphics.draw(partition,enviro.rightwall-270, 1,0, 10,3.11)
  floorsveneer()
end

enviro.rubble = love.graphics.newImage("enviro/rubble.png")
enviro.glass = love.graphics.newImage("enviro/glass.png")
enviro.spark = love.graphics.newImage("enviro/spark.png")
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
    if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then
      temp.j = 0
    end
    if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then table.remove(papers,i) end

  end
  for i,v in ipairs(papers)do
  if not me.actionshot and not you.actionshot and not pause then
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
    if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then table.remove(glasseses,i) end

  end
  for i,v in ipairs(glasseses)do
  if #glasseses > 500 then table.remove(glasseses,500) end
  if not me.actionshot and not you.actionshot and not pause then
    v.y = v.y - v.j*rampspeed
    v.x = v.x + v.v*rampspeed
    v.j = v.j - .3*rampspeed
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
    if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then table.remove(dust,i) end

  end

  for i,v in ipairs(dust)do
  if not me.actionshot and not you.actionshot and not pause then
    v.y = v.y - v.j*rampspeed
    v.x = v.x + v.v*rampspeed
    v.j = v.j - .5*rampspeed
    dustn = math.random(100,200)
  end
  love.graphics.setColor(dustn,dustn,dustn,150)
  love.graphics.draw(enviro.rubble,v.x,v.y-2,70/(v.v+v.y),1.5,1.5)
  love.graphics.setColor(255,255,255)

end
end
function drawrubble()

  for i = #rubble, 1, -1 do
    local temp = rubble[i]
    if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then table.remove(rubble,i) end

  end

  for i,v in ipairs(rubble)do
  if table.getn(rubble) > 500 then table.remove(rubble,500) end
  if not me.actionshot and not you.actionshot and not pause then
    v.y = v.y - v.j*rampspeed
    v.x = v.x + v.v*rampspeed
    v.j = v.j - .2*rampspeed
    blackn = math.random(80,150)
  end
  love.graphics.setColor(blackn,blackn,blackn)
  love.graphics.draw(enviro.rubble,v.x,v.y,70/(v.v+v.y),2.2,2.2)
  love.graphics.setColor(255,255,255)
end
end
function makerunrubble(why,ex,vee, lr)
  if rampcanhit then
    for i = 10, 1, -1 do
      table.insert(dust,{x = ex, y = why, v=math.random(vee/2, vee) + math.random()*lr, j = math.random(1,5)+math.random()})
    end
  end
end
function makeslidedust(why,ex,vee)
  if rampcanhit then
    if vee > minvfordust and math.random() > .5 then
      table.insert(dust,{x = ex, y = why, v=vee/3 + math.random(3), j = math.random(0,vee/5)})
    elseif vee < -minvfordust and math.random() > .5 then
      table.insert(dust,{x = ex, y = why, v=vee/3 - math.random(3), j = math.random(0,-vee/5)})
    end
  end

end

function makenrubble(ty, ex,why,vee,jay, n)

  if ty == "vert" then 
    for i = n, 1, -1 do
      if vee > 0 then
        table.insert(rubble,{x = ex, y = why-i*2, v=math.random(0, vee) + math.random(), j = jay+1*math.random(5)+math.random()})
      else
        table.insert(rubble,{x = ex, y = why-i*2, v=math.random(0, vee) - math.random(), j = jay+1*math.random(5)+math.random()})
      end
    end
  elseif ty == "horiz" then

  for i = n, 1, -1 do
    if vee > 0 then
      table.insert(rubble,{x = ex, y = why, v=math.random(0, vee) + math.random(), j = jay+1*math.random(5)+math.random()})
    else
      table.insert(rubble,{x = ex, y = why, v=math.random(0, vee) - math.random(), j = jay+1*math.random(5)+math.random()})
    end
  end
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
  if themap.name == "library" then
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
  if themap.name == "floors" then
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

  me.a1 = love.keyboard.isDown("f")
  me.a2 = love.keyboard.isDown("t")
  me.a3 = love.keyboard.isDown("h")
  me.block = love.keyboard.isDown("e")

  you.a1 = love.keyboard.isDown("left")
  you.a2 = love.keyboard.isDown("up")
  you.a3 = love.keyboard.isDown("right")
  you.block = love.keyboard.isDown("o")
  jjstick(me,joystick)
  jjstick(you,you.joystick)

  if waitforitplay > 0 then waitforitplay = waitforitplay - 1
  elseif fadeupretry == 2 and waitforitplay == 0 then
    menu = "prepan"
    loadmeandyou2()
    fadeupretry = 0
  elseif fadeupretry == 3 and waitforitplay == 0 then
    menu = "prechoose"
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
  elseif (me.block or you.block) and retryfade >= 250
  then fadeupretry = 2
  elseif (me.a1 or you.a1 or me.a2 or you.a2 or me.a3 or you.a3) and retryfade >= 250
  then fadeupretry = 3
  elseif fadeupretry == 1 and retryfade <255 then 
    retryfade = retryfade + 1
  elseif me.im == fade8 or you.im == fade8 then
    fadeupretry = 1
  end

  me.up = false
  me.down = false
  me.left = false
  me.right = false
  me.a1 = false
  me.a2 = false
  me.a3 = false
  me.block = false

  you.up = false
  you.down = false
  you.left = false
  you.right = false
  you.a1 = false
  you.a2 = false
  you.a3 = false
  you.block = false

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
  if table.getn(spines) < 1 and menu ~= "postpostchoose"
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
    if oddeven%waveframerate == 1 then
      if v.n >= 1 then v.v = waves[i+1].v
        v.y = v.y - v.v
      else 
        v.v = oscillator 
        v.y = v.y - v.v
      end
    end
    love.graphics.draw(enviro.wave, v.x, v.y+(screenheight*.7)-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/700)

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
          if themap.name == "street" then 
            if me.x > 3500 then you.x = 600 you.y = 600
            else you.x = 6000 you.y = 1000
            end
          elseif themap.name == "library" then 
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
          if themap.name == "street" then 
            if me.x > 3500 then me.x = 600 me.y = 600
            else me.x = 6000 me.y = 1000
            end
          elseif themap.name == "library" then 
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

  idley = 0
  idleme = 0
  ay = 0
  me.walktimer = 0
  you.walktimer = 0


  orientlr = function(xx)

    me.xleft = me.x + 30
    me.mid = me.x + 15
    you.xleft = you.x + 30
    you.mid = you.x + 15

    if not xx.slowdown and not xx.slide and not xx.stop and not xx.pause and not xx.flinch
    and (xx.dodgetype~=2 and xx.dodgetype >-1)
    then
      if xx.right then xx.lr = 1
      elseif xx.left then xx.lr = -1
      end
    end
    if xx.lr > 0 then

      xx.xanimate = xx.x
    else 
      xx.xanimate = xx.xleft
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
  walkxx = function (xx)

    xx.walktimer = xx.walktimer + 1*rampspeed

    if xx.running and not xx.dodge then 

      if xx.walktimer >= xx.runpace+2 then xx.im = run4 
        xx.walktimer = 0
        repplay(xx.runsound)
        makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
      elseif xx.walktimer >= xx.runpace + 1 then xx.im = run4 
        makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
      elseif xx.walktimer >= xx.runpace/2 + 2 then xx.im = run3 
      elseif xx.walktimer >= xx.runpace/2 then xx.im = run2 
        makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
        repplay(xx.runsound)
      elseif xx.walktimer >= 0 then xx.im = run1 
      end  
    else
      if xx.walktimer < 7 then 
        xx.im = walk1
      elseif xx.walktimer >= 7 and xx.walktimer < 14 then
        xx.im = walk2
      elseif xx.walktimer >= 14 and xx.walktimer < 21 then
        xx.im = walk3
      elseif xx.walktimer >= 21 and xx.walktimer < 28 then
        xx.im = walk4
      elseif xx.walktimer >= 28 and xx.walktimer < 35 then
        xx.im = walk5
      else
        xx.walktimer = 0
      end
    end
  end
  jumpy = function ()
    if you.wjt == 0 then
      if you.j > 0 then 
        you.im = jumprise
      else you.im = jumpfalling
      end
    end
  end
  jumpme = function ()
    if me.wjt == 0 then
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
      you.landingcounter = you.landingcounter - 1*rampspeed
    end
  end
  landmecheck = function ()
    if me.landingcounter <= 0	
    then me.landing = false
    else
      me.landingcounter = me.landingcounter - 1*rampspeed
    end
  end
  you.slidetimer = 0
  me.slidetimer = 0
  slideycheck = function ()
    if you.slidetimer < 6
    then 
      you.slidetimer = you.slidetimer + 1*rampspeed
    elseif you.slidetimer >= 6
    then you.slide = false

    end
  end
  slidemecheck = function ()
    if me.slidetimer < 6
    then 
      me.slidetimer = me.slidetimer + 1*rampspeed
    elseif me.slidetimer >= 6
    then me.slide = false

    end
  end

  animate = function ()
    landycheck()
    slideycheck()
    if you.slide 
    then you.im = slide
      makeslidedust(you.y+50,you.mid + 15 * you.lr,you.v)


    elseif you.landing
    then you.im = landing
    elseif you.g and aboutso(you.v, you.push) and not you.slide 
    then idleanimatey()
      you.walktimer = 0
    elseif not you.g
    then
      jumpy()
    else
      walkxx(you)
    end


    landmecheck()
    slidemecheck()
    if me.slide 
    then me.im = slide
      makeslidedust(me.y+50,me.mid + 20 * me.lr,me.v)

    elseif me.landing
    then me.im = landing
    elseif me.g and aboutso(me.v, me.push) and not me.slide 
    then idleanimateme()
      me.walktimer = 0
    elseif not me.g
    then
      jumpme()
    else
      walkxx(me)
    end

  end

  --SPARKS COLOR BASED ON ATTACK COLOR?!?!?!?!?!?

  sparks = {}

  function makesparks(ex,why,vee, jay, arr,gee,bee)

    for i = 10, 1, -1 do
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(0,jay),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(0,jay),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(-jay,0),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(-jay/2,jay/2),r=arr,g=gee,b=bee, rot = math.random(0,360)})

    end

  end

  function makensparks(ex,why,vee, jay, arr,gee,bee, n)
    for i = n, 1, -1 do
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(0,jay)+math.random(),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(0,jay)+math.random(),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(-jay,0)+math.random(),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(-jay/2,jay/2)+math.random(),r=arr,g=gee,b=bee, rot = math.random(0,360)})

    end


  end


  function makeslashsparks(why,ex,vee, jay, arr,gee,bee)
    if rampcanhit then
      for i = 10, 1, -1 do
        table.insert(sparks,{x = ex, y = why, v=vee+math.random(), j = math.random(0,jay)+math.random(),r=arr,g=gee,b=bee,rot=math.random(0,360)})
      end
    end
  end


  function drawsparks()

    for i = #sparks, 1, -1 do
      local temp = sparks[i]
      if lineplatcheck(temp.x, temp.y,temp.v, temp.j) then table.remove(sparks,i) end

    end

    for i,v in ipairs(sparks)do
    if not me.actionshot and not you.actionshot and not pause then
      v.y = v.y - v.j*rampspeed
      v.x = v.x + v.v*rampspeed
      v.j = v.j - .1*rampspeed
      v.rot = v.rot + math.random() * rampspeed 
    end
    love.graphics.setColor(v.r,v.g,v.b,math.random(150,255))
    love.graphics.draw(enviro.spark,v.x-2,v.y-2,v.rot,math.random()/2,math.random()/2)
    love.graphics.setColor(255,255,255)

  end
end


