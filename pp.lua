--ppunch3 inserts some p's around
ppunch1im = love.graphics.newImage("me/attack/ppunch1.png")
ppunch2im = love.graphics.newImage("me/attack/ppunch2.png")
ppunch3im = love.graphics.newImage("me/attack/ppunch3.png")
ppunch1c = love.graphics.newImage("me/attack/ppunch1c.png")
ppunch2c = love.graphics.newImage("me/attack/ppunch2c.png")
ppunch3c = love.graphics.newImage("me/attack/ppunch3c.png")
ppunch1 = {im = ppunch1im, c = ppunch1c, xoff = 15}
ppunch2 = {im = ppunch2im, c = ppunch2c, xoff = 45}
ppunch3 = {im = ppunch3im, c = ppunch3c, xoff = 45}
stomp1 = {im=love.graphics.newImage("me/attack/stomp1.png"),c=love.graphics.newImage("me/attack/stomp1c.png")}
stomp2 = {im=love.graphics.newImage("me/attack/stomp2.png"),c=love.graphics.newImage("me/attack/stomp2c.png")}

pa11 = {im=love.graphics.newImage("me/attack/pa11.png"),c=love.graphics.newImage("me/attack/pa11c.png"), xoff = 15, yoff = 30}
pa12 = {im=love.graphics.newImage("me/attack/pa12.png"),c=love.graphics.newImage("me/attack/pa12c.png"), xoff = 15}
pa13 = {im=love.graphics.newImage("me/attack/pa13.png"),c=love.graphics.newImage("me/attack/pa13c.png"), xoff = 15}

apa21 = {im=love.graphics.newImage("me/attack/apa21.png"),c=love.graphics.newImage("me/attack/apa21c.png"), xoff = 15}
apa22 = {im=love.graphics.newImage("me/attack/apa22.png"),c=love.graphics.newImage("me/attack/apa22c.png"), xoff = 15}
apa23 = {im=love.graphics.newImage("me/attack/apa23.png"),c=love.graphics.newImage("me/attack/apa23c.png"), xoff = 45}

apa11 = {im=love.graphics.newImage("me/attack/apa11.png"),c=love.graphics.newImage("me/attack/apa11c.png"), xoff = 45}
apa12 = {im=love.graphics.newImage("me/attack/apa12.png"),c=love.graphics.newImage("me/attack/apa12c.png"), xoff = 45, yoff = 40}
apa13 = {im=love.graphics.newImage("me/attack/apa13.png"),c=love.graphics.newImage("me/attack/apa13c.png"), xoff = 45, yoff = 20}

pp1back = {im=love.graphics.newImage("me/attack/pp1back.png"),c=love.graphics.newImage("me/attack/pp1backc.png"), xoff = 45, yoff = 20}
pp1back2 = {im=love.graphics.newImage("me/attack/pp1back2.png"),c=love.graphics.newImage("me/attack/pp1back2c.png"), xoff = 45, yoff = 40}
pp1back3 = {im=love.graphics.newImage("me/attack/pp1back3.png"),c=love.graphics.newImage("me/attack/pp1back3c.png"), xoff = 45, yoff = 10}
pp1back4 = {im=love.graphics.newImage("me/attack/pp1back4.png"),c=love.graphics.newImage("me/attack/pp1back3c.png"), xoff = 45, yoff = 10}
apk1 = {im=love.graphics.newImage("me/attack/apk1.png"),c=love.graphics.newImage("me/attack/apk1c.png"), xoff = 15, yoff = 10}
apk2 = {im=love.graphics.newImage("me/attack/apk2.png"),c=love.graphics.newImage("me/attack/apk2c.png"), xoff = 15, yoff = 30}

spikesize = 12
function spikegrow(cur, n, xx)
  local vv = cur.verts
  if n == 1 then
    vv[3] = vv[3]+(math.random(3, 9)+math.random()*(spikesize))*cur.lr
    vv[4] = vv[4]-(math.random(10, 20)+math.random()*(spikesize))
    local growmount = vv[5]+(math.random()*(spikesize))*cur.lr

    if growmount > themap.plats[xx.plat.n].x1 and 
    growmount < themap.plats[xx.plat.n].x2 then
      vv[5] = growmount
    end
  elseif n == 2 then
    vv[3] = vv[3]+(math.random(2, 5)+math.random()*(cur.t/5))*cur.lr
    vv[4] = vv[4]-(math.random(10, 20)+math.random()*(cur.t/5))
    local growmount = vv[5]+(math.random(4, 10)+math.random()*(cur.t/5))*cur.lr
    if growmount > themap.plats[xx.plat.n].x1 and 
    growmount < themap.plats[xx.plat.n].x2 then
      vv[5] = growmount
    end
  end

