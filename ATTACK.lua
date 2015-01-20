
--if you.flinch and wall then bounce, switch the flinch direction
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

me.currentanim = 0
you.currentanim = 0

function attackmanage(xx)
  if xx.flinch then xx.animcounter = 0
  end
  if xx.animcounter == 0 then
    xx.ppnum = 0
    xx.bbpc = 0
    xx.currentanim = xx.color.n
  end
  if xx.currentanim == 0 then
    breadandbutter(xx)
  elseif xx.currentanim == 1 then
    pandp(xx)
  end

end


shakeme = false
shakeyou = false

me.nododge = false
you.nododge = false



dying = love.graphics.newImage("me/attack/dying.png")
airdying = love.graphics.newImage("me/attack/airdying.png")

bolt = love.graphics.newImage("me/attack/bolt.png")

climb = {im=love.graphics.newImage("me/attack/climb.png"),c=love.graphics.newImage("me/attack/climbc.png")}
climb2 = {im=love.graphics.newImage("me/attack/climb2.png"),c=love.graphics.newImage("me/attack/climb2c.png")}
climb3 = {im=love.graphics.newImage("me/attack/climb3.png"),c=love.graphics.newImage("me/attack/climb3c.png")}


hookhead = love.graphics.newImage("me/attack/hookhead.png")
boltup1 = love.graphics.newImage("me/attack/boltup2.png")
boltup1left = love.graphics.newImage("me/attack/boltup2left.png")
boltthrow = love.graphics.newImage("me/attack/boltthrow.png")
flinchim = love.graphics.newImage("me/attack/flinch.png")
flinchc = love.graphics.newImage("me/attack/flinchc.png")
flinch = {im = flinchim, c = flinchc}


fallback = {im=love.graphics.newImage("me/attack/fallback.png"),c=love.graphics.newImage("me/attack/fallbackc.png")}
fallbackbounce = {im=love.graphics.newImage("me/attack/fallbackbounce.png"),c=love.graphics.newImage("me/attack/fallbackbouncec.png")}
fallbackbouncedown = {im=love.graphics.newImage("me/attack/fallbackbouncedown.png"),c=love.graphics.newImage("me/attack/fallbackbouncedownc.png")}
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
boltcharged = love.graphics.newImage("me/attack/boltcharging.png")
boltrelease = love.graphics.newImage("me/attack/boltrelease.png")
airbolt = love.graphics.newImage("me/attack/airbolt.png")
airboltslow = love.graphics.newImage("me/attack/airboltslow.png")
dodgeback = {im = love.graphics.newImage("me/attack/dodgeback.png"), c=love.graphics.newImage("me/attack/dodgebackc.png")}
dodgeback2 = {im = love.graphics.newImage("me/attack/dodgeback2.png"), c=love.graphics.newImage("me/attack/dodgeback2c.png")}
dodge = {im=love.graphics.newImage("me/attack/dodge.png"), c=love.graphics.newImage("me/attack/dodgec.png")}
dodge2 = {im=love.graphics.newImage("me/attack/dodge2.png"), c=love.graphics.newImage("me/attack/dodge2c.png")}
dodge21 = {im=love.graphics.newImage("me/attack/dodge21.png"), c=love.graphics.newImage("me/attack/dodge21c.png")}
stomp1 = love.graphics.newImage("me/attack/stomp1.png")
stomp2 = love.graphics.newImage("me/attack/stomp2.png")
purple1 = love.graphics.newImage("me/attack/purple21.png")
purple2 = love.graphics.newImage("me/attack/purple22.png")
purple3 = love.graphics.newImage("me/attack/purple23.png")
purple4 = love.graphics.newImage("me/attack/purple24.png")
purple5 = love.graphics.newImage("me/attack/purple23.png")
airspike = love.graphics.newImage("me/attack/airspike.png")
spikeland = love.graphics.newImage("me/attack/spikeland.png")
groundspike1 = love.graphics.newImage("me/attack/groundspike21.png")
groundspike2 = love.graphics.newImage("me/attack/groundspike22.png")
groundspike3 = love.graphics.newImage("me/attack/groundspike23.png")
groundspike4 = love.graphics.newImage("me/attack/groundspike3.png")
purpbolt = love.graphics.newImage("me/attack/purpbolt.png")
greenpurpprep = love.graphics.newImage("me/attack/greenpurpprep.png")
greenpurpthrow = love.graphics.newImage("me/attack/greenpurpthrow.png")
sp12 = love.graphics.newImage("me/attack/sp112.png")
sp22 = love.graphics.newImage("me/attack/sp122.png")
sp32 = love.graphics.newImage("me/attack/sp132.png")
sp42 = love.graphics.newImage("me/attack/sp142.png")
sp52 = love.graphics.newImage("me/attack/sp52.png")
sp62 = love.graphics.newImage("me/attack/sp62.png")

