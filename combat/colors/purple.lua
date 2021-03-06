--ppunch3 inserts some p's around
ppunch1 = {im = lg.newImage("images/player/attack/purple/ppunch1.png"), ppunch1im, xoff = 10, yoff = 10}
ppunch2 = {im = lg.newImage("images/player/attack/purple/ppunch2.png"), xoff = 5}
ppunch3 = {im = lg.newImage("images/player/attack/purple/ppunch3.png"), xoff = 5, yoff = -5}
stomp1 = {im=lg.newImage("images/player/attack/purple/stomp1.png")}
stomp2 = {im=lg.newImage("images/player/attack/purple/stomp2.png")}

pa11 = {im=lg.newImage("images/player/attack/purple/pa11.png"), xoff = -2, yoff = 20}
pa12 = {im=lg.newImage("images/player/attack/purple/pa12.png"), xoff = 2, yoff = -2}
pa13 = {im=lg.newImage("images/player/attack/purple/pa13.png"), xoff = 4, yoff = -6}

apa21 = {im=lg.newImage("images/player/attack/purple/apa21.png"), xoff = 2,yoff = -1, extra_height = 5}
apa22 = {im=lg.newImage("images/player/attack/purple/apa22.png"), xoff = 0, yoff = -1, extra_height = 5}
apa23 = {im=lg.newImage("images/player/attack/purple/apa23.png"), xoff = 3, yoff = -4, extra_height = 5}

apa11 = {im=lg.newImage("images/player/attack/purple/apa11.png"), xoff = 5, yoff = -3, extra_height = 5}
apa12 = {im=lg.newImage("images/player/attack/purple/apa12.png"), xoff = 13, yoff = 38, extra_height = 5}
apa13 = {im=lg.newImage("images/player/attack/purple/apa13.png"), xoff = 26, yoff = 8, extra_height = 5}

pp1back = {im=lg.newImage("images/player/attack/purple/pp1back.png"), xoff = -2, yoff = 2}
pp1back2 = {im=lg.newImage("images/player/attack/purple/pp1back2.png"), xoff = 10, yoff = 38}
pp1back3 = {im=lg.newImage("images/player/attack/purple/pp1back3.png"), xoff = 37, yoff = -4}
pp1back4 = {im=lg.newImage("images/player/attack/purple/pp1back4.png"), xoff = 37, yoff = -8}
apk1 = {im=lg.newImage("images/player/attack/purple/apk1.png"),extra_height = 5}
apk2 = {im=lg.newImage("images/player/attack/purple/apk2.png"), xoff = 0, yoff = -15}


spikesize = 12

spikecooldown = 15

mespikeprime = false
mespikeairprime = false
me.ptopspeed = 0
you.ptopspeed = 0

at.p = {}

me.hitsomeonewithpurp = false
you.hitsomeonewithpurp = false 

me.purpgroundtimer = 0
you.purpgroundtimer = 0

at.p.p = {}
at.p.p.dam = 12
at.p.p.ft = 25
at.p.p.kb = 3
at.p.p.max = 4
at.p.p.z = 4

at.p.ap = {}
at.p.ap.kj = -15
at.p.ap.z = 4

at.p.au = {}
at.p.au.dam = 12
at.p.au.ft = 25
at.p.au.kb = 10
at.p.au.kj = 15
at.p.au.z = 4

at.p.p2 = {}
at.p.p2.dam = 12
at.p.p2.ft = 65
at.p.p2.kb = 15
at.p.p2.kj = 15 
at.p.p2.t = 10
at.p.p2.z = 5


at.p.u = {}
at.p.u.dam = 3
at.p.u.ft = 30
at.p.u.kb = 0
at.p.u.kj = 24
at.p.u.z = 4
at.p.u.range = 200

at.p.k = {}
at.p.k.max = 6
at.p.k.kb = 6
at.p.k.dam = 5
at.p.k.duration = 0
at.p.k.ft = 0

at.p.ak = {}
at.p.ak.penalty = 50
at.p.ak.n = 4
at.p.ak.time = 30
at.p.ak.exposedtime = 30

me.numofspikes = 0
you.numofspikes = 0

pa2busytime = 30
pa4busytime = 10

spikespace = 10