end

quakerange = 200

spikes = {}
you.spikes = {}
me.spikes = {}
spiketimer = 0
me.spikechargetimer = 0
spikecooldown = 15

p4ft = 10

mespikeprime = false
mespikeairprime = false
me.ptopspeed = 0
you.ptopspeed = 0


spikespace = 10

function spikedraw(xx)
  for i = #xx.spikes, 1, -1 do
    love.graphics.setColor(thecolors[1].c.r,thecolors[1].c.g,thecolors[1].c.b)
    local cur = xx.spikes[i] 
    if cur.t >= -3 then


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
      franratio = 1.5
      love.graphics.setColor(thecolors[1].c.r/franratio,thecolors[1].c.g/franratio,thecolors[1].c.b/franratio)
      love.graphics.polygon("line", xx.spikes[i].verts)

    elseif cur.t<-3 then 
      table.remove(xx.spikes,i)
    end
  end
  love.graphics.setColor(255,255,255)
end


function spikeupdate(xx)
  
   if xx.purpgroundtimer < 0 and xx.purpgroundtimer+1*rampspeed >= 0 then
    xx.purpgroundtimer = 0
      xx.numofspikes = 2*at.p.ak.n
    for sn = 0, at.p.ak.n do
        local lverts = {}
        lverts[1]= xx.mid+(xx.lr*20*(sn))
        lverts[2]= xx.feet
        lverts[3]= xx.mid+(xx.lr*20*(sn-1))
        lverts[4]= xx.feet
        lverts[5]= xx.mid+(xx.lr*20*(sn-1))
        lverts[6]= xx.feet
        
        local lverts2 = {}
        lverts2[1]= xx.mid+(-xx.lr*20*(sn))
        lverts2[2]= xx.feet
        lverts2[3]= xx.mid+(-xx.lr*20*(sn))
        lverts2[4]= xx.feet
        lverts2[5]= xx.mid+(-xx.lr*20*(sn))
        lverts2[6]= xx.feet
         if lverts[1] > themap.plats[xx.plat.n].x1+spikesize and 
            lverts[1] < themap.plats[xx.plat.n].x2-spikesize then
        table.insert(xx.spikes,
          {verts = lverts,
            t = 0, lr=-xx.lr}) 
        end
         if lverts2[1] > themap.plats[xx.plat.n].x1+spikesize and 
            lverts2[1] < themap.plats[xx.plat.n].x2-spikesize then
        table.insert(xx.spikes,
          {verts = lverts2,
            t = 0, lr=xx.lr})
        end


    end
  elseif xx.purpgroundtimer < 0 then
    xx.purpgroundtimer = xx.purpgroundtimer + 1*rampspeed
  elseif xx.landingcounter >= at.p.ak.exposedtime and xx.landingcounter-1 < at.p.ak.exposedtime then
    xx.numofspikes = 0
    
  end

  
  for i = #xx.spikes, 1, -1 do
    local cur = xx.spikes[i] 
    local vv = cur.verts
    if cur.t < 0 then
      local vv = xx.spikes[i].verts
      vv[3] = vv[3]-(7*cur.lr)
      vv[4] = vv[4]+(15)
      vv[5] = vv[5]-(6*cur.lr)
      love.graphics.polygon("fill", vv)
    elseif cur.t > 0 and cur.t<5  then
      spikegrow(cur,1, xx)
    elseif cur.t <=7 and cur.t >=5 then
      hboxcs(xx.id, 
        {x=vv[1], y = vv[2]},
        {x=vv[3], y = vv[4]},
        {x=vv[5], y = vv[6]},
        {x=vv[1], y = vv[2]},
        function(z)
          xx.cancombo = true
          xx.hitsomeonewithpurp = true

          z.v = z.v + math.abs((vv[3]-vv[1])/70)*cur.lr
          z.j = z.j + -(vv[4]-vv[2])/30
          z.y = z.y-30
          z.flinch = true
          z.ft = z.ft + p4ft
          z.health = z.health - at.p.k.dam

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
          xx.hitsomeonewithpurp = true
          z.v = -z.v + (cur.lr*2)
          z.j = z.j + 10
          z.flinch = true
          z.ft = z.ft + p4ft
          z.health = z.health - at.p.k.dam/3

        end)
    end


    if xx.numofspikes > 0 then cur.t = cur.t + 1
    elseif cur.t<0 or xx.numofspikes == 0 then 
      if cur.t > 0 then cur.t = 0 else
        cur.t = cur.t - 1
      end
    end
    if cur.t == 2 then 
      makenrubble(cur.verts[3], cur.verts[2], 2*cur.lr,5,7)
    end
  end