sp11 = love.graphics.newImage("me/attack/sp111.png")
sp21 = love.graphics.newImage("me/attack/sp121.png")
sp31 = love.graphics.newImage("me/attack/sp131.png")
sp41 = love.graphics.newImage("me/attack/sp141.png")
sp51 = love.graphics.newImage("me/attack/sp51.png")
sp61 = love.graphics.newImage("me/attack/sp61.png")
stomps = love.graphics.newImage("me/attack/stomps.png")
dig = love.graphics.newImage("me/attack/dig.png")
invis = love.graphics.newImage("me/attack/invis.png")



bs = love.graphics.newImage("me/attack/bluespike.png")
bsm = love.graphics.newImage("me/attack/bluespikeprep.png") 

bluepurphit = love.graphics.newImage("me/attack/bp.png")
airbluepurphit = love.graphics.newImage("me/attack/bpup.png")

you.prevhealth = 0
me.prevhealth = 0



function camshakeflinch()
  yhdif = you.prevhealth-you.health
  mhdif = me.prevhealth-me.health

  if not (me.actionshot or you.actionshot) then
    if ((you.prevhealth > you.health or shakeyou) and you.x >= me.x)  or shakeboth then 
      camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + yhdif/2)
      camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + yhdif/2)
      if #joysticks>1 then
        you.joystick:setVibration(1,1)
      end
    elseif ((you.prevhealth > you.health  or shakeyou) and you.x < me.x) then 
      camera.x = camera.x + math.ceil(math.random()) * (shakedis + yhdif/2)
      camera.y = camera.y + math.ceil(math.random()) * (shakedis + yhdif/2)
      if #joysticks>1 then
        you.joystick:setVibration(1,1)
      end
    end

    if ((me.prevhealth > me.health  or shakeme) and me.x < you.x) or shakeboth then 
      camera.x = camera.x + math.ceil(math.random()) * (shakedis + mhdif/2)
      camera.y = camera.y + math.ceil(math.random()) * (shakedis + mhdif/2)
      if #joysticks>0 then
        me.joystick:setVibration(1,1)
      end
    elseif ((me.prevhealth > me.health  or shakeme) and me.x >= me.x) then 
      camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + mhdif/2)
      camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + mhdif/2)
      if #joysticks>0 then
        me.joystick:setVibration(1,1)
      end


    end
  end

  shakeme = false
  shakeyou = false

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




yougpc = 0
yougpready = false
yougpcd = 0
yougur = false

megpc = 0
megpready = false
megpcd = 0
megur = false

mebpc = 0
mebpready = false
mebpcd = 0
me.bur = false

mebgc = 0
mebgready = false
mebgcd = 0
mebre = false
me.bgcatch = false

youbpc = 0
youbpready = false
youbpcd = 0
you.bur = false



memidupv = 0
youmidupv = 0



youbgc = 0
youbgready = false
youbgcd = 0
youbre = false
you.bgcatch = false

function you.bluegreen(x)

  if you.flinch or mbgcancel then youbgready = false
    youbgc = 0 
    for i = #you.bolts, 1, -1 do
      local v = you.bolts[i]
      if v.s == -200 or v.s == -201 then table.remove(you.bolts)
      end
    end

  end

  if youbgc < 0 then
    youbgc = youbgc + 1 
  elseif youbgc > 0 then youbgc = youbgc - 1 
    youbre = true
  else youbre = false
  end

  if youbgcd > 0 then youbgcd = youbgcd - 1 end

  if youbgc == "ble" then youbgc = "bleh!"


  elseif youbgc < 10 and youbgc > 0 then
    you.im = reelin
    youbre = true




  elseif you.bgcatch then 
    you.im = reelin
    youbre = true
    youbgc = 9
    you.bgcatch = false
    for i = #you.bolts, 1, -1 do
      local v = you.bolts[i]
      if v.s == -200 or v.s == -201 then table.remove(you.bolts)
      end
    end
    if reel2:isStopped() then
      reel2:play()
    else reel2:rewind()
      reel2:play()
    end




  elseif youbgc > 0 
  then 

    you.im = boltthrow


    you.stop = true
    you.jstop = true
    youbre = true 

    if not you.g then youblehfuck = true
    end

    if you.g and youblehfuck then
      youblehfuck = false

      table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -youmidupv, s = -200, v = bboltspeed * you.lr + you.v})	
      if hook2:isStopped() then
        hook2:play()
      else hook2:rewind()
        hook2:play()
      end

    else
      youmidupv = you.j
      table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -you.j, s = -200, v = bboltspeed * you.lr + you.v})	
      if chain2:isStopped() then
        chain2:play()
      else chain2:rewind()
        chain2:play()
      end
    end



  elseif not x and youbgready then

    you.bgcatch = false
    you.im = boltthrow

    youbgready = false
    youbgc = 70
    you.stop = true
    you.jstop = true
    youbgcd = 120
    --this is the head

    table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = -201, v = bboltspeed * you.lr + you.v})	
    youbre = true
    youblehfuck = true

  elseif x and youbgc == 0 and youbgcd == 0 
  then 

    you.im = blue1start
    youbgready = true
    you.stop = true
    you.jstop = true



  end



