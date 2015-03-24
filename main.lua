--todo
--if not in the air then some kind of unblocking animation
--apple w is window close
--SHAEZ TIED TO RUMBLE?!?!?!?

therampspeed = .1
drawboxes = true
fightclub = true
fullscreen = false
readout = true
mute = false
eh = false
volume=0
love.audio.setVolume(volume)
--airgrab

--PARALX ZOOMS OUT SLIGHTLY DIFFERENTLY TO CAMERA ZOOM

--if you use one color too long you start to turn that color and have permanent those effects?  or you burn out?s
--or you take up to double damage? become fragile, but stronger?

--if landing lower the frnum of frames on the pre fall back
--fix zoomout relative to distance slight jump

--placement of cam funcs causes weirdness for actionshot
--cant move right while sliding left?  pretty easy to do with base/push
putmehere = 975
putyouhere = 1025
--to be rampspeedified (or if not rampcanhitified)
--idle



blashader = love.graphics.newShader( "outline.glsl" )
--do special features to second pp, shake if on plat and near, send person through plat if not floor
--make spikes not be on not ground
--front paralax?
--anytime glassbreak then slowmo
--if combo swap, still does follow through of that color, easy fix
--make purple spike combo quicker
--string together combos not desigining each ocmbination
--quickfix - bump allows you to pull people if walk in while in their box
--holding down attack makes it repeat the attack, make you have to reset to center
--doing kick as p2 makes you look like p1????
--dodgeturn around is faster than dodge...
--make it so that turnaound doesn't add V!!!!!, maybe it does it with a low v if you do it late as opposed to not permitting you to do it if it's late, add time but let v stay or even slow down if anything 
--if during the dodge whatsitcalled forward and delay, stay in a certain image?
--fix make it so that animate follows through even if BB isn't yeah
--allow faster punchs
--fix dodge
--fix flinch? make it one at least
--make vibration a function, give it parameters of duration and intensity
--at end of each update then call joystickvibrate else throw to vibrate function/variables
--maybe left stick can control purple spike direction

--on up attack, can jump in the air during combo window
--when negative 1 hum sound hold on the changetocolor but when it hits do a ding
--some water effects would be awesome
--smooth slowmo, each frame split it up before going to next, when applying v to x, split it up depending on how many slwo mini frames, apply to drawn stuff
--maybe color should just be transparent and vary that rather than color
--in case it bugs, have a temp balue each frame that resets to zero once the actual number is added on
--maybe default color is gray, not white
--general rule - attacks that take in an input (you.v) vs just outputting something offer my dynamicism, even if not immediately apparent
--make joystick 
--ON COMBO CINEMATIC, PITCH CHANGE, COLOR CHANGE, ZOOM OUT A BIT
--SPARKS COLOR BASED ON ATTACK COLOR?!?!?!?!?!?
--mine throw lob doesn't explode until activated on ground
--dodge slide turn around speed not the same as slide, it's faster
--ON HIT GLASS/WALL WHILE FLINCHED OR BOUNCE OFF EDGE WALL SLOW DOWN TIME OR PAUSE
--if chargin up then time slows or stops, easy combo chain, camera zoom too? then zoom back out, the color hums
bloop = 10
love.graphics.setDefaultFilter("linear","nearest",1)
--maybe if slow then walkrate decreases so you can walk slowly if using controller
--plane overhead night city veins simmulator for loading screens? or just a scene

