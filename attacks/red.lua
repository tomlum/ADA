redp1 = {im=lg.newImage("me/attack/red/redp1.png"),
xoff = 25,yoff = -10}
redp2 = {im=lg.newImage("me/attack/red/redp2.png"), xoff = 7,yoff = -7}
redp3 = {im=lg.newImage("me/attack/red/redp3.png"), xoff = 13,yoff = -5}
redp4 = {im=lg.newImage("me/attack/red/redp4.png"), xoff = 7,yoff = 10}
redp5 = {im=lg.newImage("me/attack/red/redp5.png"), xoff = 25,yoff = -13}
redcounter = {im=lg.newImage("me/attack/red/redcounter.png"), xoff = 25,yoff = -13}

redblock = {im=lg.newImage("me/attack/red/redblock.png"), yoff = -4}
redaslash = lg.newImage("me/attack/red/redaslash.png")
redap1 = {im=lg.newImage("me/attack/red/redap1.png"),
xoff = 15,slash = redaslash,extra_height = 5}
redap2 = {im=lg.newImage("me/attack/red/redap2.png"),
xoff = 15,slash = redaslash,extra_height = 5}
redap3 = {im=lg.newImage("me/attack/red/redap3.png"),
xoff = 8, yoff = 4,slash = redaslash,extra_height = 5}
redap4 = {im=lg.newImage("me/attack/red/redap4.png"),
xoff = 3, yoff = 4,slash = redaslash,extra_height = 5}

redcounter1 = {im=lg.newImage("me/attack/red/redcounter1.png"),
xoff = 10, yoff = -4}
redcounter2 = {im=lg.newImage("me/attack/red/redcounter2.png"),
xoff = 4, yoff = -4}
redcounter3 = {im=lg.newImage("me/attack/red/redcounter3.png"),
xoff = 8, yoff = -11}
redcounter4 = {im=lg.newImage("me/attack/red/redcounter4.png"),
xoff = 9, yoff = -11}


--redcounter2 = {im=lg.newImage("me/attack/red/redcounter2.png"), xoff = 25, yoff = -4}
counterat1 = {im=lg.newImage("me/attack/red/counterat1.png"), xoff = 1, yoff = -4}
counterat2 = {im=lg.newImage("me/attack/red/counterat2.png"), xoff = 1, yoff = -4}
counterat3 = {im=lg.newImage("me/attack/red/counterat3.png"), xoff = 1, yoff = -4}

counterat4 = {im=lg.newImage("me/attack/red/counterat4.png"), xoff = 5, yoff = -8}

counterat42 = {im=lg.newImage("me/attack/red/counterat42.png"), xoff = 5, yoff = 38}

counterat43 = {im=lg.newImage("me/attack/red/counterat43.png"), xoff = 5, yoff = -14}

counterat44 = {im=lg.newImage("me/attack/red/counterat44.png"), xoff = 4, yoff = -6}

counterat45 = {im=lg.newImage("me/attack/red/counterat45.png"), xoff = 1, yoff = -4}

redu1 = {im=lg.newImage("me/attack/red/redu1.png"), xoff = 12,yoff = -3}
redu12 = {im=lg.newImage("me/attack/red/redu12.png"), xoff = 12,yoff = -10}
redu2 = {im=lg.newImage("me/attack/red/redu2.png"), yoff = 24}

redau1 = {im=lg.newImage("me/attack/red/redau1.png"), xoff = 4,yoff = 15}
redau2 = {im=lg.newImage("me/attack/red/redau2.png"), xoff = 27
,slash = redaslash, sdir = "up"}


redak1 = {im=lg.newImage("me/attack/red/redak1.png"),
yoff = 13,extra_height = 5}
redak2 = {im=lg.newImage("me/attack/red/redak2.png"),
xoff = 6,extra_height = 5}

