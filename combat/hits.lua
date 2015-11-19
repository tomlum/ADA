walljumpdis = 12

hexbuffer = 10

me.height = 60
you.height = 60
me.width = 30
you.width = 30

max_wall_fall = 2.5

--The base hit detection function, based on the hexagon formed from the rectangle 
--surrounding the current player image the and next player image given v and j
function hexHit(xx, theid, P1, P2, P3, P4, special, effectattack)

  --detect hits on monsters
  if xx.is_player ~= nil then
    for i,mon in ipairs(monsters) do
      local dodge_h = 0
      local dodge_w = 0
      local extra_height = 0
      if mon.im.dodge_height ~= nil then
        dodge_h = mon.im.dodge_height
      end
      if mon.im.dodge_width ~= nil then
        dodge_w = mon.im.dodge_width
      end
      if mon.im.extra_height ~= nil then
        extra_height = -mon.im.extra_height
      end

      if not mon.hit and
        (hexCheck(P1.x, P1.y, P2.x, P2.y, mon.mid+mon.lr*(dodge_w/2), mon.y+(dodge_h)+hexbuffer/2,mon.width+dodge_w-hexbuffer, mon.height-dodge_h-hexbuffer-extra_height, mon.v, mon.j)
          or hexCheck(P2.x, P2.y, P3.x, P3.y, mon.mid+mon.lr*(dodge_w/2), mon.y+(dodge_h)+hexbuffer/2,mon.width+dodge_w-hexbuffer, mon.height-dodge_h-hexbuffer-extra_height, mon.v, mon.j)
          or hexCheck(P3.x, P3.y, P4.x, P4.y, mon.mid+mon.lr*(dodge_w/2), mon.y+(dodge_h)+hexbuffer/2,mon.width+dodge_w-hexbuffer, mon.height-dodge_h-hexbuffer-extra_height, mon.v, mon.j)
          or hexCheck(P4.x, P4.y, P1.x, P1.y, mon.mid+mon.lr*(dodge_w/2), mon.y+(dodge_h)+hexbuffer/2,mon.width+dodge_w-hexbuffer, mon.height-dodge_h-hexbuffer-extra_height, mon.v, mon.j)
          or boxCheck({x = mon.x, y = mon.y}, P1, P2, P3, P4)
          )
        then
        special(mon)
      end
    end



  end

  --detect hits on players
  for i,player in ipairs(players) do

    local dodge_h = 0
    local dodge_w = 0
    local extra_height = 0
    if player.im.dodge_height ~= nil then
      dodge_h = player.im.dodge_height
    end
    if player.im.dodge_width ~= nil then
      dodge_w = player.im.dodge_width
    end
    if player.im.extra_height ~= nil then
      extra_height = -player.im.extra_height
    end

    if not player.hit and (theid==0 or (theid ~= i))  and
      (hexCheck(P1.x, P1.y, P2.x, P2.y, player.mid+player.lr*(dodge_w/2), player.y+(dodge_h)+hexbuffer/2,player.width+dodge_w-hexbuffer, player.height-dodge_h-hexbuffer-extra_height, player.v, player.j)
        or hexCheck(P2.x, P2.y, P3.x, P3.y, player.mid+player.lr*(dodge_w/2), player.y+(dodge_h)+hexbuffer/2,player.width+dodge_w-hexbuffer, player.height-dodge_h-hexbuffer-extra_height, player.v, player.j)
        or hexCheck(P3.x, P3.y, P4.x, P4.y, player.mid+player.lr*(dodge_w/2), player.y+(dodge_h)+hexbuffer/2,player.width+dodge_w-hexbuffer, player.height-dodge_h-hexbuffer-extra_height, player.v, player.j)
        or hexCheck(P4.x, P4.y, P1.x, P1.y, player.mid+player.lr*(dodge_w/2), player.y+(dodge_h)+hexbuffer/2,player.width+dodge_w-hexbuffer, player.height-dodge_h-hexbuffer-extra_height, player.v, player.j)
        or boxCheck({x = player.x, y = player.y}, P1, P2, P3, P4)
        )
      then

      if effectattack ~= nil then
        special(player)
      else

        player.hit = true

        if player.counter then 
          player.counteractivate = true
        else

          special(player)

          if player.block then

            if player.color.n~=nil and player.color.n==4 then
              makensparks(player.v+player.mid,player.y+30,sparkspeed, 7, player.color.c.r,player.color.c.g,player.color.c.b,5)
            end

            player.releaseblock = true end
          end
        end
      end
    end

    --detect hits on the color boxes
    for i,box in ipairs(colorboxes) do

      if not xx.hit_a_box and (hexCheck(P1.x, P1.y, P2.x, P2.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
        or hexCheck(P2.x, P2.y, P3.x, P3.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
        or hexCheck(P3.x, P3.y, P4.x, P4.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
        or hexCheck(P4.x, P4.y, P1.x, P1.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
        or boxCheck({x = box.x, y = box.y}, P1, P2, P3, P4)
        )
      then

      local boxdam = 0
      xx.hit_a_box = true
      if xx.id == 1 then
        boxdam = you.health
        special(you)
        boxdam = boxdam - you.health
      elseif xx.id == 2 then
        boxdam = me.health
        special(me)
        boxdam = boxdam - me.health
      end

      makensparks(box.x,box.y,sparkspeed*2, sparkspeed*2, math.random(255),math.random(255),math.random(255),5)

      box.health = box.health - boxdam

      if box.health < 0 then
        local xdis = box.x-xx.mid
        local ydis = box.y-xx.y
        colorboxes = {}
        throwinto()
        for i = 20, 1, -1 do
          makensparks(xx.x+15+xdis,xx.y+ydis,sparkspeed*3, sparkspeed*3, math.random(255),math.random(255),math.random(255),20)
        end
      end
    end

  end


end



--Determines if a point P1 is in a box by the points A, B, C, D
function boxCheck(P1, A, B, C, D)
  local pints = 0
  local P2 = {x = 0, y = 0}
  if(pint(P1, P2, A, B)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, B, C)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, C, D)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, D, A)) then 
    pints = pints + 1
  end
  if pints == 1 then 
    return true
  else 
    return false
  end
end

--Determines if P1 is in the hexagon by the points A, B, C, D, E, F
function inhexcheck(P1, A, B, C, D, E, F)
  local pints = 0
  local P2 = {x = 0, y = 0}
  if(pint(P1, P2, A, B)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, B, C)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, C, D)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, D, E)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, E, F)) then 
    pints = pints + 1
  end
  if(pint(P1, P2, F, A)) then 
    pints = pints + 1
  end
  if pints == 1 then return true
  else 
    return false
  end

