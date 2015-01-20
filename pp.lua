--ppunch3 inserts some p's around
ppunch1im = love.graphics.newImage("me/attack/ppunch1.png")
ppunch2im = love.graphics.newImage("me/attack/ppunch2.png")
ppunch3im = love.graphics.newImage("me/attack/ppunch3.png")
ppunch1c = love.graphics.newImage("me/attack/ppunch1c.png")
ppunch2c = love.graphics.newImage("me/attack/ppunch2c.png")
ppunch3c = love.graphics.newImage("me/attack/ppunch3c.png")
ppunch1 = {im = ppunch1im, c = ppunch1c}
ppunch2 = {im = ppunch2im, c = ppunch2c}
ppunch3 = {im = ppunch3im, c = ppunch3c}
stomp1 = {im=love.graphics.newImage("me/attack/stomp1.png"),c=love.graphics.newImage("me/attack/stomp1c.png")}
stomp2 = {im=love.graphics.newImage("me/attack/stomp2.png"),c=love.graphics.newImage("me/attack/stomp2c.png")}

ppft = 20
me.ppnum = 0
you.ppnum = 0

numofps = 3
me.numofspikes = 0
you.numofspikes = 0
maxnumofspikes = 6

pa2busytime = 28
pa4busytime = 12
function pandp(xx)


  if xx.animcounter > 7 then
    xx.stop = true
  end

  if xx.type ==1 and xx.animcounter < pa2busytime and xx.animcounter > 0  then
    xx.anibusy = true
  elseif xx.type == 2 and xx.animcounter < pa4busytime and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then


    if (xx.a2 or xx.a3) then
      xx.type = 1
      xx.animcounter = 1
      xx.ppnum = 1
      xx.combo = xx.combo + 1
    elseif xx.a4 then
      xx.type = 2
      xx.animcounter = 1
      xx.ppnum = 1
      xx.combo = xx.combo + 1
    end


  else

    if xx.type == 1 then
      if xx.animcounter < 15 then
        xx.im = ppunch1
        xx.xoffset = 15

      elseif xx.animcounter < 17 then

        xx.im = ppunch2
        xx.xoffset = 45
        makerubble(xx.mid+xx.lr*20, xx.y+50,3*xx.lr,3)
        repplay(xx.purpsound)
        if #joysticks>=xx.id then
          xx.joystick:setVibration(1,1)
        end

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
            z.ft = ppft
            minzoom = defaultminzoom - .06
            maxzoom = defaultmaxzoom - .06

            makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

          end)

        if xx.ppnum == 1 then
          xx.v = xx.v + (xx.lr*5)
        end

      elseif xx.animcounter < 55 then
        xx.im = ppunch3
        xx.xoffset = 45
        if xx.animcounter >= pa2busytime then 
          combo(xx)
        end

      elseif xx.animcounter >= 55 then
        xx.animcounter = 0
      end

    elseif xx.type == 2 then
      if xx.animcounter < 8 then
        xx.im = stomp1

      elseif xx.animcounter == 8 then
        xx.im = stomp2
        xx.numofspikes = xx.numofspikes+1
        local lverts = {}
        local sn = xx.numofspikes
        if (xx.numofspikes <= 2 and xx.lr > 0) then
          lverts[1]= xx.mid+(xx.lr*20*sn)
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*20*sn)
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*20*sn)
          lverts[6]= xx.feet
          table.insert(xx.spikes, 
            {verts = lverts,
              t = 0, lr=1})
      elseif (xx.numofspikes <= 2 and xx.lr < 0) then
          lverts[1]= xx.mid+(xx.lr*34*sn)
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*34*sn)
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*34*sn)
          lverts[6]= xx.feet
          table.insert(xx.spikes,
            {verts = lverts,
              t = 0, lr=-1})
        
      elseif math.random()>.5 then
          lverts[1]= xx.mid+(xx.lr*20*sn)
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*20*sn)
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*20*sn)
          lverts[6]= xx.feet
          table.insert(xx.spikes, 
            {verts = lverts,
              t = 0, lr=1})
        else
          lverts[1]= xx.mid+(xx.lr*34*sn)
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*34*sn)
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*34*sn)
          lverts[6]= xx.feet
          table.insert(xx.spikes,
            {verts = lverts,
              t = 0, lr=-1})
        end
        repplay(xx.purpsound)
        if #joysticks>=xx.id then
          xx.joystick:setVibration(1,1)
        end


      elseif xx.animcounter < 50 then
        xx.im = stomp2
        if xx.animcounter >= pa4busytime and xx.a4 and not xx.holda and xx.numofspikes< maxnumofspikes then 
          xx.animcounter = 1
        end
      elseif xx.animcounter < 72 then
        xx.im = stomp2
        xx.numofspikes = 0
      elseif xx.animcounter >= 72 then
        xx.im = stomp2
        xx.animcounter = 0
      end

    end
  end
end

