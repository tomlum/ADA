require "xkcdcolor" 
require "monitors"
lg = love.graphics

--decimal random
function floRan(low,up)
  return math.random(low+1,up-1)+math.random()*math.random(-1,1)
end

function drawbackgroundbox(x,y,w,h)
  lg.setBackgroundColor(backgroundcolor.r,backgroundcolor.g,backgroundcolor.b)
  lg.rectangle("fill", x, y, w, h)
  
end

function isabout(n, v)
  return math.abs(n-v) < .1

end

function absv(v, y)
  return math.sqrt((0-v)^2 + (0-y)^2)
end

function dis(p1, p2)
  return math.sqrt((p1.y-p2.y)^2 + (p1.x-p2.x)^2)
end
--box outline
function bo(x,y,w,h,color)
  setColor(color)
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


--resting orbital decimal interval base
function rodib(val,i,base)
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
    else return base
    end
  end


  function returntobase(val,i,base)
    if val > base then 
      if val - i < base then
        val = base
      else
        val = val - i
      end
    elseif val < base then 
      if val + i > base then
        val = base
      else
        val = val + i
      end
    end
  end







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

function setColorA(c, a)
  lg.setColor(c.r,c.g,c.b, a)
end

function setColor(c)

  lg.setColor(c.r,c.g,c.b)
end

function colorChange(v)
  local vv = math.random(-5,5)
  return hof(lof(v+vv, 255), 0)
end

function colorchange2(v,amount)
  local vv = amount*math.random(-1,1)
  return hof(lof(v+vv, 255), 0)
end

function coinflip(per)
  if per==nil then
    if math.random()>.5 then return true
      else return false
      end
    else
      if math.random()>per then return true
        else return false
        end

      end


    end

--Return higher of x and y
function hof(x,y)
  if x > y then return x
    else return y
    end

  end

--Return lower of x and y
function lof(x,y)
  if x < y then return x
    else return y
    end

  end

--bounded of between x and y
function bof(x, n, y)
  if n < x then return x
  elseif n > y then return y 
    else return n
  end

end

--Many lower of, find the lowest in the table
function mlof(x)
  local lof = x[1]
  for i = 2, #x do
    if lof > x[i] then lof = x[i]

    end
  end
  return lof

end


--Many higher of, find the lowest in the table
function mhof(x)
  local hof = x[1]
  for i = 2, #x do
    if hof < x[i] then hof = x[i]

    end
  end
  return hof

end

--Many lower of, greater than zero
function mlofgz(x)
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





function retfindIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
  local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
  local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
  local det,x,y = a1*b2 - a2*b1
  if det==0 then  return {0, 0} end
  x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
  if seg1 or seg2 then
    local min,max = math.min, math.max
    if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
      seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
      return {0, 0}
    end
  end
  return {x, y}
end


function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
  local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
  local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
  local det,x,y = a1*b2 - a2*b1
  if det==0 then return false end
  x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
  if seg1 or seg2 then
    local min,max = math.min, math.max
    if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
      seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
      return false
    end
  end
  return true
end

function findxIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y)

  if findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, true, true) or findIntersect(l1p2x,l1p2y,l1p1x,l1p1y,l2p1x,l2p1y, l2p2x,l2p2y, true, true) then
    return true
    else return false
    end

  end

  function lint(l1, l2)
    return pint(l1.p1, l1.p2, l2.p1, l2.p2)
  end

  function pint(p11,p12,p21,p22)
    return findIntersect(p11.x+.2,p11.y+.2,p12.x,p12.y,p21.x+.2,p21.y+.2,p22.x,p22.y,true,true)
  end

  function retpint(p11,p12,p21,p22)
    local fred = retfindIntersect(p11.x,p11.y,p12.x,p12.y,p21.x,p21.y,p22.x,p22.y,true,true)
    if fred[1] == nil then
      return {0,0}
      else return fred
      end
    end





