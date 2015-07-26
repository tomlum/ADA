colorbox = lg.newImage("enviro/colorbox.png")
colorboxbottom = lg.newImage("enviro/colorboxbottom.png")
colorboxleaf = lg.newImage("enviro/colorboxleaf.png")

colorboxes = {}

boxhealth = 10

function spawncolorbox()
  if plat.nobox == nil  then
  
end
end

function makecolorbox(ex, why)
  local color = {r = math.random(-255,255), g = math.random(-255,255), b = math.random(-255,255)}

  local color2 = {r = math.random(-255,255), g = math.random(-255,255), b = math.random(-255,255)}

  for i = 0, 20 do
    table.insert(colorboxes, {flip = 0+.01*i, flipdir = 1, x = ex, y = why, time = 0, c = color, c2 = color2, health = boxhealth

      })
  end

end

function red()

  lg.setColor(255,0,0)

end


function blue()

  lg.setColor(0,255,0)
end

boxfliprate = .02
boxcolorshiftrate = .004


function updatecolorboxes()
  for i,v in ipairs(colorboxes) do
    
    v.c.r = colorshift(v.c.r, math.random(.01,boxcolorshiftrate))
    v.c.g = colorshift(v.c.g, math.random(.01,boxcolorshiftrate))
    v.c.b = colorshift(v.c.b, math.random(.01,boxcolorshiftrate))
    
    v.c2.r = colorshift(v.c2.r, math.random(.01,boxcolorshiftrate))
    v.c2.g = colorshift(v.c2.g, math.random(.01,boxcolorshiftrate))
    v.c2.b = colorshift(v.c2.b, math.random(.01,boxcolorshiftrate))


    if v.flip+boxfliprate > 1  then
      v.flip = -1
    end
    if v.flip < 0 and v.flip + boxfliprate >= 0 then
      v.flipdir = -v.flipdir
    end
    v.flip = v.flip + boxfliprate






  end

end

--boxpartdis
bpd = -5
function colorshift(see, rate)
  local c = see
  c = c - rate
  if c < -255 then c = 255
  end

  return c
end


--if something then draw on top so looks like spinning
function drawcolorboxes()
  
  
  
  
  
  

  for i = 1, #colorboxes do
    v = colorboxes[i]

    v1 = colorboxes[1]
      local function col2()
      lg.setColor(math.abs(v1.c.r), math.abs(v1.c.g), math.abs(v1.c.b))
    end


    local function col1()
      lg.setColor(math.abs(v1.c2.r), math.abs(v1.c2.g), math.abs(v1.c2.b))

    end



    if v.flip > 0 then
      if v.flipdir < 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorboxbottom, v.x-4.5, v.y+25, 0, -v.flip, 1,-bpd,50)
    elseif v.flip < 0 then
      if v.flipdir < 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorboxbottom, v.x-4.5, v.y+25, 0, v.flip, 1,-bpd,50)
    end


end



  



  
  







  for i = #colorboxes, 1, -1 do
    v1 = colorboxes[1]
    v = colorboxes[i]
       local function col2()
      lg.setColor(math.abs(v1.c.r), math.abs(v1.c.g), math.abs(v1.c.b))
    end


    local function col1()
      lg.setColor(math.abs(v1.c2.r), math.abs(v1.c2.g), math.abs(v1.c2.b))

    end


    iv = colorboxes[#colorboxes-i]


    if v.flip > 0 then
      if v.flipdir > 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorboxbottom, v.x-4.5, v.y+25, 0, v.flip, 1,-bpd,50)
    elseif v.flip < 0 then
      if v.flipdir > 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorboxbottom, v.x-4.5, v.y+25, 0, -v.flip, 1,-bpd,50)
    end

  end












  
  
  for i = 1, #colorboxes do
    v = colorboxes[i]
    v1 = colorboxes[1]

    local function col1()
      lg.setColor(math.abs(v1.c.r), math.abs(v1.c.g), math.abs(v1.c.b))
    end


    local function col2()
      lg.setColor(math.abs(v1.c2.r), math.abs(v1.c2.g), math.abs(v1.c2.b))

    end


    if v.flip > 0 then

      if v.flipdir > 0 then
        col1()
      else
        col2()
      end

      lg.draw(colorbox, v.x-4.5, v.y+25, 0, v.flip, 1,-bpd,50)
    elseif v.flip < 0 then
      if v.flipdir > 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorbox, v.x-4.5, v.y+25, 0, -v.flip, 1,-bpd,50)
    end


end








  for i = #colorboxes, 1, -1 do
    v1 = colorboxes[1]
    v = colorboxes[i]

    local function col1()
      lg.setColor(math.abs(v1.c.r), math.abs(v1.c.g), math.abs(v1.c.b))
    end


    local function col2()
      lg.setColor(math.abs(v1.c2.r), math.abs(v1.c2.g), math.abs(v1.c2.b))

    end

    iv = colorboxes[#colorboxes-i]

    if v.flip > 0 then
      if v.flipdir < 0 then
        col1()
      else
        col2()
      end
      lg.draw(colorbox, v.x-4.5, v.y+25, 0, -v.flip, 1,-bpd,50)
    elseif v.flip < 0 then

      if v.flipdir < 0 then
        col1()
      else
        col2()
      end

      lg.draw(colorbox, v.x-4.5, v.y+25, 0, v.flip, 1,-bpd,50)
    end

  end









end


function colorshift(see, rate)
  local c = see
  c = c - rate
  if c < -255 then c = 255
  end

  return c
end