--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person
--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person

hexbuffer = 5

function sideofline(cx1, cy1, cx2, cy2, x,y)
  return ((cx2 - cx1)*(y - cy1) - (cy2 - cy1)*(x - cx1)) > 0;
end


hitt = {}
me.height = 50
you.height = 50
me.width = 20
you.width = 20


table.insert(hitt, 
  {i = 1,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 
    block = 0, dodge = false, invince = false, g = true, lr = me.lr})

table.insert(hitt, 
  {i = 2,
    x = 0, v = 0, 
    j = 0, y = 0, 
    flinch = false, ft = 0, 
    block = 0, dodge = false, invince = false, g = true, lr = you.lr})



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
    --dodgeoffsetx
    dsh = 0
    dsw = 0
    if v.im.dodgeh ~= nil then
      dsh = 20
      end
    if v.im.dodgew ~= nil then
      dsw = 100
      end
    drawhexcheck(v.me.mid+v.me.lr*(dsw/2), v.y+(dsh), v.width+dsw, v.height-dsh, v.v, v.j)
  end

  love.graphics.line(bx1,by1,bx2,by2)
end
function drawhexcheck(ex, why, w, h, v, j)
  t = {["c"] = {x = ex, y = why+h/2},
    [0] = {x = ex-w/2, y=why, n = 0},
    [1] = {x = ex+w/2, y=why, n = 1},
    [2] = {x = ex+w/2, y=why+h, n = 2},
    [3] = {x = ex-w/2, y=why+h, n = 3}}
  d = {
    [0] = {x = ex+v-w/2, y=why-j, n = 0},
    [1] = {x = ex+v+w/2, y=why-j, n = 1},
    [2] = {x = ex+v+w/2, y=why+h-j, n = 2},
    [3] = {x = ex+v-w/2, y=why+h-j, n = 3}}


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





function hboxcs(theid, P1, P2, P3, P4, special)
  hitt[1].x = me.x+5
  hitt[1].y = me.y+5
  hitt[1].j = me.j
  hitt[1].v = me.v
  hitt[1].flinch = me.flinch
  hitt[1].flinchway = me.flinchway
  hitt[1].ft = me.ft
  hitt[1].health = me.health
  hitt[1].invince = me.invince
  hitt[1].g = me.g
  hitt[1].width = me.width
  hitt[1].height = me.height
  hitt[2].x = you.x+5
  hitt[2].y = you.y+5
  hitt[2].j = you.j
  hitt[2].v = you.v
  hitt[2].flinch = you.flinch
  hitt[2].flinchway = you.flinchway
  hitt[2].ft = you.ft
  hitt[2].health = you.health
  hitt[2].invince = you.invince
  hitt[2].g = you.g
  hitt[2].width = you.width
  hitt[2].height = you.height
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

  for i,p in ipairs(hitt) do
    
    if theid ~= i and 
    (hexcheck(P1.x, P1.y, P2.x, P2.y, p.x, p.y, p.width, p.height, p.v, p.j) 
      or hexcheck(P2.x, P2.y, P3.x, P3.y, p.x, p.y, p.width, p.height, p.v, p.j)
      or hexcheck(P3.x, P3.y, P4.x, P4.y, p.x, p.y, p.width, p.height, p.v, p.j)
      or hexcheck(P4.x, P4.y, P1.x, P1.y, p.x, p.y, p.width, p.height, p.v, p.j)
      or boxCheck({x = p.x, y = p.y}, P1, P2, P3, P4)
    )
    then
      --flash = true
      if not p.me.dodge and rampcanhit then
      special(p)
      end
    end
  end

  me.x = hitt[1].x-5
  me.y = hitt[1].y-5
  me.j = hitt[1].j
  me.v = hitt[1].v
  me.flinch = hitt[1].flinch
  me.flinchway = hitt[1].flinchway
  me.ft = hitt[1].ft
  me.health = hitt[1].health
  me.g = hitt[1].g


  you.x = hitt[2].x-5
  you.y = hitt[2].y-5
  you.j = hitt[2].j
  you.v = hitt[2].v
  you.flinch = hitt[2].flinch
  you.flinchway = hitt[2].flinchway
  you.ft = hitt[2].ft
  you.health = hitt[2].health
  you.ft = hitt[2].ft


end




function hexplatcheck(y1, x1, x2, ex, why, w, h, v, j)
  midv2 = {x = (ex+w/2)+v, y=why+h-j, n = 2}
  midv = {x = ex+w/2, y=why+h, n = 2}
  local linep1 = {x = x1, y = y1}
  local linep2 = {x = x2, y = y1}
  if pint(linep1, linep2, midv, midv2) 
  then return true
  else return false
  end

end

velforclimb = 20

