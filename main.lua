-----Naming Conventions-----
--me = player 1
--you = player 2
--xx = generic parameter for either player
--v = horizontal velocity
--j = vertical velocity
--can't kick combo out of purple kick

--love.timer.sleep?
--change push to prevent pulling
--can rapid kick
--slowdown is weird/notworking 
--pause is broken
--xx.attack_num be more meaningful than 1 - 6
--apa13 xoff is incorrect
--implement action_done on all attacks
--can hexHit use colon and self?
--fix rumble

require "initializers"

--Debug/Test Utilities
fightclub = true
menu = "color"
notilebouncing = true
melcolor = 1
mercolor = 4
youlcolor = 3
yourcolor = 2
therampspeed = .2
mapNum = 3
rampspeed= therampspeed
drawBoxes = false
drawFeet = true
volume = 0
fullscreen = false
readout = false
putmehere = 1000
putyouhere = 1025
chapter = 1
oldchapter = "bob"
lassoisathing = false
dangerCloseIsAThing = true


mute = false

love.audio.setVolume(volume)

initLove()
initDependencies()

theMap = theMaps[mapNum]

function love.load()
  initPlayer(me)
  initPlayer(you)
  initMenus()
  initJoysticks()
  initFightClub()
end


function love.update()

  refreshMenus()

  if menu == "story" then
    updatechapters()
  end
  --colorshift(thecolors[2].c,8)
  --colorshift(me.outline,6)

  speedRamp()

  if not finishedLoading then loader.update() end

  if placespeople then
    loadStage()
  end

  updateScreenInfo()
  updateControllers()

  if menu == "preplay" or menu == "play" then 
    menu = "play"

    updateSounds()
    gavinAndDan()

    if slowt == slowrate and not (pause or hitpause) and not me.actionshot 
      then

      movex(me,you)
      movex(you,me)
      hboxwall()
      platformcheckx()
      monplatupdate()
      applyMovements()





      me.oldj = me.j
      you.oldj = you.j

      me.oldv = me.v
      you.oldv = you.v

      you.push = rodib(you.push,1,0)
      me.push = rodib(me.push,1,0)

    end

      --cammovement()
      --if here then slideycling to person
      camerafol()

      if slowt == slowrate and not me.actionshot and not you.actionshot and not (pause or hitpause) then

        updateboxes()
        updateparticles()



        --if here then non slideycling to person
        --camerafol()



        me.jstop = false
        you.jstop = false
        me.limitbreak= false
        you.limitbreak = false





      end




      if slowt == slowrate and not me.actionshot and not you.actionshot and not (pause or hitpause) then

        whoupdatesfirst = math.random()
        if whoupdatesfirst>.5 then
          attackmanage(me)
          spikeupdate(me)
          boltupdate(me) 
        end
        attackmanage(you)
        spikeupdate(you)
        boltupdate(you)  
        if whoupdatesfirst<=.5 then
          attackmanage(me)
          spikeupdate(me)
          boltupdate(me) 
        end

        postattackmanage(me)
        postattackmanage(you)
        flinchingx(me,you)
        flinchingx(you,me)

        if math.abs(me.v) > math.abs(you.v) then
          bump(me)
          bump(you)
        elseif math.abs(me.v) < math.abs(you.v) then

          bump(you)
          bump(me)
        else
          if math.random()>.5
            then bump(me)
            bump(you)
            else bump(you)
              bump(me)
            end

          --SEARCH IS THIS NECESSARY?
          --[[
          if(math.abs(you.ft) > math.abs(you.oldft)) then
            you.ft = you.oldft + (you.ft-you.oldft)*(you.rampspeed)
          end
          if(math.abs(me.ft) > math.abs(me.oldft)) then
            me.ft = me.oldft + (me.ft-you.oldft)*(me.rampspeed)
          end
          ]]--

        end



        newforwarddodge(me)
        newforwarddodge(you)


        climbs(me)
        climbs(you)



        miscsounds()
        holdmanage(me)
        holdmanage(you)

        orientlr(me)
        orientlr(you)

        cammovement()
        --if here then no slow mo twitter
        camerafol()
        camshakeflinch()

      end
      monupdate()



      --down here to allow facemovement even during me.actionshot

    end


    postmonupdate()
    death2(me)
    death2(you)

  end





  function love.draw()

    if menu ~= "play" and menu ~= "story" then
      drawmenus()


    elseif menu == "play" 

      then

      if themode == "koth" then
        randomizeplat()
      end


      cclear()
      lg.draw(enviro.healthbar, ((me.health - maxhealth)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, screenwidth/1440,1)
      lg.draw(enviro.healthbar, screenwidth + ((maxhealth - you.health)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, -screenwidth/1440, 1)

      lg.setScissor(0, 0, screenwidth/2, winheight)
      camera:set()
      drawx(camera)
      camera:unset()
      lg.setScissor()



      lg.setScissor(screenwidth/2, 0, screenwidth/2, winheight)
      camera2:set()

      drawx(camera2)

      camera2:unset()
      lg.setScissor()

      if onescreen and not vertone then
        if me.x < you.x then 

          lg.setScissor(screenwidth/2, topy,twidth+1, winheight/2+1)
          camera:set()
          drawx(camera)
          camera:unset()
          lg.setScissor()

          lg.setScissor(screenwidth/2-twidth, bottomy,twidth+1, winheight/2+1)
          camera2:set()
          drawx(camera2)
          camera2:unset()
          lg.setScissor()
        elseif me.x >= you.x then

          lg.setScissor(screenwidth/2-twidth, topy,twidth+1, enviro.screenheight/2+1)
          camera2:set()
          drawx(camera2)
          camera2:unset()
          lg.setScissor()

          lg.setScissor(screenwidth/2, bottomy,twidth+1, enviro.screenheight/2+1)
          camera:set()
          drawx(camera)
          camera:unset()
          lg.setScissor()
        end
      end

      drawoverlays()


    elseif menu == "story" then
      if chapter == 1 then
        drawch1()


      end
      lg.print(tostring(chaptime),10,10)

    end


    if fightclub then
      lg.setColor(20,20,20)
      lg.print(tostring(me.combo),10,20)
      lg.print(tostring(me.color.n)..
        "       animcounter: "..tostring(me.animcounter).."current"..tostring(me.currentc)
        ..
        "       type: "..tostring(me.attack_num),10,30)
      lg.print("throughplats "..tostring("bla").."|| height "..tostring(me.height), 10, 50)
      lg.print("j "..tostring(you.j), 10, 70)
    end



    --lg.setShader()
    --[[
    boop = joystick:isVibrationSupported()
    if boop then
      lg.print("yeah",100,10,100)
    end
    ]]--
    lg.setColor(255,255,255)
    if readout then
      lg.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
      lg.print("me.x, me.y: "..tostring(me.x).." "..tostring(me.y), 10, 40)
      lg.print("you.x, you.y: "..tostring(you.x).." "..tostring(you.y), 10, 70)

      lg.setColor(255,10,0)
      lg.print("themenu "..tostring(menu), 10, 90)
      lg.print("oldmenu "..tostring(oldmenu), 10, 110)
      lg.print("fadein "..tostring(fadein), 10, 130)
      lg.print("allfade "..tostring(allfade), 10, 150)
      lg.print("me.a2b "..tostring(me.a2b)..tostring(you.speedpenalty), 10, 180)
      lg.print("slowt "..tostring(slowt), 10, 230)
      lg.print("#joysticks"..tostring(#love.joystick.getJoysticks()), 10, 250)
      lg.print("#monsters"..tostring(#monsters), 10, 280)
      for i,v in ipairs(love.joystick.getJoysticks()) do
        lg.print("hey"..v:getName()..tostring(i), 200, 20+20*i)
      end


      lg.setColor(255,0,0)


    end






    setControllers()
    rumblemodule(me)
    rumblemodule(you)
    if me.animcounter < 2 and me.animcounter > 0 then
      --makenleaves(me.x,me.y,me.v,me.j,1)

    end

    paralaxshake = false

    if not love.keyboard.isDown("3") and not love.keyboard.isDown("4") and not love.keyboard.isDown("2") then

      boxstop = false
    end
    if love.keyboard.isDown("5") and not boxstop then
      boxstop = true
      throwinto()
      --rotatefractal()
    end


    -- moveTOD(.03)
    if love.keyboard.isDown("4") and not boxstop then
      throwinto()
      --makecolorbox(me.x, me.y+30)
      boxstop = true
      --fractalrotate()
    end

    if love.keyboard.isDown("5") and not boxstop then
      rotatefractal()
      --makecolorbox(me.x, me.y+30)
      boxstop = true
      --fractalrotate()
    end

    --

    --[[
    for i,plat in ipairs(theMap.walls) do
      lg.print(tostring(plat.y).."||"..tostring(plat.x1).."||"..tostring(plat.x2).."||"..tostring(plat.x).."||"..tostring(plat.y1).."||"..tostring(plat.y2), 300,i*20)
    end
    ]]--
    if love.keyboard.isDown("2")then
      me.no_spikes = true
    end
    if fightclub then

      lg.print("pause: "..tostring(pause), 400,360)
      lg.print("me.walllr: "..tostring(me.walllr), 400,380)
      lg.print("me.lr: "..tostring(me.lr), 400,400)
      lg.print("me.oldattacknum: "..tostring(me.oldattacknum), 400,420)
      lg.print("me.oldcolor: "..tostring(me.oldcolor), 400,440)
      lg.print("me.counteractivate : "..tostring(me.counteractivate), 400,460)
      changebackgroundcolor(4)
      
    end

    pausing()

    golasso()

    camerawobble()
    pauseonhit()
  end
