
fractal1 = lg.newImage("enviro/fractals/fractal1.png")
fractal2 = lg.newImage("enviro/fractals/fractal2.png")
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
    start4={x = 50, y = 50}
  },

  {name = "fractal2", 
    stage = fractal2,
    plats = {}, walls = {},
    floor = 1000-50,
    rightwall = 1000-50,
    start={x = 300, y = 50},
    facade = fractal1facade,
    rotation = 0,
    start1={x = 200, y = 50},
    start2={x = 200, y = 50},
    start3={x = 200, y = 50},
    start4={x = 200, y = 50}
  }
}

function rotatefractal()
  map = themap
  map.rotation = (map.rotation + math.rad(90))%math.rad(360)

  if math.deg(map.rotation)%360 <= 89 then
    map.start = map.start1
  elseif math.deg(map.rotation)%360 <= 170 then
    map.start = map.start2
  elseif math.deg(map.rotation)%360 <= 260 then
    map.start = map.start3
  elseif math.deg(map.rotation)%360 <=360 then
    map.start = map.start4
  end

  for i,wall in ipairs(map.walls) do

   

    if math.deg(map.rotation)%180 < 80 then 
      wall.x1 = 1000-wall.y2
    wall.x2 = 1000-wall.y1
      
      wall.y = 1000-wall.x

      if wall.radius ~= nil then
        wall.midy = 1000-wall.x
        wall.y = wall.midy - wall.radius
      end
    else
       wall.x1 = wall.y1
    wall.x2 = wall.y2
      wall.y = wall.x

      if wall.radius ~= nil then
        wall.midy = wall.x
        wall.y = wall.midy - wall.radius
      end

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




    if  math.deg(map.rotation)%180 < 80 then
 plat.y1 = 1000-plat.x2
    plat.y2 = 1000-plat.x1
      plat.x = math.abs(1000-plat.y)

      if plat.midy ~= nil then
        plat.x = math.abs(1000-plat.midy)
      end

    else
 plat.y1 = plat.x1
    plat.y2 = plat.x2
      plat.x = plat.y

      if plat.midy ~= nil then
        plat.x = plat.midy
      end

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


end

table.insert(fractals[1].walls, {n=1,y1 = 50, y2 = fractals[1].floor, x=fractals[1].rightwall, barrier = true})
table.insert(fractals[1].walls, {n=2,y1 = 50, y2 = fractals[1].floor, x=50, barrier = true})

table.insert(fractals[1].plats, {n=1, y = fractals[1].floor, x1 = 0, x2 = fractals[1].rightwall+50, floor = true, ceiling = true})
table.insert(fractals[1].plats, {n=1, y = 50, x1 = 0, x2 = fractals[1].rightwall+50, ceiling = true, floor = true})


table.insert(fractals[2].walls, {n=1,y1 = 0, y2 = fractals[2].floor, x=fractals[2].rightwall, barrier = true})
table.insert(fractals[2].walls, {n=2,y1 = 0, y2 = fractals[2].floor, x=50, barrier = true})

table.insert(fractals[2].plats, {n=1, y = fractals[2].floor, x1 = 0, x2 = fractals[1].rightwall+50, floor = true, ceiling = true})
table.insert(fractals[2].plats, {n=2, y = 50, x1 = 0, x2 = fractals[2].rightwall+50, ceiling = true, floor = true})


table.insert(fractals[2].plats, {n=3, y = 200, x1 = 200, x2 = 800, floor = true, ceiling = true})
table.insert(fractals[2].plats, {n=4, y = 800, x1 = 200, x2 = 800, floor = true, ceiling = true})
table.insert(fractals[2].walls, {n=3,y1 = 200, y2 = 800, x=200, barrier = true})
table.insert(fractals[2].walls, {n=4,y1 = 200, y2 = 800, x=800, barrier = true})


table.insert(fractals[2].plats, {n=5, y = 719 - 2, midy = 719, x1 = 50, x2 = 200, radius = 2})


