--STEPPING UP ANIMATION IF CLIMBING, SO THAT YOU CAN GET UP EVEN IF JUST AT FEET NARROWLY MISS IT

--setvibration is in attack, currently commented out

--341a000000000000005f7000000000000

justone = true

controller1.leftdeadzone = false
controller2.leftdeadzone = false

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
    if (controller1.a1 or controller1.a2 or controller1.a3 or controller1.a4 or controller1.block or controller1.start) then
        return true
    else return false
    end
end    

function c2accept()    
    if (controller2.a1 or controller2.a2 or controller2.a3 or controller2.a4 or controller2.block or controller2.start) then
        return true
    else return false
    end
end    

function clicks()

    if MENU == "choose" and (controller1.block or controller2.block) then
        backtimer = backtimer + 1
        if backtimer > 50 then backtostage() 
        end
    else backtimer = 0
    end

    if MENU ~= "play" then


    
    if ns1 and (controller1.a1 or controller1.a2 or controller1.a3 or controller1.a4 or controller1.block or controller1.start) then
        controller1.a1 = false
        controller1.a2 = false
        controller1.a3 = false
        controller1.a4 = false
        controller1.block = false
        controller1.start = false
    elseif (controller1.a1 or controller1.a2 or controller1.a3 or controller1.a4 or controller1.block or controller1.start) then
        ns1 = true
    else ns1 = false
    end

    if ns2 and (controller2.a1 or controller2.a2 or controller2.a3 or controller2.a4 or controller2.block or controller2.start) then
        controller2.a1 = false
        controller2.a2 = false
        controller2.a3 = false
        controller2.a4 = false
        controller2.block = false
        controller2.start = false
    elseif (controller2.a1 or controller2.a2 or controller2.a3 or controller2.a4 or controller2.block or controller2.start) then
        ns2 = true
    else ns2 = false
    end

     if ns22 and (controller2.left or controller2.right or controller2.up or controller2.down) then
        controller2.up = false
        controller2.down = false
        controller2.left = false
        controller2.right = false
    elseif (controller2.left or controller2.right or controller2.up or controller2.down) then
        ns22 = true
    else ns22 = false
    end

     if ns12 and (controller1.left or controller1.right or controller1.up or controller1.down) then
        controller1.up = false
        controller1.down = false
        controller1.left = false
        controller1.right = false
    elseif (controller1.left or controller1.right or controller1.up or controller1.down) then
        ns12 = true
    else ns12 = false
    end



end
end




function joystickss()
stupid = 1
yougupv = 0
megupv = 0
yougv = boltspeed
megv = boltspeed



if not joystick then stupid = 2
else

if not justone then

    if joystick2:isGamepadDown("dpleft") then
       controller2.left = true
    elseif joystick2:isGamepadDown("dpright") then
        controller2.right = true
    end

    if joystick2:isGamepadDown("dpup") then
       controller2.up = true
    elseif joystick2:isGamepadDown("dpdown") then
        controller2.down = true
    end
 
    if joystick2:isGamepadDown("a") then
        controller2.up = true
    end

    if joystick2:isGamepadDown("x") then
        controller2.a1 = true
    end

    if joystick2:isGamepadDown("leftshoulder") then
        controller2.a2 = true
    end

    if joystick2:isGamepadDown("rightshoulder") then
        controller2.a3 = true
    end 

    if joystick2:isGamepadDown("rightstick") then
        controller2.block = true
    end 
    
    if joystick2:isGamepadDown("leftstick") then
        controller2.run = true
    end 
      if joystick2:isGamepadDown("start") then
        controller2.start = true
    end 


    if joystick2:getGamepadAxis("leftx") < -.4 then
        controller2.left = true
    elseif 
         joystick2:getGamepadAxis("leftx") > .4 then
        controller2.right = true
    end 

  if controller2.run then
    
     if 
         joystick2:getGamepadAxis("lefty") < -.58 then
        controller2.up = true
    elseif 
         joystick2:getGamepadAxis("lefty") > .58 then
        controller2.down = true
    end 
    
    else

     if 
         joystick2:getGamepadAxis("lefty") < -.5 then
        controller2.up = true
    elseif 
         joystick2:getGamepadAxis("lefty") > .5 then
        controller2.down = true
    end 
    end

    j2ry = joystick2:getGamepadAxis("righty")
    j2rx = joystick2:getGamepadAxis("rightx")
    
     j2ly = joystick2:getGamepadAxis("lefty")
    j2lx = joystick2:getGamepadAxis("leftx")

    length2 = math.abs(j2rx/math.cos(math.atan(-j2ry/j2rx)))


    controller2.a1 = false
    controller2.a2 = false
    controller2.a3 = false
    controller2.a4 = false
    
    
    
  
   if length2 > .8 then
     

        --if (j2ry/j2rx >= 0.41421356237
       --or j2ry/j2rx <= -0.41421356237)

        if (j2ry/j2rx >= 0.45421356237
        or j2ry/j2rx <= -0.45421356237)
        and j2ry < 0
           then
        controller2.a1 = true
        end

        if j2ry/j2rx >= -1.75
        and j2ry/j2rx <= 1.75
        and j2rx < 0
           then
             if flip2 > 0 then
        controller2.a2 = true
      elseif flip2 < 0 then 
        controller2.a3 = true
        end
        end

        if j2ry/j2rx >= -1.75
        and j2ry/j2rx <= 1.75
        and j2rx > 0
           then
        if flip2 > 0 then
        controller2.a3 = true
      elseif flip2 < 0 then 
        controller2.a2 = true
        end
        end

        if (j2ry/j2rx >= 0.45421356237
        or j2ry/j2rx <= -0.45421356237)
        and j2ry > 0
           then
        controller2.a4 = true
      end
      
      
      
