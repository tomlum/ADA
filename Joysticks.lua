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




function joystickss()
stupid = 1
yougupv = 0
megupv = 0
yougv = boltspeed
megv = boltspeed
yougpv = boltspeed/2
megpv = boltspeed/2
megpupv = 0
yougpupv = 0



if not joystick then stupid = 2
else

if not justone then

    if joystick2:isGamepadDown("dpleft") then
       you.left = true
    elseif joystick2:isGamepadDown("dpright") then
        you.right = true
    end

    if joystick2:isGamepadDown("dpup") then
       you.up = true
    elseif joystick2:isGamepadDown("dpdown") then
        you.down = true
    end
 
    if joystick2:isGamepadDown("a") then
        you.up = true
    end

    if joystick2:isGamepadDown("x") then
        you.a1 = true
    end

    if joystick2:isGamepadDown("leftshoulder") then
        you.a2 = true
    end

    if joystick2:isGamepadDown("rightshoulder") then
        you.a3 = true
    end 

    if joystick2:isGamepadDown("rightstick") then
        you.block = true
    end 
    
    if joystick2:isGamepadDown("leftstick") then
        you.run = true
    end 
      if joystick2:isGamepadDown("start") then
        you.start = true
    end 


    if joystick2:getGamepadAxis("leftx") < -.4 then
        you.left = true
    elseif 
         joystick2:getGamepadAxis("leftx") > .4 then
        you.right = true
    end 

  if you.run then
    
     if 
         joystick2:getGamepadAxis("lefty") < -.58 then
        you.up = true
    elseif 
         joystick2:getGamepadAxis("lefty") > .58 then
        you.down = true
    end 
    
    else

     if 
         joystick2:getGamepadAxis("lefty") < -.5 then
        you.up = true
    elseif 
         joystick2:getGamepadAxis("lefty") > .5 then
        you.down = true
    end 
    end

    j2ry = joystick2:getGamepadAxis("righty")
    j2rx = joystick2:getGamepadAxis("rightx")
    
     j2ly = joystick2:getGamepadAxis("lefty")
    j2lx = joystick2:getGamepadAxis("leftx")

    length2 = math.abs(j2rx/math.cos(math.atan(-j2ry/j2rx)))


    you.a1 = false
    you.a2 = false
    you.a3 = false
    you.a4 = false
    
    
    
  
   if length2 > .8 then
     

        --if (j2ry/j2rx >= 0.41421356237
       --or j2ry/j2rx <= -0.41421356237)

        if (j2ry/j2rx >= 0.45421356237
        or j2ry/j2rx <= -0.45421356237)
        and j2ry < 0
           then
        you.a1 = true
        end

        if j2ry/j2rx >= -1.75
        and j2ry/j2rx <= 1.75
        and j2rx < 0
           then
             if flip2 > 0 then
        you.a2 = true
      elseif flip2 < 0 then 
        you.a3 = true
        end
        end

        if j2ry/j2rx >= -1.75
        and j2ry/j2rx <= 1.75
        and j2rx > 0
           then
        if flip2 > 0 then
        you.a3 = true
      elseif flip2 < 0 then 
        you.a2 = true
        end
        end

        if (j2ry/j2rx >= 0.45421356237
        or j2ry/j2rx <= -0.45421356237)
        and j2ry > 0
           then
        you.a4 = true
      end
      
      
      
end


    you.leftdeadzone = math.abs(j2lx/math.cos(math.atan(-j2ly/j2lx))) < .3


if not you.leftdeadzone then
youangle = math.atan(-joystick2:getGamepadAxis("lefty")/(math.abs(joystick2:getGamepadAxis("leftx"))))
else youangle = 0
end


yougupv = boltspeed*math.sin(youangle)
yougv = boltspeed*math.cos(youangle)


if ((youangle >= math.rad(0) and you.g) or not you.g) then
yougpupv = pboltspeed*math.sin(math.max(youangle, math.rad(-40)))
yougpv = pboltspeed*math.cos(math.max(youangle, math.rad(-40)))
else
yougpupv = pboltspeed*math.sin(0)
yougpv = pboltspeed*math.cos(0)

