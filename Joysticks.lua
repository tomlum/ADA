--Can configure aiming the green thing, hit directly up, left, right, down

--STEPPING UP ANIMATION IF CLIMBING, SO THAT YOU CAN GET UP EVEN IF JUST AT FEET NARROWLY MISS IT

--341a000000000000005f7000000000000
readytounpause = false


doubletime = 14
me.doubledown = false
me.dubtimer = 0
you.doubledown = false
you.dubtimer = 0
me.superjumptimer = 0
you.superjumptimer = 0

me.rumbleint = 0
you.rumbleint = 0
me.lrum = 0
me.rrum = 0
you.lrum = 0
you.rrum = 0
me.joystickn = 0
you.joystickn = 0

controller_menu_c = genRanColor()

function drawControllerCheck()
  t_colorShift2(controller_menu_c, 1, .5)
  t_setColor(controller_menu_c)  
  lg.rectangle("fill",0,0,screenwidth,screenheight)
  cclear()  
  lg.sdraw(p1controllercheck, 0, 0)
  lg.sdraw(p2controllercheck, 720, 0)

  if debug then
    if too_dark then
      lg.print("too dark", 100,100)
      lg.print(controller_menu_c.r_up, 100,120)
      lg.print(controller_menu_c.g_up, 100,140)
      lg.print(controller_menu_c.b_up, 100,160)
      lg.print(controller_menu_c.r, 140,120)
      lg.print(controller_menu_c.g, 140,140)
      lg.print(controller_menu_c.b, 140,160)
    elseif too_bright then
      lg.setColor(0,0,0)
      lg.print("too bright", 100,100)
      lg.print(controller_menu_c.r_up, 100,120)
      lg.print(controller_menu_c.g_up, 100,140)
      lg.print(controller_menu_c.b_up, 100,160)
      lg.print(controller_menu_c.r, 140,120)
      lg.print(controller_menu_c.g, 140,140)
      lg.print(controller_menu_c.b, 140,160)
    end
  end
  cclear()  
end

function checkForControllers()
  for i,v in ipairs(love.joystick.getJoysticks()) do
    if me.joystick == nil then
      if v:isGamepadDown("guide") then
        me.joystick = v
        me.joystickn = i
      end
    end
    
    if you.joystick == nil and i~=me.joystickn then
      if v:isGamepadDown("guide") then
        you.joystick = v
        you.joystickn = i
      end
    end
  end
  
end

function rumbleme(xx,i)
  if i > xx.rumbleint then
    xx.rumbleint = i
  else
    xx.rumbleint = xx.rumbleint + i/2
  end
end

function rumblemodule(xx)
  if xx.joystick ~= nil then
    base = (xx.cct/colorchangetime)*colorvib
    if xx.rumbleint >= 1 then
      xx.lrum = 1
      xx.rrum = math.min(1, xx.rumbleint - 1)
    else
      xx.lrum = xx.rumbleint 
      xx.rrum = 0
    end
    
    xx.joystick:setVibration(xx.lrum,xx.rrum)
    xx.rumbleint = math.max(base,xx.rumbleint-.05)
    
  end
end




me.clicka = false
you.clicka = false
me.holda = false
you.holda = false




me.dirholda = false
you.dirholda = false
function holdmanage(xx)


  if (xx.a1b or xx.a2b or xx.a3b or xx.a4b or xx.blockb) or (MODE ~= "play" and (xx.rightbump or xx.leftbump)) then
    if not xx.holda then
      xx.holda = true
    end
    else xx.holda = false
    end

    if (xx.up or xx.down or xx.left or xx.right) then
      if not xx.dirholda then
        xx.dirholda = true
      end
      else xx.dirholda = false
      end

    end


    function combomanage(xx)

      if (xx.a1 or xx.a2 or xx.a3 or xx.a4) then
        if not xx.clicka then
          xx.clicka = true
          xx.readya = true
        else 
          xx.readya = false
        end
      else
        xx.clicka = false
        xx.readya = false
      end


  --  if xx.anibusy --or not xx.readya
  --  then
  --    cancelas(xx)
  --  end

  xx.anibusy = false

  if xx.animcounter > 0 then
    xx.block = false
    xx.jstop = true
    if onescreen and vertone then
      xx.animcounter = xx.animcounter+1
    else
      xx.animcounter = xx.animcounter+1*xx.rampspeed
    end
  elseif xx.animcounter == 0 then 
    if not xx.purplanding then
      xx.hitsomeonewithpurp = false
      xx.combo = 0
      xx.cancombo = false
      xx.jstop = false
    end
    xx.attack_num = 0
    xx.repcounter = 0
  end



end
function cancelas(xx) 
  xx.a1, xx.a2, xx.a3, xx.a4 = false, false, false, false
end




