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




function boxcheck(x,y,bx,by,bx2,by2)
  if(x < math.max(bx,bx2) and x > math.min(bx,bx2) 
    and y < math.max(by,by2) and y > math.min(by,by2))
  then return true
  end
end




function hexcheck(mx1, my1, mx2, my2, ex, why, w, h, v, j)
  local c1 = {x = ex, y=why}
  local c2 = {x = ex+w, y=why}
  local c3 = {x = ex+w, y=why+h}
  local c4 = {x = ex, y=why+h}
  
  local nc1 = {x = ex+v, y=why-j}
  local nc2 = {x = ex+w+v, y=why-j}
  local nc3 = {x = ex+w+v, y=why+h-j}
  local nc4 = {x = ex+v, y=why+h-j}
  
  
  
  
  
  if v > 0 then
    
    if findIntersect(mx1,my1,mx2,my2,
    c1.x,c1.y,c3.x,c3.y)
    or findIntersect(mx1,my1,mx2,my2,
    nc4.x,nc4.y,nc2.x,nc2.y) 
    then return true
    end
    
    
    if j < 0 then
  
      if findIntersect(mx1,my1,mx2,my2,
      nc1.x,nc1.y,nc2.x,nc2.y)
      or findIntersect(mx1,my1,mx2,my2,
      c3.x,c3.y,c4.x,c4.y)
    
      or findIntersect(mx1,my1,mx2,my2,
      nc2.x,nc2.y,c2.x,c2.y)
      or findIntersect(mx1,my1,mx2,my2,
      nc3.x,nc3.y,c3.x,c3.y)
      then return true
      end
    
       if (sideofline(nc1.x,nc1.y,c1.x,c1.y,mx1,my1) ~= 
        sideofline(nc4.x,nc4.y,c4.x,c4.y,mx1,my1)) and 
      (sideofline(nc1.x,nc1.y,nc2.x,nc2.y,mx1,my1) ~= 
        sideofline(c3.x,c3.y,c4.x,c4.y,mx1,my1)) and
      (sideofline(c1.x,c1.y,c3.x,c3.y,mx1,my1) ~= 
        sideofline(nc2.x,nc2.y,nc4.x,nc4.y,mx1,my1)) then
        return true
      end
    
    elseif j > 0 then
      
        if findIntersect(mx1,my1,mx2,my2,
        nc3.x,nc3.y,nc4.x,nc4.y)
        or findIntersect(mx1,my1,mx2,my2,
        c1.x,c1.y,c2.x,c2.y)
      
        or findIntersect(mx1,my1,mx2,my2,
        nc1.x,nc1.y,c1.x,c1.y)
        or findIntersect(mx1,my1,mx2,my2,
        nc4.x,nc4.y,c4.x,c4.y)
        then return true
        end
    
  
 
      
      
      if (sideofline(nc2.x,nc2.y,c2.x,c2.y,mx1,my1) ~= 
        sideofline(nc3.x,nc3.y,c3.x,c3.y,mx1,my1)) and 
      (sideofline(c1.x,c1.y,c2.x,c2.y,mx1,my1) ~= 
        sideofline(nc3.x,nc3.y,nc4.x,nc4.y,mx1,my1)) and
      (sideofline(c1.x,c1.y,c3.x,c3.y,mx1,my1) ~= 
        sideofline(nc2.x,nc2.y,nc4.x,nc4.y,mx1,my1)) then
        return true
      end
    
    
  end
  return false
    

    
    
    
    
    
    
    
  elseif v < 0 then
      
    if findIntersect(mx1,my1,mx2,my2,
    nc1.x,nc1.y,nc3.x,nc3.y)
    or findIntersect(mx1,my1,mx2,my2,
    c4.x,c4.y,c2.x,c2.y) 
    then return true
    end
  
    if j < 0 then
  
      if findIntersect(mx1,my1,mx2,my2,
      nc1.x,nc1.y,nc2.x,nc2.y)
      or findIntersect(mx1,my1,mx2,my2,
      c3.x,c3.y,c4.x,c4.y)
    
      or findIntersect(mx1,my1,mx2,my2,
      nc2.x,nc2.y,c2.x,c2.y)
      or findIntersect(mx1,my1,mx2,my2,
      nc3.x,nc3.y,c3.x,c3.y)
      then return true
      end
    --[[
      if (sideofline(nc3.x,nc3.y,c3.x,c3.y,mx1,my1) ~= 
      sideofline(nc2.x,nc2.y,c2.x,c2.y,mx1,my1)) and 
    (sideofline(nc1.x,nc1.y,nc2.x,nc2.y,mx1,my1) ~= 
      sideofline(c3.x,c3.y,c4.x,c4.y,mx1,my1)) and
    (sideofline(nc1.x,nc1.y,nc3.x,nc3.y,mx1,my1) ~= 
      sideofline(c2.x,c2.y,c4.x,c4.y,mx1,my1)) then
      return true
    end
    ]]--
    
    elseif j > 0 then
      
        if findIntersect(mx1,my1,mx2,my2,
        nc3.x,nc3.y,nc4.x,nc4.y)
        or findIntersect(mx1,my1,mx2,my2,
        c1.x,c1.y,c2.x,c2.y)
      
        or findIntersect(mx1,my1,mx2,my2,
        nc1.x,nc1.y,c1.x,c1.y)
        or findIntersect(mx1,my1,mx2,my2,
        nc4.x,nc4.y,c4.x,c4.y)
        then return true
        end
    
  --[[
      if (sideofline(nc1.x,nc1.y,c1.x,c1.y,mx1,my1) ~= 
        sideofline(nc4.x,nc4.y,c4.x,c4.y,mx1,my1)) and 
      (sideofline(nc3.x,nc3.y,nc4.x,nc4.y,mx1,my1) ~= 
        sideofline(c1.x,c1.y,c2.x,c2.y,mx1,my1)) and
      (sideofline(nc1.x,nc1.y,nc3.x,nc3.y,mx1,my1) ~= 
        sideofline(c2.x,c2.y,c4.x,c4.y,mx1,my1)) then
        return true
        end
  ]]--
  
    end
      return false
      
      
      
      
    
    
    
    
  
