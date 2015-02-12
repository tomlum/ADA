--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person
--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person






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


hexbuffer = 10

function sideofline(cx1, cy1, cx2, cy2, x,y)
  return ((cx2 - cx1)*(y - cy1) - (cy2 - cy1)*(x - cx1)) > 0;
end


hitt = {}
me.height = 60
you.height = 60
me.width = 30
you.width = 30

table.insert(hitt, 
  me)

table.insert(hitt, 
  you)


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
      dsh = v.im.dodgeh
    end
    if v.im.dodgew ~= nil then
      dsw = v.im.dodgew
    end
    drawhexcheck(v.mid+v.lr*(dsw/2), v.y+(dsh)+hexbuffer/2, v.width+dsw-hexbuffer, v.height-dsh-hexbuffer, v.v, v.j)
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


  for i,p in ipairs(hitt) do
    dsh = 0
    dsw = 0
    if p.im.dodgeh ~= nil then
      dsh = p.im.dodgeh
    end
    if p.im.dodgew ~= nil then
      dsw = p.im.dodgew
    end

    if theid ~= i and
    (hexcheck(P1.x, P1.y, P2.x, P2.y, p.mid+p.lr*(dsw/2), p.y+(dsh)+hexbuffer, p.width+dsw-hexbuffer/2, p.height-dsh-hexbuffer/2, p.v, p.j) 
      or hexcheck(P2.x, P2.y, P3.x, P3.y, p.mid+p.lr*(dsw/2), p.y+(dsh)+hexbuffer, p.width+dsw-hexbuffer/2, p.height-dsh-hexbuffer/2, p.v, p.j)
      or hexcheck(P3.x, P3.y, P4.x, P4.y, p.mid+p.lr*(dsw/2), p.y+(dsh)+hexbuffer, p.width+dsw-hexbuffer/2, p.height-dsh-hexbuffer/2, p.v, p.j)
      or hexcheck(P4.x, P4.y, P1.x, P1.y, p.mid+p.lr*(dsw/2), p.y+(dsh)+hexbuffer, p.width+dsw-hexbuffer/2, p.height-dsh-hexbuffer/2, p.v, p.j)
      or boxCheck({x = p.x, y = p.y}, P1, P2, P3, P4)
    )
    then
      --flash = true
      special(p)
    end
  end


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


function hall(theid, func)
  for i,p in ipairs(hitt) do
    if theid ~= i then
      func(p)
    end
  end

end

vforwallflinch = 10

function hboxwall()
  for i,p in ipairs(hitt) do 
    for j = #themap.walls, 1, -1 do 
      wall = themap.walls[j]




      if (p.x+p.v < wall.x and p.x >= wall.x)  then
        if p.flinch and math.abs(p.v) > vforwallflinch then 
          p.health = p.health - math.abs(p.v/3)
          p.v = -p.v/2
          if p.g then
            p.j = math.abs(p.v)
          else
            p.j = p.j - math.abs(p.v/3)
          end
          makerubble(p.mid, p.y,p.v, p.j)
          p.flinchway = -p.flinchway
          repplay(p.wallhit)
          p.g = false
          p.y = p.y - 10

        else
          p.x = wall.x+1
          p.v = 0
        end
      elseif (p.x+p.v > wall.x and p.x <= wall.x) then

        if p.flinch and math.abs(p.v) > vforwallflinch  then 
          p.health = p.health - math.abs(p.v/3)
          p.v = -p.v/2
          if p.g then
            p.j = math.abs(p.v)
          else
            p.j = p.j - math.abs(p.v/3)
          end
          makerubble(p.mid, p.y,p.v, p.j)
          p.flinchway = -p.flinchway
          repplay(p.wallhit)
          p.g = false
          p.y = p.y - 10

        else
          p.x = wall.x-1
          p.v = 0
        end


      end
    end


  end

  xx.oldx = xx.x

end

function hboxp()

  for i,p in ipairs(hitt) do
    for j = #themap.plats, 1, -1 do 
      plat = themap.plats[j]
      xx = p


      if p.im.yoff==nil then
        p.im.yoff = 0
      end
      if (not p.gothroughplats or (plat.floor~=nil)) and (
        ((hexplatcheck(plat.y, plat.x1, plat.x2, p.x, p.y, p.width, p.height, p.v, p.j) and p.j <= 0 
            and p.y+p.j <= plat.y-(p.im.im:getHeight())-p.im.yoff+14))
        or 
        (p.y == plat.y-p.height and p.x+p.width/2+p.v >= plat.x1 and p.x+p.width/2+p.v <= plat.x2 and p.j==0))
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
          xx.land:play()
          xx.slowdown = false
        end

        p.y = plat.y-p.height
        p.g = true
        p.j = 0
        p.plat = plat;



        break
      else
        p.g = false
        p.plat = noplat
      end

    end
  end




end