end

--used for determining the farther point from the center of a hexagon
function hexDistance(t,p1,p2)
  if p_distance(t["c"],p1) > p_distance(t["c"],p2) then return 
    p1
  else 
    return p2
  end
end

--Determines if a line hits or is in a hexagon derived from the player
function hexCheck(lx1, ly1, lx2, ly2, ex, why, w, h, v, j)
  local t = {["c"] = {x = ex, y = why+h/2},
  [0] = {x = ex-w/2, y=why, n = 0},
  [1] = {x = ex+w/2, y=why, n = 1},
  [2] = {x = ex+w/2, y=why+h, n = 2},
  [3] = {x = ex-w/2, y=why+h, n = 3}}
  local d = {
    [0] = {x = ex+v-w/2, y=why-j, n = 0},
    [1] = {x = ex+v+w/2, y=why-j, n = 1},
    [2] = {x = ex+v+w/2, y=why+h-j, n = 2},
    [3] = {x = ex+v-w/2, y=why+h-j, n = 3}
  }

  l = {[1] = {x = lx1, y = ly1},[2] = {x = lx2, y = ly2}}


  local disn = hexDistance(t, hexDistance(t, d[0], d[1]), hexDistance(t, d[2], d[3])).n
  local adjn1 = (disn+1)%4
  local adjn2 = (disn-1)%4
  local oppn = (disn-2)%4
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
  else 
    return false
  end