function doubledown(xx)

  if xx.dubtimer >= 0 then
    xx.dubtimer = r2b(xx.dubtimer,1,0)
  end

  if not xx.down and xx.doubledown then
    xx.dubtimer = 0
    xx.doubledown = false
  elseif xx.down and xx.dubtimer > 0 then
    xx.doubledown = true
    xx.dubtimer = 10
  elseif not xx.down and xx.dubtimer < 0 then
    xx.dubtimer = doubletime
  elseif xx.down and xx.dubtimer <= 0 and xx.dubtimer > -20 then

    xx.dubtimer = xx.dubtimer - 1
  end

end


function downs() 
  if 
    ((me.down and not me.dirholda) or (you.down and not you.dirholda)) then return true else return false
  end
end

function ups() 
  if 
    ((me.up and not me.dirholda) or (you.up and not you.dirholda)) then return true else return false
  end
end

--things that you need regardless of the input type

--abletochangecolor
me.atcc = true
you.atcc = true

function controlsstuff(xx)
  doubledown(xx)
  
  xx.a1 = xx.a1b
  xx.a2 = xx.a2b
  xx.a3 = xx.a3b
  xx.a4 = xx.a4b
  xx.block = xx.blockb
  xx.right = xx.rightb
  xx.left = xx.leftb
  if (xx.cct > 0 and not (xx.rightbumpb or xx.leftbumpb)) or (xx.rightbumpb and xx.leftbumpb) then
    xx.atcc = false
  elseif xx.cct <=0 then
    xx.atcc = true
  end
  if xx.atcc then
    xx.rightbump = xx.rightbumpb
    xx.leftbump = xx.leftbumpb
  else
    xx.rightbump = false
    xx.leftbump = false
  end
  if xx.blockb then 
    xx.a1 = false
    xx.a2 = false
    xx.a3 = false
    xx.a4 = false
  end

end

function keyboardcontrols()



  me.start = love.keyboard.isDown("q")
  me.up = love.keyboard.isDown("w")
  me.down = love.keyboard.isDown("s")
  me.leftb = love.keyboard.isDown("a")
  me.rightb = love.keyboard.isDown("d")
  me.a1b = love.keyboard.isDown("t")
  me.a2b = love.keyboard.isDown("f")
  me.a3b = love.keyboard.isDown("h")
  me.a4b = love.keyboard.isDown("g")
  me.blockb = love.keyboard.isDown("e")
  me.runb = love.keyboard.isDown("r")
  me.rightbumpb = love.keyboard.isDown("2")
  me.leftbumpb = love.keyboard.isDown("1")



  you.up = love.keyboard.isDown("i")
  you.down = love.keyboard.isDown("k")
  you.leftb = love.keyboard.isDown("j")
  you.rightb = love.keyboard.isDown("l")
  you.a1b = love.keyboard.isDown("up")
  you.a4b = love.keyboard.isDown("down")
  you.a2b = love.keyboard.isDown("left")
  you.a3b = love.keyboard.isDown("right")
  you.blockb = love.keyboard.isDown("o")
  you.start = love.keyboard.isDown("u")
  you.runb = love.keyboard.isDown("p")
  you.rightbumpb = love.keyboard.isDown("0")
  you.leftbumpb = love.keyboard.isDown("9")

  me.a1 = you.a1

end



me.leftdeadzone = false
you.leftdeadzone = false

love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "start", "button", 10)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "leftx", "axis", 1)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "lefty", "axis", 2)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "rightx", "axis", 6)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "righty", "axis", 3)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "leftstick", "button", 5)
love.joystick.setGamepadMapping("341a00000000000005f7000000000000", "rightstick", "button", 6)

--8 z

--10 start

--13 dup
--14 dpright
--15 dpdown
--16 dplet
-- 1 x
-- 2 a
--3 b
--4 y

--5 left bumper
--6 right bumper

--?? 7, 9, 11, 12



ns1 = false
ns2 = false
ns12 = false
ns22 = false

clickclick = false


