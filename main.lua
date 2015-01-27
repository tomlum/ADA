--todo
    blashader = love.graphics.newShader( "outline.glsl" )
--can change lr during flinch
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
--why is there that one stray color in the spine when they seperate??
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

flipfollow = false
flash = false

math.randomseed(os.clock())
--success = love.window.setMode(1280, 800, {resizable=true, fullscreen = true, vsync=true})
success = love.window.setMode(600, 600, {resizable=true, fullscreen = false, vsync=true})


fightclub = true
debug = false

musicmute = true
mute = true

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




require "DamageTable"
require "meandyou"
require "colorcontrol"
require "camera"
require "Music"
require "Hits"
require "FIZIX"
require "Animation"
require "Joysticks"
require "ATTACK"
require "At/Green"
require "At/Yellow"
require "At/Sand"
require "BB"
require "pp"
loader = require "love-loader"


moop = 0





function love.load()



  myShader = love.graphics.newShader[[
  vec4 effect(vec4 color, Image texture, vec2 vTexCoord, vec2 pixel_coords)
  {
    vec4 sum = vec4(0.0);
    number blurSize = 0.005;
    //number d = distance(vTexCoord, mousePos/screenSize);
    //number blurSize = clamp(1/d/screenSize.x, 0, 1.0);
    // blur in y (vertical)
    // take nine samples, with the distance blurSize between them
    sum += texture2D(texture, vec2(vTexCoord.x - 4.0*blurSize, vTexCoord.y)) * 0.05;
    sum += texture2D(texture, vec2(vTexCoord.x - 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x - 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x - blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * 0.16;
    sum += texture2D(texture, vec2(vTexCoord.x + blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x + 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x + 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x + 4.0*blurSize, vTexCoord.y)) * 0.05;


    return sum;
  }
  ]]
  if debug then 
    require("mobdebug").start() 
  end
  finishedLoading = false

  stagey = 0
  stagenum = 0
  modenum = 0
  themode = "none"


  tileoffset = 77
  tileyoffset = 100


  collide = true

  mechooseface = false
  youchooseface = false
  mechoosecolor = true
  youchoosecolor = true

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

  mbb,mgg,mpp,myy,ybb,ygg,ypp,yyy,mss,yss = 0,0,0,0,0,0,0,0,0,0
  mb,mg,mp,yb,yg,yp,ms,ys = false,false,false,false,false,false,false,false
  r1,r2,g1,g2,b1,b2 = 0,0,0,0,0,0

  mf1r,mf1g,mf1b = 255,255,255
  mf2r,mf2g,mf2b = 255,255,255
  mf3r,mf3g,mf3b = 255,255,255
  mf4r,mf4g,mf4b = 255,255,255
  mf5r,mf5g,mf5b = 255,255,255
  mf6r,mf6g,mf6b = 255,255,255

  yf1r,yf1g,yf1b = 255,255,255
  yf2r,yf2g,yf2b = 255,255,255
  yf3r,yf3g,yf3b = 255,255,255
  yf4r,yf4g,yf4b = 255,255,255
  yf5r,yf5g,yf5b = 255,255,255
  yf6r,yf6g,yf6b = 255,255,255


  mbindent, mgindent, mpindent, myindent, msindent = 0,0,0,0,0
  ybindent, ygindent, ypindent, yyindent, ysindent = 0,0,0,0,0

  if flipfollow then
    me.flip = me.lr
    you.flip = you.lr
  else 
    me.flip = 1
    you.flip = 1
  end




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
  lefty = true
  rightme = true
  f = false
  me.actionshot = false
  me.actiontimer = 0
  you.actiontimer = 0

  if fightclub then 
    MENU = "play"
    themap = "fightclub"
    placespeople = true
    mute = true
    while(not finishedLoading) do
      whatlevel()
      loader.update() 
    end


  end

end









function love.update()
  if not (pauseonhit and pausedonhit) then

    --FOR SLOWMO if love.timer then love.timer.sleep(1/60) end

    if not finishedLoading then
      loader.update()   end





      whatlevel()



      if MENU == "play" then 
        spines={}



        you.start = love.keyboard.isDown("u")
        if #joysticks > 0 then
          me.start = me.joystick:isGamepadDown("start")
          if #joysticks > 1 then
            you.start = you.joystick:isGamepadDown("start") 
          end
        end 

        if r2unpause and (me.start or you.start) and pause 
        then pause = false
          r2unpause = false
          thesong:resume()
        elseif (me.start or you.start) and r2unpause then 
          pause = true
          r2unpause = false
          thesong:pause()
        elseif not (me.start or you.start) then r2unpause = true 
        end
      end




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




  



        if me.health<0 or you.health<0 then

          me.up = false
          me.down = false
          me.left = false
          me.right = false
          me.a1 = false
          me.a2 = false
          me.a3 = false
          me.block = false



          you.up = false
          you.down = false
          you.left = false
          you.right = false
          you.a1 = false
          you.a2 = false
          you.a3 = false
          you.block = false

        else

          me.start = love.keyboard.isDown("q")
          me.up = love.keyboard.isDown("w")
          me.down = love.keyboard.isDown("s")
          me.left = love.keyboard.isDown("a")
          me.right = love.keyboard.isDown("d")
          me.a1b = love.keyboard.isDown("t")
          me.a2b = love.keyboard.isDown("f")
          me.a3b = love.keyboard.isDown("h")
          me.a4b = love.keyboard.isDown("g")
          me.blockb = love.keyboard.isDown("e")
          me.run = love.keyboard.isDown("r")
          me.rightb = love.keyboard.isDown("2")
          me.leftb = love.keyboard.isDown("1")



          you.up = love.keyboard.isDown("i")
          you.down = love.keyboard.isDown("k")
          you.left = love.keyboard.isDown("j")
          you.right = love.keyboard.isDown("l")
          you.a1b = love.keyboard.isDown("up")
          you.a4b = love.keyboard.isDown("down")
          you.a2b = love.keyboard.isDown("left")
          you.a3b = love.keyboard.isDown("right")
          you.blockb = love.keyboard.isDown("o")
          you.start = love.keyboard.isDown("u")
          you.run = love.keyboard.isDown("p")
          you.rightb = love.keyboard.isDown("0")
          you.leftb = love.keyboard.isDown("9")

          you.a1 = you.a1b
          you.a2 = you.a2b
          you.a3 = you.a3b
          you.a4 = you.a4b
          me.a1 = me.a1b
          me.a2 = me.a2b
          me.a3 = me.a3b
          me.a4 = me.a4b

        end



        --makes it towards and away not left and right

        --if MENU == "play" and towardaway then
        --  if (me.mid + me.v) > (you.mid + you.v) and not c2accept() then you.flip = -1
        --elseif (me.mid + me.v) <= (you.mid + you.v) and not c2accept() then you.flip = 1
        --end
        --if (me.mid + me.v) > (you.mid + you.v) and not c1accept() then me.flip = -1
        --elseif (me.mid + me.v) <= (you.mid + you.v) and not c1accept() then me.flip = 1
        --end
        --else me.flip = 1
        --you.flip = 1
        --end

    

        if #joysticks > 0 then
          jjstick(me,joystick)
        elseif #joysticks > 1 then
          jjstick(me,joystick)
          jjstick(you,you.joystick)
        end
        
            if slowt == SlowRate and not me.actionshot and not you.actionshot and not pause
      then

        if me.dodge or me.block
        then me.a1, me.a2, me.a3, me.a4, me.up = false,false,false,false,false
        end

        if you.dodge or you.block
        then you.a1, you.a2, you.a3, you.a4, you.up = false,false,false,false,false
        end


        runrunrun()

        clicks()




        if MENU == "title" then
          openingsong:play()

          openingsong:setPitch(sfade/255)



          if c1accept() or c2accept() then
            MENU = "modes"
            modesound:play()


          end


        elseif MENU == "modes"
        then 
          mov:setVolume(SFXV - .3)
          openingsong:setPitch(sfade/255)

          if (me.right or you.right) and modenum < 1 then modenum = modenum + 1 mov:play()
          elseif (me.left or you.left) and modenum > 0 then modenum = modenum - 1 mov:play()	
          end

          if modenum == 0 then 
            themode = "roulette"
            facade = mode2

          elseif modenum == 1 then 
            themode = "classic"
            facade = mode1
          end

          if c1accept() or c2accept() then 
            MENU ="prestage"
            wavesound:play()
          end

        elseif MENU == "prestage" or MENU == "stage" then
          mov:setVolume(SFXV - .3)
          openingsong:setPitch(sfade/255)
          if MENU == "prestage" then 
            if stagey == 0 then adastartfade = true end
            if stagey > 80 then stagey = stagey + .5
              oscillator = -screenheight/90
            elseif stagey > 50 then stagey = stagey + 1
              oscillator = -screenheight/100
            else
              stagey = stagey + 1.5
              oscillator = -screenheight/90
            end

            if stagey > 100 then MENU = "stage" oscillator = 5
            end

          end

          if not me.left and not me.right and not you.left and not you.right then r2ss = true
          end

          if (me.left or you.left) and MENU == "stage" and not startsfade and stagenum > 0 and r2ss then stagenum = stagenum - 1	mov:play() r2ss = false
          elseif (me.right or you.right) and MENU == "stage" and not startsfade and stagenum < 2 and r2ss then stagenum = stagenum + 1	 mov:play() r2ss = false
          end

          if sfade - 10 <= 0 then MENU = "prechoose" 
            sfade = 0
            mov:setVolume(SFXV - .7)
          elseif startsfade then sfade = sfade - 10
          elseif (c1accept() or c2accept()) and MENU == "stage" then
            if stagenum == 0 then themap = "street"
            elseif stagenum == 1 then themap = "library"
            elseif stagenum == 2 then themap = "floors"
            end
            startsfade = true
            startb:play()
          end

          if stagenum == 0 then themap = "street"
          elseif stagenum == 1 then themap = "library"
          elseif stagenum == 2 then themap = "floors"
          end


        elseif MENU == "prechoose" or MENU == "choose" or MENU == "postchoose" then
          if MENU == "prechoose" then MENU = "choose"

          end

          openingsong:stop()





          if cflicker == 255 then cfhold = cfhold + 1
          elseif cflicker <= 0 then cfup = true
          end

          if cfhold > 60 then cfhold = 0 cfup = false
          end


          if cfup and cfhold == 0 then cflicker = cflicker + 15
          elseif not cfup then cflicker = cflicker - 15
          end

          icflicker = cflicker

          if MENU == "postchoose" then
            rset = true
            lset = true
            if juststartedpost then juststartedpost = false
              placespeople = true


              rn = 1
              ln = 1
            elseif not juststartedpost then 
              rn = rn + (rn*.08)
              ln = ln + (ln*.08)
            end
          end

          if not lset and lcx  + screenwidth/30 < 0 then lcx = lcx + screenwidth/30
          else lset = true
            lcx = 0
          end 

          if not rset and rcx - screenwidth/30 > screenwidth/2 then rcx = rcx - screenwidth/30
          else rset = true
            rcx = screenwidth/2
          end

          if rn > 1000020 and ln > 1000020 and math.abs(soscillator)>400 
          then MENU = "prepan"
            yoffset = 0
            finishedLoading = false
            seperateSpines = false
          end




        elseif MENU == "prepan" or MENU == "pan" then 
          MENU = "pan"
          rset = false
          lset = false


          if enviro.dolly == 0 then
            if not mute then
              thesong:rewind()
              thesong:play()
            end
          elseif streetfadehold <= 0 then MENU = "preplay"
          elseif streetfade <= 0 then streetfadehold = streetfadehold - 1
          elseif streetfadestart then streetfade = streetfade - 5
          elseif enviro.dolly + screenwidth > enviro.rightwall/2
          or me.a1
          or me.a2
          or me.a3
          or you.a1
          or you.a2
          or you.a3 
          then 
            streetfadestart = true	
          end

          enviro.dolly = enviro.dolly + enviro.ds


        elseif MENU == "preplay" or MENU == "play" then 
          MENU = "play"




          platforming()

          movex(me,me)
          movex(you,you)

          walljump()


          fallthroughglassfloor()


          if themap == "library" then libwallbreak() 
          elseif themap == "floors" then floorswallbreak() 
          end


          you.y = you.y - you.j*.9
          me.y = me.y - me.j*.9
          you.x = you.x + you.v
          me.x = me.x + me.v
          you.next = you.feet - you.j*.9
          me.next = me.feet - me.j*.9


          if you.push > 0 then you.push = you.push - 1
          elseif you.push < 0 then you.push = you.push + 1
          end

          if me.push > 0 then me.push = me.push - 1
          elseif me.push < 0 then me.push = me.push + 1
          end

  end
  
    end
      
        cammovement()
        --if here then slideycling to person
        camerafol()

 if slowt == SlowRate and not me.actionshot and not you.actionshot and not pause then
          animate()



          orient()

          meyoux()

          you.feet = you.y + 60
          me.feet = me.y + 60
          --if here then non slideycling to person
          --camerafol()



          blocknbusy()

          me.jstop = false
          you.jstop = false
          melimitbreak= false
          youlimitbreak = false




          combomanage(me)
          combomanage(you)


        end
        
      actionshotstuff(me)
      actionshotstuff(you)
      
         if slowt == SlowRate and not me.actionshot and not you.actionshot and not pause then
 
          attackmanage(me)
          attackmanage(you)
          spikeupdate(me)
          spikeupdate(you)
 

          flinchingx(me,you)
          flinchingx(you,me)

          if math.abs(me.v) > math.abs(you.v) then
            bump(me)
          elseif math.abs(me.v) < math.abs(you.v) then

            bump(you)
          else
            if math.random()>.5
            then bump(me)
            else bump(you)
            end

          end

          newforwarddodge(me)
          newforwarddodge(you)


          climbs(me)
          climbs(you)


          walls()

          isanyonedead()
          death()

          miscsounds()
          holdmanage(me)
          holdmanage(you)



          if (themode == "classic" and (you.dead or me.dead))or (themode == "roulette" and (you.lives <= 0 or me.lives <= 0))then
            thesong:stop()
            retryupdate()
          end


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



    if MENU == "title" or MENU == "prestage" or MENU == "stage" or MENU == "modes"
    then 

      if sfade + 5 <= 255 then
        sfade = sfade + 5
      end

      if sfade == 255 and adafade <255 and (MENU == "title" or MENU == "modes") then adafade = adafade + 2.5  end

      if MENU == "prestage" and adafade - 3 < 0 then adafade = 0 adastartfade = false
      elseif adastartfade then adafade = adafade - 3
      end

      love.graphics.setColor(sfade,sfade,sfade,255)
      love.graphics.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)
      if MENU == "stage" then
        if stagenum == 0 then love.graphics.draw(enviro.stage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
        if stagenum == 1 then love.graphics.draw(enviro.stage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
        if stagenum == 2 then love.graphics.draw(enviro.stage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
      end
      drawwaves()
      love.graphics.setColor(255,255,255,adafade)
      love.graphics.draw(enviro.ada, 0, 0, 0,screenwidth/1440,screenheight/900)




    elseif MENU == "choose" or MENU == "postchoose" then
      love.graphics.setColor(255,255,255,255)
      love.graphics.draw(enviro.lselect, ((lcx - ln)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)	
      love.graphics.draw(enviro.rselect, ((720-lcx + rn)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)

      if lset then 



        if mbb<=0 then 
          love.graphics.setColor(br,bg,bb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.btile, ((tileoffset-ln+mbindent)/1440)*screenwidth, ((tileyoffset+74)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



        if mgg<=0 then 
          love.graphics.setColor(gr,gg,gb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.gtile, ((tileoffset-ln-9+mgindent)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



        if mpp<=0 then 
          love.graphics.setColor(pr,pg,pb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.ptile, ((tileoffset-ln-18+mpindent)/1440)*screenwidth, ((tileyoffset+202)/900)*screenheight, 0, screenwidth/1440, screenheight/900)

        if myy<=0 then 
          love.graphics.setColor(yer,yeg,yeb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.ytile, ((tileoffset-ln-27+myindent)/1440)*screenwidth, ((tileyoffset+266)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



        if mss<=0 then 
          love.graphics.setColor(sr,sg,sb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.stile, ((tileoffset-ln-36+msindent)/1440)*screenwidth, ((tileyoffset+330)/900)*screenheight, 0, screenwidth/1440, screenheight/900)


        love.graphics.setColor(255,255,255,255)
        if mechoosecolor then

          mbindent, mgindent, mpindent, myindent, msindent = 0,0,0,0,0

          if meseleccurrent == 0 then mbindent = 20
          elseif meseleccurrent == 1 then mgindent = 20
          elseif meseleccurrent == 2 then mpindent = 20
          elseif meseleccurrent == 3 then myindent = 20
          elseif meseleccurrent == 4 then msindent = 20
          end


          --love.graphics.draw(enviro.rselecter, ((tileoffset-ln-115-(meseleccurrent*9))/1440)*screenwidth, ((tileyoffset+10 + 64*(meseleccurrent+1))/900)*screenheight, 0, screenwidth/1440, screenheight/900)
          if me.down and mr2c and msy < (screenheight * .46) then 
            msy = msy + (screenheight * .15)
            mr2c = false
            meseleccurrent = meseleccurrent + 1
            mov:play()
          elseif me.up and mr2c and msy > (screenheight * .14)  then 
            msy = msy - (screenheight * .15)
            meseleccurrent = meseleccurrent - 1
            mr2c = false
            mov:play()
          elseif not me.down and not me.up then mr2c = true
          end
        end




      end

      if rset then 


        if ybb<=0 then 
          love.graphics.setColor(br,bg,bb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.btile, ((1440-tileoffset+rn-ybindent)/1440)*screenwidth, ((tileyoffset+74)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)


        if ygg<=0 then 
          love.graphics.setColor(gr,gg,gb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.gtile, ((1440-tileoffset+rn+9-ygindent)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)


        if ypp<=0 then 
          love.graphics.setColor(pr,pg,pb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.ptile, ((1440-tileoffset+rn+18-ypindent)/1440)*screenwidth, ((tileyoffset+202)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)

        if yyy<=0 then 
          love.graphics.setColor(yer,yeg,yeb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.ytile, ((1440-tileoffset+rn+27-yyindent)/1440)*screenwidth, ((tileyoffset+266)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)



        if yss<=0 then 
          love.graphics.setColor(sr,sg,sb,255)
        else love.graphics.setColor(255,255,255,255)
        end
        love.graphics.draw(enviro.stile, ((1440-tileoffset+rn+36-ysindent)/1440)*screenwidth, ((tileyoffset+330)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)



        if youchoosecolor then

          ybindent, ygindent, ypindent, yyindent, ysindent = 0,0,0,0,0

          if youseleccurrent == 0 then ybindent = 20
          elseif youseleccurrent == 1 then ygindent = 20
          elseif youseleccurrent == 2 then ypindent = 20
          elseif youseleccurrent == 3 then yyindent = 20
          elseif youseleccurrent == 4 then ysindent = 20
          end

          if you.down and yr2c and ysy < (screenheight * .46) then 
            ysy = ysy + (screenheight * .15)
            yr2c = false
            youseleccurrent = youseleccurrent+1
            mov2:play()
          elseif you.up and yr2c and ysy > (screenheight * .14) then 
            ysy = ysy - (screenheight * .15)
            yr2c = false
            youseleccurrent = youseleccurrent - 1
            mov2:play()
          elseif not you.down and not you.up then yr2c = true
          end
        end





      end

      if r1 + g1 + b1 == 765 then a11flick = icflicker
      else a11flick = 255 end
      if a21g + a21r + a21b == 765 then a21flick = icflicker
      else a21flick = 255 end
      if a31g + a31r + a31b == 765 then a31flick = icflicker
      else a31flick = 255 end
      if a41g + a41r + a41b == 765 then a41flick = icflicker
      else a41flick = 255 end

      if r2 + g2 + b2 == 765 then a12flick = icflicker
      else a12flick = 255 end
      if a22g + a22r + a22b == 765 then a22flick = icflicker
      else a22flick = 255 end
      if a32g + a32r + a32b == 765 then a32flick = icflicker
      else a32flick = 255 end
      if a42g + a42r + a42b == 765 then a42flick = icflicker
      else a42flick = 255 end



      if rset and lset then


        love.graphics.setColor(r1,g1,b1,a11flick)
        love.graphics.draw(enviro.a1, ((252+33-ln)/1440)*screenwidth, ((65)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((141)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)

        love.graphics.setColor(a21r,a21g,a21b,a21flick)
        love.graphics.draw(enviro.a2, ((232+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.vert, ((388+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)

        love.graphics.setColor(a31r,a31g,a31b,a31flick)
        love.graphics.draw(enviro.a3, ((336+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.vert, ((401+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)

        love.graphics.setColor(a41r,a41g,a41b,a41flick)
        love.graphics.draw(enviro.a4, ((252+33-ln)/1440)*screenwidth, ((170)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((154)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)


        love.graphics.setColor(r2,g2,b2,a12flick)
        love.graphics.draw(enviro.a1, ((252 + 720+rn)/1440)*screenwidth, (65/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (141/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)


        love.graphics.setColor(a22r,a22g,a22b,a22flick)
        love.graphics.draw(enviro.a2, ((232 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.vert, ((388 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)


        love.graphics.setColor(a32r,a32g,a32b,a32flick)
        love.graphics.draw(enviro.a3, ((336 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.vert, ((401 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)

        love.graphics.setColor(a42r,a42g,a42b,a42flick)
        love.graphics.draw(enviro.a4, ((252 + 720+rn)/1440)*screenwidth, (170/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (154/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(255,255,255,255)


        love.graphics.draw(mecurrentframe, ((232-7-ln)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        love.graphics.setColor(155, 155, 155, 255)
        love.graphics.draw(youcurrentframe, ((488 + 720 +7+rn)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)
        love.graphics.setColor(a31r,a31g,a31b,255)
        if mecurrentframe == enviro.pframe then 
          love.graphics.draw(me.face, ((240-7 + 45-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        elseif mecurrentframe == enviro.bframe then 
          love.graphics.draw(me.face, ((232-7 + 47-ln)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        elseif mecurrentframe == enviro.sframe then 
          love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)

        else
          love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        end

        love.graphics.setColor(a22r,a22g,a22b,255)
        if youcurrentframe == enviro.pframe then
          love.graphics.draw(you.face, ((1440-240-45-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        elseif youcurrentframe == enviro.bframe then
          love.graphics.draw(you.face, ((1440-232-47-13.5+7+rn)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        elseif youcurrentframe == enviro.sframe then
          love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        else
          love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
        end
        --why is this here? love.graphics.draw(face1, ((232+720)/1440)*screenwidth, (600/900)*screenheight, 0, screenwidth, screenheight)

        wa = 36 + 18



        if youchooseface then

          --- -10

          love.graphics.draw(slantbar, screenwidth, 0, 0 ,-screenwidth/1440, screenheight/900) 
          love.graphics.setColor(yf1r, yf1g, yf1b, 255)
          love.graphics.draw(face1, ((1440 - 40-70)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(yf2r, yf2g, yf2b, 255)
          love.graphics.draw(face2, ((1440 - 40-70 - 8)/1440)*screenwidth, ((tileyoffset+138 + 56)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(yf3r, yf3g, yf3b, 255)
          love.graphics.draw(face3, ((1440 - 40-70 - 16)/1440)*screenwidth, ((tileyoffset+138 + 56*2)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(yf4r, yf4g, yf4b, 255)
          love.graphics.draw(face4, ((1440 - 40-70 - 8*3)/1440)*screenwidth, ((tileyoffset+138 + 56*3)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(yf5r, yf5g, yf5b, 255)
          love.graphics.draw(face5, ((1440 - 40-70 - 8*4)/1440)*screenwidth, ((tileyoffset+138 + 56*4)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(yf6r, yf6g, yf6b, 255)
          love.graphics.draw(face6, ((1440 - 40-70 - 8*5)/1440)*screenwidth, ((tileyoffset+138 + 56*5)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)



          love.graphics.setColor(a22r, a22g, a22b, 255)
          love.graphics.draw(faceselector, ((1440 - 40 - 70 - 2 + 82 - (8 * youfaceselector))/1440)*screenwidth, ((tileyoffset+138 - 10 + 56*youfaceselector)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)

        end
        if mechooseface then

          love.graphics.draw(slantbar, 0, 0, 0 ,screenwidth/1440, screenheight/900) 


          love.graphics.setColor(mf1r, mf1g, mf1b, 255)
          love.graphics.draw(face1, ((70)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(mf2r, mf2g, mf2b, 255)
          love.graphics.draw(face2, ((70 + 8)/1440)*screenwidth, ((tileyoffset+138 + 56)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(mf3r, mf3g, mf3b, 255)
          love.graphics.draw(face3, ((70 + 16)/1440)*screenwidth, ((tileyoffset+138 + 56*2)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(mf4r, mf4g, mf4b, 255)
          love.graphics.draw(face4, ((70 + 8*3)/1440)*screenwidth, ((tileyoffset+138 + 56*3)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(mf5r, mf5g, mf5b, 255)
          love.graphics.draw(face5, ((70 + 8*4)/1440)*screenwidth, ((tileyoffset+138 + 56*4)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
          love.graphics.setColor(mf6r, mf6g, mf6b, 255)
          love.graphics.draw(face6, ((70 + 8*5)/1440)*screenwidth, ((tileyoffset+138 + 56*5)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)

          love.graphics.setColor(a31r, a31g, a31b, 255)
          love.graphics.draw(faceselector, ((30 + (8 * mefaceselector))/1440)*screenwidth, ((tileyoffset+138 - 10 + 56*mefaceselector)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        end



        --22
        if youreadytoplay then
          love.graphics.setColor(255, 255, 255, 255)
          love.graphics.draw(ready, ((267 + 720 +rn)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        end

        if mereadytoplay then
          love.graphics.setColor(255, 255, 255, 255)
          love.graphics.draw(ready, ((300-ln)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        end







        drawspine()

        --drawtriangles()

      end



    elseif MENU == "pan" or MENU == "preplay" then 
      love.graphics.setColor(math.abs(streetfade),math.abs(streetfade),math.abs(streetfade,255))
      love.graphics.draw(enviro.sky, 0, 0, 0, 500, screenheight/1500)
      if themap == "library" then 
        love.graphics.draw(enviro.paralax2, enviro.dolly/3 -100,((-floor-100)/2)/1.5 + screenheight-400, 0, .25, .25)
      end
      love.graphics.draw(enviro.paralax, -(enviro.dolly/2) -100, ((-floor-30)/4)/2 + screenheight - 655, 0, .5, .5)
      love.graphics.draw(enviro.floor, -enviro.dolly, (-floor-30)/2 + screenheight, 0, .5, .5)
      me.im = idle
      you.im = idle

    elseif MENU == "play"

    then







      if (themode == "classic" and (you.health < 0 or me.health < 0)) or (themode == "roulette" and (you.lives <= 0 or me.lives <= 0)) then 
        if not backtowhite then
          deathsound:play()
          deathsound2:play()
        end


        if backtowhite then 
          love.graphics.setColor(225,225,225)
        end

        love.graphics.setColor(255-playfadeout,255-playfadeout,255-playfadeout)
        love.graphics.draw(enviro.white, 0, 0, 0, screenwidth, screenheight)
        love.graphics.setColor(0, 0, 0, 255)
        backtowhite = true




        love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
        camera:set()
        love.graphics.setColor(a31r,a31g,a31b,255-playfadeout)
        love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)

        love.graphics.setColor(255,255,255)

        love.graphics.setColor(a22r,a22g,a22b,255-playfadeout)
        love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)

        love.graphics.setColor(255,255,255)

        camera:unset()
        love.graphics.setScissor()







        love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
        camera2:set()

        love.graphics.setColor(a31r,a31g,a31b,255-playfadeout)
        love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)

        love.graphics.setColor(255,255,255)

        love.graphics.setColor(a22r,a22g,a22b,255-playfadeout)
        love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)

        love.graphics.setColor(255,255,255)

        camera2:unset()
        love.graphics.setScissor()

        retry()







      else

        love.graphics.setColor(255,255,255)
        love.graphics.draw(enviro.gray, 0, 0, 10, 10)
        love.graphics.draw(enviro.healthbar, ((me.health - maxhealth)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, screenwidth/1440,1)
        love.graphics.setColor(155, 155, 155, 255)
        love.graphics.draw(enviro.healthbar, screenwidth + ((maxhealth - you.health)/maxhealth)*(screenwidth/2), screenheight-barheight, 0, -screenwidth/1440, 1)
        love.graphics.setColor(255, 255, 255, 255)

        love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
        camera:set()
        drawleft()
        camera:unset()
        love.graphics.setScissor()





        love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
        camera2:set()

        drawright()

        camera2:unset()
        love.graphics.setScissor()

        if onescreen and not vertone then
          if me.x < you.x then 

            love.graphics.setScissor(screenwidth/2, topy,twidth, enviro.screenheight/2)
            camera:set()
            drawleft()
            camera:unset()
            love.graphics.setScissor()

            love.graphics.setScissor(screenwidth/2-twidth+1, bottomy,twidth, enviro.screenheight/2)
            camera2:set()
            drawright()
            camera2:unset()
            love.graphics.setScissor()
          elseif me.x >= you.x then
            love.graphics.setScissor(screenwidth/2-twidth+1, topy,twidth, enviro.screenheight/2)
            camera2:set()
            drawright()
            camera2:unset()
            love.graphics.setScissor()

            love.graphics.setScissor(screenwidth/2, bottomy,twidth, enviro.screenheight/2)
            camera:set()
            drawleft()
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
        mefacerot = 0
        youfacerot = 0


      end
    end

    if not me.actionshot and not you.actionshot and not pause 
    then


      you.yoffset = 0
      me.yoffset = 0
      me.xoffset = 0
      you.xoffset = 0
      mefacerot = 0
      youfacerot = 0

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
          "       animcounter: "..tostring(me.animcounter),10,30)
    end


    flash = false
    --love.graphics.setShader()
    --[[
    boop = joystick:isVibrationSupported()
    if boop then
      love.graphics.print("yeah",100,10,100)
    end
    ]]--

  end
