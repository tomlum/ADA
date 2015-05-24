redp1 = {im=lg.newImage("me/attack/red/redp1.png"),
  xoff = 25,yoff = -10}
redp2 = {im=lg.newImage("me/attack/red/redp2.png"), xoff = 7,yoff = -7}
redp3 = {im=lg.newImage("me/attack/red/redp3.png"), xoff = 13,yoff = -5}
redp4 = {im=lg.newImage("me/attack/red/redp4.png"), xoff = 7,yoff = 10}
redp5 = {im=lg.newImage("me/attack/red/redp5.png"), xoff = 25,yoff = -13}
redcounter = {im=lg.newImage("me/attack/red/redcounter.png"), xoff = 25,yoff = -13}

redblock = {im=lg.newImage("me/attack/red/redblock.png"), yoff = -4}
redcounter = {im=lg.newImage("me/attack/red/redcounter.png"), xoff = 9, yoff = -3}

redcounter2 = {im=lg.newImage("me/attack/red/redcounter2.png"), xoff = 25, yoff = -4}
counterat1 = {im=lg.newImage("me/attack/red/counterat1.png"), xoff = 1, yoff = -4}
counterat2 = {im=lg.newImage("me/attack/red/counterat2.png"), xoff = 1, yoff = -4}
counterat3 = {im=lg.newImage("me/attack/red/counterat3.png"), xoff = 1, yoff = -4}

counterat4 = {im=lg.newImage("me/attack/red/counterat4.png"), xoff = 5, yoff = -8}

counterat42 = {im=lg.newImage("me/attack/red/counterat42.png"), xoff = 5, yoff = 38}

counterat43 = {im=lg.newImage("me/attack/red/counterat43.png"), xoff = 5, yoff = -14}

counterat44 = {im=lg.newImage("me/attack/red/counterat44.png"), xoff = 4, yoff = -6}

counterat45 = {im=lg.newImage("me/attack/red/counterat45.png"), xoff = 1, yoff = -4}


me.rlvltimer = 0
you.rlvltimer = 0
me.rlvl = 0
you.rlvl = 0
me.oldrlvl = 0
you.oldrlvl = 0
timeasred = 800

reddelta = -5
at.r = {}
at.r.p = {}
at.r.p.maxv = 12
at.r.p.dam = 6
at.r.p.kb = 1
at.r.p.ft = 8
at.r.p.delta = 4
at.r.p.z = .05
redadj = 15

at.r.k = {}
at.r.k.dam = 15
at.r.k.kb = 22
at.r.k.ft = 25
at.r.k.delta = 7
at.r.k.z = .05

--burnout
at.r.bo={}
at.r.bo.max = 4
at.r.bo.dam = 30
--red stat delta
rsdel = .14

