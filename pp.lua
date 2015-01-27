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

function spikegrow(vv, n)
  if n == 1 then
    vv[3] = vv[3]+(math.random(3, 9)+math.random()*(cur.t/5))*cur.lr
    vv[4] = vv[4]-(math.random(10, 15)+math.random()*(cur.t/5))
    vv[5] = vv[5]+(math.random(1.5,4)+math.random()*(cur.t/5))*cur.lr
  elseif n == 2 then
    vv[3] = vv[3]+(math.random(2, 5)+math.random()*(cur.t/5))*cur.lr
    vv[4] = vv[4]-(math.random(10, 15)+math.random()*(cur.t/5))
    vv[5] = vv[5]+(math.random(4, 10)+math.random()*(cur.t/5))*cur.lr
  end

end

spikes = {}
you.spikes = {}
me.spikes = {}
spiketimer = 0
me.spikechargetimer = 0
spikecooldown = 15

p4ft = 10
p4dam = 6

mespikeprime = false
mespikeairprime = false
me.ptopspeed = 0
you.ptopspeed = 0

spikespace = 10

function spikedraw(xx)
  for i = #xx.spikes, 1, -1 do
    love.graphics.setColor(thecolors[1].c.r,thecolors[1].c.g,thecolors[1].c.b)
    local cur = xx.spikes[i] 
    if cur.t > 0 and cur.t<5  then
      local vv = xx.spikes[i].verts 
      vv[3] = vv[3]+(math.random(3, 9)+math.random()*(cur.t/5))*cur.lr
      vv[4] = vv[4]-(math.random(10, 15)+math.random()*(cur.t/5))
      vv[5] = vv[5]+(math.random(1.5,4)+math.random()*(cur.t/5))*cur.lr

      love.graphics.polygon("fill", vv)

    elseif cur.t >= 5 then


      local vv = xx.spikes[i].verts 


      local vvv = {}
      vvv[1] = vv[1]+20*cur.lr
      vvv[2] = vv[2]
      vvv[3] = vv[3]
      vvv[4] = vv[4]
      vvv[5] = vv[5]
      vvv[6] = vv[6]
      love.graphics.polygon("fill", xx.spikes[i].verts)
      love.graphics.setColor(89,0,104)
      love.graphics.polygon("fill", vvv)
      love.graphics.setColor(2,2,2)
      love.graphics.polygon("line", xx.spikes[i].verts)

    elseif cur.t<-3 then 
      table.remove(xx.spikes,i)
    elseif cur.t < 0 then
      local vv = xx.spikes[i].verts
      vv[3] = vv[3]-(7*cur.lr)
      vv[4] = vv[4]+(15)
      vv[5] = vv[5]-(6*cur.lr)
      love.graphics.polygon("fill", vv)
    end
  end
  love.graphics.setColor(255,255,255)
end


function spikeupdate(xx)
  for i = #xx.spikes, 1, -1 do
    local cur = xx.spikes[i] 
    local vv = cur.verts
    if cur.t <=7 and cur.t >=5 then
      hboxcs(xx.id, 
        {x=vv[1], y = vv[2]},
        {x=vv[3], y = vv[4]},
        {x=vv[5], y = vv[6]},
        {x=vv[1], y = vv[2]},
        function(z)
          z.x = z.x + 3*cur.lr
          z.v = z.v + math.abs((vv[3]-vv[1])/70)*cur.lr
          z.j = z.j + -(vv[4]-vv[2])/30
          z.y = z.y-30
          z.flinch = true
          z.ft = z.ft + p4ft
          z.health = z.health - p4dam
        end)
    elseif cur.t >=6 then
      hboxcs(0, 
        {x=vv[1], y = vv[2]},
        {x=vv[3], y = vv[4]},
        {x=vv[5], y = vv[6]},
        {x=vv[1], y = vv[2]},
        function(z)
          z.v=-z.v*.5
          if z.flinch and math.abs(z.v)>5 then
            z.flinchway = -z.flinchway
          end
        end)
      hboxcs(0, 
        {x=vv[3], y = vv[4]},
        {x=vv[3], y = vv[4]},
        {x=vv[3], y = vv[4]},
        {x=vv[3], y = vv[4]},
        function(z)
          z.v = -z.v + (cur.lr*2)
          z.j = z.j + 6
          z.flinch = true
          z.ft = z.ft + p4ft
          z.health = z.health - p4dam/3
        end)
    end


    if xx.numofspikes > 0 then cur.t = cur.t + 1
    elseif cur.t<0 or xx.numofspikes == 0 then 
      if cur.t > 0 then cur.t = 0 else
        cur.t = cur.t - 1
      end
    end
    if cur.t == 2 then 
      makerubble(cur.verts[3], cur.verts[1], 3,3)
    end
  end
