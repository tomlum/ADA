

--maybe if... dying then color fades in color?  Or becomes darker!!!
--trails or something, sparks
--WHILE COMBO, ANIMCOUNTER NEVER GOES BELOW 1 (USUALLY RESETS TO 1)
--FLINCH IS RESPONSIBLE FOR LOWERING combo TO 0 and animcounter to 0
--General combo funciton responsible for keeping track of combo and attacking, not individual functions



me.repcounter = 0
you.repcounter = 0



at.bb = {}
at.bb.p = {}
at.bb.p.dam = 5
at.bb.p.kb = 7
at.bb.p.ft = 15
at.bb.p.max = 3
at.bb.p.z = 3

at.bb.rp = {}
at.bb.rp.dam = 5
at.bb.rp.kb = 10
at.bb.rp.ft = 30
at.bb.rp.z = 5



at.bb.ap = {}
at.bb.ap.kb = 12
at.bb.ap.ft = 10
at.bb.ap.dam = 6
at.bb.ap.z = 3

at.bb.k = {}
at.bb.k.dam = 10
at.bb.k.kb = 22
at.bb.k.ft = 30
at.bb.k.z = 4

at.bb.ak = {}
at.bb.ak.dam = 5
at.bb.ak.kb = 4
at.bb.ak.ft = 8
at.bb.ak.kj = -5
at.bb.ak.penalty = 26
at.bb.ak.z = 5


at.bb.u = {}
at.bb.u.dam = 7
at.bb.u.kb = 2
at.bb.u.j = 22
at.bb.u.ft = 20
at.bb.u.z = 3

at.bb.run = {}
at.bb.run.j = 6

sparkspeed = 3
slashsparkspeed = 7

maxcombo = 5
me.maxcombo = maxcombo
you.maxcombo = maxcombo
me.combo = 0
you.combo = 0
me.anibusy = false
you.anibusy = false
me.readya = true
you.readya = true

--air attack causes slight dash forward
me.animcounter = 0
you.animcounter = 0
you.bbcounter = 0
me.type = 1
me.repcounter = 0
me.bbpready = false
you.type = 1
you.repcounter = 0
you.bbpready = false


punch1 = {im=lg.newImage("me/attack/bb/punch1.png"),xoff = -2}
punch2 = {im=lg.newImage("me/attack/bb/punch2.png"),xoff = -1,yoff = -3}
punch3 = {im=lg.newImage("me/attack/bb/punch3.png"), yoff = -4}
punch4 = {im=lg.newImage("me/attack/bb/punch4.png"),xoff = -1, yoff = -3}
punch5 = {im=lg.newImage("me/attack/bb/punch5.png"),xoff = -2, yoff = -2}
punch6 = {im=lg.newImage("me/attack/bb/punch6.png"),yoff = -5}
kick1 = {im = lg.newImage("me/attack/bb/kick1.png"), xoff = 1, yoff = 1}
kick2 = {im = lg.newImage("me/attack/bb/kick2.png"), xoff = -1, yoff = -1}
kick3 = {im = lg.newImage("me/attack/bb/kick3.png"), yoff = -3}
uppercut = {im=lg.newImage("me/attack/bb/uppercut.png"), xoff = 1}
jumpuppercut = {im=lg.newImage("me/attack/bb/jumpuppercut.png")}
dropkick1 = {im=lg.newImage("me/attack/bb/dropkick1.png"), xoff = 5,yoff = -7,extrah=10}
dropkick2 = {im=lg.newImage("me/attack/bb/dropkick2.png"), xoff = 8,yoff = -7,extrah=-15}
divekick = {im=lg.newImage("me/attack/bb/divekick.png"), xoff = 1,yoff = -7,extrah=15}

brun1 = {im=lg.newImage("me/attack/bb/brun1.png"), xoff = 12,yoff = 1,extrah=-6}
brun2 = {im=lg.newImage("me/attack/bb/brun2.png"), xoff = 13,extrah=-6}
brun3 = {im=lg.newImage("me/attack/bb/brun3.png"), xoff = 13,extrah=-6}


airgrab1 = {im=lg.newImage("me/attack/airgrab1.png"),xoff=0}
airgrab2 = {im=lg.newImage("me/attack/airgrab2.png"),yoff = -3}
airgrab3 = {im=lg.newImage("me/attack/airgrab3.png"),xoff=1}