redk10 = {im=lg.newImage("me/attack/red/redk10.png"),
xoff = 3, yoff = 4, extra_height = 4}
redk11 = {im=lg.newImage("me/attack/red/redk11.png"),
xoff = 13+17, yoff = -6, extra_height = 5}

redak11 = {im=lg.newImage("me/attack/red/redak11.png"),
xoff = 12+17,extra_height = 5}

me.rlvltimer = 0
you.rlvltimer = 0
me.drawslash = false
you.drawslash = false
me.rlvl = 0
you.rlvl = 0
me.oldrlvl = 0
you.oldrlvl = 0
timeasred = 800

reddelta = -5
at.r = {}
at.r.p = {}
at.r.p.maxv = 12
at.r.p.dam = 4
at.r.p.kb = 0
at.r.p.ft = 8
at.r.p.delta = 4
at.r.p.z = 3.5
redadj = 15

at.r.u = {}
at.r.u.dam = 4
at.r.u.kb = 1
at.r.u.j = 15
at.r.u.ft = 26
at.r.u.delta = 4
at.r.u.z = 3.5
at.r.u.mv = 2
at.r.u.mj = 10

at.r.ap = {}
at.r.ap.dam = 5
at.r.ap.kb = 1
at.r.ap.ft = 8
at.r.ap.delta = 4
at.r.ap.z = 3

at.r.au = {}
at.r.au.dam = 5
at.r.au.j = 12
at.r.au.ft = 8
at.r.au.delta = 4
at.r.au.z = 3

at.r.k = {}
at.r.k.dam = 5
at.r.k.kb = 22
at.r.k.ft = 25
at.r.k.delta = 7
at.r.k.z = 6

at.r.ak = {}
at.r.ak.dam = 5
at.r.ak.j = 5
at.r.ak.ft = 6
at.r.ak.delta = 5
at.r.ak.z = 5
at.r.ak.penalty = 22

--burnout
at.r.bo={}
at.r.bo.max = 4
at.r.bo.dam = 30
at.r.bo.ft = 40
--red stat delta
rsdel = .14

