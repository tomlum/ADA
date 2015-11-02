xboxbase = lg.newImage("images/enviro/xboxbase.png")
xboxlstick = lg.newImage("images/enviro/xboxlstick.png")
xboxrstick = lg.newImage("images/enviro/xboxrstick.png")
xboxjoystick = lg.newImage("images/enviro/xboxjoystick.png")
xboxtrigger = lg.newImage("images/enviro/xboxtrigger.png")


function drawController(x,y,joystick,scale)
  lg.draw(xboxbase, x, y, 0, scale, scale, 14, 11)

    lg.draw(xboxtrigger, 8*scale+x, 3*scale+y, 0, scale*4/5, scale*4/5*(1-(xx.joystick:getGamepadAxis("triggerleft"))), 2, 3)
    lg.draw(xboxtrigger, 20*scale+x, 3*scale+y, 0, scale*4/5, scale*4/5*(1-(xx.joystick:getGamepadAxis("triggerright"))), 1, 3)

  if joystick:isGamepadDown("rightstick") then
    lg.setColor(190,190,190)
    lg.draw(xboxjoystick, 4*scale+x+joystick:getGamepadAxis("rightx")*scale*1.8, y+joystick:getGamepadAxis("righty")*scale*1.8, 0, scale*4/5, scale*4/5, 2, 2)
  else  
    cclear()
    lg.draw(xboxjoystick, 4*scale+x+joystick:getGamepadAxis("rightx")*scale*1.8, y+joystick:getGamepadAxis("righty")*scale*1.8, 0, scale, scale, 2, 2)
  end

  if joystick:isGamepadDown("leftstick") then
    lg.setColor(190,190,190)
    lg.draw(xboxjoystick, -7*scale+x+ajoystick:getGamepadAxis("leftx")*scale*1.8, -5*scale+y+ajoystick:getGamepadAxis("lefty")*scale*1.8, 0, scale*4/5, scale*4/5, 2, 2)
  else  
    cclear()
    lg.draw(xboxjoystick, -7*scale+x+ajoystick:getGamepadAxis("leftx")*scale*1.8, -5*scale+y+ajoystick:getGamepadAxis("lefty")*scale*1.8, 0, scale, scale, 2, 2)
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