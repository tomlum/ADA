
--also if hit floor and greatenough time then falls down

--charge blue isn't a big punch, but like a big sword slice where like, big slash
--add groudn flying up fro blue swipes?

--speed + purple = surf on the me.spikes
--JUST THE PERSON KNOCKS THEM THROUGH THE FLOOR for air attack
--TEST MAKE SURE YOU CAN'T USE ATTACKS AT THE SAME TIME, ESPECIALLY IN AIR
--for combo attacks, make sure the solo attacks say "me.a1 and not me.a2-3"
--or something, that might not fix it
--maybe if in close range the green attack pushes you back
--maybe rotate me.bolts so they look better, use trig


-- objects = {}
-- table.insert(objects, {mid = 0, midy = 0, })

-- function updateobjects()
-- objects[1]
-- end


throw = {im=love.graphics.newImage("me/attack/throw.png"),c=love.graphics.newImage("me/attack/throwc.png"), xoff = 9, yoff = 10}
airthrow = {im=love.graphics.newImage("me/attack/airthrow.png"),c=love.graphics.newImage("me/attack/airthrowc.png"), xoff = 10, yoff = 10}

throwft = 40
throwz = .1

me.grabtimer = 0
you.grabtimer = 0
me.grabbingx = nil
you.grabbingx = nil
function grab(xx)


  if xx.type == 8 and xx.animcounter > 0 then 
    xx.busy = true 
    xx.stop = true
  end
  
  if xx.blockb and (xx.a2b or xx.a3b) and xx.animcounter == 0 then
    xx.animcounter = 1
    xx.type = 8
  elseif xx.animcounter > 0 and xx.type == 8 then


    if xx.animcounter < 4 then
    if xx.g then 
      xx.im = punch1
    else
      xx.im = airgrab1
      end
    elseif xx.animcounter < 7 then
    if xx.g then 
      xx.im = punch2
    else
      xx.im = airgrab2
      end
      if xx.animcounter == 4 then
      hboxcs(xx.id, 
        {x=xx.mid, y = xx.y+24},
        {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+26-xx.j},
        {x=xx.mid, y = xx.y+30},
        {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+32-xx.j},
        function(z)
          xx.animcounter = 100
          xx.grabbingx = z
          z.y = xx.y
          z.j = xx.j
          z.v = xx.v

      end)
    end
  elseif xx.animcounter < 20 then 
    if xx.g then 
      xx.im = punch3
    else
      xx.im = airgrab3
      end
    elseif xx.animcounter < 100 then
      xx.animcounter = 0
    elseif xx.animcounter < 130 then
    if xx.g then 
      xx.im = punch2
    else
      xx.im = airgrab2
      end
      xx.grabbingx.ft = 10
      if not xx.holda and (xx.a1 or xx.a2 or xx.a3 or xx.a4) then 
        xx.grabbingx.j =  -xx.jry*30
        xx.grabbingx.v =  xx.jrx*20
        if not xx.g then
          xx.v = -xx.grabbingx.v*.8
          xx.j = -xx.grabbingx.j*.8
        end
        xx.animcounter = 300
        shakez(throwz)
        xx.grabbingx.ft = throwft
        
        if xx.jrx > 0 then
          xx.grabbingx.flinchway = -1
          xx.lr = 1
        else xx.grabbingx.flinchway = 1
          xx.lr = -1
          end
        end
    elseif xx.animcounter <260 then
      xx.animcounter = 0
      xx.v = -xx.lr*5
      xx.grabbingx.ft = 0
    elseif xx.animcounter < 310 then
     if xx.g then
     xx.im = throw
    else
      xx.im = airthrow
      end
    elseif xx.animcounter < 400 then
      xx.animcounter = 0
    end

end
end




simpledodge = true


uppercutpause = 40
me.uppercuttimer = 0
you.uppercuttimer = 0
me.olda1 = false
you.olda1 = false

me.extratimer = 0
you.extratimer = 0
extrastayonthegroundtime = 8
me.uppercuthit = false
you.uppercuthit = false
me.cantreturntothis = 0
you.cantreturntothis = 0