end



--Draw the hexHit boxes
function drawHexBoxes()
  for i,v in ipairs(players) do
    --dodgeoffsetx
    local dodge_h = 0
    local dodge_w = 0
    local extra_height = 0
    if v.im.dodge_height ~= nil then
      dodge_h = v.im.dodge_height
    end
    if v.im.dodge_width ~= nil then
      dodge_w = v.im.dodge_width
    end

    if v.im.extra_height ~= nil then
      extra_height = -v.im.extra_height
    end
    drawHexCheck(v.mid+v.lr*(dodge_w/2), v.y+(dodge_h)+hexbuffer/2, v.width+dodge_w-hexbuffer, v.height-dodge_h-hexbuffer-extra_height, v.v, v.j)
  end

  lg.line(bx1,by1,bx2,by2)
end


--draw a single hex box
function drawHexCheck(ex, why, w, h, v, j)
  local t = {["c"] = {x = ex, y = why+h/2},
  [0] = {x = ex-w/2, y=why, n = 0},
  [1] = {x = ex+w/2, y=why, n = 1},
  [2] = {x = ex+w/2, y=why+h, n = 2},
  [3] = {x = ex-w/2, y=why+h, n = 3}}
  local d = {
    [0] = {x = ex+v-w/2, y=why-j, n = 0},
    [1] = {x = ex+v+w/2, y=why-j, n = 1},
    [2] = {x = ex+v+w/2, y=why+h-j, n = 2},
    [3] = {x = ex+v-w/2, y=why+h-j, n = 3}
  }


  local disn = hexDistance(t, hexDistance(t, d[0], d[1]), hexDistance(t, d[2], d[3])).n
  local adjn1 = (disn+1)%4
  local adjn2 = (disn-1)%4
  local oppn = (disn-2)%4
  lg.setColor(255,0,0)
  lg.line(d[disn].x,d[disn].y, d[adjn1].x,d[adjn1].y)
  lg.line(d[disn].x,d[disn].y, d[adjn2].x,d[adjn2].y)
  lg.setColor(255,255,255)
  lg.line(t[adjn1].x,t[adjn1].y, d[adjn1].x,d[adjn1].y)
  lg.line(t[adjn2].x,t[adjn2].y, d[adjn2].x,d[adjn2].y)
  lg.setColor(0,255,0)
  lg.line(t[oppn].x,t[oppn].y, t[adjn1].x,t[adjn1].y)
  lg.line(t[oppn].x,t[oppn].y, t[adjn2].x,t[adjn2].y)

  lg.setColor(255,255,255)


end


--A hex check for a radial 
function hexRadial(theid, P1, radius, special)

  for i,xx in ipairs(players) do

    local dis = math.sqrt((xx.y+xx.height/2-P1.y)^2 + (xx.mid-P1.x)^2)

    if theid ~= i and
      dis<radius
      then
      special(xx)
    end
  end


  for i,xx in ipairs(monsters) do
    local dis = math.sqrt((xx.y+xx.height/2-P1.y)^2 + (xx.mid-P1.x)^2)

    if theid ~= i and
      dis<radius
      then
      special(xx)
    end
  end
end