end







function bluegreen(x)

  if me.flinch or mbgcancel then mebgready = false
    mebgc = 0 
    for i = #me.bolts, 1, -1 do
      local v = me.bolts[i]
      if v.s == -200 or v.s == -201 then table.remove(me.bolts)
      end
    end
  end

  if mebgc < 0 then
    mebgc = mebgc + 1 
  elseif mebgc > 0 then mebgc = mebgc - 1 
    mebre = true
  else mebre = false
  end

  if mebgcd > 0 then mebgcd = mebgcd - 1 end

  if mebgc == "ble" then mebgc = "bleh!"


  elseif mebgc < 10 and mebgc > 0 then
    me.im = reelin
    mebre = true




  elseif me.bgcatch then 
    me.im = reelin
    mebre = true
    mebgc = 9
    me.bgcatch = false
    for i = #me.bolts, 1, -1 do
      local v = me.bolts[i]
      if v.s == -200 or v.s == -201 then table.remove(me.bolts)
      end
    end
    if reel1:isStopped() then
      reel1:play()
    else reel1:rewind()
      reel1:play()
    end




  elseif mebgc > 0 
  then 

    me.im = boltthrow


    me.stop = true
    me.jstop = true
    mebre = true 

    if not me.g then meblehfuck = true
    end

    if me.g and meblehfuck then
      meblehfuck = false

      table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -(memidupv/2) * 2, s = -200, v = bboltspeed * me.lr + me.v})	
    else
      memidupv = me.j

      if hook1:isStopped() then
        hook1:play()
      else hook1:rewind()
        hook1:play()
      end

      table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -me.j, s = -200, v = bboltspeed * me.lr + me.v})	
      if chain1:isStopped() then
        chain1:play()
      else chain1:rewind()
        chain1:play()
      end
    end


  elseif not x and mebgready then

    me.bgcatch = false
    me.im = boltthrow

    mebgready = false
    mebgc = 70
    me.stop = true
    me.jstop = true
    mebgcd = 120
    --this is the head

    table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = -201, v = bboltspeed * me.lr + me.v})	
    mebre = true
    meblehfuck = true

  elseif x and mebgc == 0 and mebgcd == 0 
  then 

    me.im = blue1start
    mebgready = true
    me.stop = true
    me.jstop = true



  end



end



function you.bluepurple(x)
  if you.flinch or ybpcancel then youbpready = false
    youbpc = 0 
  end

  if youbpc < 0 then
    youbpc = youbpc + 1 
  elseif youbpc > 0 then youbpc = youbpc - 1 
    you.bur = true
  else you.bur = false
  end

  if youbpcd > 0 then youbpcd = youbpcd - 1 end

  if youbpc == "ble" then youbpc = "bleh!"

  elseif youbpc > 0 
  then 

    if not you.g then you.im = airbluepurphit
    else you.im = bluepurphit
    end

    you.stop = true
    you.jstop = true
    you.bur = true

  elseif not x and youbpready then

    if not you.g then you.im = airbluepurphit
    else you.im = bluepurphit
    end

    youbpready = false
    youbpc = 75
    you.stop = true
    you.jstop = true
    youbpcd = 110
    you.bur = true
    table.insert(you.spikes, {x = you.mid + 30*you.lr, y = spikecheck(you.mid + 30*you.lr, you.y) - 140, lr = you.lr, t = 40, s = -200})

    repplay(bpurp2hit)

  elseif x and youbpc == 0 and youbpcd == 0 
  then 

    if not you.g then you.im = briseprep
    else you.im = blue1start
    end
    youbpready = true
    you.stop = true
    you.jstop = true



  end
