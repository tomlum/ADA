
greena21 = {im=love.graphics.newImage("me/attack/greena21.png"),c=love.graphics.newImage("me/attack/greena21c.png"), xoff = 10}
greena22 = {im=love.graphics.newImage("me/attack/greena22.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena22s = {im=love.graphics.newImage("me/attack/greena22s.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena1s = {im=love.graphics.newImage("me/attack/greena1s.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}
greena1 = {im=love.graphics.newImage("me/attack/greena1.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}

greenk1 = {im=love.graphics.newImage("me/attack/greenk1.png"),c=love.graphics.newImage("me/attack/greenk1c.png"), xoff = 25}
greenk2 = {im=love.graphics.newImage("me/attack/greenk2.png"),c=love.graphics.newImage("me/attack/greenk2c.png"), xoff = 25}

at.g = {}
at.g.p = {}
at.g.p.dam = 4
at.g.p.kb = 2
at.g.p.ft = 10
at.g.p.max = 5



at.g.u = {}
at.g.u.dam = 2
at.g.u.kb = 4
at.g.u.j = 26
at.g.u.ft = 20


at.g.k = {}
at.g.k.dam = 10
at.g.k.ft = 30


me.ggpc = 0
you.ggpc = 0

--transform angle
function tang(ang,xx)
return (-xx.lr*90) + 90-(ang)*xx.lr
end

function gandg(xx)


  if xx.animcounter > 7 then
    xx.stop = true
  end
  if xx.animcounter < 17 and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then

    if (xx.a2 or xx.a3) and not xx.holda then
      xx.animcounter = 1
      xx.combo = xx.combo + 1
      xx.ggpc = 1
      xx.type = 1
    elseif xx.a4 and not xx.holda then
      xx.type = 2
      xx.animcounter = 1
      xx.combo = xx.combo + 1
    elseif xx.a1 and not xx.holda then
      xx.type = 3
      xx.animcounter = 1
      xx.combo = xx.combo + 1
    end

  else

    if xx.type <= 1 then
      if xx.animcounter < 4 then
        xx.im = greena21



      elseif xx.animcounter < 30 then
        xx.im = greena22
        if xx.ggpc>=3 then
          table.insert(xx.trail, 
            {color = xx.color, im = xx.im, lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t = 0;})

        end

        if xx.animcounter == 4 then
          table.insert(xx.bolts, {angle = tang(32,xx), speed = boltspeed, x = xx.mid+(30*xx.lr), y = xx.y+30, t = 0, stuck = false})


          if xx.ggpc ==3 then
            xx.v = xx.v + (xx.lr*17)
          elseif xx.ggpc==4 then
            xx.lr=-xx.lr
            xx.v = xx.v + (xx.lr*22)
          elseif xx.ggpc==5 then
            xx.lr=-xx.lr
            xx.v = xx.v + (xx.lr*19)
          end

          xx.im = greena22s
          repplay(xx.greens)

          hboxcs(xx.id, 
            {x=xx.mid, y = xx.y},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y},
            {x=xx.mid, y = me.y+60},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y+60},
            function(z)

              makeslashsparks(xx.y+30,xx.v+xx.x+xx.lr*(15),-xx.lr*slashsparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

              xx.cancombo = true
              if xx.ggpc == at.g.p.max then
                z.v = xx.lr*at.g.p.kb*3
              else
                z.v = xx.lr*at.g.p.kb
              end

              if not (z.block == -xx.lr) then
                z.health = z.health - at.g.p.dam

                z.flinch = true
                z.ft = at.g.p.ft
                if #joysticks>=xx.id then
                  xx.joystick:setVibration(.7,1)
                end
              end
            end)
        end

        if xx.animcounter >= 4 then 
          combo(xx)
        end

      elseif xx.animcounter >= 30 then
        xx.animcounter = 0
        xx.ggpc = 0
      end



    elseif xx.type == 2 then
      if xx.animcounter < 12 then
        xx.im = kick1
      elseif xx.animcounter < 18 then
        xx.im = kick2
        hboxcs(xx.id, 
          {x=me.mid, y = me.y+31},
          {x=me.mid+me.v-(me.lr*3), y = me.y-56},
          {x=me.mid+(me.lr*51), y = me.y-32},
          {x=me.mid+me.v+(me.lr*22), y = me.y+32},
          function(z)
            xx.cancombo = true
            z.health = z.health - at.bb.k.dam
            z.v = xx.lr*at.bb.k.kb
            z.flinch = true
            z.ft = at.bb.p.ft
            if #joysticks>=xx.id then
              xx.joystick:setVibration(1,1)
            end
            makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

          end)
      elseif xx.animcounter < 43 then
        xx.im = kick3
        if xx.animcounter >= 17 then 
          combo(xx)
        end
      elseif xx.animcounter >= 43 then
        xx.animcounter = 0
        xx.ggpc = 0
      end
    elseif xx.type ==3 then
      if xx.animcounter < 5 then
        xx.im = greena21
      elseif xx.animcounter < 14 then
        xx.im = greena1

        if xx.animcounter >=5 and xx.animcounter < 7 then 
          xx.im = greena1s
        end
        if xx.animcounter == 5 then
          repplay(xx.greens)
          hboxcs(xx.id, 
            {x=me.mid-(me.lr*-33), y = me.y+8},
            {x=me.mid+me.v+(me.lr*3), y = me.y+8},
            {x=me.mid, y = me.y+20},
            {x=me.mid+me.v+(me.lr*17), y = me.y+8},

            function(z)
              xx.cancombo = true
              z.health = z.health - at.g.u.dam
              z.v = at.g.u.kb*xx.lr
              z.j = at.g.u.j
              z.flinch = true
              z.ft = at.g.u.ft
              if #joysticks>=xx.id then
                xx.joystick:setVibration(1,1)
              end
              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)
            end)
        end
      elseif xx.animcounter >= 14 then
        xx.animcounter = 0
        xx.ggpc = 0
      end
    end
  end
end






me.throwcounter = 0


me.boltcombocount = 0
me.throwanimatecounter = 0


you.throwcounter = 0


you.boltcombocount = 0
you.throwanimatecounter = 0

aimwait = 10
me.waittoaim = 0
you.waittoaim = 0

you.bolts = {}
me.bolts = {}







bolt = love.graphics.newImage("me/attack/bolt.png")

function boltdraw(xx)
  for i = #xx.bolts, 1, -1 do
    local v = xx.bolts[i]
    love.graphics.draw(bolt, 
      v.x-(2.5*(math.cos(math.rad(v.angle)))),
      v.y+(2.5*(math.sin(math.rad(v.angle)))), math.rad(180+v.angle))
  end
end

function boltupdate(xx)
  for i = #xx.bolts, 1, -1 do
    local v = xx.bolts[i]
    v.x = v.x+(v.speed * math.cos(math.rad(v.angle)))
    v.y = v.y+(v.speed * math.sin(math.rad(v.angle)))
    hboxcs(xx.id, {x=v.x, y=v.y}, 
      {x=v.x+(v.speed * math.cos(math.rad(v.angle))), y=v.y+(v.speed * math.sin(math.rad(v.angle)))}, {x=v.x, y=v.y}, {x=v.x, y=v.y}, 
      function(p)
        p.v = p.v + (v.speed/6 * math.cos(math.rad(v.angle)))
        p.j = p.j - (v.speed/6 * math.sin(math.rad(v.angle)))
        p.flinch = true
        p.ft = at.g.k.ft
        end)
    
  end
end

function xpint(a,A,b,B)

  s1 = (a.y-A.y)/(a.x-A.x)
  s2 = (b.y-B.y)/(b.x-B.x)

  if A.x == a.x then
    if (b.x < a.x and B.x > a.x) or
    (B.x < a.x and b.x > a.x) then return true
    else return false 
    end
  elseif B.x == b.x then
    if (a.x < b.x and A.x > b.x) or
    (A.x < b.x and a.x > b.x) then return true
    else return false 
    end
  end

  if math.abs(s1 - s2) < .01 then return false
  end

  thepy = ((-s1*s2*a.x)-(s1*s2*b.x)+(s1*b.y)-(s2*a.y))/(s1 - s2)
  thepx = ((thepy-a.y)/s1) + a.x 

  if thepx < math.max(math.max(a.x, A.x), math.max(b.x, B.x))
  and thepx > math.min(math.min(a.x, A.x), math.min(b.x, B.x))
  and thepy < math.max(math.max(a.y, A.y), math.max(b.y, B.y))
  and thepy > math.min(math.min(a.y, A.y), math.min(b.y, B.y))
  then return true
  else return false
  end
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

function pint(p11,p12,p21,p22)
  return findIntersect(p11.x+.2,p11.y+.2,p12.x,p12.y,p21.x+.2,p21.y+.2,p22.x,p22.y,true,true)
end