--determines if a line hits a player's hex
function hline(xx, theid, P1, P2, special)
  if xx.is_player ~= nil then
    for i,xx in ipairs(monsters) do


      local dodge_h = 0
      local dodge_w = 0
      local extra_height = 0
      if xx.im.dodge_height ~= nil then
        dodge_h = xx.im.dodge_height
      end
      if xx.im.dodge_width ~= nil then
        dodge_w = xx.im.dodge_width
      end
      if xx.im.extra_height ~= nil then
        extra_height = -xx.im.extra_height
      end

      if (hexCheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dodge_w/2), xx.y+(dodge_h)+hexbuffer/2,xx.width+dodge_w-hexbuffer, xx.height-dodge_h-hexbuffer-extra_height, xx.v, xx.j))
        then
        special(xx)
        if xx.block then xx.releaseblock = true end
      end
    end
  end

  for i,xx in ipairs(players) do

    local dodge_h = 0
    local dodge_w = 0
    local extra_height = 0
    if xx.im.dodge_height ~= nil then
      dodge_h = xx.im.dodge_height
    end
    if xx.im.dodge_width ~= nil then
      dodge_w = xx.im.dodge_width
    end
    if xx.im.extra_height ~= nil then
      extra_height = -xx.im.extra_height
    end

    if 
      (theid==0 or (theid ~= i)) 
      and
      (hexCheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dodge_w/2), xx.y+(dodge_h)+hexbuffer/2,xx.width+dodge_w-hexbuffer, xx.height-dodge_h-hexbuffer-extra_height, xx.v, xx.j)
        )
      then
      xx.hit = true
      if xx.counter then 
        xx.counteractivate = true
      else
        special(xx)
        if xx.block then 
          if xx.counter and xx.lr * xx.lr < 0 then 
            xx.counteractivate = true
          end
          xx.releaseblock = true 
        end
      end
    end
  end

  for i,box in ipairs(colorboxes) do
    if (hexCheck(P1.x, P1.y, P2.x, P2.y, box.x, box.y, 40*math.abs(box.flip), 60, 0, 0))
      then
      table.remove(colorboxes, i)
      makensparks(box.x,box.y,sparkspeed, sparkspeed, math.random(0),math.random(0),math.random(0),10)
    end

  end
end

--hbox preaccomodating for the offset of an image
function hboxOffset(xx, theid, P1, P2, P3, P4, special)
  local nP1 = clone(P1)
  local nP2 = clone(P2)
  local nP3 = clone(P3)
  local nP4 = clone(P4)
  if xx.im.yoff ~= nil then
    nP1.y = P1.y+xx.im.yoff
    nP2.y = P2.y+xx.im.yoff
    nP3.y = P3.y+xx.im.yoff
    nP4.y = P4.y+xx.im.yoff
  end
  if xx.im.xoff ~= nil then
    nP1.x = P1.x+xx.im.xoff+xx.lr*15
    nP2.x = P2.x+xx.im.xoff+xx.lr*15
    nP3.x = P3.x+xx.im.xoff+xx.lr*15
    nP4.x = P4.x+xx.im.xoff+xx.lr*15
  end
  hexHit(xx, theid, nP1, nP2, nP3, nP4, special)

end



function hexplatcheck2(y1, x1, x2, ex, why, w, why2, v)

  midv21 = {x = (ex)+v, y=why2}
  midv22 = {x = (ex+w)+v, y=why2}
  midv2 = {x = (ex+w/2)+v, y=why2}
  midv = {x = ex+w/2, y=why}
  local linep1 = {x = x1, y = y1}
  local linep2 = {x = x2, y = y1}
  if pint(linep1, linep2, midv, midv2)  or 
    pint(linep1, linep2, midv, midv21)  or
    pint(linep1, linep2, midv, midv22) 
    then 
    return true
  else 
    return false
  end

end



velforclimb = 20

function climbplatcheck(ex, why, lr, h, v, j)
  midv2 = {x = (ex)+15*lr, y=why-j}
  midv = {x = (ex)+15*lr, y=why+h-j}


  for j = #the_map.plats, 1, -1 do 
    plat = the_map.plats[j]
    local linep1 = {x = plat.x1, y = plat.y}
    local linep2 = {x = plat.x2, y = plat.y}
    if (plat.floor==nil) and pint(linep1, linep2, midv, midv2) 
      then return true
    end
  end
  return false

