greenspeedlimit = 12
amountstuckinwall = boltspeed - 1
amountstuckinfloor = 45

creaturerate = .95


bolt = lg.newImage("images/player/attack/green/bolt.png")

greena12 = {im=lg.newImage("images/player/attack/green/greena12.png"), xoff = 3,yoff = 6}
greena13 = {im=lg.newImage("images/player/attack/green/greena13.png"), xoff = 3,yoff = 19}
greena14 = {im=lg.newImage("images/player/attack/green/greena14.png"), xoff = 3,yoff = 33}
greena15 = {im=lg.newImage("images/player/attack/green/greena15.png"), xoff = 3,yoff = 42}

greena21 = {im=lg.newImage("images/player/attack/green/greena21.png"), xoff = 20,yoff = -6}
greena22 = {im=lg.newImage("images/player/attack/green/greena22.png"), xoff = 30+3, yoff = -4}

greena22s = {im=lg.newImage("images/player/attack/green/greena22s.png"), xoff = 30+8, yoff = 1}
greencreatures = {im=lg.newImage("images/player/attack/green/greencreatures.png"), xoff = 30+8+8, yoff = 8}
greencreature = {im=lg.newImage("images/player/attack/green/greencreature.png"), xoff = 30+8+8, yoff = 8}


agreena22 = {im=lg.newImage("images/player/attack/green/agreena22.png"), xoff = 20, xoff = 40, yoff = 4}
agreena22s = {im=lg.newImage("images/player/attack/green/agreena22s.png"), xoff = 45, yoff = 2}

agreena1 = {im=lg.newImage("images/player/attack/green/agreena1.png"), xoff = 20, yoff = 0}
agreena1s = {im=lg.newImage("images/player/attack/green/agreena1s.png"), xoff = 20, yoff = 44}

garmfront = lg.newImage("images/player/attack/green/garmfront.png")
garmback = lg.newImage("images/player/attack/green/garmback.png")

agreenk11 = {im=lg.newImage("images/player/attack/green/agreenk11.png"), xoff = 1, yoff = -6}
agreenk12 = {im=lg.newImage("images/player/attack/green/agreenk12.png"), xoff = 1, yoff = -6}
agreenk13 = {im=lg.newImage("images/player/attack/green/agreenk13.png"), xoff = 4, yoff = -6}
greenk11 = {im=lg.newImage("images/player/attack/green/greenk11.png"), xoff = 1, yoff = -6}
greenk12 = {im=lg.newImage("images/player/attack/green/greenk12.png"), xoff = 1, yoff = -6}
greenk13 = {im=lg.newImage("images/player/attack/green/greenk13.png"), xoff = 4, yoff = -6}

greenk1 = {im=lg.newImage("images/player/attack/green/greenk1.png"), xoff = 0, yoff = -6, legs = lg.newImage("images/player/attack/green/greenk1legs.png"), legsy = 36}
greenk2 = {im=lg.newImage("images/player/attack/green/greenk2.png"), xoff = 0, yoff = -2}


agk1 = {im=lg.newImage("images/player/attack/green/agk1.png"), xoff = 2, yoff = -6}


me.greenkhit = false
you.greenkhit = false

at.g = {}
at.g.p = {}
at.g.p.dam = 6
at.g.p.kb = 2
at.g.p.ft = 10
at.g.p.max = 4
at.g.p.z = 2

at.g.u = {}
at.g.u.dam = 5
at.g.u.kb = 4
at.g.u.j = 25
at.g.u.mv = 10
at.g.u.ft = 25
at.g.u.z = 2.5
greena1adj = 10

at.g.au = {}
at.g.au.mj = 15

at.g.k = {}
at.g.k.dam = 2.5
at.g.k.kb = 16
at.g.k.angle = 0
at.g.k.ft = 7
at.g.k.delay = 50
me.greenktimer = 0
you.greenktimer = 0

greendissolvetime = 400
me.greenhit = false
you.greenhit = false


me.repcounter = 0
you.repcounter = 0

me.greenflickertimer = 0
you.greenflickertimer = 0
me.greenflicker = false
you.greenflicker = false


me.gangle = 0
you.gangle = 0
--transform angle
function tang(ang,xx)
  return (-xx.lr*90) + 90-(ang)*xx.lr
end