function c1accept()    
  if (me.a1 or me.a2 or me.a3 or me.a4 or me.start) then
    return true
    else return false
    end
  end    

  function c2accept()    
    if (you.a1 or you.a2 or you.a3 or you.a4 or you.start) then
      return true
      else return false
      end
    end    


    function cancels()
      if
        (me.block and not me.holda) or (you.block and not you.holda) then return true
      else
        return false
      end
    end


    function clicks()

      if MODE == "choose" and (me.block or you.block) then
        backtimer = backtimer + 1
        if backtimer > 50 then backtostage() 
        end
        else backtimer = 0
        end

        if MODE ~= "play" then



          if ns1 and (me.a1 or me.a2 or me.a3 or me.a4 or me.block or me.start) then
            me.a1 = false
            me.a2 = false
            me.a3 = false
            me.a4 = false
            me.block = false
            me.start = false
          elseif (me.a1 or me.a2 or me.a3 or me.a4 or me.block or me.start) then
            ns1 = true
            else ns1 = false
            end

            if ns2 and (you.a1 or you.a2 or you.a3 or you.a4 or you.block or you.start) then
              you.a1 = false
              you.a2 = false
              you.a3 = false
              you.a4 = false
              you.block = false
              you.start = false
            elseif (you.a1 or you.a2 or you.a3 or you.a4 or you.block or you.start) then
              ns2 = true
              else ns2 = false
              end

              if ns22 and (you.left or you.right or you.up or you.down) then
                you.up = false
                you.down = false
                you.left = false
                you.right = false
              elseif (you.left or you.right or you.up or you.down) then
                ns22 = true
                else ns22 = false
                end

                if ns12 and (me.left or me.right or me.up or me.down) then
                  me.up = false
                  me.down = false
                  me.left = false
                  me.right = false
                elseif (me.left or me.right or me.up or me.down) then
                  ns12 = true
                  else ns12 = false
                  end



                end
              end


              you.gupv = 0
              me.gupv = 0
              you.gv = boltspeed
              me.gv = boltspeed

              function jjstick(xx)



                if xx.joystick ~= nil then
                  xx.a4 = false
                  xx.a1 = false
                  xx.a2 = false
                  xx.a3 = false


                  xx.gupv = 0
                  xx.gv = boltspeed

                  xx.jry = xx.joystick:getGamepadAxis("righty")
                  xx.jrx = xx.joystick:getGamepadAxis("rightx")


                  xx.length = math.abs(xx.jrx/math.cos(math.atan(-xx.jry/xx.jrx)))

                  if xx.length > .8 then


                    if (xx.jry/xx.jrx >= 1
                      or xx.jry/xx.jrx <= -1)
                    and xx.jry < 0
                    then
                    xx.a1b = true
                  end

                  if xx.jry/xx.jrx >= -1
                    and xx.jry/xx.jrx <= 1
                    and xx.jrx < 0
                    then
                    xx.a2b = true
                  end

                  if xx.jry/xx.jrx >= -1
                    and xx.jry/xx.jrx <= 1
                    and xx.jrx > 0
                    then
                    xx.a3b = true
                  end

                  if (xx.jry/xx.jrx >= 1
                    or xx.jry/xx.jrx <= -1)
                  and xx.jry > 0
                  then
                  xx.a4b = true
                end
              end





              if xx.joystick:isGamepadDown("dpleft") then
                xx.leftb = true
              elseif xx.joystick:isGamepadDown("dpright") then
                xx.rightb = true
              end

              if xx.joystick:isGamepadDown("dpup") then
                xx.upb = true
              elseif xx.joystick:isGamepadDown("dpdown") then
                xx.downb = true
              end

              if xx.joystick:isGamepadDown("a") then
                xx.up = true
              end


              if xx.joystick:isGamepadDown("leftstick") then
                xx.runb = true
              end 

              if xx.joystick:isGamepadDown("rightstick") then
                xx.blockb = true
              end 
              if xx.joystick:isGamepadDown("start") then
                xx.start = true
              end 



              if xx.joystick:getGamepadAxis("leftx") < -.4 then
                xx.leftb = true
              elseif 
                xx.joystick:getGamepadAxis("leftx")  > .4 then
                xx.rightb = true
              end 

              if xx.runb then

                if 
                  xx.joystick:getGamepadAxis("lefty") > 2 then
                  xx.down = true
                elseif xx.joystick:getGamepadAxis("lefty") < - 2 then
                  xx.up = true
                end 



              else

                if 
                  xx.joystick:getGamepadAxis("lefty") > .5 then
                  xx.down = true
                elseif xx.joystick:getGamepadAxis("lefty") < - .5 then
                  xx.up = true
                end 

              end



  -- if 
  --      xx.joystick:getGamepadAxis("righty") > .4 then
  --     xx.block = true
  -- end 



  xx.rightbumpb = xx.joystick:getGamepadAxis("triggerright") > .5
  xx.leftbumpb = xx.joystick:getGamepadAxis("triggerleft") > .5

  xx.jly = xx.joystick:getGamepadAxis("lefty")
  xx.jlx = xx.joystick:getGamepadAxis("leftx")

  xx.leftdeadzone = math.abs(xx.jlx/math.cos(math.atan(-xx.jly/xx.jlx))) < .3

  xx.start = xx.joystick:isGamepadDown("start")

  if not xx.leftdeadzone then
    xx.angle = math.atan(-xx.joystick:getGamepadAxis("lefty")/(math.abs(xx.joystick:getGamepadAxis("leftx"))))
    else xx.angle = 0
    end
  end
end


function updateControllers()

  checkForControllers()
  keyboardcontrols()
  jjstick(me)
  jjstick(you)
  controlsstuff(me)
  controlsstuff(you)
  rumblemodule(me)
  rumblemodule(you)
  pausing()
end