end

function lineWallCheck(ex, why,v, j)
  midv2 = {x = (ex)+v, y=why-j, n = 2}
  midv = {x = ex, y=why, n = 2}

  if why > 100000 or ex < -10 or ex > 10000  then
    return false
  end

  for j = #the_map.walls, 1, -1 do 
    wall = the_map.walls[j]
    local linep1 = {x = wall.x, y = wall.y1}
    local linep2 = {x = wall.x, y = wall.y2}
    if pint(linep1, linep2, midv, midv2) 
      then return true
    end
  end
  return false

end


function linePlatCheck(ex, why,v, j)
  midv2 = {x = ex+v, y=why-j}
  midv = {x = ex, y=why}

  if why > 100000 or ex < -10 or ex > 10000  then
    return true
  end

  for j = #the_map.plats, 1, -1 do 
    plat = the_map.plats[j]
    local linep1 = {x = plat.x1, y = plat.y}
    local linep2 = {x = plat.x2, y = plat.y}
    if pint(linep1, linep2, midv, midv2) 
      then return true
    end
  end
  return false

end


function retlineplatcheck(ex, why,v, j)
  midv2 = {x = (ex)+v, y=why-j, n = 2}
  midv = {x = ex, y=why, n = 2}

  if why > 100000 or ex < -10 or ex > 10000  then
    return nil
  end

  for j,plat in ipairs(the_map.plats) do 
    local linep1 = {x = plat.x1, y = plat.y}
    local linep2 = {x = plat.x2, y = plat.y}
    if pint(linep1, linep2, midv, midv2) 
      then return plat
    end
  end
  return nil

end

--For affecting everyone
function hall(theid, func)
  for i,xx in ipairs(players) do
    if theid ~= i then
      func(xx)
    end
  end

  for i,xx in ipairs(monsters) do
    if theid ~= i then
      func(xx)
    end
  end

end







