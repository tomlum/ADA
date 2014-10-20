--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person

hitt = {
  me = {id = 1,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 

    block = 0, dodge = false, invince = false,
    width = 30, height = 60},
  
  you = {id = 1,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 
    
    block = 0, dodge = false, invince = false, 
    width = 30, height = 60}
}

--the big hit check
function hc(objx, objy, ojx2, objy2, blockable, dir, dodgable, force, vee, jay, dam, flinching, efftee, xjump, yjump, misc1, misc2, id)
  hitt.me.x = me.x
  hitt.me.y = me.y
  hitt.me.j = me.j
  hitt.me.v = me.v
  hitt.me.flinch = me.flinch
  hitt.me.ft = me.ft
  hitt.me.health = me.health

  hitt.you.x = you.x
  hitt.you.y = you.y
  hitt.you.j = you.j
  hitt.you.v = you.v
  hitt.you.flinch = you.flinch
  hitt.you.ft = you.ft
  hitt.you.health = you.health

  if not me.block then
    hitt.me.block = 0
  else
    hitt.me.block = me.lr
  end

  if not you.block then
    hitt.you.block = 0
  else
    hitt.you.block = you.lr
  end

  for i,v in ipairs(hitt) do

    if id~=v.id and 
    (findIntersect(objx,objy,objx2,objy2,v.x,v.y,v.x+v.v+v.width,v.y - v.j + v.height,true,true) or
      findIntersect(objx,objy,objx2,objy2,v.x+v.width,v.y+v.height,v.x+v.v,v.y - v.j,true,true)or
      findIntersect(objx,objy,objx2,objy2,v.x,v.y+v.height,v.x+v.v+v.width,v.y - v.j,true,true)or
      findIntersect(objx,objy,objx2,objy2,v.x+v.width,v.y,v.x+v.v,v.y - v.j+v.height,true,true))
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
      if (not (v.block and blockable)) then
        v.flinch = flinching
        v.ft = v.ft + efftee
        v.health = v.health - dam
      end

    end
  end
end

me.x = hitt.me.x
me.y = hitt.me.y
me.y = hitt.me.y
me.j = hitt.me.j
me.v = hitt.me.v
me.flinch = hitt.me.flinch
me.ft = hitt.me.ft
me.health = hitt.me.health
if hitt.me.block ~= 0 then
  me.lr = me.block
end


you.x = hitt.you.x
you.y = hitt.you.y
you.y = hitt.you.y
you.j = hitt.you.j
you.v = hitt.you.v
you.flinch = hitt.you.flinch
you.ft = hitt.you.ft
you.health = hitt.you.health
if hitt.you.block ~= 0 then
  you.lr = you.block
end


end
