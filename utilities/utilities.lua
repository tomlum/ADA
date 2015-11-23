require "utilities/xkcdcolor" 
require "utilities/monitors"
require "utilities/joysticks"
require "utilities/camera"
loader = require "utilities/love-loader"

--functions that begin with t_ have specific table inputs (e.g. a table representing a color in rgb values)




---------------------
---DEBUG UTILITIES---
---------------------

function debugReadouts()
  if debug then
    lg.print(tostring(chaptime),10,10)
  end

  if fightclub and debug then
    lg.setColor(20,20,20)
    lg.print(tostring(me.combo),10,20)
    lg.print(tostring(me.color.n)..
      "       animcounter: "..tostring(me.animcounter).."current"..tostring(me.currentc)
      ..
      "       type: "..tostring(me.attack_num),10,30)
    lg.print("throughplats "..tostring("bla").."|| height "..tostring(me.height), 10, 50)
    lg.print("j "..tostring(you.j), 10, 70)
  end

  lg.setColor(255,255,255)
  if readout then
    lg.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    lg.print("me.x, me.y: "..tostring(me.x).." "..tostring(me.y), 10, 40)
    lg.print("you.x, you.y: "..tostring(you.x).." "..tostring(you.y), 10, 70)

    lg.setColor(255,10,0)
    lg.print("themenu "..tostring(MODE), 10, 90)
    lg.print("OLD_MODE "..tostring(OLD_MODE), 10, 110)
    lg.print("fadein "..tostring(fadein), 10, 130)
    lg.print("allfade "..tostring(allfade), 10, 150)
    lg.print("me.a2b "..tostring(me.a2b)..tostring(you.speedpenalty), 10, 180)
    lg.print("slowt "..tostring(slowt), 10, 230)
    lg.print("#joysticks"..tostring(#love.joystick.getJoysticks()), 10, 250)
    lg.print("#monsters"..tostring(#monsters), 10, 280)
    for i,v in ipairs(love.joystick.getJoysticks()) do
      lg.print("hey"..v:getName()..tostring(i), 200, 20+20*i)
    end


    lg.setColor(255,0,0)


  end



  if not love.keyboard.isDown("3") and not love.keyboard.isDown("4") and not love.keyboard.isDown("2") then

    boxstop = false
  end
  if love.keyboard.isDown("5") and not boxstop then
    boxstop = true
    throwinto()
    --rotatefractal()
  end


  -- moveTOD(.03)
  if love.keyboard.isDown("4") and not boxstop then
    throwinto()
    --makecolorbox(me.x, me.y+30)
    boxstop = true
    --fractalrotate()
  end

  if love.keyboard.isDown("5") and not boxstop then
    rotatefractal()
    --makecolorbox(me.x, me.y+30)
    boxstop = true
    --fractalrotate()
  end

  if love.keyboard.isDown("2")then
    me.no_spikes = true
  end
  if fightclub and debug then

    lg.print("pause: "..tostring(pause), 400,360)
    lg.print("me.walllr: "..tostring(me.walllr), 400,380)
    lg.print("me.lr: "..tostring(me.lr), 400,400)
    lg.print("me.oldcolor: "..tostring(me.oldcolor), 400,440)
    lg.print("me.up : "..tostring(me.up), 400,460)
    --changebackgroundcolor(4)

  end
end




--------------------
--COLOR UTILITIES---
--------------------

function genRanColor()
  return {r = math.random(255), g = math.random(255), b = math.random(255)
}
end
function setColorA(c, a)
  lg.setColor(c.r,c.g,c.b, a)
end


function t_setColor(c)
  if c.a == nil then
    lg.setColor(c.r,c.g,c.b)
  else
    lg.setColor(c.r,c.g,c.b,c.a)
  end
end


function colorChange(v)
  local vv = math.random(-5,5)
  return math.max(math.min(v+vv, 255), 0)
end

function t_colorShift(table_color)
  table_color.r = bof(0, table_color.r+math.random(-5,5), 255)
  table_color.g = bof(0, table_color.g+math.random(-5,5), 255)
  table_color.b = bof(0, table_color.b+math.random(-5,5), 255)
end

function hls2rgb(h,l,s,a)
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    function hue2rgb(p, q, t)
      if t < 0   then t = t + 1 end
      if t > 1   then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
    end

    local q
    if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1/3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1/3)
  end

  return{r=r * 255, g=g * 255, b=b * 255, a=a * 255}
end

function t_colorShift2(table_color, amount, speed)
  if table_color.r_up == nil then
    table_color.r_up = 1
  end
  if table_color.g_up == nil then
    table_color.g_up = 1
  end
  if table_color.b_up == nil then
    table_color.b_up = 1
  end
  if math.random() < speed then 
    table_color.r = bof(0, table_color.r+floRan(amount/2,amount)*table_color.r_up, 255)
  end
  if math.random() < speed then 
    table_color.g = bof(0, table_color.g+floRan(amount/2,amount)*table_color.g_up, 255)
  end
  if math.random() < speed then 
    table_color.b = bof(0, table_color.b+floRan(amount/2,amount)*table_color.b_up, 255)
  end
  too_dark = (table_color.r + table_color.g + table_color.b) < 300 
  too_bright = (table_color.r + table_color.g + table_color.b) > 400 

  if table_color.r == 255 or table_color.r == 0 then
    table_color.r_up = -table_color.r_up
  end
  if table_color.g == 255 or table_color.g == 0 then
    table_color.g_up = -table_color.g_up
  end
  if table_color.b == 255 or table_color.b == 0 then
    table_color.b_up = -table_color.b_up
  end

  if too_dark or too_bright then
    local culprit = math.min(table_color.r,table_color.g,table_color.b)
    local correction = 1
    if too_bright then
      culprit = math.max(table_color.r,table_color.g,table_color.b)
      correction = -1
    end


    if isabout(table_color.r, culprit) then
      table_color.r_up = correction
    end
    if isabout(table_color.g, culprit) then
      table_color.g_up = correction
    end
    if isabout(table_color.b, culprit) then
      table_color.b_up = correction
    end
  end
end



--------------------
---MATH UTILITIES---
--------------------

function signOf(x)
  if x > 0 then return 1 else return -1 end
end

--"bounded of" between x and y
function bof(lower_limit, n, upper_limit)
  if n < lower_limit then 
    return lower_limit
  elseif n > upper_limit then 
    return upper_limit 
  else 
    return n
  end

end


--"lower of, greater than zero"
function lofgz(x)
  local lof = 10000000
  for i = 1, #x do

    if x[i]>0 and lof > x[i] then lof = x[i]

    end
  end
  if lof == 10000000 then
    return 0 else
    return lof
  end

end


function isabout(n, v)
  return math.abs(n-v) < 1

end


function absv(v, y)
  return math.sqrt((0-v)^2 + (0-y)^2)
end


--box outline
function bo(x,y,w,h,color)
  t_setColor(color)
  lg.rectangle("line", x, y, w, h)
  
  cclear()
end


function cclear()
  lg.setColor(255,255,255)
end



function rollover(val,i,pivot)
  if val + i > pivot then
    return pivot-val+i
  else
    return val + i
  end
end


--Return to Base
--try to get bal to base by the interval i
function r2b(val,i,base)
  if val > base then 
    if val - i < base then
      return base
    else
      return val - i
    end
  elseif val < base then 
    if val + i > base then
      return base
    else
      return val + i
    end
  else 
    return base
  end
end


------------------------------
---RANDOM(number) UTILITIES---
------------------------------

function coinFlip(decimal)
  if decimal==nil then
    if math.random()>.5 then 
      return true
    else 
      return false
    end
  else
    if math.random()>decimal then 
      return true
    else 
      return false
    end

  end


end

function posnegflip()
  if math.random()>.5 then 
    return 1
  else 
    return -1
  end
end

--generate a float random
function floRan(low,up)
  if up == nil then
    return math.random()*(low)
  else
    return low+math.random()*(up-low)
  end
end




--------------------
---LINE UTILITIES---
--------------------


function p_distance(p1, p2)
  return math.sqrt((p1.y-p2.y)^2 + (p1.x-p2.x)^2)
end


function retfindIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y)
  local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
  local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
  local det,x,y = a1*b2 - a2*b1
  if det==0 then  return {0, 0} end
  x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
  local min,max = math.min, math.max
  if not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
    not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
    return {0, 0}
  end
  return {x, y}
end


function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y)
  local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
  local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
  local det,x,y = a1*b2 - a2*b1
  if det==0 then return false end
  x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
  local min,max = math.min, math.max
  if not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
    not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
    return false
  end 
  return true
end


function lint(l1, l2)
  return pint(l1.p1, l1.p2, l2.p1, l2.p2)
end

function pint(p11,p12,p21,p22)
  return findIntersect(p11.x+.2,p11.y+.2,p12.x,p12.y,p21.x+.2,p21.y+.2,p22.x,p22.y,true,true)
end

function platpint(p11,p12,p21,p22)
  return findIntersect(p11.x,p11.y+.0001,p12.x,p12.y,p21.x,p21.y,p22.x,p22.y)
end

function retpint(p11,p12,p21,p22)
  local fred = retfindIntersect(p11.x,p11.y,p12.x,p12.y,p21.x,p21.y,p22.x,p22.y)
  if fred[1] == nil then
    return {0,0}
    else return fred
    end
  end



  -------------------
  ---LOVE UTILITIES---
  -------------------
  function setFontSize(size)
    love.graphics.setNewFont("utilities/munro.ttf", size)
  end

  -------------------
  ---LUA UTILITIES---
  -------------------

  function clone (t) -- deep-copy a table
    if type(t) ~= "table" then return t end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do
      if type(v) == "table" then
        target[k] = clone(v)
      else
        target[k] = v
      end
    end
    setmetatable(target, meta)
    return target
  end