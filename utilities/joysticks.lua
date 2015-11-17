--Can configure aiming the green thing, hit directly up, left, right, down

--STEPPING UP ANIMATION IF CLIMBING, SO THAT YOU CAN GET UP EVEN IF JUST AT FEET NARROWLY MISS IT

--341a000000000000005f7000000000000
readytounpause = false


doubletime = 14
me.double_down  = false
me.dubtimer = 0
you.double_down  = false
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
controller_menu_h = .8
controller_menu_l = .5
controller_menu_s = .5
controllersReady = false
controller_white_fade=0
controller_black_fade=0

me.using_keyboard = fightclub
you.using_keyboard = fightclub

function drawControllerCheck()

  controllersReady = (me.joystick ~= nil or me.using_keyboard) and (you.joystick ~= nil or you.using_keyboard)

  if controllersReady then
    controllerSetupSong:stop()
  else
    controllerSetupSong:play()
  end

  if controller_white_fade > 5 then 
    if controllersReady then
      controller_white_fade = controller_white_fade/1.035
    else
      controller_white_fade = controller_white_fade/1.03
    end
  else 
    controller_white_fade = 0
  end

  if not me.oldcontrollerready and (me.joystick ~= nil or me.start) then
    controller_white_fade = 255
    me.using_keyboard = true
  end

  if not you.oldcontrollerready and (you.joystick ~= nil or you.start) then
    controller_white_fade = 255
    you.using_keyboard = true
  end

  if not controllersReady then

    controller_menu_h = controller_menu_h + .001
    controller_menu_l = controller_menu_l + math.random()/500
    controller_menu_s = controller_menu_s + math.random()/200


    if controller_menu_h > 1 then
      controller_menu_h = 0
    end 

    if controller_menu_l > .65 then
      controller_menu_l = -.65
    elseif controller_menu_l < 0 and controller_menu_l > -.35 then
      controller_menu_l = .35
    end 

    if controller_menu_s > 1 then
      controller_menu_s = -1
    elseif controller_menu_s < 0 and controller_menu_s > -.7 then
      controller_menu_s = .7
    end 

  else
    controller_menu_s = 255
    controller_menu_l = 255
  end

  t_setColor(hls2rgb(controller_menu_h,math.abs(controller_menu_l),math.abs(controller_menu_s),1))

  lg.rectangle("fill",0,0,screenwidth,screenheight)
  cclear()  

  if me.joystick == nil and not me.using_keyboard then 
    lg.sdraw(p1controllercheck, 720/2, 0)
  elseif you.joystick == nil and not you.using_keyboard then 
    lg.sdraw(p2controllercheck, 720/2, 0)
  end

  if controllersReady then
    lg.setColor(0,0,0)
    lg.rectangle("fill",0,0,screenwidth,screenheight)
  end

  lg.setColor(255,255,255,controller_white_fade)
  lg.rectangle("fill",0,0,screenwidth,screenheight)
  cclear()  

  if controller_white_fade == 0 and controllersReady then
    MODE = "title"
  end

  me.oldcontrollerready = me.joystick ~= nil or me.using_keyboard
  you.oldcontrollerready = you.joystick ~= nil or you.using_keyboard
end

function checkForControllers()
  for i,v in ipairs(love.joystick.getJoysticks()) do
    if me.joystick == nil then
      if v:isGamepadDown("guide") then
        repplay(readysound)
        me.joystick = v
        me.joystickn = i
      end
    end

    if you.joystick == nil and i~=me.joystickn then
      if v:isGamepadDown("guide") then
        repplay(readysound)
      end
      you.joystick = v
      you.joystickn = i
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
  else 
    xx.holda = false
  end

  if (xx.up or xx.down or xx.left or xx.right) then
    if not xx.dirholda then
      xx.dirholda = true
    end
  else 
    xx.dirholda = false
  end

  if xx.rightbumpb then
    xx.rightbumphold = true
  else
    xx.rightbumphold = false
  end

  if xx.leftbumpb then
    xx.leftbumphold = true
  else
    xx.leftbumphold = false
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

me.lrdubtimer = 0
you.lrdubtimer = 0