--allow bounce off purple at high speeds like flinch off walls?
--adjust vroom so that it slows down to the speed limit on approach
--camera jumping alignment isn't right, test based on both on middle platform, jump up with one
--dodge is click in on run, roll down then direction (if down and right or left)
--make speed change on dis greater slower at yeah
--block is run click and down
--paper makes a sound
--debug shows healths and ft etc.
--if me.im dodgefoward and ft causes knockback, straight to back
--AIR PURPLE ON THE UPPER EDGE OF THE LIBRARY, THE BOUNDARY, DOESN'T WORK BLEH MAKE A BETTER FUNCTION DUDE, LIKE A WHEREISFLOOR FUNCTION AND PLUG THE PURP THROUGH THAT THEN - TO GET PROPER Y HEIGHT
--glass and wall breaking work on hc, and like the dis between the two inter points causes the h to be yeah, careful of like... people though, those objects, especially a vertical line.  hm.  
--green isn't working with ghc?
--SOUND WHEN FULLY CHARGED AND YOU HAVE TO SLAM DOWN, ELSE CANCEL
--maybe each color while holding has a tone, the sound version of the color's waelength?
--control stuff can be just one and apply to c1 and c2
--fix chain grab, it makes sound when hit wall, doesnt dissear if no hit, should instant stop if hit wall? yeah.
--maybe all rectangles/shapes, no lines, if hit walls  -
--make walls a hittable hc thing
--  -then do like, the dist between the two hitty things causes how much bla to be release with a minimum of 1.
--bolts can hit other bolts? knock them out of the air?
--condense controller to just one function applied to controllers
--Tie health to color of crest, gets black
--for buttons http://love2d.org/wiki/love.keypressed
--glass&rubble flies out too fast, make it like 3/4 of me.v
--blue would be cool
--dude make walls organized like floors
--add some grab only ledges, like the streetlights and the billboard
--if not one screen then slowly decrease health?
--so moveme i made into better justo ne function, do that for all i guess, make the yctt's whatever a you.ctt
--illusory bolt, forms a whole bunch but only one of them is real, the rest or other is just a reflection
--animal color, become the emobidment of the other things?  Or as a special special?
--should the edges induce a camera stop?  Why did I stop doing that?
--deadly attack if hit major damage, if miss, super exposed, can't do any other attacks for a bit?
--cloud maker would be cool, maybe like a bunch of semitransparent square in a random distribution
--if falling and time the dodge you can do a roll land, if it follows qualifications of needing to crouch
--one of the charge attacks lets you snipe by doing the above, sloep of x and y of stick
--maybe do like, the black attack hits and hten throws in a direction?
--for mines hc, dir is -you.lr? but what about them sliding backwards into it while blocking?
--above the rightmost rafter there seems tobe an invisible grabbale edge
--FOR SLOWMO if love.timer then love.timer.sleep(1/60) end
--have greenwallbreaks tied in volume to dis like purp use math.min
---maybe if at edge and other direction then stop?
--error in shaking cam when top and bottom cam?
--leafs from trees like paper from office
--incentive to attack after elapsed time, so game doesn't last forever
--flick vs the select and trigger control mechanisms
--flapping allows you to move freely in air?
--have gamespeed variable and attach it to sounds
--MAKE MASKS ON THE BLACK BAR
--climb then hold down and block is weird
--no crest on running
--sound for spines passing by?
--have leaves come out of trees like paper
--if approach edge of a floor, climb up it, or if flinched, bounce off? or not.... maybe just fall through

--can aim the green sand upwards
--more paralx?  and blur it
--ding/sound for fully charged of an attack?
--fix tornado by having wind hits halve your movement?
--im for running through wall/ glass ( or maybe only wall)
--dodge then hold run and move right, it goes weird
--make flinch sound more solid
--why is there that one stray color in the spine when they separate??
--also have a special case fo rwall jumping off edge barriers? or...
--standardize the barriers
--grapple function? it's click in on right stick and move in a direction
--an attack that really incorporates movement into it
--MAYBE make it so that color selection is the right stick but you need to use the trigger to actually use it
--if big flinch then shake screen a little mor maybe?
--big fall over should knock you off the ground, the image should be off the ground slightly
--shake from running?
--option to turn color ring on or off 
--if you do tornado, if the guy is poulled through it he pops back out the other side and repeats, also make it launch you up more
--grappling hook is looking a bit odd when reeling
--color that creates drones?  Or drones are like colored A's


--maybe vine or whatever, anyway, a poison attack that makes you weaker to other attacks
--while bla do, else do increase increment by the value of the array that we're on, is that random?  or something?  multiply it by?
--allow blue up air reset if you wall jump?
--warping color from blue to white is awesome
--one of the colors gives you a streak of you's like right behind, a ribbon
--one of the elec attacks an elec beam that randomly runs around, no controlling it, line segments grows in random direction
--why does spine add a third color sometime, like a lone blue thing moving down the spine
--select color with face buttons, direct attack/use with right stick?
--flinchdir is different when it's a mine or purples from a distance or grappling hook etc, maybe implement flinch dir
--if approach a corner just hope onto it naturall contextually
--why does a third color appear in the spine?
--fallforward face is slightly off
--is green purp decrease too small?
--pause doesnt stop tornado
--special image for jumping through a ceiling or through a wall
--running and green is not animated
--charge purple than dodge
--sprint function shakes screen?
--maybe do stuff with dt
--an attack that causes self damage too, maybe the elec one
--bug that reset characters on library, p1
--Also maybe make ynl and mnl work based on velocity
--some attacks lower gravity or something
--purple climbs up rafters
--Charge attack if it's a charge then me.charge and also you have to flip the stick in the opposite direction for it to work!


