--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person
--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person


function sideofline(cx1, cy1, cx2, cy2, x,y)
     return ((cx2 - cx1)*(y - cy1) - (cy2 - cy1)*(x - cx1)) > 0;
end


hitt = {}



table.insert(hitt, 
  {i = 1,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 
    block = 0, dodge = false, invince = false,
    width = 20, height = 50})
table.insert(hitt, 
  {i = 2,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 
    block = 0, dodge = false, invince = false,
    width = 20, height = 50})



--if worried about corner hitting do two points
function boxCheck(X,A, B, C, D)
  local pints = 0
  local Y = {x = 0, y = 0}
  if(pint(X, Y, A, B)) then 
    pints = pints + 1
  end
  if(pint(X, Y, B, C)) then 
    pints = pints + 1
  end
  if(pint(X, Y, C, D)) then 
    pints = pints + 1
  end
  if(pint(X, Y, D, A)) then 
    pints = pints + 1
  end
  if pints == 1 then return true
else return false
end
  
end

function inhexcheck(EX, A, B, C, D, E, F)
  local pints = 0
  local Y = {x = 0, y = 0}
  if(pint(EX, Y, A, B)) then 
    pints = pints + 1
  end
  if(pint(EX, Y, B, C)) then 
    pints = pints + 1
  end
  if(pint(EX, Y, C, D)) then 
    pints = pints + 1
  end
  if(pint(EX, Y, D, E)) then 
    pints = pints + 1
  end
  if(pint(EX, Y, E, F)) then 
    pints = pints + 1
  end
  if(pint(EX, Y, F, A)) then 
    pints = pints + 1
  end
  if pints == 1 then return true
else return false
  end
  
end

function hexdistan(x,y)
if distanc(t["c"],x) > distanc(t["c"],y) then return 
  x
else return y
end
end






function hexcheck(lx1, ly1, lx2, ly2, ex, why, w, h, v, j)
   t = {["c"] = {x = ex+w/2, y = why+h/2},
    [0] = {x = ex, y=why, n = 0},
    [1] = {x = ex+w, y=why, n = 1},
    [2] = {x = ex+w, y=why+h, n = 2},
    [3] = {x = ex, y=why+h, n = 3}}
   d = {
    [0] = {x = ex+v, y=why-j, n = 0},
    [1] = {x = ex+w+v, y=why-j, n = 1},
    [2] = {x = ex+w+v, y=why+h-j, n = 2},
    [3] = {x = ex+v, y=why+h-j, n = 3}}
   l = {[1] = {x = lx1, y = ly1},[2] = {x = lx2, y = ly2}}
  

  disn = hexdistan(hexdistan(d[0], d[1]), hexdistan(d[2], d[3])).n
  adjn1 = (disn+1)%4
  adjn2 = (disn-1)%4
  oppn = (disn-2)%4
  local linep1 = {x = lx1, y = ly1}
  local linep2 = {x = lx2, y = ly2}
  if 
  pint(l[1], l[2], d[disn], d[adjn1]) or
  pint(l[1], l[2], d[disn], d[adjn2]) or
  pint(l[1], l[2], t[adjn1], d[adjn1]) or
  pint(l[1], l[2], t[adjn2], d[adjn2]) or
  pint(l[1], l[2], t[oppn], t[adjn1]) or
  pint(l[1], l[2], t[oppn], t[adjn2])
  or 
inhexcheck(linep2, d[disn], d[adjn1], t[adjn1], t[oppn], t[adjn2], d[adjn2])
then return true
else return false
  end
  
  

end



function drawallhex()
for i,v in ipairs(hitt) do
    drawhexcheck(v.x, v.y, v.width, v.height, v.v, v.j)
end
  
	love.graphics.line(bx1,by1,bx2,by2)
end
function drawhexcheck(ex, why, w, h, v, j)
   t = {["c"] = {x = ex+w/2, y = why+h/2},
    [0] = {x = ex, y=why, n = 0},
    [1] = {x = ex+w, y=why, n = 1},
    [2] = {x = ex+w, y=why+h, n = 2},
    [3] = {x = ex, y=why+h, n = 3}}
   d = {
    [0] = {x = ex+v, y=why-j, n = 0},
    [1] = {x = ex+w+v, y=why-j, n = 1},
    [2] = {x = ex+w+v, y=why+h-j, n = 2},
    [3] = {x = ex+v, y=why+h-j, n = 3}}
  

  disn = hexdistan(hexdistan(d[0], d[1]), hexdistan(d[2], d[3])).n
  adjn1 = (disn+1)%4
  adjn2 = (disn-1)%4
  oppn = (disn-2)%4
  love.graphics.setColor(255,0,0)
  love.graphics.line(d[disn].x,d[disn].y, d[adjn1].x,d[adjn1].y)
  love.graphics.line(d[disn].x,d[disn].y, d[adjn2].x,d[adjn2].y)
  love.graphics.setColor(255,255,255)
  love.graphics.line(t[adjn1].x,t[adjn1].y, d[adjn1].x,d[adjn1].y)
  love.graphics.line(t[adjn2].x,t[adjn2].y, d[adjn2].x,d[adjn2].y)
  love.graphics.setColor(0,255,0)
  love.graphics.line(t[oppn].x,t[oppn].y, t[adjn1].x,t[adjn1].y)
  love.graphics.line(t[oppn].x,t[oppn].y, t[adjn2].x,t[adjn2].y)
  love.graphics.setColor(255,255,255)
  
  
  