function doubleDirection(xx)



  if ((not (xx.oldright or xx.oldleft) and xx.lrdubtimer ~= 0) or xx.runtap) and
    ((xx.right and xx.lrdubtimer > 0) or (xx.left and xx.lrdubtimer < 0)) then
    xx.runtap = true
  else
    xx.runtap = false
  end

  if xx.right then
    xx.lrdubtimer = doubletime
  elseif xx.left then
    xx.lrdubtimer = -doubletime
  end

  if xx.lrdubtimer ~= 0 and not runtap then
    xx.lrdubtimer = r2b(xx.lrdubtimer,1,0)
  end

  xx.oldright = xx.right
  xx.oldleft = xx.left

end

function doubleDown(xx)

  if xx.dubtimer >= 0 then
    xx.dubtimer = r2b(xx.dubtimer,1,0)
  end

  if not xx.down and xx.double_down  then
    xx.dubtimer = 0
    xx.double_down  = false
  elseif xx.down and xx.dubtimer > 0 then
    xx.double_down  = true
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
  doubleDirection(xx)
  doubleDown(xx)

  xx.a1 = xx.a1b
  xx.a2 = xx.a2b
  xx.a3 = xx.a3b
  xx.a4 = xx.a4b
  xx.block = xx.blockb
  xx.right = xx.rightb
  xx.left = xx.leftb
  if (xx.cct > 0 and not (xx.rightbumpb or xx.leftbumpb)) or (xx.rightbumpb and xx.leftbumpb) then
    xx.atcc = xx.using_keyboard
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



  me.start = love.keyboard.isDown(" ")
  me.up = love.keyboard.isDown("w")
  me.down = love.keyboard.isDown("s")
  me.leftb = love.keyboard.isDown("a")
  me.rightb = love.keyboard.isDown("d")
  me.a1b = love.keyboard.isDown("lgui") and me.up
  me.a2b = love.keyboard.isDown("lgui") 
  me.a3b = love.keyboard.isDown("lgui")
  me.a4b = love.keyboard.isDown("lgui") and me.down
  me.blockb = love.keyboard.isDown("c")
  me.runb = me.blockb
  me.rightbumpb = love.keyboard.isDown("e")
  me.leftbumpb = love.keyboard.isDown("q")



  you.up = love.keyboard.isDown("o")
  you.down = love.keyboard.isDown("l")
  you.leftb = love.keyboard.isDown("k")
  you.rightb = love.keyboard.isDown(";")
  you.a1b = love.keyboard.isDown("[") and you.up
  you.a2b = love.keyboard.isDown("[")
  you.a3b = love.keyboard.isDown("[")
  you.a4b = love.keyboard.isDown("[") and you.down
  you.blockb = love.keyboard.isDown("=")
  you.start = love.keyboard.isDown(" ")
  you.runb = you.blockb
  you.rightbumpb = love.keyboard.isDown("p")
  you.leftbumpb = love.keyboard.isDown("i")

  me.a1 = you.a1

  if me.a1b or me.a4b then
    me.a2b, me.a3b = false
  end
  if you.a1b or you.a4b then
    you.a2b, you.a3b = false
  end

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
  else 
    return false
  end
end    

function c2accept()    
  if (you.a1 or you.a2 or you.a3 or you.a4 or you.start) then
    return true
  else 
    return false
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
  else 
    backtimer = 0
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
    else 
      ns1 = false
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
    else 
      ns2 = false
    end

    if ns22 and (you.left or you.right or you.up or you.down) then
      you.up = false
      you.down = false
      you.left = false
      you.right = false
    elseif (you.left or you.right or you.up or you.down) then
      ns22 = true
    else 
      ns22 = false
    end

    if ns12 and (me.left or me.right or me.up or me.down) then
      me.up = false
      me.down = false
      me.left = false
      me.right = false
    elseif (me.left or me.right or me.up or me.down) then
      ns12 = true
    else 
      ns12 = false
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

slowbutton = xx.joystick:isGamepadDown("rightshoulder") or xx.joystick:isGamepadDown("leftshoulder")

xx.jly = xx.joystick:getGamepadAxis("lefty")
xx.jlx = xx.joystick:getGamepadAxis("leftx")

xx.leftdeadzone = math.abs(xx.jlx/math.cos(math.atan(-xx.jly/xx.jlx))) < .3

xx.start = xx.joystick:isGamepadDown("start")

if not xx.leftdeadzone then
  xx.angle = math.atan(-xx.joystick:getGamepadAxis("lefty")/(math.abs(xx.joystick:getGamepadAxis("leftx"))))
else 
  xx.angle = 0
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