end



   





end






   me.a4 = false
    me.a1 = false
    me.a2 = false
    me.a3 = false


 
    j1ry = joystick:getGamepadAxis("righty")
    j1rx = joystick:getGamepadAxis("rightx")
    
    
    length1 = math.abs(j1rx/math.cos(math.atan(-j1ry/j1rx)))

    if length1 > .8 then
      

        if (j1ry/j1rx >= 0.45411356137
        or j1ry/j1rx <= -0.45411356137)
        and j1ry < 0
           then
        me.a1 = true
        end

        if j1ry/j1rx >= -1.75
        and j1ry/j1rx <= 1.75
        and j1rx < 0
           then
        if flip1 > 0 then
        me.a2 = true
      elseif flip1 < 0 then 
        me.a3 = true
        end
        end

        if j1ry/j1rx >= -1.75
        and j1ry/j1rx <= 1.75
        and j1rx > 0
           then
        if flip1 > 0 then
        me.a3 = true
      elseif flip1 < 0 then 
        me.a2 = true
        end
        end

        if (j1ry/j1rx >= 0.45411356137
        or j1ry/j1rx <= -0.45411356137)
        and j1ry > 0
           then
        me.a4 = true
        end
end





    if joystick:isGamepadDown("dpleft") then
       me.left = true
    elseif joystick:isGamepadDown("dpright") then
        me.right = true
    end

    if joystick:isGamepadDown("dpup") then
       me.up = true
    elseif joystick:isGamepadDown("dpdown") then
        me.down = true
    end
 
    if joystick:isGamepadDown("a") then
        me.up = true
    end

    if joystick:isGamepadDown("x") then
        me.a1 = true
    end

    if joystick:isGamepadDown("leftshoulder") then
        me.a2 = true
    end

    if joystick:isGamepadDown("rightshoulder") then
        me.a3 = true
    end 

    if joystick:isGamepadDown("rightstick") then
        me.block = true
    end 
    
    if joystick:isGamepadDown("leftstick") then
        me.run = true
    end 
      if joystick:isGamepadDown("start") then
        me.start = true
    end 


    if joystick:getGamepadAxis("leftx") < -.4 then
        me.left = true
    elseif 
         joystick:getGamepadAxis("leftx") > .4 then
        me.right = true
    end 

    if me.run then
      
      if 
         joystick:getGamepadAxis("lefty") > .58 then
        me.down = true
    elseif joystick:getGamepadAxis("lefty") < - .58 then
        me.up = true
    end 
      
      
      else

    if 
         joystick:getGamepadAxis("lefty") > .5 then
        me.down = true
    elseif joystick:getGamepadAxis("lefty") < - .5 then
        me.up = true
    end 
    
    end

    -- if 
    --      joystick:getGamepadAxis("righty") > .4 then
    --     me.block = true
    -- end 

 

    if joystick:getGamepadAxis("triggerleft") > .5 or joystick:getGamepadAxis("triggerright") > .5 then
        me.block = true
    end
    
    
    j1ly = joystick:getGamepadAxis("lefty")
    j1lx = joystick:getGamepadAxis("leftx")
    
   me.leftdeadzone = math.abs(j1lx/math.cos(math.atan(-j1ly/j1lx))) < .3
    

    
if not me.leftdeadzone then
meangle = math.atan(-joystick:getGamepadAxis("lefty")/(math.abs(joystick:getGamepadAxis("leftx"))))
else meangle = 0
end

megupv = boltspeed*math.sin(meangle)
megv = boltspeed*math.cos(meangle)

if ((meangle >= math.rad(0) and me.g) or not me.g) then
megpupv = pboltspeed*math.sin(math.max(meangle, math.rad(-40)))
megpv = pboltspeed*math.cos(math.max(meangle, math.rad(-40)))
else
megpupv = pboltspeed*math.sin(0)
megpv = pboltspeed*math.cos(0)

end





end
  

end