math.randomseed(os.clock())
if fullscreen then 
  love.window.setMode(1280, 800, {resizable=true, fullscreen = true, vsync=true})
else
  love.window.setMode(1280/2, 800/2, {resizable=true, fullscreen = false, vsync=true})
end



debug = false

musicmute = true

justone = false
--colorcontrol, go, size,menu

pauseonhit = false
pausedonhit = false


--when dead, flash white, background cuts to black, characters are stark white



--sound for bolt whiffing by?
--assign mecolor and youcolor to the a's, a1, a2 etc
--HAVE A RUN FUNCTION? CANT ATTACK BUT RUN FASTER?

--HEY, MAYBE MAKE IT SO THAT WHEN THE TWO ARE CLOSE ENOUGH IT'S ONE SCREEN AND THEN if the right goes left he takes the left screen over
--have a map with a permanent unmovthroughable wall somewhere in the middle or somethinh

--backgrounds be a bit more fadey?  A tiny bit less color?

--base random seed on movement during one part?  or have it be entered, or just time spent on opening screen

--iphone bluetooth controller?


--if a12 then in that function have accomodations for dont let go of this module until there are no buttons pressed!!!!!!
--check for a1 and a2
--if a1 and a2 then bla if a1 then bla else nokeys, use this to identify for the above command






--when flinch background frame turns white?
--PAPER PHYSICS
--SPEED LOWERS AS THEY GET CLOSER, maybe towards is also faster hypotenuse of x-x y-y 
--fall damage?
--one attack does more damage the longer its in the air
--have the 12:00 flash
--charge punch off screen doesnt hit wall
--dodge and stick arm air slowdown
--special barry final attack



require "blur"
require "menustuff"
require "DamageTable"
require "meandyou"
require "Music"
require "colorcontrol"
require "camera"
require "Hits"
require "FIZIX"
require "Animation"
require "Joysticks"
require "ATTACK"
require "GG"
require "BB"
require "pp"
require "OO"
loader = require "love-loader"


moop = 0





function love.load()


  me.oldv = 0
  you.oldv = 0
  if debug then 
    require("mobdebug").start() 
  end
  finishedloading = false

  stagey = 0
  stagenum = 0
  modenum = 0
  themode = "none"


  tileoffset = 77
  tileyoffset = 100


  collide = true

  mefaceselector = 0
  youfaceselector = 0
  juststartedpost = true
  ln = 0
  rn = 0

  retryfade = 0
  fadeupretry = 0

  cflicker = 0
  cfhold = 0
  cfup = true

  mbindent, mgindent, mpindent, myindent, msindent = 0,0,0,0,0
  ybindent, ygindent, ypindent, yyindent, ysindent = 0,0,0,0,0




  sfade = 5
  startsfade = false

  lcx = -screenwidth 
  rcx = screenwidth*1.5
  lset = false
  rset = false
  msy = 0
  ysy = 0
  mr2c = true
  yr2c = true

  meseleccurrent = 0
  youseleccurrent = 0

  mecurrentframe = enviro.bframe
  youcurrentframe = enviro.bframe


  adafade = 0

  backtowhite = false


  joysticks = love.joystick.getJoysticks()
  if #joysticks > 0 then
    me.joystick = joysticks[1]
  end
  if #joysticks > 1 then
    you.joystick = joysticks[2]
  end


  x = 11
  you.lefty = true
  me.righty = true
  f = false
  me.actionshot = false
  me.actiontimer = 0
  you.actiontimer = 0

  if fightclub then 
    themode = "duel"
    menu = "play"
    themap = themaps[100]
    placespeople = true
    while(not finishedloading) do
      whatlevel()
      loader.update() 
    end


  end

end