function combo(xx, func)
    xx.hit = false

  if xx.color.n ~= xx.cchangeto.n and xx.cancombo
  then
    if func~= nil then func() end
    xx.actionshot = true
    xx.cancombo = false
  end
  if not xx.holda and xx.currentanim == xx.color.n and xx.combo<xx.maxcombo then

  if xx.g then 
    if xx.im==greenk1 then
      xx.type = 2
      xx.animcounter = 1
      xx.combo = xx.combo + 1


  elseif xx.a2 or xx.a3 then
      xx.numofspikes = 0
      if func~= nil then func() end
      if xx.color.n==0 then
        xx.type = 1
        if xx.repcounter < at.bb.p.max then
          xx.repcounter = xx.repcounter+1
          if xx.repcounter == 1 then xx.combo = xx.combo + 1 end
          xx.animcounter = 1
        end
      elseif xx.color.n==1 and xx.repcounter < at.p.p.max then
        xx.type = 1
        xx.animcounter = 1
        xx.repcounter = xx.repcounter + 1
        if xx.repcounter == 1 then xx.combo = xx.combo + 1 end
      elseif xx.color.n==2 and xx.repcounter < at.g.p.max then
        xx.type = 1
        xx.animcounter = 1
        xx.repcounter = xx.repcounter + 1
        if xx.repcounter == 1 then xx.combo = xx.combo + 1 end
      elseif xx.color.n==3 and xx.repcounter < at.o.p.max then
        xx.type = 1
        xx.animcounter = 1
        xx.repcounter = xx.repcounter + 1
        if xx.repcounter == 1 then xx.combo = xx.combo + 1 end


      end

  elseif xx.a4 and (xx.oldtype ~= 2 or xx.actionshot) then
    
      if func~= nil then func() end
      if xx.color.n==0  then
        xx.combo = xx.combo + 1
        xx.animcounter = 1
        xx.type = 2

      elseif xx.color.n==1 and not xx.hitsomeonewithpurp then
        xx.type = 2
        xx.animcounter = 17
        xx.repcounter = xx.repcounter + 1
        xx.combo = xx.combo + 1
      elseif xx.color.n==2 then
        xx.type = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.color.n==3 then
        xx.type = 2
        xx.animcounter = 7
        xx.combo = xx.combo + 1

      end
    elseif xx.a1 then
      
      xx.numofspikes = 0
      if func~= nil then func() end
      if xx.color.n==0 then
        xx.type = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.color.n==1 then
        xx.type = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.color.n==2 then
        xx.type = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end




end
else
    if xx.a4 then
      if xx.color.n==3 and xx.repcounter < at.o.ak.max then
        xx.animcounter = 1
        xx.type = 5
        xx.combo = xx.combo + 1
        xx.repcounter = xx.repcounter + 1
        if xx.repcounter == 1 then xx.combo = xx.combo + 1 end
        xx.j = 2
        
      end
      
      
    end


  end
  end
end







function nottoomanyuppercuts(xx)

  if xx.type == 3 and xx.cancombo then xx.uppercuthit = true end

  if not xx.g then xx.uppercuttimer = 0 end

  if xx.uppercuttimer > 0 then
    if xx.color.n ~= xx.cchangeto.n and xx.uppercuthit and xx.uppercuttimer > 30
    then
      xx.actionshot = true
      xx.cancombo = false
      xx.uppercuttimer = 0
    end
    xx.uppercuttimer = xx.uppercuttimer-1*rampspeed
    xx.a1 = false
  else xx.uppercuthit = false
  end



  if xx.type==3 then xx.uppercuttimer = uppercutpause end

end


me.currentanim = 0
you.currentanim = 0
me.oldj = 0
you.oldj = 0

me.oldft = 0
you.oldft = 0

function attackmanage(xx)
  
  

  if xx.type < 4 and not xx.g and ((xx.type~=2 and xx.color.n~=2) or (xx.type~=2 and xx.color.n~=3)) then 
    xx.animcounter = 0
  elseif xx.type >= 4 and xx.type < 7 and xx.g then 
    xx.animcounter = 0
    if xx.type == 5 and xx.color.n == 1 then
      xx.purpgroundtimer = -at.p.ak.time
    end
  end

  if xx.type == 7 and xx.color.n == 0 and xx.animcounter > 2 and xx.g then
    xx.animcounter = 0
  end
  
  grab(xx)

  if xx.landing then xx.a1, xx.a2, xx.a3, xx.a4 = false, false, false, false end

  nottoomanyuppercuts(xx)

  --  if xx.flinch then xx.animcounter = 0
  --  end
  if xx.animcounter == 0 then
    xx.hit = false
    xx.repcounter = 0
    xx.currentanim = xx.color.n
  end
  if xx.currentanim == 0 then
    breadandbutter(xx)
  elseif xx.currentanim == 1 then
    pandp(xx)
  elseif xx.currentanim == 2 then
    gandg(xx)
  elseif xx.currentanim == 3 then
    orangeyouglad(xx)
  end



  --  if(math.abs(xx.j) > math.abs(xx.oldj)) then
  --    xx.j = xx.oldj + (xx.j-xx.oldj)*(rampspeed)
  --  end

  --xx.oldj = xx.j
  

