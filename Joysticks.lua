--STEPPING UP ANIMATION IF CLIMBING, SO THAT YOU CAN GET UP EVEN IF JUST AT FEET NARROWLY MISS IT

--setvibration is in attack, currently commented out

--341a000000000000005f7000000000000



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
  if (me.a1 or me.a2 or me.a3 or me.a4 or me.block or me.start) then
    return true
  else return false
  end
end    

function c2accept()    
  if (you.a1 or you.a2 or you.a3 or you.a4 or you.block or you.start) then
    return true
  else return false
  end
end    

function clicks()

  if MENU == "choose" and (me.block or you.block) then
    backtimer = backtimer + 1
    if backtimer > 50 then backtostage() 
    end
  else backtimer = 0
  end

  if MENU ~= "play" then



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
      xx.a1 = true
    end

    if xx.jry/xx.jrx >= -1
    and xx.jry/xx.jrx <= 1
    and xx.jrx < 0
    then
      if xx.flip > 0 then
        xx.a2 = true
      elseif xx.flip < 0 then 
        xx.a3 = true
      end
    end

    if xx.jry/xx.jrx >= -1
    and xx.jry/xx.jrx <= 1
    and xx.jrx > 0
    then
      if xx.flip > 0 then
        xx.a3 = true
      elseif xx.flip < 0 then 
        xx.a2 = true
      end
    end

    if (xx.jry/xx.jrx >= 1
      or xx.jry/xx.jrx <= -1)
    and xx.jry > 0
    then
      xx.a4 = true
    end
  end





  if xx.joystick:isGamepadDown("dpleft") then
    xx.left = true
  elseif xx.joystick:isGamepadDown("dpright") then
    xx.right = true
  end

  if xx.joystick:isGamepadDown("dpup") then
    xx.up = true
  elseif xx.joystick:isGamepadDown("dpdown") then
    xx.down = true
  end

  if xx.joystick:isGamepadDown("a") then
    xx.up = true
  end


  if xx.joystick:isGamepadDown("rightshoulder") and xx.joystick:isGamepadDown("leftshoulder") then
    xx.block = true
  end 

  if xx.joystick:isGamepadDown("leftstick") then
    xx.run = true
  end 
  if xx.joystick:isGamepadDown("start") then
    xx.start = true
  end 



  if xx.joystick:getGamepadAxis("leftx") < -.4 then
    xx.left = true
  elseif 
  xx.joystick:getGamepadAxis("leftx") > .4 then
    xx.right = true
  end 

  if xx.run then

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



    xx.rightb = xx.joystick:getGamepadAxis("triggerright") > .5
    xx.leftb = xx.joystick:getGamepadAxis("triggerleft") > .5

  xx.jly = xx.joystick:getGamepadAxis("lefty")
  xx.jlx = xx.joystick:getGamepadAxis("leftx")

  xx.leftdeadzone = math.abs(xx.jlx/math.cos(math.atan(-xx.jly/xx.jlx))) < .3



  if not xx.leftdeadzone then
    xx.angle = math.atan(-xx.joystick:getGamepadAxis("lefty")/(math.abs(xx.joystick:getGamepadAxis("leftx"))))
  else xx.angle = 0
  end

  xx.gv = boltspeed*math.cos(xx.angle)







end