function randr(xx)
  xx.counter = false
  xx.drawslash = false


  if xx.rlvl ~= xx.oldrlvl then

    xx.rlvltimer = timeasred

    if xx.rlvl >= at.r.bo.max then
      xx.rlvl = 0
      xx.health = xx.health - at.r.bo.dam
      xx.ft = at.r.bo.ft
      makensparks(xx.v+xx.mid,xx.y+30,sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,50)
      repplay(xx.flinch1)
      repplay(xx.flinch2)
      repplay(xx.redshattersou)
    else

      xx.redblocksou:setPitch(1/(xx.rlvl+1)+.5)
      repplay(xx.redblocksou)
    end




  end
  xx.oldrlvl = xx.rlvl

  if xx.rlvltimer > 0 then
    xx.rlvltimer = xx.rlvltimer - 1
  else
    xx.rlvltimer = 0
    if xx.rlvl > 0  then
      xx.rlvl = xx.rlvl - 1
    end
  end








  if xx.animcounter == 0 then

    if xx.g then

      if (xx.a2 or xx.a3) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 1
      elseif (xx.a4) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 2
        --xx.hit = false
      elseif (xx.a1) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 3

      end
    else
      if (xx.a2 or xx.a3) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 4
      elseif (xx.a1) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 6
      elseif (xx.a4) and not xx.holda  then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.attack_num = 5
      end
    end
  else
    xx.stop = true

    if xx.attack_num == 1 then
      if xx.repcounter%2 == 1 then

        if xx.animcounter < 28-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          if xx.repcounter == 1 then
            xx.im = redp1
          else
            xx.im = redp5
          end
        elseif xx.animcounter < 28+3-redadj - reddelta*xx.rlvl+xx.repcounter*2  then
          xx.im = redp2
          if math.abs(xx.v)<at.r.p.maxv then
            xx.v = xx.v + xx.lr*(3+xx.rlvl/3)
          end
        elseif xx.animcounter < 60-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.im = redp3
          if xx.animcounter <=29+3-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
            repplay(xx.redsound)
            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*9), y = xx.y+29},
              {x=xx.mid+xx.v+(xx.lr*51), y = xx.y+24-xx.j},
              {x=xx.mid+xx.v+(xx.lr*47), y = xx.y+29-xx.j},
              {x=xx.mid+(xx.lr*5), y = xx.y+34},
              function(z)

                xx.cancombo = true
                z.v = z.v/3+xx.lr*(at.r.p.kb+xx.rlvl/3)+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.p.dam+at.r.p.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.p.ft+at.r.p.delta*xx.rlvl
                end
                shakez(at.r.p.z)

                end)
          end
          xx.cmbo=true--combo(xx)

        elseif xx.animcounter >= 60-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.animcounter = 0
          xx.repcounter = 0
        end

      elseif xx.repcounter%2 == 0 then
        if xx.animcounter < 28-7-redadj - reddelta*xx.rlvl+xx.repcounter*2 then

          xx.im = redp3

        elseif xx.animcounter < 28-7+4-redadj - reddelta*xx.rlvl+xx.repcounter*2  then
          xx.im = redp4
          if math.abs(xx.v)<at.r.p.maxv then
            xx.v = xx.v + xx.lr*(2+xx.rlvl/3)
          end
        elseif xx.animcounter < 60-7-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.im = redp5

          if xx.animcounter <=29-7+4-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
            repplay(xx.redsound)
            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*15), y = xx.y+13+15},
              {x=xx.mid+xx.v+(xx.lr*20), y = xx.y+13+11-xx.j},
              {x=xx.mid+xx.v+(xx.lr*17), y = xx.y+13+50-xx.j},
              {x=xx.mid+(xx.lr*12), y = xx.y+13+54},
              function(z)

                xx.cancombo = true
                z.v = z.v/3+xx.lr*(at.r.p.kb+xx.rlvl/3)+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.p.dam+at.r.p.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.p.ft+at.r.p.delta*xx.rlvl
                end
                shakez(at.r.p.z)

                end)
          end

          xx.cmbo=true--combo(xx)
        elseif xx.animcounter >= 60-7-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.animcounter = 0
          xx.repcounter = 0
        end




      end


    elseif xx.attack_num == 2 then
      if xx.animcounter < 30 then 
        if xx.a4b and not xx.holda and xx.rlvl > 0 then
          xx.animcounter = 200
        end
        if xx.animcounter < 6 then
          xx.im = redcounter1
        else
          xx.im = redcounter2
        end
        xx.block = true
        xx.counter = true
        if xx.counteractivate then
          xx.animcounter = 100
        end

      elseif xx.animcounter < 40 then
        xx.stop = true
        xx.im = redcounter2

      elseif xx.animcounter < 100 then
        xx.animcounter = 0

      elseif xx.animcounter < 110 then
        if xx.animcounter < 105 then
          xx.im = redcounter3
        else
          xx.im = redcounter4
        end
        for i,v in ipairs(players) do
          if v.id ~= xx.id then
            v.hit = false
          end
        end

      elseif xx.animcounter >= 200 then
        if xx.animcounter < 207 - reddelta*xx.rlvl then
          xx.im = redk10

        elseif xx.animcounter < 230 - reddelta*xx.rlvl then
          if xx.animcounter < 208 - reddelta*xx.rlvl then
            hexRadial(xx.id, {x=xx.mid, y = xx.y+30}, 70+90*xx.rlvl, 
              function(p)
                xx.cancombo = true
                radialthrow(xx, p, (xx.rlvl*1.5+5)*((70+90*xx.rlvl)-math.sqrt((p.y-xx.y)^2 + (p.mid-xx.x)^2))/(72+10*xx.rlvl))
                makensparks(xx.mid,xx.y+30,xx.v+3, xx.j-3, xx.color.c.r/(xx.rlvl/15+1),xx.color.c.g/(xx.rlvl/15+1),xx.color.c.b/(xx.rlvl/15+1), 5*(xx.rlvl+1))
                makensparks(xx.mid,xx.y+30,xx.v-3, xx.j-3, xx.color.c.r/(xx.rlvl/15+1),xx.color.c.g/(xx.rlvl/15+1),xx.color.c.b/(xx.rlvl/15+1), 5*(xx.rlvl+1))
              end
              )
            repplay(xx.redpushsou)
            xx.rlvl = 0
          end
          xx.im = redk11


          else xx.animcounter = 0

          end



        elseif xx.rlvl == 3 then
          if xx.animcounter < 108 then
            xx.im = counterat42
          elseif xx.animcounter < 115 then
            if xx.animcounter < 121 then
              hexHit(xx, xx.id, 
                {x=xx.mid+(xx.lr*5), y = xx.y+12},
                {x=xx.mid+xx.v+(xx.lr*112), y = xx.y+28-xx.j},
                {x=xx.mid+xx.v+(xx.lr*99), y = xx.y+44-xx.j},
                {x=xx.mid+(xx.lr*5), y = xx.y+28},
                function(z)
                  xx.cancombo = true
                  z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                  if not (z.block and z.lr == -xx.lr) then
                    z.health = z.health - (at.r.p.dam+at.r.p.delta*xx.rlvl)
                    z.flinch = true
                    z.ft = z.ft+at.r.k.ft+at.r.p.delta*xx.rlvl
                  end
                  shakez(at.r.k.z)
                  end)

            end
            xx.im = counterat4
          elseif xx.animcounter < 124+15 then
            xx.im = counterat43
          elseif xx.animcounter < 127+15 then
            xx.im = counterat44
          elseif xx.animcounter < 130+15 then
            xx.im = counterat45
          else
            xx.animcounter = 0
            xx.rlvl = 0
          end

        elseif xx.animcounter < 115 and xx.rlvl < 3 then
          if xx.rlvl == 0 then
            xx.im = counterat1

            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*1), y = xx.y+20},
              {x=xx.mid+xx.v+(xx.lr*59), y = xx.y+23-xx.j},
              {x=xx.mid+xx.v+(xx.lr*59), y = xx.y+24-xx.j},
              {x=xx.mid+(xx.lr*1), y = xx.y+31},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.k.dam+at.r.p.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
                end
                shakez(at.r.k.z)

                end)
            repplay(xx.redsound3)
          elseif xx.rlvl == 1 then
            xx.im = counterat2

            hboxOffset(xx, xx.id, 
              {x=xx.mid+(xx.lr*23), y = xx.y+18},
              {x=xx.mid+xx.v+(xx.lr*80), y = xx.y+9-xx.j},
              {x=xx.mid+xx.v+(xx.lr*80), y = xx.y+37-xx.j},
              {x=xx.mid+(xx.lr*23), y = xx.y+27},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.k.dam+at.r.p.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
                end
                shakez(at.r.k.z)end)
            repplay(xx.redsound3)

          elseif xx.rlvl == 2 then
            xx.im = counterat3

            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*10), y = xx.y+24},
              {x=xx.mid+xx.v+(xx.lr*84), y = xx.y+15-xx.j},
              {x=xx.mid+xx.v+(xx.lr*84), y = xx.y+29-xx.j},
              {x=xx.mid+(xx.lr*8), y = xx.y+42},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.k.dam+at.r.p.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
                end
                shakez(at.r.k.z)end)
            repplay(xx.redsound3)
          elseif xx.rlvl == 3 then
            xx.im = counterat42



          end
        else 
          xx.animcounter = 0
          xx.rlvl = 0

        end

      elseif xx.attack_num == 3 then
        if xx.animcounter < 15 - reddelta*xx.rlvl then
          xx.im = redu1 
          xx.block = true
        elseif xx.animcounter < 20 - reddelta*xx.rlvl*2 then
          xx.im = redu12
        elseif xx.animcounter < 30 - reddelta*xx.rlvl*2 then
          xx.im = redu2
          if xx.animcounter < 30 - reddelta*xx.rlvl*2 then
            if xx.animcounter < 22 - reddelta*xx.rlvl*2 then
              xx.v = xx.v+xx.lr*(at.r.u.mv+xx.rlvl/2)
              xx.j = at.r.u.mj+(xx.rlvl*3)
            end

            hexHit(xx, xx.id, 
              {x=xx.mid, y = xx.y},
              {x=xx.mid+xx.v+(xx.lr*20), y = xx.y-16-xx.j},
              {x=xx.mid+xx.v+(xx.lr*20), y = xx.y-4-xx.j},
              {x=xx.mid+(xx.lr*5), y = xx.y+27},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.u.kb+xx.v/2
                z.j = z.j/3+at.r.u.j+(xx.rlvl+1)+xx.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - (at.r.u.dam+at.r.u.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.u.ft+at.r.u.delta*xx.rlvl
                end
                shakez(at.r.u.z)end)
            repplay(xx.redsound2)


          end
          else xx.animcounter = 0




          end

        elseif xx.attack_num == 4 then
          if xx.animcounter < 3 - reddelta*xx.rlvl+xx.repcounter*4 then



            if xx.repcounter % 4 == 1 then
              xx.im = redap1
            elseif xx.repcounter % 4 == 2 then
              xx.im = redap2
            elseif xx.repcounter % 4 == 3  then
              xx.im = redap3
            elseif xx.repcounter % 4 == 0  then
              xx.im = redap4
            end
            xx.j = xx.j/1.1
          elseif xx.animcounter < 50 - reddelta*xx.rlvl+xx.repcounter*4 then

            if xx.repcounter % 4 == 1 then
              xx.im = redap2
            elseif xx.repcounter % 4 == 2 then
              xx.im = redap3
            elseif xx.repcounter % 4 == 3  then
              xx.im = redap4
            elseif xx.repcounter % 4 == 0  then
              xx.im = redap1
            end


            if xx.animcounter < 5 - reddelta*xx.rlvl+xx.repcounter*4 then
              xx.drawslash = true

              hexHit(xx, xx.id, 
                {x=xx.mid, y = xx.y},
                {x=xx.mid+xx.v+(xx.lr*52), y = xx.y+36-xx.j},
                {x=xx.mid+xx.v+(xx.lr*52), y = xx.y+36-xx.j},
                {x=xx.mid, y = xx.y+72},
                function(z)
                  xx.cancombo = true
                  z.v = z.v/3+xx.lr*at.r.ap.kb+xx.v
                  if not (z.block and z.lr == -xx.lr) then
                    z.health = z.health - (at.r.ap.dam+at.r.p.delta*xx.rlvl)
                    z.flinch = true
                    z.ft = z.ft+at.r.ap.ft+at.r.ap.delta*xx.rlvl
                  end
                  shakez(at.r.ap.z)end)
              repplay(xx.redsound2)

            else
              xx.cmbo=true
            end

          end

        elseif xx.attack_num == 6 then
          if xx.animcounter < 8 - reddelta*xx.rlvl then
            xx.im = redau1 
          elseif xx.animcounter < 40 - reddelta*xx.rlvl then
            xx.im = redau2
            if xx.animcounter < 10 - reddelta*xx.rlvl then
              xx.drawslash = true
              if xx.j < 0 then xx.j = xx.j + 15 else xx.j = xx.j + 3 end

              hexHit(xx, xx.id, 
                {x=xx.mid+xx.v, y = xx.y-37-xx.j},
                {x=xx.mid+(xx.lr*36), y = xx.y},
                {x=xx.mid-(xx.lr*36), y = xx.y},
                {x=xx.mid+xx.v, y = xx.y-37-xx.j},
                function(z)
                  xx.cancombo = true
                  z.v = z.v/3+xx.v
                  z.j = z.j/3+at.r.au.j+(xx.rlvl+1)*2+xx.j

                  z.health = z.health - (at.r.au.dam+at.r.au.delta*xx.rlvl)
                  z.flinch = true
                  z.ft = z.ft+at.r.au.ft+at.r.au.delta*xx.rlvl
                  shakez(at.r.u.z)end)
              repplay(xx.redsound)

            end
            else xx.animcounter = 0




            end


          elseif xx.attack_num == 5 then
            if xx.animcounter < 70  then
              if xx.animcounter < 3 then
                xx.j = 12 - xx.rlvl
              end
              if xx.a4b and not xx.holda and xx.rlvl > 0 then
                xx.animcounter = 200
              end
              xx.im = redak1 
              if xx.j < -2 then
                xx.landing_counter = at.r.ak.penalty+(xx.rlvl+1)
                xx.j = xx.j - (xx.rlvl+1)/3
                hexHit(xx, xx.id, 
                  {x=xx.mid, y = xx.y},
                  {x=xx.mid+(xx.lr*46)+xx.v, y = xx.y+7-xx.j},
                  {x=xx.mid+(xx.lr*42)+xx.v, y = xx.y+56-xx.j},
                  {x=xx.mid-(xx.lr*21), y = xx.y+73},
                  function(z)
                    xx.landing_counter = 0
                    xx.animcounter = 100
                    xx.j = -xx.j/1.5
                    xx.cancombo = true
                    z.v = z.v/3+xx.v
                    if z.plat.floor == nil then
                      z.g = false
                    end
                    z.j = z.j/3-at.r.ak.j-(xx.rlvl+1)*2-xx.j
                    repplay(xx.redsound3)

                    z.health = z.health - (at.r.ak.dam+at.r.ak.delta*xx.rlvl)
                    z.flinch = true
                    z.ft = z.ft+at.r.ak.ft+at.r.ak.delta*xx.rlvl
                    makensparks(xx.mid,xx.y+30,xx.v+3, xx.j-3, xx.color.c.r/(xx.rlvl/15+1),xx.color.c.g/(xx.rlvl/15+1),xx.color.c.b/(xx.rlvl/15+1), 10*(xx.rlvl+1))
                    xx.rlvl = 0
                    shakez(at.r.ak.z)end)
end


elseif xx.animcounter < 100 then 
  xx.animcounter = 0
elseif xx.animcounter < 102 then
  xx.im = redak2
elseif xx.animcounter < 135 then
  xx.im = redap2
  xx.cmbo = true
elseif xx.animcounter < 200 then
  xx.animcounter = 0
elseif xx.animcounter < 230 - reddelta*xx.rlvl then
  if xx.animcounter < 202 - reddelta*xx.rlvl then
    hexRadial(xx.id, {x=xx.mid, y = xx.y+30}, 70+90*xx.rlvl, 
      function(p)
        xx.cancombo = true
        radialthrow(xx, p, (xx.rlvl*2+7)*((70+90*xx.rlvl)-math.sqrt((p.y-xx.y)^2 + (p.mid-xx.x)^2))/(72+10*xx.rlvl))

        makensparks(xx.mid,xx.y+30,xx.v+3, xx.j-3, xx.color.c.r/(xx.rlvl/15+1),xx.color.c.g/(xx.rlvl/15+1),xx.color.c.b/(xx.rlvl/15+1), 5*(xx.rlvl+1))
        makensparks(xx.mid,xx.y+30,xx.v-3, xx.j-3, xx.color.c.r/(xx.rlvl/15+1),xx.color.c.g/(xx.rlvl/15+1),xx.color.c.b/(xx.rlvl/15+1), 5*(xx.rlvl+1))

      end
      )
    xx.rlvl = 0
    repplay(xx.redpushsou)
  end
  xx.im = redak11


  else xx.animcounter = 0




  end


end



end



xx.counteractivate = false
end