function spikegrow(cur, n, xx)
  local vv = cur.verts
  if n == 1 then
    vv[3] = vv[3]+(floRan(3, 20))*cur.lr
    vv[4] = vv[4]-(floRan(10, 30))
    local growmount = vv[5]+(math.random()*(spikesize))*cur.lr

    if growmount > the_map.plats[xx.plat.n].x1 and 
      growmount < the_map.plats[xx.plat.n].x2 then
      vv[5] = growmount
    end
  elseif n == 2 then
    vv[3] = vv[3]+(floRan(2, 5))*cur.lr
    vv[4] = vv[4]-(floRan(10, 20))
    local growmount = vv[5]+(math.random(4, 10)+math.random()*(cur.t/5))*cur.lr
    if growmount > the_map.plats[xx.plat.n].x1 and 
      growmount < the_map.plats[xx.plat.n].x2 then
      vv[5] = growmount
    end
  end

end

function dopurpakspikes(xx)
  if xx.purplanding then
    xx.no_spikes = false
  end
  if xx.purpgroundtimer > 0 and xx.purpgroundtimer <= 1.3 then
    xx.purpgroundtimer = 0
    xx.numofspikes = 2*at.p.ak.n
    repplay(xx.purp2)
    
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

      if lverts[1] > the_map.plats[xx.plat.n].x1+spikesize and 
        lverts[1] < the_map.plats[xx.plat.n].x2-spikesize then
        table.insert(xx.spikes,
          {verts = lverts,
          t = 0, lr=-xx.lr}) 
      end

      if lverts2[1] > the_map.plats[xx.plat.n].x1+spikesize and 
        lverts2[1] < the_map.plats[xx.plat.n].x2-spikesize then
        table.insert(xx.spikes,
          {verts = lverts2,
          t = 0, lr=xx.lr})
      end


    end
  elseif xx.purpgroundtimer < 0 then
    xx.purpgroundtimer = xx.purpgroundtimer + 1*ramp(xx)
  elseif xx.landing_counter < at.p.ak.exposedtime then
    xx.no_spikes = true
  end


end


function spikedraw(xx)
  for i,cur in ipairs(xx.spikes) do
    t_setColor(thecolors[1].c)
    if cur.t >= -3 then


      local vv = cur.verts 


      local vvv = {}
      vvv[1] = vv[1]+20*cur.lr
      vvv[2] = vv[2]
      vvv[3] = vv[3]
      vvv[4] = vv[4]
      vvv[5] = vv[5]
      vvv[6] = vv[6]
      lg.polygon("fill", cur.verts)
      lg.setColor(thecolors[1].c.r/2,thecolors[1].c.g/2,thecolors[1].c.b/2)
      lg.polygon("fill", vvv)
      franratio = 1.5
      lg.setColor(thecolors[1].c.r/franratio,thecolors[1].c.g/franratio,thecolors[1].c.b/franratio)
      lg.polygon("line", cur.verts)

    end
  end
  lg.setColor(255,255,255)
end


function spikeupdate(xx)

  for i,cur in ipairs(xx.spikes) do
    local vv = cur.verts

    if cur.t<-3 then 
      table.remove(xx.spikes,i)
    else
      if cur.t < 0 then
        vv[3] = vv[3]+cur.lr*math.abs(vv[1]-vv[3])/4
        vv[4] = vv[4]+(vv[2]-vv[4])/4
        vv[5] = vv[5]+cur.lr*math.abs(vv[1]-vv[5])/4
        lg.polygon("fill", vv)
      elseif cur.t > 0 and cur.t < 5  then
        spikegrow(cur,1,xx)
        if cur.t > 3 then
          hexHit(xx, xx.id, 
            {x=vv[1], y = vv[2]},
            {x=vv[3], y = vv[4]},
            {x=vv[5], y = vv[6]},
            {x=vv[1]+1, y = vv[2]+1},
            function(z)
              xx.cancombo = true
              xx.hitsomeonewithpurp = true
              z.v = z.v + math.abs((vv[3]-vv[1])/(20))*cur.lr
              z.j = z.j + (vv[2]-vv[4])/6
              z.flinch = true
              z.ft = z.ft + at.p.k.ft
              z.health = z.health - at.p.k.dam
              end)
        end
      elseif cur.t >=5 then
        hexHit(xx,0, 
          {x=vv[1], y = vv[2]},
          {x=vv[3], y = vv[4]},
          {x=vv[5], y = vv[6]},
          {x=vv[1], y = vv[2]},
          function(z)
            z.v=-z.v*.5
            if z.flinch and math.abs(z.v)>5 then
              z.flinchway = -z.flinchway
            end
            end, true)
        hexHit(xx,0, 
          {x=vv[3], y = vv[4]},
          {x=vv[3]-(vv[3]-vv[1])/5, y = vv[4]-(vv[2]-vv[4])/5},
          {x=vv[3]-(vv[3]-vv[1])/5, y = vv[4]-(vv[2]-vv[4])/5},
          {x=vv[3], y = vv[4]},
          function(z)
            xx.hitsomeonewithpurp = true
            z.v = -z.v + (cur.lr*2)
            z.j = z.j + 12
            z.flinch = true
            z.ft = z.ft + at.p.k.ft
            z.health = z.health - at.p.k.dam/3
            end)
      end


      if not xx.no_spikes and xx.numofspikes > 0 then cur.t = cur.t + 1
      else
        if cur.t > 0 then cur.t = 0 
        else
          cur.t = cur.t - 1
        end
      end
      if cur.t == 2 then 
        makenrubble("vert", cur.verts[3], cur.verts[2], 2*cur.lr,2,7)
      end
    end
  end
  if xx.no_spikes then
    xx.numofspikes = 0
  end
  xx.no_spikes = true
