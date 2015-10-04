--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person
--DUDE, MAYBE MAKE ALL BLOCKS SHOULD BE INTEGERS
--also remember that flinch dir depends on the object hitting dir not necessarily the lr of the other person




slipoffedges = true

me.hit = false
you.hit = false
--for dis from height to feet in fall anim
wallhangtime = 20
walljumpd = 12


me.oldpy = me.y
you.oldpy = you.y


hexbuffer = 10


players = {}
me.height = 60
you.height = 60
me.width = 30
you.width = 30
me.player = true
you.player = true

table.insert(players, 
  me)

table.insert(players, 
  you)

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

function hexdistan(p1,p2)
  if p_distance(t["c"],p1) > p_distance(t["c"],p2) then return 
    p1
  else 
    return p2
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








  function drawPlayerllhex()
    if drawBoxes then
      for i,v in ipairs(players) do
      --dodgeoffsetx
      dsh = 0
      dsw = 0
      extrah = 0
      if v.im.dodgeh ~= nil then
        dsh = v.im.dodgeh
      end
      if v.im.dodgew ~= nil then
        dsw = v.im.dodgew
      end

      if v.im.extrah ~= nil then
        extrah = -v.im.extrah
      end
      drawhexcheck(v.mid+v.lr*(dsw/2), v.y+(dsh)+hexbuffer/2, v.width+dsw-hexbuffer, v.height-dsh-hexbuffer-extrah, v.v, v.j)
    end

    lg.line(bx1,by1,bx2,by2)
  end
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



function hradial(theid, P1, radius, special)

  for i,xx in ipairs(players) do

    local dis = math.sqrt((xx.y-P1.y)^2 + (xx.mid-P1.x)^2)

    if theid ~= i and
      dis<radius
      then
      special(xx)
    end
  end


  for i,xx in ipairs(hittmon) do
    local dis = math.sqrt((xx.y-P1.y)^2 + (xx.mid-P1.x)^2)

    if theid ~= i and
      dis<radius
      then
      special(xx)
    end
  end



end



