

function colorcombomonitor(xx, x, y)
  lg.print("me.animcounter"..tostring(xx.animcounter), x, y)
  lg.print("me.cmbo"..tostring(xx.cmbo), x, y+20)
  lg.print("me.color.n"..tostring(xx.color.n), x, y+40)
  lg.print("me.currentc"..tostring(xx.currentc), x, y+60)
  lg.print("me.repcounter"..tostring(xx.repcounter), x, y+80)
end

function cameramonitorf(x,y)

  lg.print("cscale"..tostring(cscale),x,y)
  lg.print("beigedif"..tostring(beigedif),x,y+20)
  lg.print("ydif"..tostring(ydif),x,y+40)
  lg.print("me.y"..tostring(me.y),x,y+60)
  lg.print("midypoint"..tostring(midypoint),x,y+80)
  lg.print("mecamfloor"..tostring(mecamfloor),x,y+100)
  lg.print("youcamfloor"..tostring(youcamfloor),x,y+120)
  lg.print("vertone"..tostring(vertone),x,y+140)
end
