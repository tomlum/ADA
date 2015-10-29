
fractal1 = lg.newImage("images/enviro/fractals/fractal1.png")
fractal2 = lg.newImage("images/enviro/fractals/fractal2.png")
fractal3 = lg.newImage("images/enviro/fractals/fractal3.png")
fractal3paralax = lg.newImage("images/enviro/fractals/fractal3paralax.png")
fractal4 = lg.newImage("images/enviro/fractals/fractal4.png")
fractal4paralax = lg.newImage("images/enviro/fractals/fractal4paralax.png")
fractal5 = lg.newImage("images/enviro/fractals/fractal5.png")
fractal5paralax = lg.newImage("images/enviro/fractals/fractal5paralax.png")
fractal1facade = lg.newImage("images/enviro/fractals/fractal1facade.png")

function fractalrespawn(xx)

  local newplat
  
  local firsttime = true
  
  while(firsttime) do
    firsttime = false
    local rannum = math.random(1, #theMap.plats)
    newplat = theMap.plats[rannum]
    xx.go_here = {}
    xx.go_here.x = math.random(newplat.x1+15, newplat.x2-15)
    xx.go_here.y = newplat.y-100
    
    xx.go_here_d = {}
    xx.go_here_d.x = (xx.x-xx.go_here.x)/40
    xx.go_here_d.y = (xx.y-xx.go_here.y)/40
    
  end
end


function insertfractalbox(num)

  fractals[num].walls[1] = {n=1,y1 = 50, y2 = fractals[num].floor, x=fractals[num].rightwall, barrier = true, floor = true, fractalbox = true}
  fractals[num].walls[2] = {n=2,y1 = 50, y2 = fractals[num].floor, x=50, barrier = true, ceiling = true, fractalbox = true}

  fractals[num].plats[1] = {n=1, y = fractals[num].floor, x1 = 50, x2 = fractals[num].rightwall, floor = true, fractalbox = true}
  fractals[num].plats[2] = {n=2, y = 50, x1 = 50, x2 = fractals[num].rightwall, ceiling = true, fractalbox = true}

end

fractals = {
  {name = "fractal1", 
  stage = fractal1,
  plats = {}, walls = {},
  floor = 1000-50,
  rightwall = 1000-50,
  start={x = 50, y = 50},
  facade = fractal1facade,
  rotation = 0,
  start1={x = 50, y = 50},
  start2={x = 50, y = 50},
  start3={x = 50, y = 50},
  start4={x = 50, y = 50},
  height = 1000,
  width = 1000
  },

  {name = "fractal2", 
  stage = fractal2,
  plats = {}, walls = {},
  floor = 1000-50,
  rightwall = 1000-50,
  start={x = 300, y = 50},
  facade = fractal1facade,
  rotation = 0,
  start1={x = 70, y = 70},
  start2={x = 70, y = 70},
  start3={x = -70, y = -70},
  start4={x = -70, y = -70},
  height = 1000,
  width = 1000
  },

  {name = "fractal3", 
  stage = fractal3,
  plats = {}, walls = {},
  rightwall = 500-50,
  floor = 2000-50,
  start={x = 300, y = 50},
  paralaxscale = .5,
  paralax = fractal3paralax,
  facade = fractal1facade,
  rotation = 0,
  start1={x = 50, y = 1035},
  start2={x = 466, y = 100},
  start3={x = 50, y = 716},
  start4={x = 1034, y = 100},
  height = 2000,
  width = 500
  },

  {name = "fractal4", 
  stage = fractal4,
  plats = {}, walls = {},
  floor = 950,
  rightwall = 2050,
  start={x = 100, y = 100},
  paralaxscale = .5,
  paralax = fractal4paralax,
  rotation = 0,
  start1={x = -100, y = 100},
  start2={x = 100, y = 100},
  start3={x = -100, y = 100},
  start4={x = 100, y = 100},
  height = 1000,
  width = 2100
  },
  {name = "fractal5", 
  stage = fractal5,
  plats = {}, walls = {},
  floor = 2500-50,
  rightwall = 2500-50,
  start={x = 100, y = 100},
  paralaxscale = .75,
  paralax = fractal5paralax,
  rotation = 0,
  start1={x = 1000, y = 100},
  start2={x = -1000, y = 100},
  start3={x = 1000, y = 100},
  start4={x = -1000, y = 100},
  height = 2500,
  width = 2500
}
}

function rotatefractal()
  map = theMap
  map.rotation = (map.rotation + math.rad(90))%math.rad(360)


  local truewidth = map.width
  local trueheight = map.height
  local flip = false

  if math.deg(map.rotation)%360 <= 89 then
    map.start = map.start1
    map.height = truewidth
    flip = true
  elseif math.deg(map.rotation)%360 <= 170 then
    map.start = map.start2
  elseif math.deg(map.rotation)%360 <= 260 then
    map.start = map.start3

    map.height = truewidth
    flip = true

  elseif math.deg(map.rotation)%360 <=360 then
    map.start = map.start4
  end


  for i,wall in ipairs(map.walls) do




    wall.x1 = map.height-wall.y2
    wall.x2 = map.height-wall.y1

    wall.y = wall.x

    if wall.radius ~= nil then
      wall.midy = wall.x
      wall.y = wall.midy - wall.radius
    end


    wall.y1 = nil
    wall.y2 = nil
    wall.x = nil


    if wall.barrier and flip then
      local oldceiling = wall.ceiling
      wall.ceiling = wall.floor
      wall.floor = oldceiling
    end

  end  

  for i,plat in ipairs(map.plats) do




    plat.y1 = plat.x1
    plat.y2 = plat.x2
    plat.x = map.height-plat.y

    if plat.midy ~= nil then
      plat.x = map.height-plat.midy
    end

    plat.y = nil
    plat.x1 = nil
    plat.x2 = nil


    if plat.floor or plat.ceiling then
      plat.barrier = true
      if flip then
        local oldceiling = plat.ceiling
        plat.ceiling = plat.floor
        plat.floor = oldceiling
      end
    end
  end

  tempplat = clone(map.plats)
  map.plats = clone(map.walls)
  map.walls = clone(tempplat)

  map.width = truewidth
  map.height = trueheight


end

function makeplatbox(num, en, ex, why, width, height, enn)

  local enplus = en + 1
  local en = enn
  fractals[num].plats[en] = {n = en, y = why, x1 =  ex, x2 = ex+width, floor = true}
  fractals[num].plats[enplus] = {n = enplus, y = why+height, x1 =  ex, x2 = ex+width, ceiling = true}

  fractals[num].walls[en] = {n = en, y1 = why, y2 = why+height, x=ex, barrier = true, floor = true}
  fractals[num].walls[enplus] = {n = enplus, y1 = why, y2 = why+height, x=ex+width, barrier = true, ceiling = true}


end

insertfractalbox(1)
insertfractalbox(2)
insertfractalbox(3)
insertfractalbox(4)
insertfractalbox(5)

fractals[1].walls[3]= {n=1,y1 = 198, y2 = 950, x=805, barrier = true, floor = true}
fractals[1].plats[3]= {n=2, midy = 200, x1 = 805, x2 = 950, radius = 1, y = 0, floor = true}
fractals[1].plats[4]= {n=3, midy = 564, x1 = 512, x2 = 767, radius = 1, y=0}


fractals[2].walls[3] = {n=3,fractal = true,y1 = 200, y2 = 800, x=200}
fractals[2].walls[4] = {n=4,fractal = true,y1 = 200, y2 = 800, x=800}
fractals[2].walls[5] = {n=5,y1 = 780, y2 = 950, x=292, radius = 2}
fractals[2].walls[6] = {n=6,y1 = 780, y2 = 950, x=496, radius = 2}
fractals[2].walls[7] = {n=7,y1 = 780, y2 = 950, x=699, radius = 2}


fractals[2].plats[3] = {n=3,fractal = true, midy = 724, x1 = 800, x2 = 950, radius = 2, y = 0}
fractals[2].plats[4] = {n=4,fractal = true, y = 200, x1 = 200, x2 = 800}
fractals[2].plats[5] = {n=5,fractal = true, y = 800, x1 = 200, x2 = 800}
fractals[2].plats[6] = {n=6,fractal = true, midy = 346, x1 = 50, x2 = 200, radius = 2, y = 0}
fractals[2].plats[7] = {n=7,fractal = true, midy = 586, x1 = 50, x2 = 200, radius = 2, y = 0}
fractals[2].plats[8] = {n=8,fractal = true, midy = 719, x1 = 50, x2 = 216, radius = 2, y = 0}
fractals[2].plats[9] = {n=9,fractal = true, midy = 238, x1 = 769, x2 = 950, radius = 2, y = 0}
fractals[2].plats[10] = {n=10,fractal = true, midy = 298, x1 = 769, x2 = 950, radius = 2, y = 0}
fractals[2].plats[11] = {n=11,fractal = true, midy = 392, x1 = 769, x2 = 950, radius = 2, y = 0}
fractals[2].plats[12] = {n=12,fractal = true, midy = 455, x1 = 769, x2 = 950, radius = 2, y = 0}
fractals[2].plats[13] = {n=13,fractal = true, midy = 515, x1 = 769, x2 = 950, radius = 2, y = 0}
fractals[2].plats[14] = {n=14,fractal = true, midy = 565, x1 = 769, x2 = 950, radius = 2, y = 0}


makeplatbox(3, 3, 0, 0, 116, 1034,101)
makeplatbox(3, 5, 384, 0, 116, 517,102)
makeplatbox(3, 7, 268, 517, 232, 517,103)
makeplatbox(3, 11, 0, 1034, 50, 250,104)
makeplatbox(3, 12, 500-50, 1034, 50, 250,105)
makeplatbox(3, 13, 0, 1284, 100, 250,106)
makeplatbox(3, 15, 500-100, 1284, 100, 250,107)
makeplatbox(3, 17, 0, 1284+250, 150, 250,108)
makeplatbox(3, 19, 500-150, 1284+250, 150, 250,109)
makeplatbox(3, 21, 0, 1284+250+250, 200, 250,110)
makeplatbox(3, 23, 500-200, 1284+250+250, 200, 250,111)
makeplatbox(3, 25, 500-200, 1284+250+250, 200, 250, 23,112)


makeplatbox(4, 3, 733, 50, 23, 154,101)
makeplatbox(4, 5, 756, 181, 198, 23,102)
makeplatbox(4, 7, 989, 657, 374, 24,103)
makeplatbox(4, 9, 989, 292, 374, 24,104)
makeplatbox(4, 11, 805, 367, 23, 48,105)
makeplatbox(4, 13, 805, 367, 23, 48,106)
makeplatbox(4, 15, 828, 392, 198, 23,107)

fractals[4].plats[17] = {n=17, fractal = true, midy = 404, x1 = 170, x2 = 470, radius = 1, y = 136}
fractals[4].plats[18] = {n=18, fractal = true, midy = 537, x1 = 170, x2 = 470, radius = 1, y = 136}
fractals[4].plats[19] = {n=19, fractal = true, midy = 670, x1 = 170, x2 = 470, radius = 1, y = 136}
fractals[4].plats[20] = {n=20, fractal = true, midy = 803, x1 = 170, x2 = 470, radius = 1, y = 136}
fractals[4].plats[21] = {n=21, fractal = true, midy = 179, x1 = 513, x2 = 645, radius = 1, y = 179}
fractals[4].plats[22] = {n=22, fractal = true, midy = 706, x1 = 565, x2 = 923, radius = 1, y = 0}
fractals[4].plats[23] = {n=23, fractal = true, midy = 850, x1 = 1562, x2 = 2050, radius = 2, y = 0}

fractals[4].walls[17] = {n=17, y1 = 403, y2 = 950, x=171, radius = 1}
fractals[4].walls[18] = {n=18, y1 = 650, y2 = 950, x=469, radius = 1}
fractals[4].walls[19] = {n=19, y1 = 50, y2 = 180, x=514, radius = 1}
fractals[4].walls[20] = {n=20, y1 = 403, y2 = 538, x=469, radius = 1}
fractals[4].walls[21] = {n=21, y1 = 705, y2 = 814, x=566, radius = 1}
fractals[4].walls[22] = {n=22, y1 = 705, y2 = 814, x=922, radius = 1}
fractals[4].walls[23] = {n=23, y1 = 564, y2 = 950, x=990, radius = 1}
fractals[4].walls[24] = {n=24, y1 = 564, y2 = 950, x=1360, radius = 1}
fractals[4].walls[25] = {n=25, y1 = 50, y2 = 316, x=990, radius = 1}
fractals[4].walls[26] = {n=26, y1 = 50, y2 = 316, x=1360, radius = 1}
fractals[4].walls[27] = {n=27, y1 = 50, y2 = 164, x=1564, radius = 2}
fractals[4].walls[28] = {n=28, y1 = 564, y2 = 851, x=1564, radius = 2}
fractals[4].walls[29] = {n=29, y1 = 564, y2 = 851, x=1801, radius = 2}
fractals[4].walls[30] = {n=30, y1 = 50, y2 = 109, x=1801, radius = 2}



makeplatbox(5, 3, 1756, 50, 674, 37,108)
makeplatbox(5, 5, 50, 50, 316, 110,109)
makeplatbox(5, 7, 2432, 459, 18, 551,110)
makeplatbox(5, 9, 255, 70, 255, 77,111)
makeplatbox(5, 11, 50, 2300, 162, 37,112)
makeplatbox(5, 13, 212, 2337, 189, 36,113)
makeplatbox(5, 15, 401, 2373, 329, 28,114)
makeplatbox(5, 17, 730, 2401, 228, 25,115)
makeplatbox(5, 19, 958, 2426, 227, 24,116)
makeplatbox(5, 21, 2207, 2300, 243, 150,117)











thefractal = fractals[3]



--IN THIS ONE, NO THING FOR GROUND THING, LIKE, NO GROUND CAMERA ADJUST
function throwinto()
  theMap = fractals[math.random(1,5)]
  local map = theMap
  --[[
  theMap = fractals[math.random(1,3)]
  local map = theMap
  while(math.random()<.5) do
    rotatefractal()
  end
  ]]--
  rotatefractal()
  local i = math.random(0,5)
  
  local truewidth = map.width
  local trueheight = map.height

  if math.deg(map.rotation)%360 <= 89 then
    map.start = map.start1
    map.height = truewidth
  elseif math.deg(map.rotation)%360 <= 170 then
    map.start = map.start2
  elseif math.deg(map.rotation)%360 <= 260 then
    map.start = map.start3

    map.height = truewidth

  elseif math.deg(map.rotation)%360 <=360 then
    map.start = map.start4
  end




  local start = theMap.start
  if onescreen then
    if start.x < 0 then

      me.x = theMap.width+start.x + (mexrig-me.x)
      you.x = theMap.width+start.x + (mexrig-you.x)
      local temp = me.x
      me.x = you.x
      you.x = temp
    else

      me.x = start.x + math.abs((mexrig-me.x))
      you.x = start.x + math.abs((mexrig-you.x))
    end
  else

    if start.x < 0 then
      me.x = theMap.width+start.x + (mexrig-me.x)
      you.x = theMap.width+start.x + (youxrig-you.x)
      local temp = me.x
      me.x = you.x
      you.x = temp

    else
      if me.x > you.x then
        me.x = start.x + math.abs((youxrig-me.x))
        you.x = start.x + math.abs((mexrig-you.x))
      else
        me.x = start.x + math.abs((mexrig-me.x))
        you.x = start.x + math.abs((youxrig-you.x))
      end

    end
  end

  if vertone then
    if start.y < 0 then
      me.y = theMap.height+start.y + (meyrig-me.y)
      you.y = theMap.height+start.y + (meyrig - you.y)
      local temp = me.y
      me.y = you.y
      you.y = temp

    else
      me.y = start.y + math.abs((meyrig-me.y))
      you.y = start.y + math.abs((meyrig - you.y))
    end
  else
    if start.y < 0 then
      me.y = theMap.height+start.y + (meyrig-me.y)
      you.y = theMap.height+start.y + (youyrig - you.y)
      local temp = me.y
      me.y = you.y
      you.y = temp


    else
      me.y = start.y + math.abs((meyrig-me.y))
      you.y = start.y + math.abs((youyrig - you.y))
    end
  end

  me.feet = me.y + 60
  you.feet = you.y + 60
  me.old_feet = me.y
  you.old_feet = you.y



  floor = 1000-50
  enviro.stage = thefractal.stage
  enviro.rightwall = thefractal.rightwall
  floor = thefractal.floor


  map.width = truewidth
  map.height = trueheight



end

function changebackgroundcolor(rate)
  backgroundcolor.r = colorChange(backgroundcolor.r,rate)
  backgroundcolor.g = colorChange(backgroundcolor.g,rate)
  backgroundcolor.b = colorChange(backgroundcolor.b,rate)
  lg.setBackgroundColor(backgroundcolor.r,backgroundcolor.g,backgroundcolor.b)
end


backgroundcolor = {r = math.random(255),g = math.random(255),b = math.random(255)}