function randr(xx)


  if xx.rlvl ~= xx.oldrlvl then
    xx.rlvltimer = timeasred

    if xx.rlvl >= at.r.bo.max then
      xx.rlvl = 0
      xx.health = xx.health - at.r.bo.dam
    end

    if xx.color.n == 4 then
      local t = thecolors[4].s
      xx.color.s = {def=t.def+rsdel*xx.rlvl, speed = t.speed-rsdel*xx.rlvl, jump = t.jump-rsdel*xx.rlvl, weight = t.weight+rsdel*xx.rlvl, brittle = t.brittle-rsdel*xx.rlvl}

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
        xx.type = 1
      elseif (xx.a4) and not xx.holda then
        xx.animcounter = 1
        xx.combo = xx.combo + 1
        xx.repcounter = 1
        xx.type = 2
        xx.hit = false

      end
    end
  else
    xx.stop = true

    if xx.type == 1 then
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
            xx.v = xx.v + xx.lr*3
          end
        elseif xx.animcounter < 60-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.im = redp3
          if xx.animcounter <=29+3-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
            hboxcs(xx, xx.id, 
              {x=xx.mid+(xx.lr*9), y = xx.y+29},
              {x=xx.mid+xx.v+(xx.lr*51), y = xx.y+24-xx.j},
              {x=xx.mid+xx.v+(xx.lr*47), y = xx.y+29-xx.j},
              {x=xx.mid+(xx.lr*5), y = xx.y+34},
              function(z)

                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.p.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.r.p.dam+at.r.p.delta*xx.rlvl
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
            xx.v = xx.v + xx.lr*2
          end
        elseif xx.animcounter < 60-7-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
          xx.im = redp5

          if xx.animcounter <=29-7+4-redadj - reddelta*xx.rlvl+xx.repcounter*2 then
            hboxcs(xx, xx.id, 
              {x=xx.mid+(xx.lr*15), y = xx.y+13+15},
              {x=xx.mid+xx.v+(xx.lr*20), y = xx.y+13+11-xx.j},
              {x=xx.mid+xx.v+(xx.lr*17), y = xx.y+13+50-xx.j},
              {x=xx.mid+(xx.lr*12), y = xx.y+13+54},
              function(z)

                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.p.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.r.p.dam+at.r.p.delta*xx.rlvl
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


    elseif xx.type == 2 then
      if xx.animcounter < 30 then 
        xx.im = redcounter
        xx.block = true
        if xx.hit then
          xx.animcounter = 100
        end

      elseif xx.animcounter < 40 then
        xx.stop = true
        xx.im = redcounter

      elseif xx.animcounter < 100 then
        xx.animcounter = 0

      elseif xx.animcounter < 105 then
        xx.im = redcounter2
        for i,v in ipairs(hitt) do
          if v.id ~= xx.id then
            v.hit = false
          end
        end
      elseif xx.rlvl == 3 then
        if xx.animcounter < 110 then
          xx.im = counterat42
        elseif xx.animcounter < 120 then
          if xx.animcounter < 121 then
            hboxcs(xx, xx.id, 
              {x=xx.mid+(xx.lr*5), y = xx.y+12},
              {x=xx.mid+xx.v+(xx.lr*112), y = xx.y+28-xx.j},
              {x=xx.mid+xx.v+(xx.lr*99), y = xx.y+44-xx.j},
              {x=xx.mid+(xx.lr*5), y = xx.y+28},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.r.p.dam+at.r.p.delta*xx.rlvl
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.p.delta*xx.rlvl
                end
                shakez(at.r.k.z)
              end)
          end
          xx.im = counterat4
        elseif xx.animcounter < 124 then
          xx.im = counterat43
        elseif xx.animcounter < 127 then
          xx.im = counterat44
        elseif xx.animcounter < 130 then
          xx.im = counterat45
        else
          xx.animcounter = 0
            xx.rlvl = 0
        end

      elseif xx.animcounter < 115 and xx.rlvl < 3 then
        if xx.rlvl == 0 then
          xx.im = counterat1

          hboxcs(xx, xx.id, 
            {x=xx.mid+(xx.lr*1), y = xx.y+20},
            {x=xx.mid+xx.v+(xx.lr*59), y = xx.y+23-xx.j},
            {x=xx.mid+xx.v+(xx.lr*59), y = xx.y+24-xx.j},
            {x=xx.mid+(xx.lr*1), y = xx.y+31},
            function(z)
              xx.cancombo = true
              z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.r.k.dam+at.r.p.delta*xx.rlvl
                z.flinch = true
                z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
              end
              shakez(at.r.k.z)

            end)
        elseif xx.rlvl == 1 then
          xx.im = counterat2

          hboxcs(xx, xx.id, 
            {x=xx.mid+(xx.lr*46.1), y = xx.y+21},
            {x=xx.mid+xx.v+(xx.lr*65), y = xx.y+23-xx.j},
            {x=xx.mid+xx.v+(xx.lr*65), y = xx.y+23-xx.j},
            {x=xx.mid+(xx.lr*46.1), y = xx.y+41},
            function(z)
              xx.cancombo = true
              z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.r.k.dam+at.r.p.delta*xx.rlvl
                z.flinch = true
                z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
              end
              shakez(at.r.k.z)end)


            hboxcs(xx, xx.id, 
              {x=xx.mid+(xx.lr*11), y = xx.y+22},
              {x=xx.mid+xx.v+(xx.lr*45), y = xx.y+9-xx.j},
              {x=xx.mid+xx.v+(xx.lr*45), y = xx.y+42-xx.j},
              {x=xx.mid+(xx.lr*10), y = xx.y+31},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.r.k.dam+at.r.p.delta*xx.rlvl
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
                end
                shakez(at.r.k.z)
              end)

          elseif xx.rlvl == 2 then
            xx.im = counterat3

            hboxcs(xx, xx.id, 
              {x=xx.mid+(xx.lr*10), y = xx.y+24},
              {x=xx.mid+xx.v+(xx.lr*84), y = xx.y+15-xx.j},
              {x=xx.mid+xx.v+(xx.lr*84), y = xx.y+29-xx.j},
              {x=xx.mid+(xx.lr*8), y = xx.y+42},
              function(z)
                xx.cancombo = true
                z.v = z.v/3+xx.lr*at.r.k.kb+xx.v
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.r.k.dam+at.r.p.delta*xx.rlvl
                  z.flinch = true
                  z.ft = z.ft+at.r.k.ft+at.r.k.delta*xx.rlvl
                end
                shakez(at.r.k.z)end)
            elseif xx.rlvl == 3 then
              xx.im = counterat42



            end
          else 
            xx.animcounter = 0
            xx.rlvl = 0

          end


        end
      end
    end