function gandg(xx)
  xx.greenflickertimer = rollover(xx.greenflickertimer, xx.rampspeed, 16)
  xx.greenflicker = false

  if not xx.using_keyboard then
    if math.sqrt(xx.jry^2+xx.jrx^2) > .1 then
      xx.gangle = math.deg(math.atan(-xx.jry/math.abs(xx.jrx)))
    end
    if xx.gangle > 75 then xx.gangle = 90 
    elseif xx.gangle < 15 and xx.gangle > -15 then
      xx.gangle = 0
    end
  else
    xx.gangle = 0
  end


  if xx.animcounter > 7 then
    xx.stop = true
  end
  if xx.animcounter < 17 and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then

    if xx.g then

      if (xx.a2 or xx.a3) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 1
        rumbleme(xx, .01)
      elseif xx.a4 and not xx.holda and xx.greenktimer == 0 then
        xx.attack_num = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        rumbleme(xx, .01)
      elseif xx.a1 and not xx.holda then
        xx.attack_num = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        rumbleme(xx, .01)
      end

    else

      if (xx.a2 or xx.a3) and not xx.holda then
        xx.animcounter = 1
        xx.attack_num = 4
      elseif xx.a1 and not xx.holda then
        xx.animcounter = 1
        xx.attack_num = 6
      elseif xx.a4 and not xx.holda then
        xx.attack_num = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1

      end
    end
  else

    if xx.attack_num == 1 then
      if xx.animcounter > 16 then
        xx.cmbo=true
      end
      if xx.animcounter < 7 then
        xx.im = greena21
        if math.random() > creaturerate then
          xx.creature = true

          makensparks(xx.mid,xx.y+30,-xx.lr*10, xx.j-3, xx.color.c.r,xx.color.c.g,xx.color.c.b, 7)
        else
          xx.creature = false
        end

      elseif xx.animcounter < 60 then
        if xx.creature and math.abs(xx.v)>6 then 
          xx.im = greencreature
        else
          xx.im = greena22

          if xx.greenflickertimer < 8 and math.abs(xx.v) > 4 then
            xx.greenflicker = true
          end

        end
        if xx.repcounter<=3 and xx.rampcanhit and xx.v~= 0 then
          table.insert(xx.trail, 
            {color = xx.color, im = xx.im, lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t = 2, colornum = 2})

        end

        if xx.animcounter <= 9 then
          if xx.repcounter ==1 and math.abs(xx.v) < greenspeedlimit then
            xx.v = xx.v + (xx.lr*7)*5
            --xx.origgreenlr  = xx.lr
          elseif xx.repcounter==2 and math.abs(xx.v) < greenspeedlimit then
            --xx.lr=-xx.origgreenlr  
            xx.v = math.abs(xx.v)*xx.lr + (xx.lr*5)*5
          elseif xx.repcounter==3 and math.abs(xx.v) < greenspeedlimit then
            --xx.lr=xx.origgreenlr 
            xx.v = math.abs(xx.v)*xx.lr + (xx.lr*4)*5
          elseif xx.repcounter==4 and math.abs(xx.v) < greenspeedlimit then
            --xx.lr=xx.origgreenlr 
            xx.v = math.abs(xx.v)*xx.lr + (xx.lr*3)*5
          end

          if xx.creature then 
            xx.im = greencreatures
          else
            xx.im = greena22s
          end
          repplay(xx.greens)


          rumbleme(xx, .1)

          hexHit(xx, xx.id, 
            {x=xx.mid, y = xx.y},
            {x=xx.mid+xx.v+(xx.lr*67), y = xx.y-xx.j},
            {x=xx.mid+xx.v+(xx.lr*67), y = xx.y+40-xx.j},
            {x=xx.mid, y = me.y+47},
            function(z)

              makenslashsparks(xx.y+30,xx.v+xx.x+xx.lr*(15),-xx.lr*slashsparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,20)

              xx.cancombo = true
              if xx.repcounter == at.g.p.max then
                z.v = xx.lr*at.g.p.kb*3
              else
                z.v = xx.lr*at.g.p.kb
              end

              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.g.p.dam

                z.flinch = true
                z.ft = z.ft+at.g.p.ft
              end
              shakez(at.g.p.z)
              end)

          
          --combo(xx)

        elseif xx.animcounter < 12 then
          xx.v = xx.v/1.2
        end
      elseif xx.animcounter >= 60 then
        xx.animcounter = 0
        xx.repcounter = 0
      end




    elseif xx.attack_num == 2 then


      if xx.animcounter < 4 then
        if xx.g then
          xx.im = greenk11
        else
          xx.im = agreenk11
        end
      elseif xx.animcounter < 7 then
        if xx.g then
          xx.im = greenk12
        else
          xx.im = agreenk12
        end
      elseif xx.animcounter < 12 then
        if xx.g then
          xx.im = greenk13
        else
          xx.im = agreenk13
        end

      elseif xx.animcounter < 14 then
        xx.stop = false
        xx.greenkcondition = true
        if xx.joystick~= nil then
          if xx.joystick:getGamepadAxis("rightx") > 0 then
            xx.lr = 1
          else
            xx.lr = -1
          end
        else
          if xx.runtap then
            if xx.left then xx.lr = -1 
            elseif xx.right then xx.lr = 1
            end
          end
        end
        if xx.g then
          xx.im = greenk1
        else
          xx.im = agk1
        end
        xx.animcounter = 12
        if not xx.holda then
          if (xx.a1b or xx.a2b or xx.a3b or xx.a4b)and not xx.using_keyboard then
            at.g.k.angle = xx.gangle
            xx.animcounter = 14
          elseif xx.a1b then
            at.g.k.angle = 90
            xx.animcounter = 14
          elseif xx.a4b and not xx.g then
            at.g.k.angle = -90
            xx.animcounter = 14
          elseif xx.a2b or xx.a3b or (xx.a4b and xx.g) then
            at.g.k.angle = 0
            xx.animcounter = 14
          elseif xx.color.n ~= 2 then
            xx.animcounter = 0
          end
        end
      elseif xx.animcounter < 50 then
        if xx.v ~= 0 or xx.animcounter <25 then
          xx.im = greenk2
        end


        if xx.animcounter <= 15 then
          repplay(xx.greens)
          if not xx.g then
            xx.v = xx.v-(boltspeed/3 * math.cos(math.rad(at.g.k.angle)))*xx.lr
            xx.j = xx.j-(boltspeed/2 * math.sin(math.rad(at.g.k.angle)))

          else
            xx.v = xx.v-(boltspeed/3 * math.cos(math.rad(at.g.k.angle)))*xx.lr

          end
          if xx.rampcanhit then

            rumbleme(xx, .7)

            table.insert(xx.bolts, {angle = tang(at.g.k.angle,xx), speed = boltspeed, x = xx.mid, y = xx.y+20, t = 0, stuck = false})
            table.insert(xx.bolts, {angle = tang(at.g.k.angle,xx)+1, speed = boltspeed, x = xx.mid, y = xx.y+20, t = 0, stuck = false})
            table.insert(xx.bolts, {angle = tang(at.g.k.angle,xx)-1, speed = boltspeed, x = xx.mid, y = xx.y+20, t = 0, stuck = false})
            xx.greenhit = false
          end
        elseif xx.animcounter >= 15 and xx.greenhit then 
          xx.cancombo = true
          xx.cmbo=true--combo(xx)
        end
      else
        xx.greenktimer = at.g.k.delay
        xx.animcounter = 0
        xx.repcounter = 0
      end

    elseif xx.attack_num == 3 then
      if xx.animcounter < 5+greena1adj then
        xx.im = greena21
      elseif xx.animcounter < 20+greena1adj then
        if xx.animcounter < 8+greena1adj then
          xx.v = xx.v + (xx.lr*5)
        end

        hexHit(xx, xx.id, 
          {x=xx.mid+(xx.lr*18), y = xx.y+16},
          {x=xx.mid+xx.v+(xx.lr*54), y = xx.y-6-xx.j},
          {x=xx.mid+xx.v+(xx.lr*19), y = xx.y-42-xx.j},
          {x=xx.mid+(xx.lr*9), y = xx.y-4},

          function(z)
            xx.cancombo = true
            shakez(at.g.u.z)
            z.health = z.health - at.g.u.dam
            z.v = at.g.u.kb*xx.lr
            z.j = at.g.u.j
            z.flinch = true
            z.ft = z.ft+at.g.u.ft

            end)

        if xx.animcounter < 7-2+greena1adj then
          xx.im = greena21
          repplay(xx.greens)
        elseif xx.animcounter < 7+greena1adj then
          xx.im = greena12
        elseif xx.animcounter < 11-2+greena1adj then
          xx.im = greena21
          repplay(xx.greens)
        elseif xx.animcounter < 11+greena1adj then
          xx.im = greena13
        elseif xx.animcounter < 15-2+greena1adj then
          xx.im = greena21
          repplay(xx.greens)
        elseif xx.animcounter < 15+greena1adj then
          xx.im = greena14
        elseif xx.animcounter < 20-2+greena1adj then
          xx.im = greena21
          repplay(xx.greens)
        elseif xx.animcounter < 20+greena1adj then
          xx.im = greena15
        end
        if xx.greenflickertimer < 8 and math.abs(xx.v) > 4 and xx.animcounter < 20+greena1adj then
          xx.greenflicker = true
        end
        if xx.rampcanhit then
          table.insert(xx.trail, 
            {color = xx.color, im = xx.im, lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t =2, colornum = 2})
        end

      elseif xx.animcounter >= 14+greena1adj then
        xx.animcounter = 0
        xx.repcounter = 0
      end

    elseif xx.attack_num == 4 then
      if xx.animcounter < 3 then
        xx.im = agreena22

      elseif xx.animcounter < 30 then
        xx.im = agreena22
        if xx.greenflickertimer < 8 and math.abs(xx.v) > 4  then
          xx.greenflicker = true
        end
        if xx.rampcanhit then
          table.insert(xx.trail, 
            {color = xx.color, im = xx.im, lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t = 2, colornum = 2})
        end

        if xx.animcounter <= 4 then
          xx.v = xx.v+4*xx.lr*xx.rampspeed

          xx.im = agreena22s
          repplay(xx.greens)

          hexHit(xx, xx.id, 
            {x=xx.mid, y = xx.y},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y-xx.j},
            {x=xx.mid+xx.v+(xx.lr*88), y = xx.y+60-xx.j},
            {x=xx.mid, y = me.y+60},
            function(z)

              makenslashsparks(xx.y+30,xx.v+xx.x+xx.lr*(15),-xx.lr*slashsparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,20)

              xx.cancombo = true
              if xx.repcounter == at.g.p.max then
                z.v = xx.lr*at.g.p.kb*3
              else
                z.v = xx.lr*at.g.p.kb
              end

              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.g.p.dam

                z.flinch = true
                z.ft = z.ft+at.g.p.ft
              end
              end)
        end

      elseif xx.animcounter >= 40 then
        xx.animcounter = 0
      end

    elseif xx.attack_num ==6 then


      if xx.greenflickertimer < 8 and absv(xx.v, xx.j) > 3 and xx.animcounter < 20+greena1adj then
        xx.greenflicker = true
      end

      if xx.animcounter < 3 then
      elseif xx.animcounter < 40 then
        xx.im = agreena1

        if xx.animcounter >=3 and xx.animcounter < 6 then 
          xx.im = agreena1s
        end
        if isabout(xx.animcounter, 5) then
          repplay(xx.greens)
          xx.j = at.g.au.mj
          hexHit(xx, xx.id, 
            {x=xx.mid-(xx.lr*-33), y = xx.y+8},
            {x=xx.mid+xx.v+(xx.lr*3), y = xx.y-40-xx.j},
            {x=xx.mid+xx.v+(xx.lr*33), y = xx.y-40-xx.j},
            {x=xx.mid, y = xx.y+30},

            function(z)
              xx.cancombo = true
              z.health = z.health - at.g.u.dam
              z.v = at.g.u.kb*xx.lr
              z.j = at.g.u.j
              z.flinch = true
              z.ft = z.ft+at.g.u.ft
              end)
        end
      elseif xx.animcounter >= 50 then
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







