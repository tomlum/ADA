xboxbase = lg.newImage("images/enviro/xboxbase.png")
xboxlstick = lg.newImage("images/enviro/xboxlstick.png")
xboxrstick = lg.newImage("images/enviro/xboxrstick.png")
xboxjoystick = lg.newImage("images/enviro/xboxjoystick.png")
xboxtrigger = lg.newImage("images/enviro/xboxtrigger.png")

training_wheels = true

function  drawTrainingWheels()
  if training_wheels then
    if me.using_keyboard then
      drawKeyboardControls1(22, screenheight-100, 2)
    end
    if you.using_keyboard then
      drawKeyboardControls2(screenwidth-540, screenheight-30, 2)
    end
  end
  drawSpacebar()
end


function monitorParticles(x,y)
  lg.print("leaves: " .. #leaves .. 
    "| rubble: " .. #rubble ..  
    "| glasseses: " .. #glasseses ..  
    "| clouds: " .. #clouds ..  
    "| dust: " .. #dust ..    
    "| sparks: " .. #sparks ..  
    "| papers: " .. #papers 
    ,x,y)
end


function drawKeyboardControls3(x, y, scale)
  setFontSize(9*scale)
  cclear()
  drawKey("u", x+(21*6)*scale, y-16*scale, scale)

  drawKey("o", x+(21*8)*scale, y-16*scale, scale)
  drawKey("k", x+(4+21*7)*scale, y, scale)
  drawKey("l", x+(4+21*8)*scale, y, scale)
  drawKey(";", x+(4+21*9)*scale, y, scale)
  setFontSize(font_size)

end

function drawKeyboardControls1(x, y, scale)
  setFontSize(9*scale)
  cclear()

  drawKey("w", x+(21)*scale, y-16*scale, scale)
  drawKey("a", x+(4+0)*scale, y, scale)
  drawKey("s", x+(4+21*1)*scale, y, scale)
  drawKey("d", x+(4+21*2)*scale, y, scale)
  
  lg.setColor(80,80,80)
  drawBlackKey("c", x+(10+21*2)*scale, y+16*scale, scale)
  if OS_String == "OS X" then
    lg.setColor(80,80,80)
    drawBlackKey("lgui", x+(24)*scale, y+32*scale, scale)
  else
    lg.setColor(80,80,80)
    drawBlackKey("lalt", x+(32)*scale, y+32*scale, scale)
  end
  setFontSize(9*scale)
  lg.setColor(me.color.c.r,me.color.c.g,me.color.c.b)
  drawKey("v", x+(10+21*3)*scale, y+16*scale, scale)

  cclear()
  setFontSize(font_size)
end

function drawKeyboardControls2(x, y, scale)
  setFontSize(9*scale)

  if youpuppet then
    cclear()

    lg.setColor(80,80,80)
    drawBlackKey("=", x+(-6+21*11)*scale, y-32*scale, scale,"c")

    lg.setColor(80,80,80)
    drawBlackKey("[", x+(21*10)*scale, y-16*scale, scale,"lgui")
    setFontSize(9*scale)

    drawKey("o", x+(21*8)*scale, y-16*scale, scale,"w")
    drawKey("k", x+(4+21*7)*scale, y, scale,"a")
    drawKey("l", x+(4+21*8)*scale, y, scale,"s")
    drawKey(";", x+(4+21*9)*scale, y, scale,"d")
    lg.setColor(you.color.c.r,you.color.c.g,you.color.c.b)
    drawKey("backspace", x+(-6+21*12)*scale, y-32*scale, scale,"v")

    setFontSize(font_size)

  else
    cclear()

    lg.setColor(80,80,80)
    drawBlackKey("=", x+(-6+21*11)*scale, y-32*scale, scale)

    lg.setColor(80,80,80)
    drawBlackKey("[", x+(21*10)*scale, y-16*scale, scale)
    setFontSize(9*scale)

    drawKey("o", x+(21*8)*scale, y-16*scale, scale)
    drawKey("k", x+(4+21*7)*scale, y, scale)
    drawKey("l", x+(4+21*8)*scale, y, scale)
    drawKey(";", x+(4+21*9)*scale, y, scale)
    lg.setColor(you.color.c.r,you.color.c.g,you.color.c.b)
    drawKey("backspace", x+(-6+21*12)*scale, y-32*scale, scale)

    setFontSize(font_size)
  end
end