end

at.p = {}


at.p.p = {}
at.p.p.dam = 12
at.p.p.ft = 25
at.p.p.kb = 2
at.p.p.max = 4
at.p.p.z = .07

at.p.ap = {}
at.p.ap.kj = -15
at.p.ap.z = .07

at.p.au = {}
at.p.au.dam = 12
at.p.au.ft = 25
at.p.au.kb = 10
at.p.au.kj = 15
at.p.au.z = .07

at.p.p2 = {}
at.p.p2.dam = 12
at.p.p2.ft = 65
at.p.p2.kb = 15
at.p.p2.kj = 15 
at.p.p2.t = 10
at.p.p2.z = .07


at.p.u = {}
at.p.u.dam = 3
at.p.u.ft = 30
at.p.u.kb = 0
at.p.u.kj = 24
at.p.u.z = .07

at.p.k = {}
at.p.k.max = 6
at.p.k.kb = 6
at.p.k.dam = 3

at.p.ak = {}
at.p.ak.penalty = 50
at.p.ak.n = 4
at.p.ak.time = 30
 at.p.ak.exposedtime = 37




me.repcounter = 0
you.repcounter = 0

me.numofspikes = 0
you.numofspikes = 0

pa2busytime = 30
pa4busytime = 10


me.hitsomeonewithpurp = false
you.hitsomeonewithpurp = false 

me.purpgroundtimer = 0
you.purpgroundtimer = 0