end
function postattackmanage(xx)
  if(math.abs(xx.v) > math.abs(xx.oldv)) then
    xx.v = xx.oldv + ((xx.v-xx.oldv)/xx.color.s.weight)*(rampspeed)
  end
  if(math.abs(xx.ft) > math.abs(xx.oldft)) then
    rumbleme(xx,(math.log(xx.ft-xx.oldft)+.5)/5)
    xx.ft = xx.oldft + (xx.ft-xx.oldft)*(rampspeed)*xx.color.s.brittle
  end
  xx.oldft = xx.ft
end


me.shake = false
you.shake = false

me.nododge = false
you.nododge = false



dying ={im = love.graphics.newImage("me/attack/dying.png")}
airdying = {im = love.graphics.newImage("me/attack/airdying.png")}

bolt = love.graphics.newImage("me/attack/bolt.png")

climb = {im=love.graphics.newImage("me/attack/climb.png"),c=love.graphics.newImage("me/attack/climbc.png")}
climb2 = {im=love.graphics.newImage("me/attack/climb2.png"),c=love.graphics.newImage("me/attack/climb2c.png")}
climb3 = {im=love.graphics.newImage("me/attack/climb3.png"),c=love.graphics.newImage("me/attack/climb3c.png")}


flinchim = love.graphics.newImage("me/attack/flinch.png")
flinchc = love.graphics.newImage("me/attack/flinchc.png")
flinch = {im = flinchim, c = flinchc}


fallback = {im=love.graphics.newImage("me/attack/fallback.png"),c=love.graphics.newImage("me/attack/fallbackc.png"),xoff = 12, dodgeh = 32, dodgew = 26}
fallbackbounce = {im=love.graphics.newImage("me/attack/fallbackbounce.png"),c=love.graphics.newImage("me/attack/fallbackbouncec.png"),xoff = 12, dodgeh = 32, dodgew = 26}
fallbackbouncedown = {im=love.graphics.newImage("me/attack/fallbackbouncedown.png"),c=love.graphics.newImage("me/attack/fallbackbouncedownc.png"),xoff = 12, dodgeh = 32, dodgew = 26}
fallforward = {im=love.graphics.newImage("me/attack/fallforward.png"),c=love.graphics.newImage("me/attack/fallforwardc.png")}
fallback1 = {im=love.graphics.newImage("me/attack/fallback1.png"),c=love.graphics.newImage("me/attack/fallback1c.png")}
fallforward1 = {im=love.graphics.newImage("me/attack/fallforward1.png"),c=love.graphics.newImage("me/attack/fallforward1c.png")}
gettingup1 = {im=love.graphics.newImage("me/attack/gettingup1.png"),c=love.graphics.newImage("me/attack/gettingup1c.png")}
gettingup2 = {im=love.graphics.newImage("me/attack/gettingup2.png"),c=love.graphics.newImage("me/attack/gettingup2c.png")}
gettingup11 = {im=love.graphics.newImage("me/attack/gettingup11.png"),c=love.graphics.newImage("me/attack/gettingup11c.png")}

flinchback = {im=love.graphics.newImage("me/attack/flinchback.png"),c=love.graphics.newImage("me/attack/flinchbackc.png")}
blockc = love.graphics.newImage("me/attack/blockc.png")
blockim = love.graphics.newImage("me/attack/block.png")
block = {im = blockim, c = blockc}

dodgeback = {im = love.graphics.newImage("me/attack/dodgeback.png"), c=love.graphics.newImage("me/attack/dodgebackc.png")}
dodgeback2 = {im = love.graphics.newImage("me/attack/dodgeback2.png"), c=love.graphics.newImage("me/attack/dodgeback2c.png")}
dodge = {im=love.graphics.newImage("me/attack/dodge.png"), c=love.graphics.newImage("me/attack/dodgec.png"), dodgeh = 32, dodgew = 10}
dodge2 = {im=love.graphics.newImage("me/attack/dodge2.png"), c=love.graphics.newImage("me/attack/dodge2c.png"), xoff = 12}
dodge21 = {im=love.graphics.newImage("me/attack/dodge21.png"), c=love.graphics.newImage("me/attack/dodge21c.png"), xoff = 12}