end


function bluepurple(x)
  if me.flinch or mbpcancel then mebpready = false
    mebpc = 0 
  end

  if mebpc < 0 then
    mebpc = mebpc + 1 
  elseif mebpc > 0 then mebpc = mebpc - 1 
    me.bur = true
  else me.bur = false
  end

  if mebpcd > 0 then mebpcd = mebpcd - 1 end

  if mebpc == "ble" then mebpc = "bleh!"

  elseif mebpc > 0 
  then 

    if not me.g then me.im = airbluepurphit
    else me.im = bluepurphit
    end

    me.stop = true
    me.jstop = true
    me.bur = true 

  elseif not x and mebpready then

    if not me.g then me.im = airbluepurphit
    else me.im = bluepurphit
    end

    mebpready = false
    mebpc = 75
    me.stop = true
    me.jstop = true
    mebpcd = 110
    table.insert(me.spikes, {x = me.mid + 30*me.lr, y = spikecheck(me.mid + 30*me.lr, me.y) - 140, lr = me.lr, t = 40, s = -200})
    repplay(bpurp1hit)
    me.bur = true

  elseif x and mebpc == 0 and mebpcd == 0 
  then 

    if not me.g then me.im = briseprep
    else me.im = blue1start
    end
    mebpready = true
    me.stop = true
    me.jstop = true



  end
end







youchargecounter = 0
combocounteryou = 0
attacknumberyou = 0
chargecounteryou = 0


me.dodgeanimatetimer = 0


