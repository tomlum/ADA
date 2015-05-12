redp1 = {im=love.graphics.newImage("me/attack/redp1.png"), r = love.graphics.newImage("me/attack/redp1r.png"),
  c = love.graphics.newImage("me/attack/redp1c.png"),
  xoff = 25,yoff = -10, cxoff = 22, cyoff = 7}
redp2 = {im=love.graphics.newImage("me/attack/redp2.png"), r = love.graphics.newImage("me/attack/redp2r.png"),
  c = love.graphics.newImage("me/attack/redp2c.png"), xoff = 7,yoff = -7, cxoff = 9, cyoff = 7}
redp3 = {im=love.graphics.newImage("me/attack/redp3.png"), xoff = 13,yoff = -5, cxoff = 2, cyoff = 15}
redp4 = {im=love.graphics.newImage("me/attack/redp4.png"), xoff = 7,yoff = 10, cxoff = 2, cyoff = 15}
redp5 = {im=love.graphics.newImage("me/attack/redp5.png"), xoff = 25,yoff = -13, cxoff = 2, cyoff = 15}


me.rlvl = 1
you.rlvl = 1

reddelta = 5
at.r = {}
at.r.p = {}
at.r.p.maxv = 12

function randr(xx)


  if xx.animcounter == 0 then

    if xx.g then

      if (xx.a2 or xx.a3) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.type = 1
        rumbleme(xx, .01)

      end
    end
  else
      xx.stop = true

    if xx.type == 1 then
      if xx.repcounter%2 == 1 then

        if xx.animcounter < 28 - reddelta*xx.rlvl then
          if xx.repcounter == 1 then
            xx.im = redp1
          else
            xx.im = redp5
          end
        elseif xx.animcounter < 28 - reddelta*xx.rlvl +3 then
          xx.im = redp2
          if math.abs(xx.v)<at.r.p.maxv then
            xx.v = xx.v + xx.lr*3
          end
        elseif xx.animcounter < 57 - reddelta*xx.rlvl then
          xx.im = redp3
          combo(xx)

        elseif xx.animcounter >= 57 - reddelta*xx.rlvl then
          xx.animcounter = 0
          xx.repcounter = 0
        end

      elseif xx.repcounter%2 == 0 then
        if xx.animcounter < 28-7 - reddelta*xx.rlvl then
          
            xx.im = redp3
        elseif xx.animcounter < 28-7 - reddelta*xx.rlvl +4 then
          xx.im = redp4
          if math.abs(xx.v)<at.r.p.maxv then
            xx.v = xx.v + xx.lr*1
          end
        elseif xx.animcounter < 57-7 - reddelta*xx.rlvl then
          xx.im = redp5
          combo(xx)
        elseif xx.animcounter >= 57-7 - reddelta*xx.rlvl then
          xx.animcounter = 0
          xx.repcounter = 0
        end




      end





    end
  end
end