end


function pandp(xx)

  if xx.hitsomeonewithpurp and xx.numofspikes>0 then 
    xx.cmbo=true--combo(xx)
    xx.cancombo = true
    if xx.purplanding then
      xx.landing_counter = 0
    end
  end



  if xx.animcounter > 7 then
    xx.stop = true
  end

  if xx.attack_num == 1 and xx.animcounter < pa2busytime and xx.animcounter > 0  then
    xx.anibusy = true
  elseif xx.attack_num == 2 and xx.animcounter < pa4busytime and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then
    if xx.g then

      if (xx.a2 or xx.a3) then
        xx.attack_num = 1
        xx.animcounter = 1
        xx.repcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.a4 then
        xx.attack_num = 2
        xx.animcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.a1 then
        xx.attack_num = 3
        xx.animcounter = 1
        xx.repcounter = 1
        xx.combo = xx.combo + 1
      end

    else
      if (xx.a2 or xx.a3) then
        xx.attack_num = 4
        xx.animcounter = 1
      elseif xx.a4 then
        xx.attack_num = 5
        xx.animcounter = 1
      elseif xx.a1 then
        xx.attack_num = 6
        xx.animcounter = 1
      end
    end


  else

    if xx.attack_num == 1 then

      if xx.repcounter > 3 then
        if xx.animcounter <  at.p.p2.t then
          xx.im = ppunch3

        elseif xx.animcounter <  at.p.p2.t+2 then
          xx.im = pp1back
          if xx.animcounter >=at.p.p2.t and xx.animcounter < at.p.p2.t+1 then
            hexHit(xx, xx.id, 
              {x=xx.mid, y = xx.y+6},
              {x=xx.mid+xx.v+(xx.lr*46), y = xx.y+35},
              {x=xx.mid+xx.v+(xx.lr*60), y = xx.y+40},
              {x=xx.mid, y = me.y+30},
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
          hexHit(xx, xx.id, 
            {x=xx.mid+(xx.lr * -17), y = xx.y-31},
            {x=xx.mid+xx.v+(xx.lr*9), y = xx.y-38},
            {x=xx.mid+xx.v+(xx.lr*50), y = xx.y+28},
            {x=xx.mid+(xx.lr*-31), y = me.y+13},
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
          if isabout(xx.animcounter, at.p.p2.t+5) then 
            repplay(xx.purp2)
          end
          xx.im = pp1back4

          if xx.animcounter <= at.p.p2.t+5 then 
            hall(xx.id, function(z) if z.plat.n == xx.plat.n
              and math.abs(z.x) - math.abs(xx.x) < at.p.u.range then
              z.j = 10
              z.flinch = true
              z.ft = z.ft+at.p.p.ft*2/3
              end end)
            hexHit(xx, xx.id, 
              {x=xx.mid, y = xx.y+22},
              {x=xx.mid+xx.v+(xx.lr*-55), y = xx.y+66},
              {x=xx.mid+xx.v+(xx.lr*-44), y = xx.y+65},
              {x=xx.mid+(xx.lr*-12), y = me.y+37},
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
          makenrubble("vert", xx.mid+xx.lr*20, xx.y+50,3*xx.lr,3,10)
          repplay(xx.purp2)
          if #joysticks>=xx.id then
            xx.joystick:setVibration(1,1)
          end

          hall(xx.id, function(z) if z.plat.n == xx.plat.n
            and math.abs(z.x) - math.abs(xx.x) < at.p.u.range then
            z.j = 10
            z.flinch = true
            z.ft = z.ft+at.p.p.ft*2/3
            end end)
          
          hexHit(xx, xx.id, 
            {x=xx.mid, y = xx.y+35},
            {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+26},
            {x=xx.mid+xx.v+(xx.lr*44), y = xx.y+49},
            {x=xx.mid, y = xx.y+6},
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
            xx.cmbo=true--combo(xx)
          end

        elseif xx.animcounter >= 55 then
          xx.animcounter = 0
        end
      end

    elseif xx.attack_num == 2 then
      xx.no_spikes = false

      if xx.animcounter < 20 then
        xx.im = stomp1

      elseif xx.animcounter <= 21 then
        xx.im = stomp2

        rumbleme(xx, 1.2)
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

          if lverts[1] > the_map.plats[xx.plat.n].x1+spikesize and 
            lverts[1] < the_map.plats[xx.plat.n].x2-spikesize then
            table.insert(xx.spikes, 
              {verts = lverts,
              t = 0, lr=xx.lr})
            repplay(xx.purpsound)
          end
          if lverts2[1] > the_map.plats[xx.plat.n].x1+spikesize and 
            lverts2[1] < the_map.plats[xx.plat.n].x2-spikesize then
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


          if lverts[1] > the_map.plats[xx.plat.n].x1+spikesize and 
            lverts[1] < the_map.plats[xx.plat.n].x2-spikesize then

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
        xx.cmbo=true
        if  xx.a4 and not xx.holda and xx.numofspikes< at.p.k.max then 
          xx.animcounter = 17
        end
      elseif xx.animcounter < 70 then
        xx.im = stomp2
        xx.no_spikes = true
      elseif xx.animcounter < 70+at.p.k.duration then
        xx.im = stomp2

      else
        xx.im = stomp2
        xx.animcounter = 0
      end

    elseif xx.attack_num == 3 then
      if xx.animcounter < 20 then
        xx.im = pa11

      elseif xx.animcounter < 21 then
        xx.im = pa12
      elseif xx.animcounter < 40 then
        xx.im = pa13
        if xx.animcounter <= 22 then

          makenrubble("vert", xx.mid, xx.feet-5, 5,2,7)
          makenrubble("vert", xx.mid, xx.feet-5, -5,2,7)

          repplay(xx.purpsound)
          repplay(xx.purp2)
          hall(xx.id, function(z) if z.plat.n == xx.plat.n then
            z.j = at.p.u.kj 
            xx.cancombo = true
            z.flinch = true
            z.ft = z.ft+at.p.u.ft
            z.health = z.health - at.p.u.dam
            end end)

        elseif xx.animcounter > 23 then
          xx.cmbo=true--combo(xx)
        end
      else 
        xx.animcounter = 0
      end


    elseif xx.attack_num == 4 then
      if xx.animcounter < 15 then
        xx.im = apa21
      elseif xx.animcounter < 17 then
        xx.im = apa22
      elseif xx.animcounter < 50 then
        xx.im = apa23
        if xx.animcounter <= 18 then

          repplay(xx.airpurp1)
          hexHit(xx, xx.id, 
            {x=xx.mid, y = xx.y+15},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+29-xx.j},
            {x=xx.mid+xx.v+(xx.lr*18), y = xx.y+57-xx.j},
            {x=xx.mid-5*xx.lr, y = me.y+70},
            function(z)
              repplay(xx.purpsound)
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


    elseif xx.attack_num == 5 then
      xx.purplanding = true 
      if xx.animcounter < 3 then
        xx.animcounter = 1
        xx.im=apk1
        xx.j = xx.j - 1
        xx.landing_counter = at.p.ak.penalty + at.p.ak.time



      elseif xx.animcounter <= 40 then
        xx.im=apk2
        if xx.animcounter > 30 then
        end


      elseif xx.animcounter >= 40 then
        xx.animcounter = 0
      end

    elseif xx.attack_num == 6 then
      if xx.animcounter < 15 then
        xx.im = apa11
      elseif xx.animcounter < 17 then
        xx.im = apa12
        if xx.animcounter < 16 then
          xx.j = xx.j + at.p.au.kj 
          xx.v = xx.v - at.p.au.kb*xx.lr 
          repplay(xx.airpurp2)
          hexHit(xx, xx.id, 
            {x=xx.mid+(xx.lr * -17), y = xx.y-31},
            {x=xx.mid+xx.v+(xx.lr*9), y = xx.y-38-xx.j},
            {x=xx.mid+xx.v+(xx.lr*50), y = xx.y+28-xx.j},
            {x=xx.mid+(xx.lr*-31), y = me.y+13},

            function(z)
              repplay(xx.purpsound)
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