
fractal1 = lg.newImage("enviro/fractals/fractal1.png")
fractal2 = lg.newImage("enviro/fractals/fractal2.png")
fractal3 = lg.newImage("enviro/fractals/fractal3.png")
fractal3paralax = lg.newImage("enviro/fractals/fractal3paralax.png")
fractal4 = lg.newImage("enviro/fractals/fractal4.png")
fractal4paralax = lg.newImage("enviro/fractals/fractal4paralax.png")
fractal5 = lg.newImage("enviro/fractals/fractal5.png")
fractal5paralax = lg.newImage("enviro/fractals/fractal5paralax.png")
fractal1facade = lg.newImage("enviro/fractals/fractal1facade.png")


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
  map = themap
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

function makeplatbox(num, ex, why, width, height)


  table.insert(fractals[num].plats, {y = why, x1 =  ex, x2 = ex+width, floor = true})
  table.insert(fractals[num].plats, {y = why+height, x1 =  ex, x2 = ex+width, ceiling = true})

    table.insert(fractals[num].walls, {y1 = why, y2 = why+height, x=ex, barrier = true, floor = true})
    table.insert(fractals[num].walls, {y1 = why, y2 = why+height, x=ex+width, barrier = true, ceiling = true})


end

table.insert(fractals[1].walls, {n=1,y1 = 198, y2 = 950, x=805, barrier = true, floor = true})
table.insert(fractals[1].plats, {n=1, midy = 200, x1 = 805, x2 = 950, radius = 1, y = 0, floor = true})
table.insert(fractals[1].plats, {fractal = true, midy = 564, x1 = 512, x2 = 767, radius = 1, y=0})







table.insert(fractals[2].plats, {fractal = true, y = 200, x1 = 200, x2 = 800})
table.insert(fractals[2].plats, {fractal = true, y = 800, x1 = 200, x2 = 800})
table.insert(fractals[2].walls, {fractal = true,y1 = 200, y2 = 800, x=200})
table.insert(fractals[2].walls, {fractal = true,y1 = 200, y2 = 800, x=800})


table.insert(fractals[2].plats, {fractal = true, midy = 346, x1 = 50, x2 = 200, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 586, x1 = 50, x2 = 200, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 719, x1 = 50, x2 = 216, radius = 2, y = 0})

table.insert(fractals[2].walls, {y1 = 780, y2 = 950, x=292, radius = 2})
table.insert(fractals[2].walls, {y1 = 780, y2 = 950, x=496, radius = 2})
table.insert(fractals[2].walls, {y1 = 780, y2 = 950, x=699, radius = 2})



table.insert(fractals[2].plats, {fractal = true, midy = 238, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 298, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 392, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 455, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 515, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 565, x1 = 769, x2 = 950, radius = 2, y = 0})
table.insert(fractals[2].plats, {fractal = true, midy = 724, x1 = 800, x2 = 950, radius = 2, y = 0})


makeplatbox(3, 0, 0, 116, 1034)
makeplatbox(3, 384, 0, 116, 517)
makeplatbox(3, 268, 517, 232, 517)

makeplatbox(3, 0, 1034, 50, 250)
makeplatbox(3, 500-50, 1034, 50, 250)

makeplatbox(3, 0, 1284, 100, 250)
makeplatbox(3, 500-100, 1284, 100, 250)
makeplatbox(3, 0, 1284+250, 150, 250)
makeplatbox(3, 500-150, 1284+250, 150, 250)
makeplatbox(3, 0, 1284+250+250, 200, 250)
makeplatbox(3, 500-200, 1284+250+250, 200, 250)



makeplatbox(3, 500-200, 1284+250+250, 200, 250)

table.insert(fractals[4].plats, {fractal = true, midy = 404, x1 = 170, x2 = 470, radius = 1, y = 136})
table.insert(fractals[4].plats, {fractal = true, midy = 537, x1 = 170, x2 = 470, radius = 1, y = 136})


table.insert(fractals[4].plats, {fractal = true, midy = 670, x1 = 170, x2 = 470, radius = 1, y = 136})
table.insert(fractals[4].plats, {fractal = true, midy = 803, x1 = 170, x2 = 470, radius = 1, y = 136})

table.insert(fractals[4].walls, {y1 = 403, y2 = 950, x=171, radius = 1})
table.insert(fractals[4].walls, {y1 = 650, y2 = 950, x=469, radius = 1})

table.insert(fractals[4].walls, {y1 = 50, y2 = 180, x=514, radius = 1})

table.insert(fractals[4].walls, {y1 = 403, y2 = 538, x=469, radius = 1})
table.insert(fractals[4].plats, {fractal = true, midy = 179, x1 = 513, x2 = 645, radius = 1, y = 179})

table.insert(fractals[4].plats, {fractal = true, midy = 706, x1 = 565, x2 = 923, radius = 1, y = 0})
table.insert(fractals[4].walls, {y1 = 705, y2 = 814, x=566, radius = 1})
table.insert(fractals[4].walls, {y1 = 705, y2 = 814, x=922, radius = 1})