function climbplatcheck(ex, why, lr, h, v, j)
  midv2 = {x = (ex)+15*lr, y=why-j, n = 2}
  midv = {x = (ex)+15*lr, y=why+h-j, n = 2}


  for j = #themap.plats, 1, -1 do 
    plat = themap.plats[j]
    local linep1 = {x = plat.x1, y = plat.y}
    local linep2 = {x = plat.x2, y = plat.y}
    if pint(linep1, linep2, midv, midv2) 
    then return true
    end
  end
  return false

end

function lineplatcheck(ex, why,v, j)
  midv2 = {x = (ex)+v, y=why-j, n = 2}
  midv = {x = ex, y=why, n = 2}

  if why > 100000 or ex < -10 or ex > 10000  then
    return false
  end

  for j = #themap.plats, 1, -1 do 
    plat = themap.plats[j]
    local linep1 = {x = plat.x1, y = plat.y}
    local linep2 = {x = plat.x2, y = plat.y}
    if pint(linep1, linep2, midv, midv2) 
    then return true
    end
  end
  return false

end

me.im = idle1
you.im = idle2

function hboxp()
  hitt[1].x = me.x+hexbuffer
  hitt[1].y = me.y+hexbuffer
  hitt[1].j = me.j
  hitt[1].v = me.v
  hitt[1].flinch = me.flinch
  hitt[1].flinchway = me.flinchway
  hitt[1].ft = me.ft
  hitt[1].health = me.health
  hitt[1].invince = me.invince
  hitt[1].g = me.g
  hitt[1].me = me
  hitt[1].height = me.height
  hitt[1].width = me.width
  hitt[2].x = you.x+hexbuffer
  hitt[2].y = you.y+hexbuffer
  hitt[2].j = you.j
  hitt[2].v = you.v
  hitt[2].flinch = you.flinch
  hitt[2].flinchway = you.flinchway
  hitt[2].ft = you.ft
  hitt[2].health = you.health
  hitt[2].invince = you.invince
  hitt[2].g = you.g
  hitt[2].me = you
  hitt[2].height = you.height
  hitt[2].width = you.width


  hitt[1].im = me.im
  hitt[2].im = you.im

  hitt[1].landingcounter = me.landingcounter
  hitt[1].landing = me.landing
  hitt[1].slowdown = me.slowdown

  hitt[2].landingcounter = you.landingcounter
  hitt[2].landing = you.landing
  hitt[2].slowdown = you.slowdown


  hitt[1].gothroughplats = me.gothroughplats
  hitt[2].gothroughplats = you.gothroughplats



  for i,p in ipairs(hitt) do
    for j = #themap.plats, 1, -1 do 
      plat = themap.plats[j]
      xx = p
      if (not p.gothroughplats or (plat.floor~=nil)) and (
        ((hexplatcheck(plat.y, plat.x1, plat.x2, p.x, p.y, p.width, p.height+hexbuffer, p.v, p.j) and p.j <= 0 
            and p.y+p.j <= plat.y-(p.im.im:getHeight())-p.im.yoff+14))
        or 
        (p.y == plat.y-hexbuffer-p.height and p.x+p.width/2+p.v >= plat.x1 and p.x+p.width/2+p.v <= plat.x2 and p.j==0))
      then
        if p.j ~= 0 then
          if xx.j < -jforlanding or math.abs(xx.v) > speedlimit then 
            xx.landingcounter = landingwait
            xx.landing = true 
            xx.v = xx.v * landingfric
          else
            xx.landingcounter = shortlandwait
            xx.landing = true 
            xx.v = xx.v * landingfric
          end
          xx.me.land:play()
          xx.slowdown = false
        end

        p.y = plat.y-hexbuffer-p.height
        p.g = true
        p.j = 0
        p.plat = cur;



        break
      else
        p.g = false
        p.plat = noplat
      end

    end
  end

  me.x = hitt[1].x-hexbuffer
  me.y = hitt[1].y-hexbuffer
  me.j = hitt[1].j
  me.v = hitt[1].v
  me.flinch = hitt[1].flinch
  me.flinchway = hitt[1].flinchway
  me.ft = hitt[1].ft
  me.health = hitt[1].health
  me.g = hitt[1].g
  me.plat = hitt[1].plat


  you.x = hitt[2].x-5
  you.y = hitt[2].y-5
  you.j = hitt[2].j
  you.v = hitt[2].v
  you.flinch = hitt[2].flinch
  you.flinchway = hitt[2].flinchway
  you.ft = hitt[2].ft
  you.health = hitt[2].health
  you.ft = hitt[2].ft
  you.g = hitt[2].g
  you.plat = hitt[2].plat


  me.landingcounter = hitt[1].landingcounter 
  me.landing = hitt[1].landing 
  me.slowdown = hitt[1].slowdown 

  you.landingcounter = hitt[2].landingcounter 
  you.landing = hitt[2].landing 
  you.slowdown = hitt[2].slowdown 



end

