

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

function cameramonitorf(x,y)

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

function dangermonitorf(x,y)
 lg.print("dangerclose"..tostring(dangerclose), x, y)
      lg.print("rampspeed"..tostring(rampspeed), x, y+20)
      lg.print("cscale"..tostring(cscale), x, y+40)
      lg.print("dangerZoom"..tostring(dangerZoom), x, y+60)
      lg.print("minzoom"..tostring(minzoom), x, y+80)
      lg.print("maxzoom"..tostring(maxzoom), x, y+100)
     end