end



ppft = 10
me.ppnum = 0
you.ppnum = 0

numofps = 3
me.numofspikes = 0
you.numofspikes = 0
maxnumofspikes = 6

pa2busytime = 28
pa4busytime = 10



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

      elseif xx.animcounter < 16 then

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
            z.v = xx.lr*bbpkb
            z.flinch = true
            z.ft = z.ft + ppft
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
        local lverts2 = {}
        local sn = xx.numofspikes
        if (xx.numofspikes <= 2 and xx.lr > 0) then
          lverts[1]= xx.mid+(xx.lr*25*(sn-1))
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*25*(sn-1))
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*25*(sn-1))
          lverts[6]= xx.feet

          lverts2[1]= xx.mid+(xx.lr*25*(sn))
          lverts2[2]= xx.feet
          lverts2[3]= xx.mid+(xx.lr*25*(sn))
          lverts2[4]= xx.feet
          lverts2[5]= xx.mid+(xx.lr*25*(sn))
          lverts2[6]= xx.feet

          table.insert(xx.spikes, 
            {verts = lverts,
              t = 0, lr=1})
          table.insert(xx.spikes, 
            {verts = lverts2,
              t = 0, lr=1})
        elseif (xx.numofspikes <= 2 and xx.lr < 0) then
          lverts[1]= xx.mid+(xx.lr*40*(sn-1))
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*40*(sn-1))
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*40*(sn-1))
          lverts[6]= xx.feet

          lverts2[1]= xx.mid+(xx.lr*25*(sn))
          lverts2[2]= xx.feet
          lverts2[3]= xx.mid+(xx.lr*25*(sn))
          lverts2[4]= xx.feet
          lverts2[5]= xx.mid+(xx.lr*25*(sn))
          lverts2[6]= xx.feet

          table.insert(xx.spikes, 
            {verts = lverts2,
              t = 0, lr=-1})

          table.insert(xx.spikes,
            {verts = lverts,
              t = 0, lr=-1})

        elseif math.random()>0 then
          lverts[1]= xx.mid+(xx.lr*25*(sn-1))
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*25*(sn-1))
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*25*(sn-1))
          lverts[6]= xx.feet
          table.insert(xx.spikes, 
            {verts = lverts,
              t = 0, lr=1})


          lverts2[1]= xx.mid+(xx.lr*25*(sn))
          lverts2[2]= xx.feet
          lverts2[3]= xx.mid+(xx.lr*25*(sn))
          lverts2[4]= xx.feet
          lverts2[5]= xx.mid+(xx.lr*25*(sn))
          lverts2[6]= xx.feet

          table.insert(xx.spikes, 
            {verts = lverts2,
              t = 0, lr=1})

        else
          lverts[1]= xx.mid+(xx.lr*40*(sn-1))
          lverts[2]= xx.feet
          lverts[3]= xx.mid+(xx.lr*40*(sn-1))
          lverts[4]= xx.feet
          lverts[5]= xx.mid+(xx.lr*40*(sn-1))
          lverts[6]= xx.feet


          lverts2[1]= xx.mid+(xx.lr*25*(sn))
          lverts2[2]= xx.feet
          lverts2[3]= xx.mid+(xx.lr*25*(sn))
          lverts2[4]= xx.feet
          lverts2[5]= xx.mid+(xx.lr*25*(sn))
          lverts2[6]= xx.feet

          table.insert(xx.spikes, 
            {verts = lverts2,
              t = 0, lr=-1})

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
        if xx.animcounter >= 17 then 
          combo(xx, function()
              if (xx.a1 or xx.a2 or xx.a3) and xx.combo < xx.maxcombo-1 then
                xx.numofspikes = 0
              end
            end)
        end
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

