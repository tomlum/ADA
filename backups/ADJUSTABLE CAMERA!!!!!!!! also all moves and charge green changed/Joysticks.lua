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

    if joystick:getGamepadAxis("leftx") < -.2 then
    	controller1.left = true
    elseif 
    	 joystick:getGamepadAxis("leftx") > .2 then
    	controller1.right = true
    end 

     if joystick:getGamepadAxis("lefty") < -.2 then
    	controller1.down = true
    elseif 
    	 joystick:getGamepadAxis("lefty") > .2 then
    	controller1.up = true
    end 

if joystick:getGamepadAxis("righty") < -.2 then
    	controller1.up = true
    elseif 
    	 joystick:getGamepadAxis("righty") > .2 then
    	controller1.down = true
    end 

    if joystick:getGamepadAxis("rightx") < -.2 then
    	controller1.left = true
    elseif 
    	 joystick:getGamepadAxis("rightx") > .2 then
    	controller1.right = true
    end 
    

end
end