invis = {im=love.graphics.newImage("me/attack/invis.png"),c=love.graphics.newImage("me/attack/invis.png")}



you.prevhealth = 0
me.prevhealth = 0



function camshakeflinch()
  yhdif = you.prevhealth-you.health
  mhdif = me.prevhealth-me.health

  if not (me.actionshot or you.actionshot) and not noshake then
    if ((you.shake) and you.x >= me.x)  or shakeboth then 
      camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + yhdif/2)
      camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + yhdif/2)
      if #joysticks>1 then
        you.joystick:setVibration(1,1)
      end
    elseif ((you.shake) and you.x < me.x) then 
      camera.x = camera.x + math.ceil(math.random()) * (shakedis + yhdif/2)
      camera.y = camera.y + math.ceil(math.random()) * (shakedis + yhdif/2)
      if #joysticks>1 then
        you.joystick:setVibration(1,1)
      end
    end

    if ((me.shake) and me.x < you.x) or shakeboth then 
      camera.x = camera.x + math.ceil(math.random()) * (shakedis + mhdif/2)
      camera.y = camera.y + math.ceil(math.random()) * (shakedis + mhdif/2)
      if #joysticks>0 then
        me.joystick:setVibration(1,1)
      end
    elseif ((me.shake) and me.x >= me.x) then 
      camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + mhdif/2)
      camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + mhdif/2)
      if #joysticks>0 then
        me.joystick:setVibration(1,1)
      end


    end
  end

  me.shake = false
  you.shake = false
  shakeboth = false

end

function isanyonedead()

  if me.health <= 0 then 
    me.stop = true
    me.jstop = true
    if not me.g then me.im = airdying
    else
      me.im = dying
    end

  elseif you.health <= 0 then 
    you.stop = true
    you.jstop = true
    if not you.g then you.im = airdying
    else
      you.im = dying

    end
  end
end







me.dodgeanimatetimer = 0


you.dodgedelaycounter = 0
you.dodgecounter = 0
me.dodgedelaycounter = 0
me.dodgecounter = 0
backdodgetime = 20
dodgetime = 23
backdodgetime = 15
turnaroundtime = 20
turndodgedelay = 10
dodgedelay = 20
dodgespeed = speedlimit*1.25
backdodgespeed = speedlimit*1

me.qualifyfordodge = false
you.qualifyfordodge = false


you.dodgeanimatetimer = 0

you.currentdodgev = 0
me.currentdodgev = 0

me.dodgelr = me.lr


--if hold dodge after a point just slide on the ground
dodgerefreshtime = 38
me.dodgerefreshtimer = 0
you.dodgerefreshtimer = 0