--Wall detection
function hboxwall()
  for i,xx in ipairs(players) do

    local dodge_h = 0
    local dodge_w = 0
    local extra_height = 0
    if xx.im.dodge_height ~= nil then
      dodge_h = xx.im.dodge_height
    end
    if xx.im.dodge_width ~= nil then
      dodge_w = xx.im.dodge_width
    end
    if xx.im.extra_height ~= nil then
      extra_height = -xx.im.extra_height
    end


    --wall jump/hold mechanics
    if xx.is_player~=nil then
      if not (xx.runb or xx.blockb) or xx.flinch or xx.a1 or xx.a2 or xx.a3 or xx.a4 or xx.g or xx.dodge then 
        xx.wall_grab = false 
      end

      if xx.wall_grab then 
        xx.lr = xx.walllr
        xx.v = 0
        xx.j = math.max(-max_wall_fall,xx.j)
        xx.im = wallgrab
        makendust(xx.mid-14*xx.lr, xx.feet, xx.lr*1, -xx.j,2,1)

        if not xx.wall_grab and ((xx.lr > 0 and xx.right) or (xx.lr < 0 and xx.left)) then 
          xx.wall_grab = false
          xx.jt = walljumpjt
          xx.j = -xx.jly*walljumpdis
          xx.v = xx.jlx*walljumpdis
        elseif xx.wall_grab and (xx.up or xx.down or (xx.lr > 0 and xx.rightb) or (xx.lr < 0 and xx.leftb)) and not ((xx.lr < 0 and xx.rightb) or (xx.lr > 0 and xx.leftb)) then
          xx.wall_grab = false
          if xx.up then
            xx.jt = xx.jt + walljumpjt2
            xx.j = walljumpj2
            xx.v = walljumpv2 *xx.lr
          elseif xx.down then
            xx.jt = xx.jt + walljumpjt2
            xx.j = -walljumpj2*.4
            xx.v = walljumpv2 *xx.lr
          else
            xx.jt = xx.jt + walljumpjt
            xx.j = walljumpj
            xx.v = walljumpv *xx.lr
          end


        end
      end
    end


    for j = #the_map.walls, 1, -1 do 
      local wall = the_map.walls[j]

      --Wall jump check
      if xx.is_player~=nil and not xx.flinch
        and ((xx.x+xx.v < wall.x and xx.x >= wall.x) or (xx.x+xx.width+xx.v > wall.x and xx.x+xx.width <= wall.x)) and xx.feet-xx.j >= wall.y1 and xx.y-xx.j <= wall.y2 and 
        (xx.runb or xx.blockb) and not xx.g and not xx.wall_grab and math.abs(xx.j) > 0 and not xx.flinch and not xx.busy and xx.animcounter == 0
        then
        if (xx.x+xx.v < wall.x and xx.x >= wall.x) then
          xx.wallside = .01 
        elseif (xx.x+xx.width+xx.v > wall.x and xx.x+xx.width <= wall.x) then
          xx.wallside = -.01 -xx.width
        end

        xx.wall_grab = true
        xx.walllr = -xx.lr
        xx.wallx = wall.x+xx.wallside
        xx.v = 0

        --Barrier check/rebound off of barrier
      elseif (wall.barrier~=nil) and xx.feet-xx.j > wall.y1 and xx.y-xx.j < wall.y2 and ((xx.x+xx.v < wall.x and xx.x >= wall.x and xx.v < 0) or (xx.x+xx.width+xx.v > wall.x and xx.x+xx.width <= wall.x and xx.v > 0)) and not xx.wall_grab then
        if (xx.x+xx.v < wall.x and xx.x >= wall.x) then
          xx.wallside = .01 
        else
          xx.wallside = -.01
        end


        if xx.flinch and math.abs(xx.v) > v_for_wall_flinch then 

          xx.health = xx.health - math.abs(xx.v/3)
          xx.v = -xx.v/2
          if xx.g then
            xx.j = math.abs(xx.v)
          else
            xx.j = xx.j - math.abs(xx.v/3)
          end
          makenrubble("vert", xx.mid, xx.feet,xx.v, xx.j/2,20)
          repplay(xx.wallhit)
          xx.g = false
          xx.y = xx.y - 10

        else
          xx.v = 0
        end

      end


    end

    --Generate rubble/glass from wall
    wallRubbleCheck(xx)
    orient(xx)
  end


end


function retOWallCheck(ex, why,vee, jay)
  for j = #the_map.walls, 1, -1 do
    local wallace = the_map.walls[j]
    local res = retpint({x = wallace.x, y = wallace.y1}, {x = wallace.x, y = wallace.y2}, {x = ex, y = why}, {x = ex+vee, y = why-jay})
    if res[2] > 0 then
      if wallace.glasswall~=nil then 
        if (wallace.glasswall > 0 and res[2] < wallace.glasswall) or (wallace.glasswall < 0 and res[2] > -wallace.glasswall) then
          res[3] = true
        end
      end
      return res
    end

  end
  return {0, 0}

end