function boltdraw(xx)
  lg.setColor(thecolors[2].c.r,thecolors[2].c.g,thecolors[2].c.b)
  for i,v in ipairs(xx.bolts) do
    lg.draw(bolt, 
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
      rgbset(thecolors[2].c, (255/bolttraillength)*(bolttraillength/xx.bolttrail[i].t))
      lg.draw(bolt, 
        v.x-(2.5*(math.cos(math.rad(v.angle)))),
        v.y+(2.5*(math.sin(math.rad(v.angle)))), math.rad(180+v.angle))
    end
  end
end

function boltupdate(xx)

  for i,v in ipairs(xx.bolts) do
    if v.removeme~=nil then
      if v.removeme >= 1 then
        table.remove(xx.bolts, i)
      else
        v.removeme = v.removeme + 1
      end
    else

      if v.t >= greendissolvetime then
      table.remove(xx.bolts, i)end
      --[[
      local xnex =  v.x+(v.speed * math.cos(math.rad(v.angle)))*
      local ynex = v.y+(v.speed * math.sin(math.rad(v.angle)))*
      for i = #you.spikes, 1, -1 do 
        local spike1 = you.spikes[i-1] 
        if pint({x = spike1[1], y = spike1[2]}, {x = spike1[3], y = spike1[4]}, {x = v.x, y = v.y}, {x = xnex, y = ynex}) or
          pint({x = spike1[3], y = spike1[4]}, {x = spike1[5], y = spike1[6]}, {x = v.x, y = v.y}, {x = xnex, y = ynex}) or
          pint({x = spike1[5], y = spike1[6]}, {x = spike1[1], y = spike1[2]}, {x = v.x, y = v.y}, {x = xnex, y = ynex})

          then
          makeslashsparks(v.y,v.x, (v.speed * math.cos(math.rad(v.angle)))/8,(v.speed * math.sin(math.rad(v.angle)))+5, xx.color.c.r,xx.color.c.g,xx.color.c.b)
          table.remove(xx.bolts, i)
        end

      end
      ]]--
      for j,k in ipairs(the_map.walls) do 
        if k.barrier then
          if bolts_fly_relative then
            if ((v.x < k.x+amountstuckinwall and v.x+(v.speed * math.cos(math.rad(v.angle)))*ramp(xx) > k.x+amountstuckinwall and v.x > k.x) 
              or 
              (v.x > k.x-amountstuckinwall and v.x+(v.speed * math.cos(math.rad(v.angle)))*ramp(xx) < k.x-amountstuckinwall and v.x < k.x)

              ) and v.y > k.y1 and (k.y2 == nil or v.y < k.y2) then
            v.stuck = true
          end
        else
          if (v.x < k.x+amountstuckinwall and v.x+(v.speed * math.cos(math.rad(v.angle)))*rampspeed > k.x+amountstuckinwall) 
            or 
            (v.x > k.x-amountstuckinwall and v.x+(v.speed * math.cos(math.rad(v.angle)))*rampspeed < k.x-amountstuckinwall) then
            v.stuck = true
          end
        end
      end
    end



    if v.y <= the_map.floor+amountstuckinfloor and not v.stuck then
      table.insert(xx.bolttrail, {angle = v.angle, speed = v.speed, x = v.x, y = v.y, t = 0})
      if bolts_fly_relative then
        v.x = v.x+(v.speed * math.cos(math.rad(v.angle)))*ramp(xx)
        v.y = v.y+(v.speed * math.sin(math.rad(v.angle)))*ramp(xx)

      else
        v.x = v.x+(v.speed * math.cos(math.rad(v.angle)))*rampspeed
        v.y = v.y+(v.speed * math.sin(math.rad(v.angle)))*rampspeed
      end
      else v.stuck = true
      end
      if not v.stuck then 

        hexRadial(xx.id, {x = v.x, y = v.y}, 200, function()
          repplay(xx.whiff)
        end
        )

        hline(xx, xx.id, 
          {x=v.x+(v.speed * math.cos(math.rad(v.angle))), y=v.y+(v.speed * math.sin(math.rad(v.angle)))}, 
          {x=v.x, y=v.y},
          function(p)
            if math.abs(p.v) < at.g.k.kb then
              p.v = p.v + (v.speed/2 * math.cos(math.rad(v.angle)))
            end
            if math.abs(p.j) < at.g.k.kb then
              p.j = p.j - (v.speed/2 * math.sin(math.rad(v.angle)))
            end
            p.flinch = true
            if (v.speed * math.cos(math.rad(v.angle))) > 0 then p.flinchway = -1 
            else
              p.flinchway = 1
            end
            p.ft = at.g.k.ft
            repplay(xx.greenbreak)
            makenslashsparks(v.x, v.y, 
              (v.speed * math.cos(math.rad(v.angle)))/4, 
              (v.speed * math.sin(math.rad(v.angle)))+5,
              green.r, green.g, green.b, 10)
            v.removeme = 0
            xx.greenhit = true
          end
          )
      end
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






