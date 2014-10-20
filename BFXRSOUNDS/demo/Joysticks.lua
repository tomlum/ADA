--341a000000000000005f7000000000000

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


    




function joysticks()
stupid = 1

if not joystick then stupid = 2
else


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

    if joystick2:isGamepadDown("b") then
        controller2.block = true
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

     if 
         joystick2:getGamepadAxis("lefty") < -.4 then
        controller2.up = true
    elseif 
         joystick2:getGamepadAxis("lefty") > .4 then
        controller2.down = true
    end 

if 
         joystick2:getGamepadAxis("righty") > .4 then
        controller2.block = true
    end 

  

    if joystick2:getGamepadAxis("triggerleft") > .5 or joystick2:getGamepadAxis("triggerright") > .5 then
        controller2.block = true
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

    if joystick:isGamepadDown("b") then
        controller1.block = true
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

    if 
         joystick:getGamepadAxis("lefty") > .4 then
        controller1.down = true
    elseif joystick:getGamepadAxis("lefty") < - .4 then
        controller1.up = true
    end 

    if 
         joystick:getGamepadAxis("righty") > .4 then
        controller1.block = true
    end 

 

    if joystick:getGamepadAxis("triggerleft") > .5 or joystick:getGamepadAxis("triggerright") > .5 then
        controller1.block = true
    end
    




end
end