--The platform detection function
function hexPlat()
  for i,xx in ipairs(players) do
    for j,plat in ipairs(the_map.plats) do 

      local extra_height = 0
      local dodge_height = 0
      if xx.im.extra_height ~= nil then
        extra_height = xx.im.extra_height
      end
      if xx.im.dodge_height ~= nil then
        dodge_height= xx.im.dodge_height
      end
      
      if xx.im.yoff==nil then
        xx.im.yoff = 0
      end
      if plat.ceiling and xx.y - xx.j < plat.y and xx.y >= plat.y and plat.x1 < xx.mid+xx.width/2 and plat.x2 > xx.mid-xx.width/2  then

        xx.y = plat.y
        xx.jt = 0
        xx.j = 0
        break

      elseif xx.go_here == nil and (not xx.gothroughplats or plat.floor~=nil) and (
        (hexplatcheck2(plat.y, plat.x1, plat.x2, xx.x, xx.old_feet, xx.width, xx.y+xx.height+extra_height-xx.j*ramp(xx), xx.v) and xx.j <= 0)
        or 
        (xx.y == plat.y-xx.height and xx.x+xx.width+xx.v >= plat.x1 and xx.x+xx.v <= plat.x2 and xx.j==0))
      then

      if xx.j ~= 0 and xx.is_player~=nil  then

        --xx.old_feet = xx.feet

        if xx.j < -j_for_landing or math.abs(xx.v) > speedlimit then 
          xx.landing_counter = xx.landing_counter + landing_wait
          xx.landing = true 
          xx.v = xx.v * landing_fric
        else
          xx.landing_counter = xx.landing_counter + short_land_wait
          xx.landing = true 
          xx.v = xx.v * landing_fric
        end
        repplay(xx.land)
        makeLandDust(xx.mid, xx.feet, xx.v, math.floor(math.abs(xx.j)/2))
        xx.slowdown = false

      end
      xx.y = plat.y-xx.height--+extra_height

      xx.g = true
      xx.j = 0

      xx.plat = plat;
      if slipoffedges then
        if xx.x < plat.x2 and xx.mid > plat.x2 then
          xx.v = math.max(xx.v,2)
        elseif xx.mid < plat.x1 and xx.x+xx.width > plat.x1 then
          xx.v = math.min(xx.v,-2)
        end
      end

      break

    else
      xx.g = false
      xx.plat = noplat
    end
  end
  if xx.im.extra_height ~= nil then
    xx.old_feet = xx.y+xx.height+xx.im.extra_height
  else
    xx.old_feet = xx.y+xx.height
  end

  xx.gothroughplats = false
end


for i,xx in ipairs(monsters) do
  for j = #the_map.plats, 1, -1 do 
    plat = the_map.plats[j]

    local extra_height = 0
    local dodge_height = 0
    if xx.im.extra_height ~= nil then
      extra_height = -xx.im.extra_height
    end
    if xx.im.dodge_height ~= nil then
      dodge_height= xx.im.dodge_height
    end



    if xx.im.yoff==nil then
      xx.im.yoff = 0
    end
    if (not xx.gothroughplats or plat.floor~=nil) and (
      (hexplatcheck2(plat.y, plat.x1, plat.x2, xx.x, xx.old_feet, xx.width, xx.y+xx.height-extra_height-xx.j, xx.v) and xx.j <= 0)
      or 
      (xx.y == plat.y-xx.height-extra_height and xx.x+xx.width/2+xx.v >= plat.x1 and xx.x+xx.width/2+xx.v <= plat.x2 and xx.j==0))
    then

    if xx.j ~= 0 and xx.is_player~=nil then
      if xx.j < -j_for_landing or math.abs(xx.v) > speedlimit then 
        xx.landing_counter = xx.landing_counter + landing_wait
        xx.landing = true 
        xx.v = xx.v * landing_fric
      else
        xx.landing_counter = xx.landing_counter + short_land_wait
        xx.landing = true 
        xx.v = xx.v * landing_fric
      end
      repplay(xx.land)
      xx.slowdown = false
    end

    xx.y = plat.y-xx.height

    xx.g = true
    xx.j = 0
    xx.plat = plat;

    if xx.x < plat.x2 and xx.mid > plat.x2 then
      xx.v = math.max(xx.v,2)
    elseif xx.mid < plat.x1 and xx.x+xx.width> plat.x1 then
      xx.v = math.min(xx.v,-2)
    end



    break
  else
    xx.g = false
    xx.plat = noplat
  end

end
if xx.im.extra_height ~= nil then
  xx.old_feet = xx.y+xx.height-xx.im.extra_height
else
  xx.old_feet = xx.y+xx.height
end


end
end