--[[
function rotatefractal()
  map = themap
  map.rotation = map.rotation + math.rad(90)

  if math.deg(map.rotation)%360 <= 89 then
    map.start = map.start1
  elseif math.deg(map.rotation)%360 <= 170 then
    map.start = map.start2
  elseif math.deg(map.rotation)%360 <= 260 then
    map.start = map.start3
  elseif math.deg(map.rotation)%360 <=360 then
    map.start = map.start4
  end


  tempplat = clone(map.plats)
  map.plats = {}
  for i,wall in ipairs(map.walls) do
    if wall.midy == nil then
      table.insert(map.plats, {n = wall.n, y = wall.x, x1 = wall.y2, x2 = wall.y1, ceiling = wall.barrier, floor = wall.barrier, radius = wall.radius, midy = wall.midy})
    else
      table.insert(map.plats, {n = wall.n, y = wall.midy - wall.radius, x1 = wall.y2, x2 = wall.y1, ceiling = wall.barrier, floor = wall.barrier, radius = wall.radius, midy = wall.midy})
    end

  end  
  map.walls = {}
  for i,plat in ipairs(tempplat) do
    if plat.midy == nil then
      table.insert(map.walls, {n = plat.n, x = plat.y, y1 = plat.x1, y2 = plat.x2, barrier = plat.floor, barrier = plat.floor, radius = plat.radius, midy = plat.x})

    else
      table.insert(map.walls, {n = plat.n, x = plat.midy, y1 = plat.x1, y2 = plat.x2, barrier = plat.floor, barrier = plat.floor, radius = plat.radius, midy = plat.x})
    end
  end



end

table.insert(fractals[1].walls, {n=1,y1 = 0, y2 = fractals[1].floor, x=fractals[1].rightwall, barrier = true})
table.insert(fractals[1].walls, {n=2,y1 = 0, y2 = fractals[1].floor, x=50, barrier = true})

table.insert(fractals[1].plats, {n=1, y = fractals[1].floor, x1 = 0, x2 = fractals[1].rightwall+50, floor = true, ceiling = true, midy = fractals[1].floor, radius = 0})
table.insert(fractals[1].plats, {n=1, y = 50, x1 = 0, x2 = fractals[1].rightwall+50, ceiling = true, floor = true, midy = 50, radius = 0})


table.insert(fractals[2].walls, {n=1,y1 = 0, y2 = fractals[2].floor, x=fractals[2].rightwall, barrier = true})
table.insert(fractals[2].walls, {n=2,y1 = 0, y2 = fractals[2].floor, x=50, barrier = true})


table.insert(fractals[2].plats, {n=3, y = 200, x1 = 200, x2 = 800, floor = true, ceiling = true, midy = 200, radius = 0})
table.insert(fractals[2].plats, {n=4, y = 800, x1 = 200, x2 = 800, floor = true, ceiling = true, midy = 800})
table.insert(fractals[2].walls, {n=3,y1 = 200, y2 = 800, x=200, barrier = true})
table.insert(fractals[2].walls, {n=4,y1 = 200, y2 = 800, x=800, barrier = true})


table.insert(fractals[2].plats, {n=5, y = 719 - 2, midy = 719, x1 = 50, x2 = 200, radius = 2})
]]--


thefractal = fractals[2]



--IN THIS ONE, NO THING FOR GROUND THING, LIKE, NO GROUND CAMERA ADJUST
function throwinto()

  themap = thefractal
  rotatefractal()



  local start = themap.start
  if onescreen then

    me.x = start.x + math.abs((mexrig-me.x))
    you.x = start.x + math.abs((mexrig-you.x))
  else
    me.x = start.x + math.abs((mexrig-me.x))
    you.x = start.x + math.abs((youxrig-you.x))
  end

  if vertone then
    me.y = start.y + math.abs((meyrig-me.y))
    you.y = start.y + math.abs((meyrig - you.y))
  else
    me.y = start.y + math.abs((meyrig-me.y))
    you.y = start.y + math.abs((youyrig - you.y))
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