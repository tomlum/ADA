
ppunch1 = love.graphics.newImage("me/attack/ppunch1.png")
ppunch2 = love.graphics.newImage("me/attack/ppunch2.png")
ppunch3 = love.graphics.newImage("me/attack/ppunch3.png")

function pandp(xx, inuse)

  if inuse then

    if xx.animcounter > 7 then
      xx.stop = true
    end
    
    if xx.animcounter < 30 and xx.animcounter > 0  then
      xx.anibusy = true
    end

    if xx.animcounter == 0 then

      if (xx.a2 or xx.a3) then
        xx.type = 1
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end


    else

      if xx.type ==1 then
        if xx.animcounter < 15 then
            xx.im = ppunch1
          xx.xoffset = 15

        elseif xx.animcounter < 17 then
            xx.im = ppunch2
          xx.xoffset = 45
          repplay(xx.blues)
          hboxcs(xx.id, 
            {x=xx.mid, y = xx.y+35},
            {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+26},
            {x=xx.mid, y = me.y+6},
            {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+49},
            function(z)
              z.health = z.health - bbpdam
              if xx.bbpc == animcounter then
                z.v = xx.lr*bbpkb*3
              else
                z.v = xx.lr*bbpkb
              end
              z.flinch = true
              z.ft = bbft

              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, 255,255,255)

            end)
          xx.v = xx.v + (xx.lr*4)

        elseif xx.animcounter < 50 then
          xx.im = ppunch3
          xx.xoffset = 45

          if xx.animcounter >= 35 then 
            combo(xx)
          end

        elseif xx.animcounter >= 50 then
          xx.animcounter = 0
        end



      
      end
    end
  end

end