function breadandbutter(xx)


  if xx.animcounter > 0 then
    xx.stop = true
  end
  if xx.animcounter < 17 and xx.animcounter > 0  then
    xx.anibusy = true
  end


  if xx.animcounter == 0 then

    if xx.g then 
      if xx.running and (xx.a2b or xx.a3b) then
        xx.type = 7
        xx.animcounter = 1
      elseif (xx.a2 or xx.a3) and xx.color.n == 0 and not xx.holda then
        xx.type = 1
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
      elseif xx.a4 and not xx.holda then
        xx.type = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      elseif xx.a1 and not xx.holda then
        xx.type = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end
    else
      if (xx.a2 or xx.a3) and not xx.holda then
        xx.type = 4
        xx.animcounter = 1
      elseif xx.a4 and not xx.holda then
        xx.type = 5
        xx.animcounter = 1
      elseif xx.a1 and not xx.holda then
        xx.type = 6
        xx.animcounter = 1
      end

    end


  else

    if xx.type == 1 then
      if xx.animcounter < 6 then
        if xx.repcounter%2==0 then
          xx.im = punch1
        else
          xx.im = punch4
        end

      elseif xx.animcounter<=9 then
        if xx.repcounter%2==0 then
          xx.im = punch2
        else
          xx.im = punch5
        end
        repplay(xx.blues)
        if xx.animcounter >0 then
          hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+24},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+26-xx.j},
            {x=xx.mid, y = xx.y+30},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+32-xx.j},
            function(z)

              xx.cancombo = true
              z.v = z.v/3+xx.lr*at.bb.p.kb+xx.v
              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.bb.p.dam
                z.flinch = true
                z.ft = z.ft+at.bb.p.ft
              end
              shakez(at.bb.p.z)

            end)
        end
        xx.v = xx.v + (xx.lr*3)*xx.rampspeed

      elseif xx.animcounter < 37 then
        if xx.repcounter%2==0  then
          xx.im = punch3
        else
          xx.im = punch6
        end

        if xx.animcounter >= 17 then 
          xx.cmbo=true--combo(xx)
        end

      elseif xx.animcounter >= 37 then
        xx.animcounter = 0
      end



    elseif xx.type == 2 then
      if xx.animcounter < 12 then
        xx.im = kick1
      elseif xx.animcounter < 18 then
        xx.im = kick2
          hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+31},
            {x=xx.mid+xx.v+(xx.lr*28), y = xx.y+31-xx.j},
            {x=xx.mid+xx.v+(xx.lr*28), y = xx.y+39-xx.j},
            {x=xx.mid, y = xx.y+37},
            function(z)
              xx.cancombo = true
              z.health = z.health - at.bb.k.dam
              z.flinch = true
              if not (z.block and z.lr == -xx.lr) then
                z.ft = z.ft+at.bb.k.ft
                z.v = z.v/3+ xx.lr*at.bb.k.kb
              else
                z.ft = z.ft+at.bb.k.ft/2
                z.v = z.v/3+ xx.lr*at.bb.k.kb*2/3
              end
              shakez(at.bb.k.z)

            end)
      elseif xx.animcounter < 43 then
        xx.im = kick3
        if xx.animcounter >= 17 then 
          xx.cmbo=true--combo(xx)
        end
      elseif xx.animcounter >= 43 then
        xx.animcounter = 0
      end
    elseif xx.type ==3 then
      if xx.animcounter < 9 then
        xx.im = punch6
      elseif xx.animcounter < 16 then
        xx.im = uppercut
        if xx.animcounter <=12 then
          hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+20},
            {x=xx.mid+xx.v+(xx.lr*11), y = xx.y+4-xx.j},
            {x=xx.mid+xx.v+(xx.lr*17), y = xx.y+4-xx.j},
            {x=xx.mid, y = xx.y+30},

            function(z)
              xx.cancombo = true
              z.health = z.health - at.bb.u.dam
              z.v = z.v/3+at.bb.u.kb*xx.lr
              z.j = z.j/3+at.bb.u.j
              z.flinch = true
              z.ft = z.ft+at.bb.u.ft
              shakez(at.bb.u.z)
            end)
        end
      elseif xx.animcounter >= 16 then
        xx.animcounter = 0
      end

    elseif xx.type == 4 then
      if xx.animcounter < 4 then
        xx.im = dropkick1

      elseif xx.animcounter<=20 then
        xx.im = dropkick2
        if xx.animcounter <10 then
          hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+18},
            {x=xx.mid+xx.v+(xx.lr*25), y = xx.y+18-xx.j},
            {x=xx.mid+xx.v+(xx.lr*25), y = xx.y+26-xx.j},
            {x=xx.mid, y = xx.y+26},
            function(z)
              xx.cancombo = true
              if xx.animcounter == 4 then
                z.v = z.v/3+xx.lr*at.bb.ap.kb+xx.v
              else
                z.v = z.v/3+xx.lr*at.bb.ap.kb/2+xx.v
              end
              if not (z.block and z.lr == -xx.lr) then
                if xx.animcounter == 4 then
                  z.health = z.health - at.bb.ap.dam
                else
                  z.health = z.health - at.bb.ap.dam/2
                end
                z.flinch = true
                z.ft = z.ft+at.bb.ap.ft/4
                shakez(at.bb.ap.z)
              end

            end)
        end

      elseif xx.animcounter < 25 then
        xx.im=dropkick1
      elseif xx.animcounter < 40 then

      elseif xx.animcounter >= 40 then
        xx.animcounter = 0
      end


    elseif xx.type == 5 then
      if xx.animcounter < 8 then
        xx.im=dropkick1

      elseif xx.animcounter<=25 then
        xx.im = divekick
        if xx.animcounter == 10 and xx.rampcanhit then
          xx.j = xx.j - 7
          xx.landingcounter = at.bb.ak.penalty
        end
        hboxcs(xx, xx.id, 
          {x=xx.mid+8, y = xx.y+40},
          {x=xx.mid+xx.v+(xx.lr*14), y = xx.y+64-xx.j},
          {x=xx.mid+xx.v+(xx.lr*6), y = xx.y+64-xx.j},
          {x=xx.mid, y = xx.y+40},
          function(z)
            xx.cancombo = true
            z.v = z.v+xx.lr*at.bb.ak.kb+xx.v/2
            if not (z.block and z.lr == -xx.lr)then
              if xx.animcounter == 5 then
                z.health = z.health - at.bb.ak.dam
              else
                z.health = z.health - at.bb.ak.dam/2
              end
              z.flinch = true
              z.ft = z.ft+at.bb.ak.ft
              z.j = xx.j + at.bb.ak.kj
              shakez(at.bb.ak.z)
            end

          end)


      elseif xx.animcounter <= 40 then

      elseif xx.animcounter >= 40 then
        xx.animcounter = 0
      end

    elseif xx.type ==6 then
      if xx.animcounter < 5 then
      elseif xx.animcounter < 16 then
        xx.im = jumpuppercut
        if xx.animcounter <= 12 then
          hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+30},
            {x=xx.mid+xx.v+(xx.lr*11), y = xx.y+8-xx.j},
            {x=xx.mid+xx.v+(xx.lr*17), y = xx.y+8-xx.j},
            {x=xx.mid, y = xx.y+20},

            function(z)
              xx.cancombo = true
              z.health = z.health - at.bb.u.dam
              z.v = z.v/3+at.bb.u.kb*xx.lr
              z.j = z.j/3 + at.bb.u.j*2/3 + xx.j
              z.flinch = true
              z.ft = z.ft+at.bb.u.ft
              shakez(at.bb.u.z)
            end)
        end
      elseif xx.animcounter >= 16 then
        xx.animcounter = 0
      end

  elseif xx.type == 7 then
      if xx.animcounter == 2 then
        xx.j = at.bb.run.j
        xx.im = brun1
      elseif xx.animcounter < 7 then
        xx.im = brun1
      elseif xx.animcounter < 9 then
           hboxcs(xx, xx.id, 
            {x=xx.mid, y = xx.y+19},
            {x=xx.mid+xx.v+(xx.lr*19), y = xx.y+23-xx.j},
            {x=xx.mid+xx.v+(xx.lr*19), y = xx.y+29-xx.j},
            {x=xx.mid, y = xx.y+26},
            function(z)
              z.v = z.v/3+xx.lr*at.bb.rp.kb+xx.v
              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.bb.rp.dam
                z.flinch = true
                z.ft = z.ft+at.bb.rp.ft
              end
              shakez(at.bb.rp.z)

            end)
          
        xx.im = brun2
      elseif xx.animcounter < 30 then
        xx.im = brun3
      else
        xx.animcounter = 0
      end
      
   
      
    end
  end
end