elseif v == 0 then
  if findIntersect(mx1,my1,mx2,my2,
    ex,math.min(why, why-j),
    ex+w,math.min(why, why-j))
  or findIntersect(mx1,my1,mx2,my2,
    ex,math.max(why+h, why+h-j),
    ex+w,math.max(why+h, why+h-j))
  or findIntersect(mx1,my1,mx2,my2,
    ex+w,math.max(why+h, why+h-j),
    ex+w,math.min(why, why-j))
  or findIntersect(mx1,my1,mx2,my2,
    ex,math.max(why+h, why+h-j),
    ex,math.min(why, why-j))
  
  or boxcheck(mx1, my1, 
      ex, math.min(why,why-j), 
      ex+w, math.max(why+height,why+height-j))
    then return true
  
  
end
return false





elseif j == 0 then

if findIntersect(mx1,my1,mx2,my2,
    math.min(ex,ex+v),why,
    math.max(ex+w,ex+v+w)+w,why)
  or findIntersect(mx1,my1,mx2,my2,
    math.min(ex,ex+v),why+h,
    math.max(ex+w,ex+v+w)+w,why+h)
  or findIntersect(mx1,my1,mx2,my2,
    math.min(ex,ex+v),why,
    math.min(ex,ex+v),why+h)
  or findIntersect(mx1,my1,mx2,my2,
    math.max(ex+w,ex+v+w),why,
    math.max(ex+w,ex+v+w),why+h)
  
  or boxcheck(mx1, my1, 
      math.min(ex, ex+v), why, 
      math.max(ex+width, ex+width+v), why+height)
    then return true


end
return false



end

end



--the big hit check
function hc(objx, objy, objx2, objy2, blockable, dir, dodgable, force, vee, jay, dam, flinching, efftee, xjump, yjump, misc1, misc2, theid)
  hitt[1].x = me.x+5
  hitt[1].y = me.y+5
  hitt[1].j = me.j
  hitt[1].v = me.v
  hitt[1].flinch = me.flinch
  hitt[1].ft = me.ft
  hitt[1].health = me.health
  hitt[2].x = you.x+5
  hitt[2].y = you.y+5
  hitt[2].j = you.j
  hitt[2].v = you.v
  hitt[2].flinch = you.flinch
  hitt[2].ft = you.ft
  hitt[2].health = you.health
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
    if theid ~= v.i and hexcheck(objx, objy, objx2, objy2, v.x, v.y, v.width, v.height, v.v, v.j)
      
    and not v.incince then
      if(not (dodgeable and v.dodge)) then
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
        v.ft = v.ft + efftee
        v.health = v.health - dam
      end
    end
  end
end

me.x = hitt[1].x-5
me.y = hitt[1].y-5
me.y = hitt[1].y
me.j = hitt[1].j
me.v = hitt[1].v
me.flinch = hitt[1].flinch
me.ft = hitt[1].ft
me.health = hitt[1].health
if hitt[1].block ~= 0 then
  me.lr = me.block
end

you.x = hitt[2].x-5
you.y = hitt[2].y-5
you.y = hitt[2].y
you.j = hitt[2].j
you.v = hitt[2].v
you.flinch = hitt[2].flinch
you.ft = hitt[2].ft
you.health = hitt[2].health
if hitt[2].block ~= 0 then
  you.lr = you.block
end

end