--for non lethal things
function hboxcss(theid, P1, P2, P3, P4, special)


  for i,xx in ipairs(players) do
    dsh = 0
    dsw = 0
    extrah = 0
    if xx.im.dodgeh ~= nil then
      dsh = xx.im.dodgeh
    end
    if xx.im.dodgew ~= nil then
      dsw = xx.im.dodgew
    end
    if xx.im.extrah ~= nil then
      extrah = -xx.im.extrah
    end

    if theid ~= i and
      (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j) 
        or hexcheck(P2.x, P2.y, P3.x, P3.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or hexcheck(P3.x, P3.y, P4.x, P4.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or hexcheck(P4.x, P4.y, P1.x, P1.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or boxCheck({x = xx.x, y = xx.y}, P1, P2, P3, P4)
        )
      then
      --flash = true
      special(xx)
    end
  end


  for i,xx in ipairs(hittmon) do
    dsh = 0
    dsw = 0
    extrah = 0
    if xx.im.dodgeh ~= nil then
      dsh = xx.im.dodgeh
    end
    if xx.im.dodgew ~= nil then
      dsw = xx.im.dodgew
    end
    if xx.im.extrah ~= nil then
      extrah = -xx.im.extrah
    end

    if theid ~= i and
      (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j) 
        or hexcheck(P2.x, P2.y, P3.x, P3.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or hexcheck(P3.x, P3.y, P4.x, P4.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or hexcheck(P4.x, P4.y, P1.x, P1.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer, xx.width+dsw-hexbuffer/2, -extrah + xx.height-dsh-hexbuffer/2, xx.v, xx.j)
        or boxCheck({x = xx.x, y = xx.y}, P1, P2, P3, P4)
        )
      then
      --flash = true
      special(xx)
    end
  end



end



function hline(xx, theid, P1, P2, special)
  if xx.player ~= nil then
    for i,xx in ipairs(hittmon) do


      dsh = 0
      dsw = 0
      extrah = 0
      if xx.im.dodgeh ~= nil then
        dsh = xx.im.dodgeh
      end
      if xx.im.dodgew ~= nil then
        dsw = xx.im.dodgew
      end
      if xx.im.extrah ~= nil then
        extrah = -xx.im.extrah
      end

      if (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j))
        then
        special(xx)
        if xx.block then xx.letgoofblock = true end
      end
    end




  end

  for i,xx in ipairs(players) do

    dsh = 0
    dsw = 0
    extrah = 0
    if xx.im.dodgeh ~= nil then
      dsh = xx.im.dodgeh
    end
    if xx.im.dodgew ~= nil then
      dsw = xx.im.dodgew
    end
    if xx.im.extrah ~= nil then
      extrah = -xx.im.extrah
    end

    if 
      (theid==0 or (theid ~= i)) 
      and
      (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
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
          xx.letgoofblock = true end
        end
      end
    end

    for i,box in ipairs(colorboxes) do
      if (hexcheck(P1.x, P1.y, P2.x, P2.y, box.x, box.y, 40*math.abs(box.flip), 60, 0, 0))
        then
        table.remove(colorboxes, i)
        makensparks(box.x,box.y,sparkspeed, sparkspeed, math.random(0),math.random(0),math.random(0),10)
      end

    end

  end


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
      nP1.x = P1.x+xx.im.xoff
      nP2.x = P2.x+xx.im.xoff
      nP3.x = P3.x+xx.im.xoff
      nP4.x = P4.x+xx.im.xoff
    end
    hboxcs(xx, theid, nP1, nP2, nP3, nP4, special)

  end



  function hboxcs(xx, theid, P1, P2, P3, P4, special)

    if xx.player ~= nil then
      for i,xx in ipairs(hittmon) do


        dsh = 0
        dsw = 0
        extrah = 0
        if xx.im.dodgeh ~= nil then
          dsh = xx.im.dodgeh
        end
        if xx.im.dodgew ~= nil then
          dsw = xx.im.dodgew
        end
        if xx.im.extrah ~= nil then
          extrah = -xx.im.extrah
        end

        if not xx.hit and
          (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P2.x, P2.y, P3.x, P3.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P3.x, P3.y, P4.x, P4.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P4.x, P4.y, P1.x, P1.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or boxCheck({x = xx.x, y = xx.y}, P1, P2, P3, P4)
            )
          then
          --flash = true
          special(xx)
          if xx.block then

            if xx.color.n~=nil and xx.color.n==4 then
              makensparks(xx.v+xx.mid,xx.y+30,sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,2)
            end
            xx.letgoofblock = true end

          end
        end




      end

      for i,xx in ipairs(players) do

        dsh = 0
        dsw = 0
        extrah = 0
        if xx.im.dodgeh ~= nil then
          dsh = xx.im.dodgeh
        end
        if xx.im.dodgew ~= nil then
          dsw = xx.im.dodgew
        end
        if xx.im.extrah ~= nil then
          extrah = -xx.im.extrah
        end

        if not xx.hit and (theid==0 or (theid ~= i))  and
          (hexcheck(P1.x, P1.y, P2.x, P2.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P2.x, P2.y, P3.x, P3.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P3.x, P3.y, P4.x, P4.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or hexcheck(P4.x, P4.y, P1.x, P1.y, xx.mid+xx.lr*(dsw/2), xx.y+(dsh)+hexbuffer/2,xx.width+dsw-hexbuffer, xx.height-dsh-hexbuffer-extrah, xx.v, xx.j)
            or boxCheck({x = xx.x, y = xx.y}, P1, P2, P3, P4)
            )
          then
          xx.hit = true

          if xx.counter then 
            xx.counteractivate = true
          else
            --flash = true
            special(xx)
            if xx.block then

              if xx.color.n~=nil and xx.color.n==4 then
                makensparks(xx.v+xx.mid,xx.y+30,sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,5)
              end
              xx.letgoofblock = true end
            end
          end
        end

        for i,box in ipairs(colorboxes) do

          if not xx.hitbox and (hexcheck(P1.x, P1.y, P2.x, P2.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
            or hexcheck(P2.x, P2.y, P3.x, P3.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
            or hexcheck(P3.x, P3.y, P4.x, P4.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
            or hexcheck(P4.x, P4.y, P1.x, P1.y, box.x, box.y-30, 40*math.abs(box.flip), 50, 1, 1)
            or boxCheck({x = box.x, y = box.y}, P1, P2, P3, P4)
            )


          then
          local boxdam = 0
          xx.hitbox = true
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

    function hexplatcheck2(y1, x1, x2, ex, why, w, why2, v)


      midv2 = {x = (ex+w/2)+v, y=why2}
      midv21 = {x = (ex)+v, y=why2}
      midv22 = {x = (ex+w)+v, y=why2}
      midv = {x = ex+w/2+.001, y=why}
      local linep1 = {x = x1, y = y1}
      local linep2 = {x = x2, y = y1}
      if pint(linep1, linep2, midv, midv2)  or 
        pint(linep1, linep2, midv, midv21)  or
        pint(linep1, linep2, midv, midv22) 
        then return true
        else return false
        end

      end



      velforclimb = 20

      function climbplatcheck(ex, why, lr, h, v, j)
        midv2 = {x = (ex)+15*lr, y=why-j}
        midv = {x = (ex)+15*lr, y=why+h-j}


        for j = #themap.plats, 1, -1 do 
          plat = themap.plats[j]
          local linep1 = {x = plat.x1, y = plat.y}
          local linep2 = {x = plat.x2, y = plat.y}
          if (plat.floor==nil) and pint(linep1, linep2, midv, midv2) 
            then return true
          end
        end
        return false

      end

      function linewallcheck(ex, why,v, j)
        midv2 = {x = (ex)+v, y=why-j, n = 2}
        midv = {x = ex, y=why, n = 2}

        if why > 100000 or ex < -10 or ex > 10000  then
          return false
        end

        for j = #themap.walls, 1, -1 do 
          wall = themap.walls[j]
          local linep1 = {x = wall.x, y = wall.y1}
          local linep2 = {x = wall.x, y = wall.y2}
          if pint(linep1, linep2, midv, midv2) 
            then return true
          end
        end
        return false

      end


      function lineplatcheck(ex, why,v, j)
        midv2 = {x = ex+v, y=why-j}
        midv = {x = ex, y=why}

        if why > 100000 or ex < -10 or ex > 10000  then
          return true
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


      function retlineplatcheck(ex, why,v, j)
        midv2 = {x = (ex)+v, y=why-j, n = 2}
        midv = {x = ex, y=why, n = 2}

        if why > 100000 or ex < -10 or ex > 10000  then
          return nil
        end

        for j,plat in ipairs(themap.plats) do 
          local linep1 = {x = plat.x1, y = plat.y}
          local linep2 = {x = plat.x2, y = plat.y}
          if pint(linep1, linep2, midv, midv2) 
            then return plat
          end
        end
        return nil

      end

      me.im = idle1
      you.im = idle2


      function hall(theid, func)
        for i,xx in ipairs(players) do
          if theid ~= i then
            func(xx)
          end
        end

        for i,xx in ipairs(hittmon) do
          if theid ~= i then
            func(xx)
          end
        end

      end








      function hboxwall()
        for i,xx in ipairs(players) do

          dsh = 0
          dsw = 0
          extrah = 0
          if xx.im.dodgeh ~= nil then
            dsh = xx.im.dodgeh
          end
          if xx.im.dodgew ~= nil then
            dsw = xx.im.dodgew
          end
          if xx.im.extrah ~= nil then
            extrah = -xx.im.extrah
          end

          if xx.player~=nil then
            if ( xx.flinch or xx.a1 or xx.a2 or xx.a3 or xx.a4) then xx.wjt = 0 end

            if xx.wjt > 0 then 
              xx.wjt = xx.wjt + 1*ramp(xx)
              --[[
              if xx.wjt > 8 then 
                xx.wjt = 0
                if xx.v >= 0 then xx.lr = 1
                else xx.lr = -1
                end
              else
                ]]--
                if xx.wjt > wallhangtime then 
                  xx.wjt = 0 
                  xx.lr = xx.walllr
                  if #joysticks>=xx.id then
                    xx.jt = walljumpjt
                    xx.j = -xx.jly*walljumpd
                    xx.v = xx.jlx*walljumpd

                  else
                    if xx.up then
                      xx.jt = xx.jt + walljumpjt2
                      xx.j = walljumpvv2
                      xx.v = walljumpv2 *-xx.walllr
                    else
                      xx.jt = xx.jt + walljumpjt
                      xx.j = walljumpvv
                      xx.v = walljumpv *-xx.walllr
                    end
                  end
                else 
                  xx.x = xx.wallx
                  xx.v = 0
                  xx.j = 0
                  xx.im = wallgrab
                  xx.y = xx.initwy
                  xx.lr = xx.walllr


                end
              end
            end


            for j = #themap.walls, 1, -1 do 
              local wall = themap.walls[j]


              if xx.player~=nil and not xx.flinch
                and ((xx.x+xx.v*wall_jump_range < wall.x and xx.x >= wall.x) or (xx.x+xx.width+xx.v*wall_jump_range > wall.x and xx.x+xx.width <= wall.x)) and xx.feet-xx.j >= wall.y1 and xx.y-xx.j <= wall.y2 and 
                ((xx.v < 0 and xx.right) or (xx.v > 0 and xx.left)) and xx.wjt == 0 and math.abs(xx.j) > 0 and not xx.flinch and not xx.busy and xx.animcounter == 0
                then
                if (xx.x+xx.v*wall_jump_range < wall.x and xx.x >= wall.x) then
                  xx.wallside = .01 
                elseif (xx.x+xx.width+xx.v*wall_jump_range > wall.x and xx.x+xx.width <= wall.x) then
                  xx.wallside = -.01 -xx.width
                end

                xx.wjt = 1 
                xx.initwy = xx.y - xx.j
                xx.walllr = -xx.lr
                xx.wallx = wall.x+xx.wallside
                xx.v = 0
              elseif (wall.barrier~=nil) and xx.feet-xx.j > wall.y1 and xx.y-xx.j < wall.y2 and ((xx.x+xx.v < wall.x and xx.x >= wall.x and xx.v < 0) or (xx.x+xx.width+xx.v > wall.x and xx.x+xx.width <= wall.x and xx.v > 0)) and xx.wjt == 0 then
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
              elseif wall.barrier and xx.x < wall.x and xx.x + xx.width > wall.x and (xx.y < wall.y2 and xx.feet > wall.y1) then
                if xx.mid < wall.x or xx.v < 0 then
                  xx.v = lof(xx.v,-2)
                else
                  xx.v = hof(xx.v,2)
                end


              end








              xrubble(xx)



            end


          end


        end


        function retowallcheck(ex, why,vee, jay)
          for j = #themap.walls, 1, -1 do
            local wallace = themap.walls[j]
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





        function hboxp()
          for i,xx in ipairs(players) do
            for j,plat in ipairs(themap.plats) do 

              extrah = 0
              dodgeh = 0
              if xx.im.extrah ~= nil then
                extrah = -xx.im.extrah
              end
              if xx.im.dodgeh ~= nil then
                dodgeh= xx.im.dodgeh
              end



              if xx.im.yoff==nil then
                xx.im.yoff = 0
              end
              if plat.ceiling and xx.y - xx.j < plat.y and xx.y >= plat.y and plat.x1 < xx.mid+xx.width/2 and plat.x2 > xx.mid-xx.width/2  then

                xx.y = plat.y+1
                xx.jt = 0
                xx.j = 0
                break

                elseif xx.gohere == nil and (not xx.gothroughplats or plat.floor~=nil) and (
                  (hexplatcheck2(plat.y, plat.x1, plat.x2, xx.x, xx.oldpy, xx.width, xx.y+xx.height-extrah-xx.j, xx.v) and xx.j <= 0)
                  or 
                  (xx.y == plat.y-xx.height-extrah and xx.x+xx.width+xx.v >= plat.x1 and xx.x+xx.v <= plat.x2 and xx.j==0))
                then



                local goforit = true 
                --[[
                if xx.j ~= 0  then
                  if xx.x < plat.x2 and xx.x+xx.width > plat.x2 then
                    if xx.mid > plat.x2 then
                      xx.x = plat.x2+1
                      goforit = false
                      xx.v = 0
                    else
                      xx.x = plat.x2-xx.width*3/4
                    end
                  elseif xx.x < plat.x1 and xx.x+xx.width > plat.x1 then
                    if xx.mid < plat.x1 then
                      xx.x = plat.x1-xx.width*3/4
                    else
                      xx.x = plat.x1-1
                      goforit = false
                    end
                  end
                end
                ]]--
                
                
                
                if xx.j ~= 0 and xx.player~=nil and goforit then



                  if xx.im.extrah ~= nil then
                    xx.oldpy = xx.y+xx.height-xx.im.extrah
                  else
                    xx.oldpy = xx.y+xx.height
                  end

                  if xx.j < -j_for_landing or math.abs(xx.v) > speedlimit then 
                    xx.landingcounter = xx.landingcounter + landing_wait
                    xx.landing = true 
                    xx.v = xx.v * landing_fric
                  else
                    xx.landingcounter = xx.landingcounter + short_land_wait
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
                if slipoffedges then
                  if xx.x < plat.x2 and xx.mid > plat.x2 then
                    xx.v = hof(xx.v,2)
                  elseif xx.mid < plat.x1 and xx.x+xx.width> plat.x1 then
                    xx.v = lof(xx.v,-2)
                  end
                end



                break
              else
                xx.g = false
                xx.plat = noplat
              end

            end
            if xx.im.extrah ~= nil then
              xx.oldpy = xx.y+xx.height-xx.im.extrah
            else
              xx.oldpy = xx.y+xx.height
            end
          end


          for i,xx in ipairs(hittmon) do
            for j = #themap.plats, 1, -1 do 
              plat = themap.plats[j]

              extrah = 0
              dodgeh = 0
              if xx.im.extrah ~= nil then
                extrah = -xx.im.extrah
              end
              if xx.im.dodgeh ~= nil then
                dodgeh= xx.im.dodgeh
              end



              if xx.im.yoff==nil then
                xx.im.yoff = 0
              end
              if (not xx.gothroughplats or plat.floor~=nil) and (
                (hexplatcheck2(plat.y, plat.x1, plat.x2, xx.x, xx.oldpy, xx.width, xx.y+xx.height-extrah-xx.j, xx.v) and xx.j <= 0)
                or 
                (xx.y == plat.y-xx.height-extrah and xx.x+xx.width/2+xx.v >= plat.x1 and xx.x+xx.width/2+xx.v <= plat.x2 and xx.j==0))
              then

              if xx.j ~= 0 and xx.player~=nil then
                if xx.j < -j_for_landing or math.abs(xx.v) > speedlimit then 
                  xx.landingcounter = xx.landingcounter + landing_wait
                  xx.landing = true 
                  xx.v = xx.v * landing_fric
                else
                  xx.landingcounter = xx.landingcounter + short_land_wait
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
                xx.v = hof(xx.v,2)
              elseif xx.mid < plat.x1 and xx.x+xx.width> plat.x1 then
                xx.v = lof(xx.v,-2)
              end



              break
            else
              xx.g = false
              xx.plat = noplat
            end

          end
          if xx.im.extrah ~= nil then
            xx.oldpy = xx.y+xx.height-xx.im.extrah
          else
            xx.oldpy = xx.y+xx.height-1
          end
        end





      end


