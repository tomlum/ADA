
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
function nottoomanyuppercuts(xx)

if xx.type == 3 and xx.cancombo then xx.uppercuthit = true end

  if xx.uppercuttimer > 0 then
    if xx.color.n ~= xx.cchangeto.n and xx.uppercuthit and xx.uppercuttimer > 30
    then
      xx.actionshot = true
      xx.cancombo = false
    end
    xx.uppercuttimer = xx.uppercuttimer-1
    xx.a1 = false
  else xx.uppercuthit = false
  end

  if xx.type==3 then xx.uppercuttimer = uppercutpause end

end


me.currentanim = 0
you.currentanim = 0

function attackmanage(xx)


  nottoomanyuppercuts(xx)

  if xx.flinch then xx.animcounter = 0
  end
  if xx.animcounter == 0 then
    xx.ppnum = 0
    xx.bbpc = 0
    xx.ggpc = 0
    xx.currentanim = xx.color.n
  end
  if xx.currentanim == 0 then
    breadandbutter(xx)
  elseif xx.currentanim == 1 then
    pandp(xx)
  elseif xx.currentanim == 2 then
    gandg(xx)
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
flinchim = love.graphics.newImage("me/attack/flinch.png")
flinchc = love.graphics.newImage("me/attack/flinchc.png")
flinch = {im = flinchim, c = flinchc}


fallback = {im=love.graphics.newImage("me/attack/fallback.png"),c=love.graphics.newImage("me/attack/fallbackc.png"),xoff = 12}
fallbackbounce = {im=love.graphics.newImage("me/attack/fallbackbounce.png"),c=love.graphics.newImage("me/attack/fallbackbouncec.png"),xoff = 12}
fallbackbouncedown = {im=love.graphics.newImage("me/attack/fallbackbouncedown.png"),c=love.graphics.newImage("me/attack/fallbackbouncedownc.png"),xoff = 12}
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
dodge = {im=love.graphics.newImage("me/attack/dodge.png"), c=love.graphics.newImage("me/attack/dodgec.png")}
dodge2 = {im=love.graphics.newImage("me/attack/dodge2.png"), c=love.graphics.newImage("me/attack/dodge2c.png"), xoff = 12}
dodge21 = {im=love.graphics.newImage("me/attack/dodge21.png"), c=love.graphics.newImage("me/attack/dodge21c.png"), xoff = 12}

invis = {im=love.graphics.newImage("me/attack/invis.png"),c=love.graphics.newImage("me/attack/invis.png")}



you.prevhealth = 0
me.prevhealth = 0



function camshakeflinch()
  yhdif = you.prevhealth-you.health
  mhdif = me.prevhealth-me.health

  if not (me.actionshot or you.actionshot) and not noshake then
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
      end
    elseif xx.dodgetype == 0 and xx.dodgerefreshtimer == 0 then
      if((xx.lr > 0 and xx.right) or (xx.lr < 0 and xx.left)) and xx.block then
        xx.dodgetype = 1
        xx.dodgecounter = dodgetime
        xx.currentdodgev = xx.v
      elseif((xx.lr < 0 and xx.right) or (xx.lr > 0 and xx.left)) and xx.block and not xx.running  then
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
  fallframes = 8
  me.oldflinch = false
  you.oldflinch = false
  me.bouncej = 0
  you.bouncej = 0


  getuptime = 8
  forgetuptime = 3

  jforfallbackbounce = 5

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
            xx.extratimer = xx.extratimer - 1
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


