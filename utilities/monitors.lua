xboxbase = lg.newImage("images/enviro/xboxbase.png")
xboxlstick = lg.newImage("images/enviro/xboxlstick.png")
xboxrstick = lg.newImage("images/enviro/xboxrstick.png")
xboxjoystick = lg.newImage("images/enviro/xboxjoystick.png")
xboxtrigger = lg.newImage("images/enviro/xboxtrigger.png")


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

function drawKeyboardControls1(x, y, scale)
  drawKey("w", x+(21*1)*scale, y-16*scale, scale)

  drawKey("a", x+(7+0)*scale, y, scale)
  drawKey("s", x+(7+21*1)*scale, y, scale)
  drawKey("d", x+(7+21*2)*scale, y, scale)
  
  drawKey("x", x+(14+21*1)*scale, y+16*scale, scale)
  drawKey("c", x+(14+21*2)*scale, y+16*scale, scale)
  drawKey("v", x+(14+21*3)*scale, y+16*scale, scale)

  drawKey("lgui", x+(28)*scale, y+32*scale, scale)

end

function drawKeyboard(x, y, scale)
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

  drawKey("a", x+(7+0)*scale, y, scale)
  drawKey("s", x+(7+21*1)*scale, y, scale)
  drawKey("d", x+(7+21*2)*scale, y, scale)
  drawKey("f", x+(7+21*3)*scale, y, scale)
  drawKey("g", x+(7+21*4)*scale, y, scale)
  drawKey("h", x+(7+21*5)*scale, y, scale)
  drawKey("j", x+(7+21*6)*scale, y, scale)
  drawKey("k", x+(7+21*7)*scale, y, scale)
  drawKey("l", x+(7+21*8)*scale, y, scale)
  drawKey(";", x+(7+21*9)*scale, y, scale)
  drawKey("'", x+(7+21*10)*scale, y, scale)

  drawKey("z", x+(14+0)*scale, y+16*scale, scale)
  drawKey("x", x+(14+21*1)*scale, y+16*scale, scale)
  drawKey("c", x+(14+21*2)*scale, y+16*scale, scale)
  drawKey("v", x+(14+21*3)*scale, y+16*scale, scale)
  drawKey("b", x+(14+21*4)*scale, y+16*scale, scale)
  drawKey("n", x+(14+21*5)*scale, y+16*scale, scale)
  drawKey("m", x+(14+21*6)*scale, y+16*scale, scale)
  drawKey(",", x+(14+21*7)*scale, y+16*scale, scale)
  drawKey(".", x+(14+21*8)*scale, y+16*scale, scale)
  drawKey("/", x+(14+21*9)*scale, y+16*scale, scale)
  drawKey("lgui", x+(28)*scale, y+32*scale, scale)
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