function love.update()
  --FOR SLOWMO if love.timer then love.timer.sleep(1/60) end

  speedramp = love.keyboard.isDown("x")
  if speedramp then 
    rampspeed = therampspeed
    if ramptimer >= 1 then 
      ramptimer = 0
      rampcanhit = true
    else 
      ramptimer = ramptimer + therampspeed
      rampcanhit = false
    end
  else
    ramptimer = 0
    rampcanhit = true
    rampspeed = 1
  end

  if not finishedloading then
    loader.update()   end


    whatlevel()






    me.prevhealth = me.health
    you.prevhealth = you.health


    screenwidth = love.graphics.getWidth()
    screenheight = love.graphics.getHeight()
    enviro.screenheight = screenheight - barheight
    healthratio = (screenwidth/2)/maxhealth


    randomizepitch()


    if me.flinch then me.jstop = false end
    if you.flinch then you.jstop = false end




    if 
    love.keyboard.isDown("z")
    then slowt = slowt + 1
      if slowt > SlowRate then slowt = 0
      end
    else 
      SlowRate = 10
      slowt = SlowRate
    end




    keyboardcontrols()



    if #joysticks > 0 then
      jjstick(me,me.joystick)
    elseif #joysticks > 1 then
      jjstick(me,me.joystick)
      jjstick(you,you.joystick)
    end

    controlsstuff(me)
    controlsstuff(you)


    if menu == "preplay" or menu == "play" then 
      menu = "play"
      
      if musfadein > 0 then 
    musfade = musfade + musfadein
    if musfade + musfadein >= 255 then
      musfadein = 0
      musfade = 255
    end
  elseif musfadein < 0 then
    musfade = musfade + musfadein
    if musfade +musfadein <= 0 then
      musfadein = 0
      musfade = 0
    end
  end

  if thesong~= nil then
    if musfade == 0 then
      thesong:pause()
    else
      thesong:play()
      thesong:setPitch(musfade/255)
    end
  end

      if slowt == SlowRate and not pause and not me.actionshot 
      then

        if me.dodge or me.block
        then me.a1, me.a2, me.a3, me.a4, me.up = false,false,false,false,false
        end

        if you.dodge or you.block
        then you.a1, you.a2, you.a3, you.a4, you.up = false,false,false,false,false
        end











        movex(me,you)
        movex(you,me)
        --used to be here platformcheckx()


        fallthroughglassfloor()


        if themap.name == "library" then libwallbreak() 
        elseif themap.name == "floors" then floorswallbreak() 
        end


        platformcheckx()

        you.y = you.y - you.j*.9*rampspeed
        me.y = me.y - me.j*.9*rampspeed
        you.x = you.x + you.v*rampspeed
        me.x = me.x + me.v*rampspeed
        you.next = you.feet - you.j*.9
        me.next = me.feet - me.j*.9


        me.oldv = me.v
        you.oldv = you.v

        you.push = rodib(you.push,1,0)
        me.push = rodib(me.push,1,0)

      end

      cammovement()
      --if here then slideycling to person
      camerafol()

      if slowt == SlowRate and not me.actionshot and not you.actionshot and not pause then
        animate()



        orientlr(me)
        orientlr(you)

        you.feet = you.y + 60
        me.feet = me.y + 60
        --if here then non slideycling to person
        --camerafol()



        blocknbusy(me)
        blocknbusy(you)

        me.jstop = false
        you.jstop = false
        me.limitbreak= false
        you.limitbreak = false




        combomanage(me)
        combomanage(you)

        updatemytrail(me)
        updatemytrail(you)


      end
      actionshotstuff(me)
      actionshotstuff(you)


      if slowt == SlowRate and not me.actionshot and not you.actionshot and not pause then

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


          if(math.abs(you.ft) > math.abs(you.oldft)) then
            you.ft = you.oldft + (you.ft-you.oldft)*(rampspeed)
          end

        end



        newforwarddodge(me)
        newforwarddodge(you)


        climbs(me)
        climbs(you)



        isanyonedead()

        miscsounds()
      holdmanage(me)
      holdmanage(you)


        
        cammovement()
        --if here then no slow mo twitter
        camerafol()
        camshakeflinch()

      end




      --down here to allow facemovement even during me.actionshot




      if me.im == slowdown then
        me.xoffset = 10
      end

      if you.im == slowdown then 
        you.xoffset = 10
      end
    end


  end







  function love.draw()



    --love.graphics.setShader(myShader)

    me.xoffset = me.xoffset * me.lr
    you.xoffset = you.xoffset * you.lr

    if menu ~= "play" then
      drawmenus()


    elseif menu == "play"

    then



      if (themode == "duel" and (you.health < 0 or me.health < 0)) or (themode == "spectrum" and (you.lives <= 0 or me.lives <= 0)) then 
          menu = "retry"


      else

        love.graphics.draw(enviro.healthbar, ((me.health - maxhealth)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, screenwidth/1440,1)
        love.graphics.setColor(155, 155, 155, 255)
        love.graphics.draw(enviro.healthbar, screenwidth + ((maxhealth - you.health)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, -screenwidth/1440, 1)
        love.graphics.setColor(255, 255, 255, 255)

        love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
        camera:set()
        drawx(camera)
        camera:unset()
        love.graphics.setScissor()


        love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
        camera2:set()

        drawx(camera2)

        camera2:unset()
        love.graphics.setScissor()

        if onescreen and not vertone then
          if me.x < you.x then 

            love.graphics.setScissor(screenwidth/2, topy,twidth, enviro.screenheight/2)
            camera:set()
            drawx(camera)
            camera:unset()
            love.graphics.setScissor()

            love.graphics.setScissor(screenwidth/2-twidth+1, bottomy,twidth, enviro.screenheight/2)
            camera2:set()
            drawx(camera2)
            camera2:unset()
            love.graphics.setScissor()
          elseif me.x >= you.x then
            love.graphics.setScissor(screenwidth/2-twidth+1, topy,twidth, enviro.screenheight/2)
            camera2:set()
            drawx(camera2)
            camera2:unset()
            love.graphics.setScissor()

            love.graphics.setScissor(screenwidth/2, bottomy,twidth, enviro.screenheight/2)
            camera:set()
            drawx(camera)
            camera:unset()
            love.graphics.setScissor()
          end
        end

        love.graphics.setColor(255, 255, 255)


        love.graphics.draw(enviro.wall, wallx, 0, 0, width, enviro.screenheight)
        --love.graphics.draw(enviro.beige, beigex, 0, 0, bwidth/2, bheight)
        --love.graphics.draw(enviro.beige, beigex, enviro.screenheight, 0, bwidth/2, -bbheight)
        love.graphics.setColor(255, 255, 255, 255)

        love.graphics.setColor(53, 53, 53)

        love.graphics.rectangle("fill",(screenwidth/2)-twidth,(enviro.screenheight/2)-bwidth/2,twidth*2,bwidth)
        love.graphics.setColor(255, 255, 255, 255)

        if not fightclub then
          go()
        end
        drawroulettenumbers()


      end
    end


    if fightclub then

      if me.invince then
        love.graphics.print("invince", 100, 100)
      end
      if you.invince then
        love.graphics.print("invince", 100, 100)
      end
      love.graphics.setColor(20,20,20)
      love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
      love.graphics.print(tostring(me.combo),10,20)
      love.graphics.print(tostring(me.color.n)..
        "       animcounter: "..tostring(me.animcounter)
        ..
        "       type: "..tostring(me.type),10,30)
      love.graphics.print("throughplats "..tostring("bla").."|| height "..tostring(me.height), 10, 50)
      love.graphics.print("falling "..tostring(you.falling).."|| ft "..tostring(you.ft).."|| flinchway "..tostring(you.flinchway), 10, 70)
    end



    --love.graphics.setShader()
    --[[
    boop = joystick:isVibrationSupported()
    if boop then
      love.graphics.print("yeah",100,10,100)
    end
    ]]--
    love.graphics.setColor(255,255,255)
    if readout then
    love.graphics.setColor(255,10,0)
    love.graphics.print("themenu "..tostring(menu), 10, 90)
    love.graphics.print("oldmenu "..tostring(oldmenu), 10, 110)
    love.graphics.print("fadein "..tostring(fadein), 10, 130)
    love.graphics.print("allfade "..tostring(allfade), 10, 150)
    love.graphics.print("me.a2b "..tostring(me.a2b)..tostring(you.speedpenalty), 10, 180)
    love.graphics.print("tileset "..tostring(tileset), 10, 230)
    love.graphics.setColor(255,0,0)
    love.graphics.print("mme.oldcolorn"..tostring(me.oldcolorn), 10, 260)
    love.graphics.print("mme.color.n"..tostring(me.color.n), 10, 280)
    end
    if love.keyboard.isDown("4") then blursize = blursize + 1
    elseif love.keyboard.isDown("3") and blursize > 1 then blursize = blursize - 1 end

  
   if #joysticks > 0 then
    rumblemodule(me)
  end
  if #joysticks > 1 then
    rumblemodule(you)
  end
  end