newforwarddodge = function(xx)


  if not xx.dodge then xx.dodgelr = xx.lr
    xx.makeslidesound = true end

    if xx.dodgerefreshtimer > 0 then xx.dodgerefreshtimer = xx.dodgerefreshtimer - 1
    end


    if xx.flinch or xx.falling
    then xx.dodgecounter = 0
      xx.dodge = false
      xx.dodgetype = 0
      xx.pause = false
      xx.dodgedelaycounter = 0
      xx.stop = true
      xx.purpgroundtimer = 0
      xx.landingcounter = 0
    end

    if xx.dodgedelaycounter > 0 then 
      xx.dodgedelaycounter = xx.dodgedelaycounter - 1*rampspeed
      xx.stop = true
      xx.dodge = false
      xx.dodgetype = 0
    end


    if xx.dodgecounter > 1 then 
      xx.dodgecounter = xx.dodgecounter-1*rampspeed
      if xx.dodgecounter-1*rampspeed<1 then
        xx.dodgecounter = 1
      end

    elseif xx.dodgecounter == 1 then
      xx.dodgecounter = 0
      if xx.dodgetype == 1 or xx.dodgetype == -1 then 
        xx.dodgedelaycounter = dodgedelay
        xx.dodgerefreshtimer = dodgerefreshtime
      elseif xx.dodgetype == 2 then
        xx.dodgedelaycounter = 2
        xx.dodgerefreshtimer = dodgerefreshtime

      elseif xx.dodgetype == -2 then
        xx.dodgetype = 0
        xx.dodge = false
        xx.dodgerefreshtimer = dodgerefreshtime*1.5
      end
    end


    if xx.dodgetype == -2 then
      xx.im = dodgeback
      xx.v = backdodgespeed * -xx.lr
      xx.dodge = true

    elseif xx.dodgetype == -1 then  
      xx.dodge = true
      xx.im = dodgeback2
      xx.v = backdodgespeed*-xx.lr
      if xx.dodgecounter < 7 and ((xx.left and xx.lr > 0) or (xx.right and xx.lr < 0)) then 
        xx.im = dodgeback
        xx.dodgetype = -2

      end

    elseif xx.dodgetype == 2 then 

      if xx.dodgecounter > turnaroundtime-7 then 
        xx.im = dodge21
        xx.v = xx.v - xx.lr*1
      else xx.im=dodge2
      end
    elseif xx.dodgetype == 1 then
      xx.dodge = true
      xx.im = dodge
      xx.v = xx.currentdodgev/3+(dodgespeed*xx.lr)
      if (xx.dodgelr > 0 and xx.left) or (xx.dodgelr < 0 and xx.right) then
        xx.v = xx.currentdodgev/3-(dodgespeed*xx.lr)
        xx.dodgetype = 2
        xx.dodgecounter = turnaroundtime
        xx.makeslidesound = true
        xx.im = dodge21
      end
    elseif xx.dodgetype == 0 and xx.dodgerefreshtimer == 0 then
      if xx.g and ((xx.lr > 0 and xx.rightb and xx.qualifyfordodge) or (xx.lr < 0 and xx.leftb and xx.qualifyfordodge))  then
        xx.dodgetype = 1
        xx.dodgecounter = dodgetime
        xx.currentdodgev = xx.v
      elseif xx.g and ((xx.lr < 0 and xx.rightb and xx.qualifyfordodge) or (xx.lr > 0 and xx.leftb and xx.qualifyfordodge))  and not xx.running  then
        xx.dodgetype = -1
        xx.dodgecounter = backdodgetime
      end
    end


    if xx.dodgetype >= 1 and xx.makeslidesound then 
      repplay(xx.slidedodge)
      xx.makeslidesound = false
    elseif xx.dodgetype <= -1 and xx.makeslidesound then
      repplay(xx.backdodge)
      xx.makeslidesound = false

    end
    if xx.dodgetype~=0 then
      if(math.abs(xx.v) > math.abs(xx.oldv)) then
        xx.v = xx.oldv + (xx.v-xx.oldv)*(rampspeed)
      end
    end
    if not simpledodge then
      xx.qualifyfordodge = xx.down and not (xx.rightb or xx.leftb)
    else
      xx.qualifyfordodge = xx.down
    end
  end













  me.letgoofblock = false
  you.letgoofblock = false
  function blocknbusy(xx)

    if not xx.blockb then xx.letgoofblock = false 
    end

    if not xx.block and xx.blockb then
      xx.letgoofblock = true
    end

    if xx.blockb and xx.dodgedelaycounter == 0 and not xx.a1 and not xx.a2 and not xx.a3 and xx.g and not xx.dodge and not xx.landing and not xx.letgoofblock
    then xx.im = block
      xx.block = true
      xx.stop = true

      if not xx.oldblock then repplay(xx.blocksound) end


    else 
      xx.block = false 
      xx.stop = false
    end


    if xx.landing or xx.flinch 
    then xx.busy = true
    else xx.busy = false
    end

    xx.oldblock = xx.block


  end




















  you.oldft = 0
  you.oldg = 0
  me.oldft = 0
  me.oldg = 0
  me.falltimer = 0
  you.falltimer = 0
  you.flinchway = 1
  me.flinchway = 1
  you.gflinchleft = 1
  me.gflinchleft = -1

  me.hittheground = false
  you.hittheground = false

  me.falling = false
  you.falling = false

  fttofall = 25
  fallframes = 4
  me.oldflinch = false
  you.oldflinch = false
  me.bouncej = 0
  you.bouncej = 0


  getuptime = 8
  forgetuptime = 3
  me.oldhealth = me.health
  you.oldhealth = you.health

  jforfallbackbounce = 5


  function flinchingx(xx,yy)
    
    
    if xx.ft > 0 then xx.flinch = true end
    
    if xx.health < xx.oldhealth then
      xx.health = xx.oldhealth + (xx.health-xx.oldhealth)*(rampspeed)/xx.color.s.def
      local dif = xx.oldhealth - xx.health
      makensparks(xx.v+xx.mid,xx.y+30,sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,math.floor(dif/rampspeed * 2/3))
    end
    xx.oldhealth = xx.health

    if xx.ft > fttofall then
      xx.falling = true
    end

    if (not xx.oldflinch and xx.flinch) or (xx.flinchway > 0 and not xx.g) then
      xx.falltimer = fallframes
    end

    if xx.ft < fttofall and xx.falling and not xx.g and not xx.hittheground then xx.falling = false
    end

    if xx.ft == 0 and not xx.falling and xx.falltimer == 0 then 

      xx.hittheground = false 
    end

    if xx.ft == 0 or (xx.ft < 0 and xx.ft + 1*rampspeed >=0) or (xx.ft > 0 and xx.ft - 1*rampspeed <=0) then 
      xx.flinch = false 
      xx.ft = 0
    elseif xx.ft < 0 then xx.ft = xx.ft + 1*rampspeed
    elseif xx.ft > 0 then xx.ft = xx.ft - 1*rampspeed
    end
    --camshakeflinch()



    if xx.prevhealth > xx.health then 
      if xx.v/(math.abs(xx.v)) < 0 then
        if xx.lr > 0 then
          xx.flinchway = -1
        else
          xx.flinchway = 11
        end
      else
        if xx.lr > 0 then
          xx.flinchway = 11
        else
          xx.flinchway = -1
        end
      end
      if xx.flinch then 
        if xx.g then xx.gflinchleft = xx.ft end
        repplay(xx.flinch1)
        repplay(xx.flinch2)
      else 
        repplay(xx.minch)
      end
    end


    if xx.falltimer < 0 then
      if xx.falltimer + 1*rampspeed > 0 then
        xx.falltimer = 0
      else
        xx.falltimer = xx.falltimer + 1*rampspeed
      end
      xx.flinch = true
      xx.stop = true
      if xx.flinchway > 0 then 
        xx.im = gettingup2
      else
        if xx.falltimer < -4 then 
          xx.im = gettingup11
        else xx.im = gettingup1
        end
      end

    elseif not xx.falling and xx.flinch then 
      if xx.flinchway < 0 then xx.im = flinch
      else xx.im = flinchback
      end

    elseif xx.falling then


      if xx.ft == 0 and xx.falltimer == 0 then
        if xx.flinchway > 0 then
          xx.im = fallforward
        else
          xx.im = fallback
        end
        if xx.extratimer == 1 then
          xx.falling = false
          xx.extratimer = 0
          xx.flinch = true
          xx.stop = true
          if xx.flinchway > 0 then 
            xx.falltimer = -forgetuptime
          elseif xx.j==0 then
            xx.falltimer = -getuptime
          end
        elseif xx.extratimer == 0 and xx.j==0 and xx.v==0 then xx.extratimer = extrastayonthegroundtime
        elseif xx.extratimer > 0 then

          xx.flinch = true
          xx.stop = true
          if xx.extratimer - 1*rampspeed < 1 then
            xx.extratimer = 1
          else
            xx.extratimer = xx.extratimer - 1*rampspeed
          end
        end

      end

      if xx.falltimer > 0 then xx.falltimer = xx.falltimer - 1*rampspeed
      else 
        xx.hittheground = true
      end

      if not xx.g then 

        if xx.j < -jforfallbackbounce then xx.bouncej = xx.j
        else xx.bouncej = 0 
        end

        xx.falltimer = fallframes
        if not xx.hittheground then
          if xx.flinchway > 0 then xx.im = fallforward1
          else xx.im = fallback1
          end
        else
          if xx.flinchway > 0 then 
            xx.im = fallforward1
          else 
            if xx.j >=0 then xx.im = fallbackbounce
            else xx.im = fallbackbouncedown
            end
          end
        end

      else 


        if xx.flinchway > 0 
        --and not (xx.flinchway < 0 and xx.hittheground) 
        then
          if xx.falltimer > 0 then
            xx.im = fallforward1
          else
            xx.im = fallforward
          end
        else
          if xx.falltimer > 0 and not xx.hittheground then
            xx.im = fallback1
          else
            if xx.bouncej < 0 then
              xx.j = -xx.bouncej*.2
            end
            xx.im = fallback
          end
        end
      end



    end


    xx.oldflinch = xx.flinch
    xx.oldft = xx.ft
    xx.oldg = xx.g

  end


