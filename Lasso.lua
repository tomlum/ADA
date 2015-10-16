lasso = true
lassowidth = 15
lassocracks = 0
lassodurability = 100
readytobreak = false


function lassoScreen()
  if lassoisathing then
    if ((onescreen and not oldonescreen) or 
      (vertone and not oldvertone)) then
    lasso = true
  end

  if lassocracks >= lassodurability then
    readytobreak = true
  end

  if lasso then

    if not onescreen and oldonescreen then
      if readytobreak then
        lasso = false
      else
        lassocracks = lassocracks +1
        onescreen = true
        if me.mid < midpoint then
          if me.v < 0 then
            me.v = -me.v*1
          end
          if you.v > 0 then
            you.v = -you.v*1
          end
        else
          if me.v > 0 then
            me.v = -me.v*1
          end
          if you.v < 0 then
            you.v = -you.v*1
          end
        end
      end
    end

    if not vertone and oldvertone then
      if readytobreak then
        lasso = false
      else
        lassocracks = lassocracks +1
        vertone = true
        if me.y < midypoint then
          if me.j > 0 then
            me.j = -me.j
          end
          if you.j < 0 then
            if you.j > -4 then
              you.j = 15 else
              you.j = -you.j
            end
          end
        else
          if me.j < 0 then
            if me.j > -4 then
              me.j = 15 else
              me.j = -me.j
            end
          end
          if you.j > 0 then
            you.j = -you.j
          end
        end
      end
    end
  end
  if lasso then
    lg.setColor(backgroundcolor.r,backgroundcolor.g,backgroundcolor.b)
    lg.rectangle("fill", 0, 0, screenwidth, lassowidth)
    lg.rectangle("fill", 0, 0, lassowidth, screenheight)
    lg.rectangle("fill", 0, screenheight-lassowidth, screenwidth, lassowidth)
    lg.rectangle("fill", screenwidth-lassowidth, 0, lassowidth, screenheight)
    lg.setColor(255,255,255)
  end
end

if readytobreak and not lasso then
  readytobreak = false
  lassocracks = 0
  makensparks(camera.x,camera.y,10, 0, 255,255,255, 100)
  makensparks(camera.x+screenwidth,camera.y,10, 0, 255,255,255, 100)
  makensparks(camera.x,camera.y+screenheight,10, 0, 255,255,255, 100)
end

oldvertone = vertone
oldonescreen = onescreen
end