end



--the big hit check
function hc(objx, objy, objx2, objy2, blockable, dir, dodgeable, force, vee, jay, dam, flinching, efftee, xjump, yjump, misc1, misc2, theid)
  hitt[1].x = me.x+5
  hitt[1].y = me.y+5
  hitt[1].j = me.j
  hitt[1].v = me.v
  hitt[1].flinch = me.flinch
  hitt[1].ft = me.ft
  hitt[1].health = me.health
  hitt[1].invince = me.invince
  hitt[1].dodge = me.dodge
  hitt[2].x = you.x+5
  hitt[2].y = you.y+5
  hitt[2].j = you.j
  hitt[2].v = you.v
  hitt[2].flinch = you.flinch
  hitt[2].ft = you.ft
  hitt[2].health = you.health
  hitt[2].invince = you.invince
  hitt[2].dodge = you.dodge
  if not me.block then
    hitt[1].block = 0
  else
    hitt[1].block = me.lr
  end
  if not you.block then
    hitt[2].block = 0
  else
    hitt[2].block = you.lr
  end
  for i,v in ipairs(hitt) do
    if theid ~= i and hexcheck(objx, objy, objx2, objy2, v.x, v.y, v.width, v.height, v.v, v.j)
   then
      flash = true
      
      if not (v.dodge and dodgeable) then
          v.dodge = false
        
      if force then
        v.v = vee
        v.j = jay
      else
        --push, not force
        v.v = v.v +  vee
        v.j = v.j + jay
      end
      v.x = v.x + xjump
      v.y = v.y - yjump
      if(not ((v.block~=dir) and blockable)) then
        v.flinch = flinching
        v.ft = v.ft + efftee
        v.health = v.health - dam
      end
    end
  end
end

me.x = hitt[1].x-5
me.y = hitt[1].y-5
me.j = hitt[1].j
me.v = hitt[1].v
me.flinch = hitt[1].flinch
me.ft = hitt[1].ft
me.health = hitt[1].health
me.dodge = hitt[1].dodge


you.x = hitt[2].x-5
you.y = hitt[2].y-5
you.j = hitt[2].j
you.v = hitt[2].v
you.flinch = hitt[2].flinch
you.ft = hitt[2].ft
you.health = hitt[2].health
you.dodge = hitt[2].dodge



end


function hboxc(P1, P2, P3, P4, blockable, dir, dodgeable, force, vee, jay, dam, flinching, efftee, xjump, yjump, misc1, misc2, theid)
  hitt[1].x = me.x+5
  hitt[1].y = me.y+5
  hitt[1].j = me.j
  hitt[1].v = me.v
  hitt[1].flinch = me.flinch
  hitt[1].ft = me.ft
  hitt[1].health = me.health
  hitt[1].invince = you.invince
  hitt[2].x = you.x+5
  hitt[2].y = you.y+5
  hitt[2].j = you.j
  hitt[2].v = you.v
  hitt[2].flinch = you.flinch
  hitt[2].ft = you.ft
  hitt[2].health = you.health
  hitt[2].invince = you.invince
  if not me.block then
    hitt[1].block = 0
  else
    hitt[1].block = me.lr
  end
  if not you.block then
    hitt[2].block = 0
  else
    hitt[2].block = you.lr
  end
  for i,v in ipairs(hitt) do
    if theid ~= i and 
    (hexcheck(P1.x, P1.y, P2.x, P2.y, v.x, v.y, v.width, v.height, v.v, v.j) 
      or hexcheck(P2.x, P2.y, P3.x, P3.y, v.x, v.y, v.width, v.height, v.v, v.j)
      or hexcheck(P3.x, P3.y, P4.x, P4.y, v.x, v.y, v.width, v.height, v.v, v.j)
      or hexcheck(P4.x, P4.y, P1.x, P1.y, v.x, v.y, v.width, v.height, v.v, v.j)
      or boxCheck({x = v.x, y = v.y}, P1, P2, P3, P4)
      )
   then
      --flash = true
      
      if not (dodgeable and v.dodge) then
      if force then
        v.v = vee
        v.j = jay
      else
        --push, not force
        v.v = v.v +  vee
        v.j = v.j + jay
      end
      v.x = v.x + xjump
      v.y = v.y - yjump
      if (not ((v.block~=0) and blockable)) then
        v.flinch = flinching
        if v.ft == 0 then 
          v.ft = efftee
          else
        v.ft = v.ft + efftee/5
        end
        v.health = v.health - dam
      end
    end
  end
end

me.x = hitt[1].x-5
me.y = hitt[1].y-5
me.j = hitt[1].j
me.v = hitt[1].v
me.flinch = hitt[1].flinch
me.ft = hitt[1].ft
me.health = hitt[1].health


you.x = hitt[2].x-5
you.y = hitt[2].y-5
you.j = hitt[2].j
you.v = hitt[2].v
you.flinch = hitt[2].flinch
you.ft = hitt[2].ft
you.health = hitt[2].health


end