function drawKeyboard(x, y, scale)


  drawKey("1", x+(-6+0)*scale, y-32*scale, scale)
  drawKey("2", x+(-6+21*1)*scale, y-32*scale, scale)
  drawKey("3", x+(-6+21*2)*scale, y-32*scale, scale)
  drawKey("4", x+(-6+21*3)*scale, y-32*scale, scale)
  drawKey("5", x+(-6+21*4)*scale, y-32*scale, scale)
  drawKey("6", x+(-6+21*5)*scale, y-32*scale, scale)
  drawKey("7", x+(-6+21*6)*scale, y-32*scale, scale)
  drawKey("8", x+(-6+21*7)*scale, y-32*scale, scale)
  drawKey("9", x+(-6+21*8)*scale, y-32*scale, scale)
  drawKey("0", x+(-6+21*9)*scale, y-32*scale, scale)
  drawKey("-", x+(-6+21*10)*scale, y-32*scale, scale)
  drawKey("=", x+(-6+21*11)*scale, y-32*scale, scale)

  drawKey("q", x+(0)*scale, y-16*scale, scale)
  drawKey("w", x+(21*1)*scale, y-16*scale, scale)
  drawKey("e", x+(21*2)*scale, y-16*scale, scale)
  drawKey("r", x+(21*3)*scale, y-16*scale, scale)
  drawKey("t", x+(21*4)*scale, y-16*scale, scale)
  drawKey("y", x+(21*5)*scale, y-16*scale, scale)
  drawKey("u", x+(21*6)*scale, y-16*scale, scale)
  drawKey("i", x+(21*7)*scale, y-16*scale, scale)
  drawKey("o", x+(21*8)*scale, y-16*scale, scale)
  drawKey("p", x+(21*9)*scale, y-16*scale, scale)
  drawKey("[", x+(21*10)*scale, y-16*scale, scale)
  drawKey("]", x+(21*11)*scale, y-16*scale, scale)
  drawKey("\\", x+(21*12)*scale, y-16*scale, scale)

  drawKey("a", x+(4+0)*scale, y, scale)
  drawKey("s", x+(4+21*1)*scale, y, scale)
  drawKey("d", x+(4+21*2)*scale, y, scale)
  drawKey("f", x+(4+21*3)*scale, y, scale)
  drawKey("g", x+(4+21*4)*scale, y, scale)
  drawKey("h", x+(4+21*5)*scale, y, scale)
  drawKey("j", x+(4+21*6)*scale, y, scale)
  drawKey("k", x+(4+21*7)*scale, y, scale)
  drawKey("l", x+(4+21*8)*scale, y, scale)
  drawKey(";", x+(4+21*9)*scale, y, scale)
  drawKey("'", x+(4+21*10)*scale, y, scale)

  drawKey("z", x+(10+0)*scale, y+16*scale, scale)
  drawKey("x", x+(10+21*1)*scale, y+16*scale, scale)
  drawKey("c", x+(10+21*2)*scale, y+16*scale, scale)
  drawKey("v", x+(10+21*3)*scale, y+16*scale, scale)
  drawKey("b", x+(10+21*4)*scale, y+16*scale, scale)
  drawKey("n", x+(10+21*5)*scale, y+16*scale, scale)
  drawKey("m", x+(10+21*6)*scale, y+16*scale, scale)
  drawKey(",", x+(10+21*7)*scale, y+16*scale, scale)
  drawKey(".", x+(10+21*8)*scale, y+16*scale, scale)
  drawKey("/", x+(10+21*9)*scale, y+16*scale, scale)
  drawKey("lalt", x+(32)*scale, y+32*scale, scale)
  --drawKey("lgui", x+(45)*scale, y+32*scale, scale)
end