end


    controller2.leftdeadzone = math.abs(j2lx/math.cos(math.atan(-j2ly/j2lx))) > .4


if controller2.leftdeadzone then
youangle = math.atan(-joystick2:getGamepadAxis("lefty")/(math.abs(joystick2:getGamepadAxis("leftx"))))
yougupv = boltspeed*math.sin(youangle)
yougv = boltspeed*math.cos(youangle)
end
end



end


   controller1.a4 = false
    controller1.a1 = false
    controller1.a2 = false
    controller1.a3 = false


 

    j1ry = joystick:getGamepadAxis("righty")
    j1rx = joystick:getGamepadAxis("rightx")
    

    length1 = math.abs(j1rx/math.cos(math.atan(-j1ry/j1rx)))

    if length1 > .8 then
      

        if (j1ry/j1rx >= 0.45411356137
        or j1ry/j1rx <= -0.45411356137)
        and j1ry < 0
           then
        controller1.a1 = true
        end

        if j1ry/j1rx >= -1.75
        and j1ry/j1rx <= 1.75
        and j1rx < 0
           then
        if flip1 > 0 then
        controller1.a2 = true
      elseif flip1 < 0 then 
        controller1.a3 = true
        end
        end

        if j1ry/j1rx >= -1.75
        and j1ry/j1rx <= 1.75
        and j1rx > 0
           then
        if flip1 > 0 then
        controller1.a3 = true
      elseif flip1 < 0 then 
        controller1.a2 = true
        end
        end

        if (j1ry/j1rx >= 0.45411356137
        or j1ry/j1rx <= -0.45411356137)
        and j1ry > 0
           then
        controller1.a4 = true
        end
end





    if joystick:isGamepadDown("dpleft") then
       controller1.left = true
    elseif joystick:isGamepadDown("dpright") then
        controller1.right = true
    end

    if joystick:isGamepadDown("dpup") then
       controller1.up = true
    elseif joystick:isGamepadDown("dpdown") then
        controller1.down = true
    end
 
    if joystick:isGamepadDown("a") then
        controller1.up = true
    end

    if joystick:isGamepadDown("x") then
        controller1.a1 = true
    end

    if joystick:isGamepadDown("leftshoulder") then
        controller1.a2 = true
    end

    if joystick:isGamepadDown("rightshoulder") then
        controller1.a3 = true
    end 

    if joystick:isGamepadDown("rightstick") then
        controller1.block = true
    end 
    
    if joystick:isGamepadDown("leftstick") then
        controller1.run = true
    end 
      if joystick:isGamepadDown("start") then
        controller1.start = true
    end 


    if joystick:getGamepadAxis("leftx") < -.4 then
        controller1.left = true
    elseif 
         joystick:getGamepadAxis("leftx") > .4 then
        controller1.right = true
    end 

    if controller1.run then
      
      if 
         joystick:getGamepadAxis("lefty") > .58 then
        controller1.down = true
    elseif joystick:getGamepadAxis("lefty") < - .58 then
        controller1.up = true
    end 
      
      
      else

    if 
         joystick:getGamepadAxis("lefty") > .5 then
        controller1.down = true
    elseif joystick:getGamepadAxis("lefty") < - .5 then
        controller1.up = true
    end 
    
    end

    -- if 
    --      joystick:getGamepadAxis("righty") > .4 then
    --     controller1.block = true
    -- end 

 

    if joystick:getGamepadAxis("triggerleft") > .5 or joystick:getGamepadAxis("triggerright") > .5 then
        controller1.block = true
    end
    
    
    j1ly = joystick:getGamepadAxis("lefty")
    j1lx = joystick:getGamepadAxis("leftx")
    
   controller1.leftdeadzone = math.abs(j1lx/math.cos(math.atan(-j1ly/j1lx))) > .4
    

    
if controller1.leftdeadzone then
meangle = math.atan(-joystick:getGamepadAxis("lefty")/(math.abs(joystick:getGamepadAxis("leftx"))))
megupv = boltspeed*math.sin(meangle)
megv = boltspeed*math.cos(meangle)
end






  

end