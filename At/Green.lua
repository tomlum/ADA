
greena21 = {im=love.graphics.newImage("me/attack/greena21.png"),c=love.graphics.newImage("me/attack/greena21c.png"), xoff = 10}
greena22 = {im=love.graphics.newImage("me/attack/greena22.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena22s = {im=love.graphics.newImage("me/attack/greena22s.png"),c=love.graphics.newImage("me/attack/greena22c.png"), xoff = 20}
greena1s = {im=love.graphics.newImage("me/attack/greena1s.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}
greena1 = {im=love.graphics.newImage("me/attack/greena1.png"),c=love.graphics.newImage("me/attack/greena1c.png"), xoff = 20, yoff = 60}

at.g = {}
at.g.p = {}
at.g.p.dam = 4
at.g.p.kb = 2
at.g.p.ft = 5
at.g.p.max = 5



at.g.u = {}
at.g.u.dam = 2
at.g.u.kb = 4
at.g.u.j = 26
at.g.u.ft = 20


me.ggpc = 0
you.ggpc = 0


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
            {x=xx.mid+xx.v+(xx.lr*111), y = xx.y},
            {x=xx.mid, y = me.y+60},
            {x=xx.mid+xx.v+(xx.lr*111), y = xx.y+60},
            function(z)
              
              makeslashsparks(xx.y+30,xx.v+xx.x+xx.lr*(15),-xx.lr*slashsparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)
              
              xx.cancombo = true
              z.health = z.health - at.g.p.dam
              if xx.ggpc == at.g.p.max then
                z.v = xx.lr*at.g.p.kb*3
              else
                z.v = xx.lr*at.g.p.kb
              end
              z.flinch = true
              z.ft = at.g.p.ft
              if #joysticks>=xx.id then
                xx.joystick:setVibration(.7,1)
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


function boltsdraw(arr)
  for i,v in ipairs(arr) do

    if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, v.lr* math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
    elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, v.lr * math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
    elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
    elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
    elseif v.s == -202 then love.graphics.draw(sandbolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)



    end


  end
end


function you.bolts.update()



  for i = #you.bolts, 1, -1 do
    local v = you.bolts[i]



    local sangle = v.lr*math.atan(-v.upv/math.abs(v.v))
    local sboltwidth = (80*math.cos(sangle))

    local angle = v.lr*math.atan(-v.upv/math.abs(v.v))
    local boltwidth = (65*math.cos(sangle))
    local spoint = v.x + (sboltwidth *v.lr)
    local point = v.x + (boltwidth *v.lr)
    local ypoint = v.y + (65*math.sin(sangle))*v.lr
    local sypoint = v.y + (80*math.sin(sangle))*v.lr

    if ((v.y - v.upv + 4 >= floor - 60 and point > 1407 and themap == "library")
      or 
      point + v.v > enviro.rightwall-50 or 
      point + v.v < 50)
    and not v.stuckinwall
    then v.stuckinwall = true
      if v.s == -201 then
        you.bgcatch = true
      end
    end


    if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(you.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
    end
    if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(you.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
    end


    if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 and not v.stuckinwall
    then
      v.upv = v.upv - 1

    end


    if v.s == -1 and 
    ghc(spoint, sypoint, spoint + v.v, sypoint -v.upv, true, v.lr, true, true, v.lr*30, 0, pboltdam, 0, 0, 0, 0, you.id)
    then 

    elseif v.s == -202 and v.v ~= 0 and
    ghc(point, ypoint, point+v.v,ypoint-v.upv, true, v.lr, true, false, v.v, sandboltknockup, sandboltdam, gsft, 0, 0, "air", v.id)
    then 
      table.remove(you.bolts, i)


    elseif v.s == -201 and spoint * v.lr < (me.mid) * v.lr and (spoint + v.v) * v.lr +1> (me.mid + me.v) * v.lr
    and not me.dodge
    and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
    then table.remove(you.bolts, i)
      you.bgcatch = true
      me.v = -thev(math.abs(you.x - me.x)) * you.lr
      if not (me.block and v.lr~=me.lr) then
        me.ft = thev(math.abs(you.x - me.x))
        me.flinch = true
      end



    elseif v.s >= 0 and not v.stuckinwall and
    ghc(point, ypoint, point+v.v, ypoint-v.upv, true, v.lr, true, false, v.v/4, 0, boltdamage, 0, 0, 0, 0, you.id)
    then table.remove(you.bolts, i)

    end



    if v.time > boltdespawntime
    then table.remove(you.bolts, i)

    elseif v.x < -100 or v.x > enviro.rightwall + 100
    then table.remove(you.bolts, i)





    elseif v.s == -1 and platformcheck((v.x + (v.lr*sboltwidth)), v.y-v.upv+7, v.upv-2)
    then table.remove(you.bolts, i)

      table.insert(you.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
      table.insert(you.spikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
      table.insert(you.spikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
      table.insert(you.spikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
      table.insert(you.spikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
      table.insert(you.spikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
      table.insert(you.spikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
      table.insert(you.spikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
      table.insert(you.spikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
      table.insert(you.spikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
      table.insert(you.spikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
      table.insert(you.spikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
      table.insert(you.spikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
      table.insert(you.spikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
      table.insert(you.spikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
      table.insert(you.spikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
      table.insert(you.spikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})



      for i, v in ipairs(you.spikes) do





        v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

        if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
        then v.y = - 100
        end
      end



    elseif themap == "library" and v.y - v.upv + 4 >= floor -50	and point + v.v > 1407 and v.lr > 0 then
      v.y = v.y
      v.x = 1407 - 20

      v.s = 0
      v.time = v.time + 1
    elseif point + v.v > enviro.rightwall-50 then
      if v.s == -1 then v.stuckinwall = true end
      v.y = v.y
      if v.x~= enviro.rightwall-80 and (math.min(math.abs(v.x - you.x),math.abs(v.x - me.x)) < 200) then 
        repplay(greenwallbreaks)
      end

      v.x = enviro.rightwall - 80


      if v.s == 1 or v.s == 2 then v.s = 0 end
      v.time = v.time + 1
    elseif point + v.v < 50 then
      if v.s == -1 then v.stuckinwall = true end
      v.y = v.y
      if v.x~= 80 and (math.min(math.abs(v.x - you.x),math.abs(v.x - me.x)) < 200) then
        repplay(greenwallbreaks)
      end
      v.x = 80

      if v.s == 1 or v.s == 2 then v.s = 0 end
      v.time = v.time + 1


    elseif v.y - v.upv + 4 >= floor
    then v.y = floor + (v.upv*.7) 
      v.stuckinwall = true


      v.time = v.time + 1
      if v.s == 1 or v.s == 2 then v.s = 0 end


    elseif v.y - v.upv + 4 >= floor - 60 and point > 1407 and themap == "library"
    then v.y = floor - 60 + (v.upv*.7) 
      if v.s == -1 then v.stuckinwall = true end


      v.time = v.time + 1
      v.s = 0






    else

      v.x = v.x + v.v
      v.time = v.time + 1

      if v.s == -200 or v.s == -201 then
        v.y = v.y
      else 
        v.y = v.y - v.upv
      end
    end


    if v.s >= 0 and distan(me.mid,me.y+30, point,ypoint) < whiffradius and distan(me.mid,me.y+30, point+v.v,ypoint-v.upv) > whiffradius and math.abs(v.v + v.upv) > 2 and not v.stuckinwall  then
      repplay(whiff2)
    end



  end

  if you.gfired and you.throwanimatecounter < pauseforgreen
  then you.throwanimatecounter = you.throwanimatecounter + 1

    if you.j ~= 0
    then
      if you.slowdown
      then
        you.im = airboltslow
      else
        you.im = airbolt
      end
    else
      you.im = boltthrow
    end	

  else you.gfired = false
    you.throwanimatecounter = 0
  end



  if you.throwcounter > 50
  then you.boltcombocount = 0
    you.throwcounter = 0
    you.prime = false
  elseif you.boltcombocount < 3 and you.throwcounter > 30
  then you.boltcombocount = 0
    you.throwcounter = 0

  elseif you.boltcombocount < 3 and you.boltcombocount > 0 then
    you.throwcounter = you.throwcounter + 1
  elseif you.boltcombocount >= 3
  then
    you.throwcounter = you.throwcounter + 1
  end


  if you.gfired and you.throwanimatecounter < pauseforgreen or you.boltchargecounter>=50 or you.im==boltrelease then you.gree=true
  else you.gree = false
  end

  if you.throwanimatecounter == 1 then 
    you.waittoaim = aimwait
  elseif you.waittoaim > 0 then you.waittoaim = you.waittoaim - 1
  end

  if you.gree or you.green or you.waittoaim > 0 then you.stop = true you.jstop = true
  end


end


you.boltchargecounter = 0
you.boltchargehold = 20

function you.bolts.shoot(x)

  if you.landing
  then you.boltchargecounter = 0
  end

  if you.flinch or you.gcancel then
    you.attack = "none"
    you.boltchargehold = 20
    you.boltchargecounter = 0
    you.prime = false
  end

  if you.boltchargehold < 17
  then you.boltchargehold = you.boltchargehold + 1
    you.im = boltrelease
    you.stop = true
    you.busy = true

  elseif (you.attack == "chargebolt" or you.boltchargecounter == greenchargetime) and not x 
  then
    you.stop = true
    you.attack = null
    you.boltchargecounter = 0
    if cg2:isStopped() then
      cg2:play()
    else cg2:rewind()
      cg2:play()
    end
    table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 3, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -3, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 6, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -6, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -12, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 12, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -18, s = 1, v = boltspeed * you.lr + you.v})
    table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 18, s = 1, v = boltspeed * you.lr + you.v})



    you.im = boltrelease
    you.prime = false
    you.boltchargehold = 0
    you.busy = true
  elseif you.boltchargecounter == greenchargetime and you.g and x
  then you.stop = true
    you.attack = "chargebolt"
    you.im = boltcharged
    you.busy = true

  elseif x
  then
    you.prime = true
    you.boltchargecounter = you.boltchargecounter + 1



  elseif you.prime == true and you.boltcombocount < 5 and not you.gfired
  then
    you.prime = false
    table.insert(you.bolts, {x = you.mid  , y = you.y + 24, lr = you.lr, time = 0, upv = yougupv, s = 0, v = yougv * you.lr + you.v})

    if gr2:isStopped() then
      gr2:play()
    else gr2:rewind()
      gr2:play()
    end

    if not you.g then
      table.insert(you.bolts, {x = you.mid +12  * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = yougupv, s = 0, v = yougv * you.lr + you.v})
    end
    you.gfired = true
    you.boltcombocount = you.boltcombocount + 1
    you.throwcounter = 0
    you.boltchargecounter = 0

  else you.prime = false
    you.boltchargecounter = 0
    you.attack = none
  end
end















me.bolts = {}








--table.insert(me.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = onplat(v.y) + math.random(8), lr = v.lr, t = 0, s = 0}))





function me.bolts.update()
  for i = #me.bolts, 1, -1 do
    local v = me.bolts[i]


    local sangle = v.lr*math.atan(-v.upv/math.abs(v.v))
    local sboltwidth = (80*math.cos(sangle))

    local angle = v.lr*math.atan(-v.upv/math.abs(v.v))
    local boltwidth = (65*math.cos(sangle))
    local spoint = v.x + (sboltwidth *v.lr)
    local point = v.x + (boltwidth *v.lr)
    local ypoint = v.y + (65*math.sin(sangle))*v.lr
    local sypoint = v.y + (80*math.sin(sangle))*v.lr


    if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(me.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
    end
    if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(me.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
    end



    if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 and not v.stuckinwall
    then
      v.upv = v.upv - 1

    end


    if v.s == -201 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr +1 > (you.mid + you.v) * v.lr
    and not you.dodge
    and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
    then table.remove(me.bolts, i)
      me.bgcatch = true
      you.v = -thev(math.abs(you.x - me.x)) * me.lr
      if not (you.block and v.lr~=you.lr) then
        you.ft = thev(math.abs(you.x - me.x))
        you.flinch = true
      end


    elseif v.s == -202 and v.v ~= 0 and not you.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j,you.x+30,you.y+60,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j,you.x,you.y+60,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j+60,you.x+30,you.y,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j+60,you.x,you.y,true,true))
    then
      table.remove(me.bolts, i)

      you.v = you.v + v.v
      you.g = false
      you.j = you.j + sandboltknockup

      if not (you.block and v.lr~=you.lr)
      then
        you.health = you.health - sandboltdam
        you.ft = gsft
      end	


    elseif v.s == -1 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr  +1 > (you.mid + you.v) * v.lr
    and not you.dodge
    and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet then
      you.v = you.v + v.lr * 32
      if not (you.block and v.lr~=you.lr)
      then
        you.health = you.health - pboltdam

      end	


    elseif v.s >= 0 and v.v ~= 0 and not you.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j,you.x+30,you.y+60,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j,you.x,you.y+60,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j+60,you.x+30,you.y,true,true)
      or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j+60,you.x,you.y,true,true))
    then table.remove(me.bolts, i)
      you.v = you.v + v.v/3
      you.j = you.j + v.upv/3
      if not (you.block and v.lr~=you.lr)
      then
        you.health = you.health - boltdamage

      end	
    end





    if v.time > boltdespawntime
    then table.remove(me.bolts, i)

    elseif v.x < -100 or v.x > enviro.rightwall + 100
    then table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)
      table.remove(me.bolts, i)





    elseif v.s == -1 and platformcheck((v.x + (v.lr*sboltwidth)), v.y-v.upv+7, v.upv-2)
    then table.remove(me.bolts, i)

      table.insert(me.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
      table.insert(me.spikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
      table.insert(me.spikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
      table.insert(me.spikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
      table.insert(me.spikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
      table.insert(me.spikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
      table.insert(me.spikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
      table.insert(me.spikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
      table.insert(me.spikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
      table.insert(me.spikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
      table.insert(me.spikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
      table.insert(me.spikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
      table.insert(me.spikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
      table.insert(me.spikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
      table.insert(me.spikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
      table.insert(me.spikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
      table.insert(me.spikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})


      for i, v in ipairs(me.spikes) do





        v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

        if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
        then v.y = - 100
        end
      end



















    elseif themap == "library" and v.y - v.upv + 4 >= floor -50	and point + v.v > 1407 and v.lr > 0 then

      v.y = v.y
      v.x = 1407 - 20

      v.s = 0
      v.time = v.time + 1
    elseif point + v.v > enviro.rightwall-50 then
      if v.s == -1 then v.stuckinwall = true end
      v.y = v.y
      if v.x~= enviro.rightwall-80 and (math.min(math.abs(v.x - you.x),math.abs(v.x - me.x)) < 200) then 
        repplay(greenwallbreaks)
      end
      v.x = enviro.rightwall - 80

      if v.s == 1 or v.s == 2 then v.s = 0 end
      v.time = v.time + 1
    elseif point + v.v < 50 then
      if v.s == -1 then v.stuckinwall = true end
      v.y = v.y
      if v.x~= 80 and (math.min(math.abs(v.x - you.x),math.abs(v.x - me.x)) < 200) then 
        repplay(greenwallbreaks)
      end
      v.x = 80


      if v.s == 1 or v.s == 2 then v.s = 0 end
      v.time = v.time + 1


    elseif v.y - v.upv + 4 >= floor
    then v.y = floor + (v.upv*.7)
      v.stuckinwall = true


      v.time = v.time + 1
      if v.s == 1 or v.s == 2 then v.s = 0 end

    elseif v.y - v.upv + 4 >= floor - 60 and point > 1407 and themap == "library"
    then v.y = floor - 60 + (v.upv*.7) 
      v.stuckinwall = true


      v.time = v.time + 1
      v.s = 0




    else
      v.x = v.x + v.v
      v.time = v.time + 1
      if v.s == -200 or v.s == -201 then
        v.y = v.y
      else 
        v.y = v.y - v.upv
      end

    end

    if v.s >= 0 and distan(you.mid,you.y+30, point,ypoint) < whiffradius and distan(you.mid,you.y+30, point+v.v,ypoint-v.upv) > whiffradius and math.abs(v.v + v.upv) > 2 and (v.x < enviro.rightwall - 81 and v.x > 81) then
      repplay(whiff1)
    end


  end

  if me.gfired and me.throwanimatecounter < pauseforgreen
  then 
    me.throwanimatecounter = me.throwanimatecounter + 1

    if me.j ~= 0
    then
      if me.slowdown
      then
        me.im = airboltslow
      else
        me.im = airbolt
      end
    else
      me.im = boltthrow
    end	

  else me.gfired = false
    me.throwanimatecounter = 0
  end




  if me.throwcounter > 50
  then me.boltcombocount = 0
    me.throwcounter = 0
    me.prime = false
  elseif me.boltcombocount < 3 and me.throwcounter > 30
  then me.boltcombocount = 0
    me.throwcounter = 0

  elseif me.boltcombocount < 3 and me.boltcombocount > 0 then
    me.throwcounter = me.throwcounter + 1
  elseif me.boltcombocount >= 3
  then
    me.throwcounter = me.throwcounter + 1
  end

  if me.gfired and me.throwanimatecounter < pauseforgreen or me.boltchargecounter>=50 or me.im==boltrelease then me.gree=true
  else me.gree = false
  end

  if me.throwanimatecounter == 1 then 
    me.waittoaim = aimwait
  elseif me.waittoaim > 0 then me.waittoaim = me.waittoaim - 1
  end

  if me.gree or me.green or me.waittoaim > 0 then me.stop = true me.jstop = true
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