function drawController(x,y,joystick,scale)

  lg.draw(xboxtrigger, -6.5*scale+x, -10*scale+y, 0, scale*4/5, scale*4/5*(1-(joystick:getGamepadAxis("triggerleft"))), 2, 3)
  lg.draw(xboxtrigger, 6.5*scale+x, -10*scale+y, 0, scale*4/5, scale*4/5*(1-(joystick:getGamepadAxis("triggerright"))), 1, 3)

  lg.draw(xboxbase, x, y, 0, scale, scale, 14, 11)

  if joystick:isGamepadDown("rightstick") then
    lg.setColor(190,190,190)
    lg.draw(xboxjoystick, 4*scale+x+joystick:getGamepadAxis("rightx")*scale*1.8, y+joystick:getGamepadAxis("righty")*scale*1.8, 0, scale*4/5, scale*4/5, 2, 2)
  else  
    cclear()
    lg.draw(xboxjoystick, 4*scale+x+joystick:getGamepadAxis("rightx")*scale*1.8, y+joystick:getGamepadAxis("righty")*scale*1.8, 0, scale, scale, 2, 2)
  end

  if joystick:isGamepadDown("leftstick") then
    lg.setColor(190,190,190)
    lg.draw(xboxjoystick, -7*scale+x+joystick:getGamepadAxis("leftx")*scale*1.8, -5*scale+y+joystick:getGamepadAxis("lefty")*scale*1.8, 0, scale*4/5, scale*4/5, 2, 2)
  else  
    cclear()
    lg.draw(xboxjoystick, -7*scale+x+joystick:getGamepadAxis("leftx")*scale*1.8, -5*scale+y+joystick:getGamepadAxis("lefty")*scale*1.8, 0, scale, scale, 2, 2)
  end
  --lg.draw(xboxlstick, x+joystick:getGamepadAxis("leftx")*scale*1.8, y+joystick:getGamepadAxis("lefty")*scale*1.5, 0, scale, scale, 14, 11)
  --lg.draw(xboxrstick, x+joystick:getGamepadAxis("rightx")*scale*1.8, y+joystick:getGamepadAxis("righty")*scale*1.5, 0, scale, scale, 14, 11)
end


function fallmonitor(xx, x, y)
  lg.print("me.ft"..tostring(xx.ft), x, y)
  lg.print("me.falltimer"..tostring(xx.falltimer), x, y+20)
  lg.print("me.falling"..tostring(xx.falling), x, y+40)
  lg.print("me.flinch"..tostring(xx.flinch), x, y+60)
  lg.print("me.extratimer"..tostring(xx.extratimer), x, y+80)
end

function colorcombomonitor(xx, x, y)
  lg.print("me.animcounter"..tostring(xx.animcounter), x, y)
  lg.print("me.cmbo"..tostring(xx.cmbo), x, y+20)
  lg.print("me.color.n"..tostring(xx.color.n), x, y+40)
  lg.print("me.currentc"..tostring(xx.currentc), x, y+60)
  lg.print("me.repcounter"..tostring(xx.repcounter), x, y+80)
end

function cameraoutline()
  bo(0, 0, screenwidth/2, playheight, "light purple")
  bo(screenwidth/2, 0, screenwidth/2, playheight, "red")

  if onescreen and not vertone then
    if me.x < you.x then 
      bo(screenwidth/2, topy,twidth, playheight/2, "teal")
      bo(screenwidth/2-twidth+1, bottomy,twidth, playheight/2,"yellow")
    elseif me.x >= you.x then
      bo(screenwidth/2-twidth+1, topy,twidth, playheight/2, "teal")
      bo(screenwidth/2, bottomy,twidth, playheight/2, "yellow")
    end

  end
end

function cameramonitor(x,y)

  lg.print("cscale"..tostring(cscale),x,y)
  lg.print("beigedif*cscale"..tostring(beigedif*cscale),x,y+20)
  lg.print("ydif"..tostring(ydif),x,y+40)
  lg.print("me.y"..tostring(me.y),x,y+60)
  lg.print("midypoint"..tostring(midypoint),x,y+80)
  lg.print("mecamfloor"..tostring(mecamfloor),x,y+100)
  lg.print("youcamfloor"..tostring(youcamfloor),x,y+120)
  lg.print("vertone"..tostring(vertone),x,y+140)
  lg.print("minzoom"..tostring(minzoom),x,y+160)
  lg.print("maxzoom"..tostring(maxzoom),x,y+180)
  lg.print("head2ceiling"..tostring(head2ceiling),x,y+200)
  lg.print("feet2bottom"..tostring(feet2bottom),x,y+220)

end

function dangermonitor(x,y)

 lg.print("dangerclose"..tostring(dangerclose), x, y)
 lg.print("rampspeed"..tostring(rampspeed), x, y+20)
 lg.print("cscale"..tostring(cscale), x, y+40)
 lg.print("dangerZoom"..tostring(dangerZoom), x, y+60)
 lg.print("minzoom"..tostring(minzoom), x, y+80)
 lg.print("maxzoom"..tostring(maxzoom), x, y+100)

end