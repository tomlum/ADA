require "xkcdcolor" 
require "monitors"
lg = love.graphics



--box outline
function bo(x,y,w,h,color)
  setColor(color)
  lg.rectangle("line", x, y, w, h)
  
  cclear()
end


function cclear()
lg.setColor(255,255,255)
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

function vcs(c)
  
  lg.setColor(c.r,c.g,c.b)
  end

function colorchange(v)
local vv = math.random(-5,5)
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



function lof(x,y)
  if x < y then return x
  else return y
  end

end

function mlof(x)
  local lof = x[1]
  for i = 2, #x do
    if lof > x[i] then lof = x[i]

    end
  end
  return lof

end

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

function mhof(x)
  local hof = x[1]
  for i = 2, #x do
    if hof < x[i] then hof = x[i]

    end
  end
  return hof

end


function hof(x,y)
  if x > y then return x
  else return y
  end

end