function pandp(xx)

  if xx.hitsomeonewithpurp and xx.numofspikes>0 then 
    combo(xx)
    xx.cancombo = true
  end
  
 

  if xx.animcounter > 7 then
    xx.stop = true
  end

  if xx.type ==1 and xx.animcounter < pa2busytime and xx.animcounter > 0  then
    xx.anibusy = true
  elseif xx.type == 2 and xx.animcounter < pa4busytime and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then
    if xx.g then

      if (xx.a2 or xx.a3) then
        xx.type = 1
        xx.animcounter = 1
        xx.repcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.a4 then
        xx.type = 2
        xx.animcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.a1 then
        xx.type = 3
        xx.animcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      end

    else
      if (xx.a2 or xx.a3) then
        xx.type = 4
        xx.animcounter = 1
      elseif xx.a4 then
        xx.type = 5
        xx.animcounter = 1
      elseif xx.a1 then
        xx.type = 6
        xx.animcounter = 1
      end
    end


  else

    if xx.type == 1 then

      if xx.repcounter > 3 then
        if xx.animcounter <  at.p.p2.t then
          xx.im = ppunch3

        elseif xx.animcounter <  at.p.p2.t+2 then
          xx.im = pp1back
          if xx.animcounter >=at.p.p2.t and xx.animcounter < at.p.p2.t+1 then
            hboxcs(xx.id, 
              {x=xx.mid, y = xx.y+6},
              {x=xx.mid+xx.v+(xx.lr*46), y = xx.y+35},
              {x=xx.mid, y = me.y+30},
              {x=xx.mid+xx.v+(xx.lr*60), y = xx.y+40},
              function(z)
                xx.cancombo = true
                z.health = z.health - at.p.p2.dam
                z.v = z.v + xx.lr*at.p.p2.kb + xx.v
                z.flinch = true
                z.ft = z.ft + at.p.p2.ft
                z.j=at.p.p2.kj + xx.j
              shakez(at.p.p2.z)


              end)
          end
        elseif xx.animcounter < at.p.p2.t+4 then
          xx.im = pp1back2
          hboxcs(xx.id, 
            {x=xx.mid+(xx.lr * -17), y = xx.y-31},
            {x=xx.mid+xx.v+(xx.lr*9), y = xx.y-38},
            {x=xx.mid+(xx.lr*-31), y = me.y+13},
            {x=xx.mid+xx.v+(xx.lr*50), y = xx.y+28},
            function(z)
              xx.cancombo = true
              z.health = z.health - at.p.p2.dam
              z.v = z.v -xx.lr*at.p.p2.kb/3 + xx.v
              z.flinch = true
              z.ft = z.ft + at.p.p2.ft
              z.j=at.p.p2.kj*1.5 + xx.j
              shakez(at.p.p2.z)


            end)
        elseif xx.animcounter < at.p.p2.t+39 then
          if xx.animcounter == at.p.p2.t+5 then 
            repplay(xx.purp2)
          end
          xx.im = pp1back4
          
          if xx.animcounter <= at.p.p2.t+5 then 
            hall(xx.id, function(z) if z.plat.n == xx.plat.n
              and math.abs(z.x) - math.abs(xx.x) < quakerange then
                z.j = 10
                z.flinch = true
                z.ft = z.ft+at.p.p.ft*2/3
              end end)
            hboxcs(xx.id, 
              {x=xx.mid, y = xx.y+22},
              {x=xx.mid+xx.v+(xx.lr*-55), y = xx.y+66},
              {x=xx.mid+(xx.lr*-12), y = me.y+37},
              {x=xx.mid+xx.v+(xx.lr*-44), y = xx.y+65},
              function(z)
                xx.cancombo = true
                z.health = z.health - at.p.p2.dam
                z.v = z.v-xx.lr*at.p.p2.kb + xx.v
                z.flinch = true
                z.ft = z.ft + at.p.p2.ft
                shakez(at.p.p2.z)


              end)
            xx.im = pp1back3
          end

        else
          xx.animcounter = 0
        end
      else

        if xx.animcounter < 20 then
          xx.im = ppunch1

        elseif xx.animcounter < 21 then

          xx.im = ppunch2
          makenrubble(xx.mid+xx.lr*20, xx.y+50,3*xx.lr,3,10)
          repplay(xx.purp2)
          if #joysticks>=xx.id then
            xx.joystick:setVibration(1,1)
          end
          hall(xx.id, function(z) if z.plat.n == xx.plat.n
              and math.abs(z.x) - math.abs(xx.x) < quakerange then
                z.j = 10
                z.flinch = true
                z.ft = z.ft+at.p.p.ft*2/3
              end end)

            hboxcs(xx.id, 
              {x=xx.mid, y = xx.y+35},
              {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+26},
              {x=xx.mid, y = me.y+6},
              {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+49},
              function(z)
                xx.cancombo = true
                z.health = z.health - at.p.p.dam
                z.v = xx.lr*at.p.p.kb + xx.v
                z.flinch = true
                z.ft = z.ft + at.p.p.ft/3
                z.j=0
              shakez(at.p.p.z)


              end)

            if xx.repcounter == 1 then
              xx.v = xx.v + (xx.lr*5)
            end

          elseif xx.animcounter < 55 then
            xx.im = ppunch3
            if xx.animcounter >= pa2busytime then 
              combo(xx)
            end

          elseif xx.animcounter >= 55 then
            xx.animcounter = 0
          end
        end

      elseif xx.type == 2 then

        if xx.animcounter < 20 then
          xx.im = stomp1

        elseif xx.animcounter == 20 then
          xx.im = stomp2
          xx.numofspikes = xx.numofspikes+1
          local lverts = {}
          local lverts2 = {}
          local sn = xx.numofspikes
          if (xx.numofspikes <= 2 ) then
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

            if lverts[1] > themap.plats[xx.plat.n].x1+spikesize and 
            lverts[1] < themap.plats[xx.plat.n].x2-spikesize then
              table.insert(xx.spikes, 
                {verts = lverts,
                  t = 0, lr=xx.lr})
              repplay(xx.purpsound)
              end
             if lverts2[1] > themap.plats[xx.plat.n].x1+spikesize and 
            lverts2[1] < themap.plats[xx.plat.n].x2-spikesize then
              table.insert(xx.spikes, 
                {verts = lverts2,
                  t = 0, lr=xx.lr})
            end

          else
            lverts[1]= xx.mid+(xx.lr*40*(sn-1))
            lverts[2]= xx.feet
            lverts[3]= xx.mid+(xx.lr*40*(sn-1))
            lverts[4]= xx.feet
            lverts[5]= xx.mid+(xx.lr*40*(sn-1))
            lverts[6]= xx.feet


            --  lverts2[1]= xx.mid+(xx.lr*25*(sn))
            --  lverts2[2]= xx.feet
            --  lverts2[3]= xx.mid+(xx.lr*25*(sn))
            --  lverts2[4]= xx.feet
            --  lverts2[5]= xx.mid+(xx.lr*25*(sn))
            --  lverts2[6]= xx.feet

            -- table.insert(xx.spikes, 
            --  {verts = lverts2,
            --    t = 0, lr=-1})

            if lverts[1] > themap.plats[xx.plat.n].x1+spikesize and 
            lverts[1] < themap.plats[xx.plat.n].x2-spikesize then

              repplay(xx.purpsound)
              if math.random() > .5 then
                table.insert(xx.spikes,
                  {verts = lverts,
                    t = 0, lr=-1})
              else
                table.insert(xx.spikes,
                  {verts = lverts,
                    t = 0, lr=1})
              end
            end
          end
          if #joysticks>=xx.id then
            xx.joystick:setVibration(1,1)
          end


        elseif xx.animcounter < 60 then
          xx.im = stomp2

          if  xx.a4 and not xx.holda and xx.numofspikes< at.p.k.max then 
            xx.animcounter = 17
          end
        elseif xx.animcounter < 70 then
          xx.im = stomp2
          xx.numofspikes = 0

        else
          xx.im = stomp2
          xx.animcounter = 0
        end

      elseif xx.type ==3 then
        if xx.animcounter < 20 then
          xx.im = pa11

        elseif xx.animcounter < 21 then
          xx.im = pa12
        elseif xx.animcounter < 40 then
          xx.im = pa13
          if xx.animcounter == 21 then

            makenrubble(xx.mid, xx.feet-5, 5,4,7)
            makenrubble(xx.mid, xx.feet-5, -5,4,7)

            repplay(xx.purpsound)
            repplay(xx.purp2)
            me.shake = true 
            hall(xx.id, function(z) if z.plat.n == xx.plat.n then
                  z.j = at.p.u.kj 
                  xx.cancombo = true
                  z.flinch = true
                  z.ft = z.ft+at.p.u.ft
                  z.health = z.health - at.p.u.dam
                end end)

            elseif xx.animcounter > 23 then
              combo(xx)
            end
          else 
            xx.animcounter = 0
          end


        elseif xx.type ==4 then
          if xx.animcounter < 15 then
            xx.im = apa21
          elseif xx.animcounter < 17 then
            xx.im = apa22
          elseif xx.animcounter < 50 then
            xx.im = apa23
            if xx.animcounter == 17 then
              hboxcs(xx.id, 
                {x=xx.mid, y = xx.y+15},
                {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+29},
                {x=xx.mid-5*xx.lr, y = me.y+70},
                {x=xx.mid+xx.v+(xx.lr*18), y = xx.y+57},
                function(z)
                  xx.cancombo = true
                  z.health = z.health - at.p.p.dam
                  z.v = xx.lr*at.p.p.kb
                  z.flinch = true
                  z.ft = z.ft + at.p.p.ft
                  z.j = z.j + xx.j + at.p.ap.kj
                  if z.plat.floor == nil then
                    z.g = false
                  end
              shakez(at.p.ap.z)
                end)
            end
          end


        elseif xx.type == 5 then
          if xx.animcounter < 3 then
            xx.animcounter = 1
            xx.im=apk1
            xx.j = xx.j - 2
            xx.landingcounter = at.p.ak.penalty + at.p.ak.time
             



          elseif xx.animcounter <= 40 then
            xx.im=apk2


          elseif xx.animcounter >= 40 then
            xx.animcounter = 0
          end

        elseif xx.type ==6 then
          if xx.animcounter < 15 then
            xx.im = apa11
          elseif xx.animcounter < 17 then
            xx.im = apa12
            if xx.animcounter == 15 then
              xx.j = xx.j + at.p.au.kj 
              xx.v = xx.v - at.p.au.kb 
              hboxcs(xx.id, 
                {x=xx.mid+(xx.lr * -17), y = xx.y-31},
                {x=xx.mid+xx.v+(xx.lr*9), y = xx.y-38},
                {x=xx.mid+(xx.lr*-31), y = me.y+13},
                {x=xx.mid+xx.v+(xx.lr*50), y = xx.y+28},

                function(z)
                  xx.cancombo = true
                  z.health = z.health - at.p.au.dam
                  z.v = z.v -xx.lr*at.p.au.kb/3 + xx.v
                  z.flinch = true
                  z.ft = z.ft + at.p.au.ft
                  z.j=at.p.au.kj + xx.j
              shakez(at.p.au.z)


                end)
            end
          elseif xx.animcounter < 50 then
            xx.im = apa13

          end
        end
      end

    end