you.dodgedelaycounter = 0
you.dodgecounter = 0
me.dodgedelaycounter = 0
me.dodgecounter = 0
backdodgetime = 15
dodgetime = 23
backdodgetime = 15
turnaroundtime = 20
turndodgedelay = 10
dodgedelay = 20
dodgespeed = speedlimit*1.25
backdodgespeed = speedlimit*1



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
    xx.slidesound = true end

    if xx.dodgerefreshtimer > 0 then xx.dodgerefreshtimer = xx.dodgerefreshtimer - 1
    end


    if xx.flinch 
    then xx.dodgecounter = 0
      xx.dodge = false
      xx.dodgetype = 0
      xx.pause = false
      xx.dodgedelaycounter = 0
    end

    if xx.dodgedelaycounter > 0 then 
      xx.dodgedelaycounter = xx.dodgedelaycounter - 1
      xx.stop = true
      xx.dodge = false
      xx.dodgetype = 0
    end


    if xx.dodgecounter > 1 then 
      xx.dodgecounter = xx.dodgecounter-1 
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
      xx.xoffset = 12
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
        xx.slidesound = true
        xx.im = dodge21
        xx.xoffset = 12
      end
    elseif xx.dodgetype == 0 and xx.dodgerefreshtimer == 0 then
      if((xx.lr > 0 and xx.right) or (xx.lr < 0 and xx.left)) and xx.block then
        xx.dodgetype = 1
        xx.dodgecounter = dodgetime
        xx.currentdodgev = xx.v
      elseif((xx.lr < 0 and xx.right) or (xx.lr > 0 and xx.left)) and xx.block then
        xx.dodgetype = -1
        xx.dodgecounter = backdodgetime
      end
    end


    if xx.dodgetype >= 1 and xx.slidesound then 
      repplay(xx.slidedodge)
      xx.slidesound = false
    elseif xx.dodgetype <= -1 and xx.slidesound then
      repplay(xx.backdodge)
      xx.slidesound = false

    end

  end














  function blocknbusy()


    if me.blockb and me.dodgedelaycounter == 0 and not me.a1 and not me.a2 and not me.a3 and me.g and not me.dodge and not me.landing
    then me.im = block
      me.block = true
      me.stop = true
      if not me.oldblock then repplay(me.blocksound) end


    else me.block = false 
      me.stop = false
    end


    if you.blockb and you.dodgedelaycounter == 0 and not you.a1 and not you.a2 and not you.a3 and you.g and not you.dodge and not you.landing 
    then you.im = block
      you.block = true
      you.stop = true
      if not you.oldblock then repplay(you.blocksound) end


    else you.block = false
      you.stop = false
    end

    if me.landing or me.flinch 
    then me.busy = true
    else me.busy = false
    end

    if you.landing or you.flinch 
    then you.busy = true
    else you.busy = false
    end

    me.oldblock = me.block
    you.oldblock = you.block


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
  fallframes = 3
  me.oldflinch = false
  you.oldflinch = false
  me.bouncej = 0
  you.bouncej = 0


  getuptime = 8
  forgetuptime = 3

  jforfallbackbounce = 4

  function flinchingx(xx,yy)

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

    if xx.ft < 0 then xx.ft = xx.ft + 1
    elseif xx.ft ==0 then 
      xx.flinch = false end
      if xx.ft > 0 then xx.ft = xx.ft - 1
      end
      camshakeflinch()



      if xx.prevhealth > xx.health then 
        xx.flinchway = yy.lr * xx.lr
        if xx.flinch then 
          if xx.g then xx.gflinchleft = xx.ft end
          repplay(xx.flinch1)
          repplay(xx.flinch2)
        else 
          repplay(xx.minch)
        end
      end


      if xx.falltimer < 0 then
        xx.falltimer = xx.falltimer + 1
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
          xx.falling = false
          if xx.flinchway > 0 then 
            xx.falltimer = -forgetuptime
          else
            xx.falltimer = -getuptime
          end
        end

        if xx.falltimer > 0 then xx.falltimer = xx.falltimer - 1
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
          

          if xx.flinchway > 0 and not (xx.flinchway < 0 and xx.hittheground) then
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



    flinchingyou = function ()





      if you.oldft < you.ft then
        inityflinch = you.ft
      end

      if not you.g then you.falltimer = 0 end
      if not you.oldg and you.g then you.gflinchleft = you.ft-you.flinchtimer end

      if you.flinchtimer > you.ft
      then 
        you.flinch = false
        you.flinchtimer = 0

      elseif you.flinch then
        you.flinchtimer = you.flinchtimer + 1
        you.stop = true
        if you.flinchway > 0 then 

          if you.g and you.gflinchleft>fallflinchtime then
            you.falltimer = you.falltimer + 1
            if you.falltimer <= 5 then you.im = fallforward1
            elseif you.ft - you.flinchtimer < 2 then you.im = gettingup2
            elseif you.falltimer >5 then you.im = fallforward
              youfacerot = 1.57 * me.lr
            end
          elseif inityflinch > fallflinchtime and not you.g then
            you.im = fallforward1
          else you.im = flinch
          end


        elseif you.flinchway < 0 then 
          if you.g and you.gflinchleft>fallflinchtime then
            you.falltimer = you.falltimer + 1
            if you.falltimer <= 5 then you.im = fallback1
              you.xoffset = 4
            elseif you.ft - you.flinchtimer < 2 then you.im = gettingup1
              you.xoffset = 6
            elseif you.falltimer >5 then
              you.im = fallback
              you.xoffset = 20
            end
          elseif inityflinch > fallflinchtime and not you.g then
            you.im = fallback1
            you.xoffset = 4
          else you.im = flinch
          end
        end
      end

      you.oldft = you.ft
      you.oldg = you.g


    end

    flinchingme = function ()
      if me.ft > 0 then me.ft = me.ft - 1
      end


      if me.oldft < me.ft then
        initmeflinch = me.ft
      end
      if not me.g then me.falltimer = 0 end
      if not me.oldg and me.g then me.gflinchleft = me.ft-me.flinchtimer end
      if me.flinchtimer > me.ft
      then 
        me.flinch = false
        me.flinchtimer = 0
      elseif me.flinch then
        me.flinchtimer = me.flinchtimer + 1
        me.stop = true
        if me.flinchway > 0 then 
          if me.g and me.gflinchleft>fallflinchtime then
            me.falltimer = me.falltimer + 1
            if me.falltimer <= 5 then me.im = fallforward1
            elseif me.ft - me.flinchtimer < 2 then me.im = gettingup2
            elseif me.falltimer >5 then me.im = fallforward
            end
          elseif initmeflinch > fallflinchtime and not me.g then
            me.im = fallforward1
          else me.im = flinch
          end


        elseif me.flinchway < 0 then 
          if me.g and me.gflinchleft>fallflinchtime then
            me.falltimer = me.falltimer + 1
            if me.falltimer <= 5 then me.im = fallback1
              me.xoffset = 4
            elseif me.ft - me.flinchtimer < 2 then me.im = gettingup1
              me.xoffset = 6
            elseif me.falltimer >5 then me.im = fallback
              me.xoffset = 20
            end
          elseif initmeflinch > fallflinchtime and not me.g then
            me.im = fallback1
            me.xoffset = 4
          else me.im = flinch
          end
        end
      end
      me.oldft = me.ft
      me.oldg = me.g
    end



















