
greena21 = {im=love.graphics.newImage("me/attack/greena21.png"),c=love.graphics.newImage("me/attack/greena21c.png"), xoff = 10}
greena22 = {im=love.graphics.newImage("me/attack/greena22.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena22s = {im=love.graphics.newImage("me/attack/greena22s.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena1s = {im=love.graphics.newImage("me/attack/greena1s.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}
greena1 = {im=love.graphics.newImage("me/attack/greena1.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}

greenk1 = {im=love.graphics.newImage("me/attack/greenk1.png"),c=love.graphics.newImage("me/attack/greenk1c.png"), xoff = 40, yoff = 20}
greenk2 = {im=love.graphics.newImage("me/attack/greenk2.png"),c=love.graphics.newImage("me/attack/greenk2c.png"), xoff = 30, yoff = 20}


me.greenkhit = false
you.greenkhit = false

at.g = {}
at.g.p = {}
at.g.p.dam = 4
at.g.p.kb = 2
at.g.p.ft = 10
at.g.p.max = 4



at.g.u = {}
at.g.u.dam = 2
at.g.u.kb = 4
at.g.u.j = 26
at.g.u.ft = 20


at.g.k = {}
at.g.k.dam = 10
at.g.k.angle = 0
at.g.k.ft = 30

greendissolvetime = 400
me.greenhit = false
you.greenhit = false


me.repcounter = 0
you.repcounter = 0

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
      xx.repcounter = 1
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



      elseif xx.animcounter < 40 then
        xx.im = greena22
        if xx.repcounter>=1 then
          table.insert(xx.trail, 
            {color = xx.color, im = xx.im, lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t = 0;})

        end

        if xx.animcounter == 4 then


          if xx.repcounter ==1 then
            xx.v = xx.v + (xx.lr*17)
          elseif xx.repcounter==2 then
            if rampcanhit then
            xx.lr=-xx.lr end
            xx.v = xx.v + (xx.lr*22)
          elseif xx.repcounter==3 then
            if rampcanhit then
            xx.lr=-xx.lr end
            xx.v = xx.v + (xx.lr*13)
          end

          xx.im = greena22s
          repplay(xx.greens)

          hboxcs(xx.id, 
            {x=xx.mid, y = xx.y},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y-xx.j},
            {x=xx.mid, y = me.y+60},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y+60-xx.j},
            function(z)

              makeslashsparks(xx.y+30,xx.v+xx.x+xx.lr*(15),-xx.lr*slashsparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

              xx.cancombo = true
              if xx.repcounter == at.g.p.max then
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

      elseif xx.animcounter >= 40 then
        xx.animcounter = 0
        xx.repcounter = 0
      end



    elseif xx.type == 2 then
      if xx.animcounter < 10 then
        xx.im = greenk1
        xx.animcounter = 8
        if xx.a1b then
          at.g.k.angle = 90
          xx.animcounter = 9
        elseif xx.a2b or xx.a3b then
          at.g.k.angle = 0
          xx.animcounter = 9
        end
      elseif xx.animcounter < 50 then
        xx.im = greenk2

        if xx.animcounter == 10 then
          repplay(xx.greens)
          if rampcanhit then
           
          table.insert(xx.bolts, {angle = tang(at.g.k.angle,xx), speed = boltspeed, x = xx.mid, y = xx.y+20, t = 0, stuck = false})
          xx.greenhit = false
          end
        elseif xx.animcounter >= 12 and xx.greenhit then 
          xx.cancombo = true
          combo(xx)
        end
      elseif xx.animcounter >= 50 then
        xx.animcounter = 0
        xx.repcounter = 0
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
            {x=xx.mid-(xx.lr*-33), y = xx.y+8},
            {x=xx.mid+xx.v+(xx.lr*3), y = xx.y-40-xx.j},
            {x=xx.mid, y = xx.y+30},
            {x=xx.mid+xx.v+(xx.lr*33), y = xx.y-40-xx.j},

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
        xx.repcounter = 0
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

me.bolttrail = {}
you.bolttrail = {}
bolttraillength = 3
function bolttraildraw(xx)
  for i = #xx.bolttrail, 1, -1 do
    local v = xx.bolttrail[i]
    
    if v.t >= bolttraillength then table.remove(xx.bolttrail, i) else
    v.t = v.t + 1*rampspeed
    love.graphics.setColor(255,255,255,50)--love.graphics.setColor(255,255,255,(255/bolttraillength)*(bolttraillength/xx.bolttrail[i].t))
    love.graphics.draw(bolt, 
      v.x-(2.5*(math.cos(math.rad(v.angle)))),
      v.y+(2.5*(math.sin(math.rad(v.angle)))), math.rad(180+v.angle))
    end
  end
end

function boltupdate(xx)
  for i = #xx.bolts, 1, -1 do
    local v = xx.bolts[i]
      v.t = v.t + 1
      
      
      if v.t >= greendissolvetime then
        table.remove(xx.bolts, i)
        end
    if v.y <= themap.floor+10 or v.stuck then
      table.insert(xx.bolttrail, {angle = v.angle, speed = v.speed, x = v.x, y = v.y, t = 0})
    v.x = v.x+(v.speed * math.cos(math.rad(v.angle)))*rampspeed
    v.y = v.y+(v.speed * math.sin(math.rad(v.angle)))*rampspeed
    else v.stuck = true
    end
    if not v.stuck then hboxcs(xx.id, {x=v.x, y=v.y}, 
      {x=v.x+(v.speed * math.cos(math.rad(v.angle))), y=v.y+(v.speed * math.sin(math.rad(v.angle)))}, {x=v.x, y=v.y}, {x=v.x, y=v.y}, 
      function(p)
        p.v = p.v + (v.speed/2 * math.cos(math.rad(v.angle)))
        p.j = p.j - (v.speed/2 * math.sin(math.rad(v.angle)))
        p.flinch = true
        if (v.speed * math.cos(math.rad(v.angle))) > 0 then p.flinchway = -1 
        else
          p.flinchway = 1
        end
        p.ft = at.g.k.ft
        repplay(xx.greenbreak)
        makeslashsparks(v.y,v.x, (v.speed * math.cos(math.rad(v.angle)))/8,(v.speed * math.sin(math.rad(v.angle)))+5, xx.color.c.r,xx.color.c.g,xx.color.c.b)
        table.remove(xx.bolts, i)
        xx.greenhit = true
      end)
end
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