table.insert(fractals[4].walls, {y1 = 564, y2 = 950, x=990, radius = 1})
table.insert(fractals[4].walls, {y1 = 564, y2 = 950, x=1360, radius = 1})

table.insert(fractals[4].walls, {y1 = 50, y2 = 316, x=990, radius = 1})
table.insert(fractals[4].walls, {y1 = 50, y2 = 316, x=1360, radius = 1})


table.insert(fractals[4].walls, {y1 = 50, y2 = 164, x=1564, radius = 2})
table.insert(fractals[4].walls, {y1 = 564, y2 = 851, x=1564, radius = 2})
table.insert(fractals[4].walls, {y1 = 564, y2 = 851, x=1801, radius = 2})

table.insert(fractals[4].walls, {y1 = 50, y2 = 109, x=1801, radius = 2})

table.insert(fractals[4].plats, {fractal = true, midy = 850, x1 = 1562, x2 = 2050, radius = 2, y = 0})

makeplatbox(4, 733, 50, 23, 154)
makeplatbox(4, 756, 181, 198, 23)
makeplatbox(4, 989, 657, 374, 24)
makeplatbox(4, 989, 292, 374, 24)
makeplatbox(4, 805, 367, 23, 48)
makeplatbox(4, 805, 367, 23, 48)
makeplatbox(4, 828, 392, 198, 23)


makeplatbox(5, 1756, 50, 674, 37)
makeplatbox(5, 50, 50, 316, 110)

makeplatbox(5, 2432, 459, 18, 551)

makeplatbox(5, 255, 70, 255, 77)

makeplatbox(5, 50, 2300, 162, 37)
makeplatbox(5, 212, 2337, 189, 36)
makeplatbox(5, 401, 2373, 329, 28)
makeplatbox(5, 730, 2401, 228, 25)
makeplatbox(5, 958, 2426, 227, 24)
makeplatbox(5, 2207, 2300, 243, 150)




function insertfractalbox(num)
  table.insert(fractals[num].walls, {n=1,y1 = 50, y2 = fractals[num].floor, x=fractals[num].rightwall, barrier = true, floor = true, fractalbox = true})
  table.insert(fractals[num].walls, {n=2,y1 = 50, y2 = fractals[num].floor, x=50, barrier = true, ceiling = true, fractalbox = true})

  table.insert(fractals[num].plats, {n=1, y = fractals[num].floor, x1 = 50, x2 = fractals[num].rightwall, floor = true, fractalbox = true})
  table.insert(fractals[num].plats, {n=2, y = 50, x1 = 50, x2 = fractals[num].rightwall, ceiling = true, fractalbox = true})

end


insertfractalbox(1)
insertfractalbox(2)
insertfractalbox(3)
insertfractalbox(4)
insertfractalbox(5)




thefractal = fractals[3]



--IN THIS ONE, NO THING FOR GROUND THING, LIKE, NO GROUND CAMERA ADJUST
function throwinto()
  themap = fractals[3]
  local map = themap
  --[[
  themap = fractals[math.random(1,3)]
  local map = themap
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




  local start = themap.start
  if onescreen then
    if start.x < 0 then

      me.x = themap.width+start.x + (mexrig-me.x)
      you.x = themap.width+start.x + (mexrig-you.x)
      local temp = me.x
      me.x = you.x
      you.x = temp
    else

      me.x = start.x + math.abs((mexrig-me.x))
      you.x = start.x + math.abs((mexrig-you.x))
    end
  else

    if start.x < 0 then
      me.x = themap.width+start.x + (mexrig-me.x)
      you.x = themap.width+start.x + (youxrig-you.x)
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
      me.y = themap.height+start.y + (meyrig-me.y)
      you.y = themap.height+start.y + (meyrig - you.y)
      local temp = me.y
      me.y = you.y
      you.y = temp

    else
      me.y = start.y + math.abs((meyrig-me.y))
      you.y = start.y + math.abs((meyrig - you.y))
    end
  else
    if start.y < 0 then
      me.y = themap.height+start.y + (meyrig-me.y)
      you.y = themap.height+start.y + (youyrig - you.y)
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
  me.oldpy = me.y
  you.oldpy = you.y



  floor = 1000-50
  enviro.stage = thefractal.stage
  enviro.rightwall = thefractal.rightwall
  floor = thefractal.floor


  map.width = truewidth
  map.height = trueheight



end

function changebackgroundcolor(rate)
    backgroundcolor.r = colorchange(backgroundcolor.r,rate)
  backgroundcolor.g = colorchange(backgroundcolor.g,rate)
  backgroundcolor.b = colorchange(backgroundcolor.b,rate)
  lg.setBackgroundColor(backgroundcolor.r,backgroundcolor.g,backgroundcolor.b)


  end
backgroundcolor = {r = math.random(255),g = math.random(255),b = math.random(255)}