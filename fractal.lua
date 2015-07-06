
fractal1 = lg.newImage("enviro/fractals/fractal1.png")
fractal2 = lg.newImage("enviro/fractals/fractal2.png")
fractal3 = lg.newImage("enviro/fractals/fractal3.png")
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
    floor = 500-50,
    rightwall = 2000-50,
    start={x = 300, y = 50},
    facade = fractal1facade,
    rotation = 0,
    start1={x = 50, y = 50},
    start2={x = 50, y = 50},
    start3={x = 50, y = 50},
    start4={x = 50, y = 50},
    height = 500,
    width = 2000
  }
}

function rotatefractal()
  map = themap
  map.rotation = (map.rotation + math.rad(90))%math.rad(360)


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


    if wall.barrier then
      wall.ceiling = true
      wall.floor = true
      wall.barrier = nil
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
      plat.ceiling = nil
      plat.floor = nil
      plat.barrier = true
    end
  end

  tempplat = clone(map.plats)
  map.plats = clone(map.walls)
  map.walls = clone(tempplat)
  
  map.width = truewidth
  map.height = trueheight
 

end

table.insert(fractals[1].walls, {n=1,y1 = 198, y2 = 950, x=805, barrier = true})
table.insert(fractals[1].plats, {n=1, midy = 200, x1 = 805, x2 = 950, radius = 1, y = 0, floor = true, ceiling = true})
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




function insertfractalbox(num)
  table.insert(fractals[num].walls, {n=1,y1 = 50, y2 = fractals[num].floor, x=fractals[num].rightwall, barrier = true})
  table.insert(fractals[num].walls, {n=2,y1 = 50, y2 = fractals[num].floor, x=50, barrier = true})

  table.insert(fractals[num].plats, {n=1, y = fractals[num].floor, x1 = 50, x2 = fractals[num].rightwall, floor = true, ceiling = true})
  table.insert(fractals[num].plats, {n=2, y = 50, x1 = 50, x2 = fractals[num].rightwall, ceiling = true, floor = true})

end


insertfractalbox(1)
insertfractalbox(2)
insertfractalbox(3)




thefractal = fractals[3]



--IN THIS ONE, NO THING FOR GROUND THING, LIKE, NO GROUND CAMERA ADJUST
function throwinto()

  themap = thefractal
  --rotatefractal()
  


  

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
      me.x = start.x + math.abs((mexrig-me.x))
      you.x = start.x + math.abs((youxrig-you.x))

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
  
  
  
end