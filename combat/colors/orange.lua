


op1 = {im=lg.newImage("images/player/attack/orange/op1.png"), xoff = 2}
op2 = {im=lg.newImage("images/player/attack/orange/op2n.png"), xoff = 9,yoff = 10}
op3 = {im=lg.newImage("images/player/attack/orange/op3n.png"), xoff = 9+11,yoff = 12+7}
op4 = {im=lg.newImage("images/player/attack/orange/op4n.png"), xoff = 9,yoff = 12}
op5 = {im=lg.newImage("images/player/attack/orange/op5n.png"), xoff = 9+11,yoff = 12+7}


ao21 = {im=lg.newImage("images/player/attack/orange/ao21.png"), xoff = 9, yoff = 17, extra_height = 5}
ao22 = {im=lg.newImage("images/player/attack/orange/ao22.png"), xoff = 9-5+13, extra_height = 5, yoff = 22}


ao23 = {im=lg.newImage("images/player/attack/orange/ao23.png"), xoff = 5,yoff = 17, extra_height = 5}
ao24 = {im=lg.newImage("images/player/attack/orange/ao24.png"), xoff = 9-5+13, extra_height = 5+14, yoff = 23}


ok2 = {im=lg.newImage("images/player/attack/orange/ok2.png"), xoff = 9,yoff = 15}
ok3 = {im=lg.newImage("images/player/attack/orange/ok3.png"), xoff = 84,yoff = 3}
ok4 = {im=lg.newImage("images/player/attack/orange/ok4.png"), xoff = 45,yoff = 0, extra_height = 5}


o32 = {im=lg.newImage("images/player/attack/orange/o32.png"), 
  xoff = 9,yoff = -5}

o33 = {im=lg.newImage("images/player/attack/orange/o33.png"), xoff = 4}

ao31 = {im=lg.newImage("images/player/attack/orange/ao31.png"), xoff = 15, yoff = 9}
ao32 = {im=lg.newImage("images/player/attack/orange/ao32.png"), yoff = 52, xoff = 12}



aop1 = {im=lg.newImage("images/player/attack/orange/aop1.png"), xoff = 5,yoff = 17, extra_height = 5}
aop2 = {im=lg.newImage("images/player/attack/orange/aop2.png"),yoff = 32, extra_height = 5, xoff = 10}

orun = {im=lg.newImage("images/player/attack/orange/orun.png")}
aorun1 = {im=lg.newImage("images/player/attack/orange/aorun1.png"), xoff = 3, yoff = 0}
aorun2 = {im=lg.newImage("images/player/attack/orange/aorun2.png"), xoff = 3, yoff = 0}


at.o = {}
at.o.p = {}
at.o.p.dam = 10
at.o.p.ft = 25
at.o.p.max = 2
at.o.p.z = .4
at.o.p.j = -20

at.o.ap = {}
at.o.ap.dam = 10
at.o.ap.ft = 19
at.o.ap.z = 3.5
at.o.ap.j = -20

at.o.ak = {}
at.o.ak.dam = 15
at.o.ak.ft = 18
at.o.ak.max = 5
at.o.ak.z = 4.5
at.o.ak.j = -10
me.o5repcounter = 0
you.o5repcounter = 0


at.o.k = {}
at.o.k.dam = 15
at.o.k.ft = 18
at.o.k.z = 4
at.o.k.j = -20
at.o.k.mj = 17


at.o.u = {}
at.o.u.dam = 15
at.o.u.ft = 24
at.o.u.j = 25
at.o.u.v = 0
at.o.u.z = 4


function orangeyouglad(xx)
  if xx.g then 
    xx.o5repcounter = 0 end


    if xx.animcounter > 0 then
      xx.stop = true
    end
    if xx.animcounter < 17 and xx.animcounter > 0  then
      xx.anibusy = true
    end

    if xx.animcounter == 0 then

      if xx.g then 
        if math.abs(xx.v)>vforrunningattack and (xx.a2b or xx.a3b) then
          xx.attack_num = 7
          xx.animcounter = 1
        elseif (xx.a1) then
          xx.attack_num = 3
          xx.animcounter = 1
        elseif (xx.a2 or xx.a3) then
          xx.attack_num = 1
          xx.animcounter = 1
        elseif xx.a4 then
          xx.attack_num = 2
          xx.animcounter = 1
          xx.combo = xx.combo + 1
        end
      else

        if (xx.a1) then
          xx.attack_num = 6
          xx.animcounter = 1
        elseif (xx.a2 or xx.a3) then
          xx.attack_num = 4
          xx.animcounter = 1
        elseif xx.a4 and xx.j < 1 and xx.o5repcounter < at.o.ak.max  then
          xx.attack_num = 5
          xx.animcounter = 1
          xx.combo = xx.combo + 1
          xx.o5repcounter =  xx.o5repcounter +1
        end

      end


    else

      if xx.attack_num == 1 then
        if xx.animcounter<=7 then
          if xx.repcounter%2==0 then
            xx.im = op2
          else
            xx.im = op4
          end
          repplay(xx.orangesou)


        elseif xx.animcounter < 40 then
          if isabout(xx.animcounter, 8) then

            ocontactstuff(xx, xx.mid+(xx.lr*72), xx.y+32,xx.v+(19*xx.lr), xx.j-36) 

            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*59), y = xx.y+24},
              {x=xx.mid+xx.v+(xx.lr*64), y = xx.y+24-xx.j},
              {x=xx.mid+xx.v+(xx.lr*91), y = xx.y+60-xx.j},
              {x=xx.mid+(xx.lr*89), y = xx.y+68},
              function(z)

                xx.cancombo = true
                z.v = z.v/5
                z.j = z.j+at.o.p.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.p.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.p.ft
                end
                shakez(at.o.p.z)

              end)
          end


          if xx.repcounter%2==0  then
            xx.im = op3
          else
            xx.im = op5
          end

          if xx.animcounter >= 10 then 
            xx.cmbo=true--combo(xx)
          end


        elseif xx.animcounter < 42 then
          xx.cmbo=true--combo(xx)
          if xx.repcounter%2==0  then
            xx.im = op2
          else
            xx.im = op3
          end

        elseif xx.animcounter < 44 then
          xx.cmbo=true--combo(xx)

          if xx.repcounter%2==0  then
            xx.im = op1
          else
            xx.im = op1
          end
        elseif xx.animcounter < 50 then
          xx.stop = false
        elseif xx.animcounter < 1000 then
          xx.animcounter = 0
        end

      elseif xx.attack_num == 2 then
        if xx.animcounter < 3 then
          xx.im = op1

        elseif xx.animcounter<=12+5 then
          xx.im = ok2


        elseif xx.animcounter < 50 then
          xx.im = ok3

          if isabout(xx.animcounter, 13+5) then

            ocontactstuff(xx, xx.mid+(xx.lr*50), xx.y+27,xx.v+(49*xx.lr), xx.j-38) 
            ocontactstuff(xx, xx.mid-(xx.lr*50), xx.y+27,xx.v-(49*xx.lr), xx.j-38)
            --[[
            xx.oplat = retlineplatcheck(xx.mid+(xx.lr*50), xx.y+27,xx.v+(49*xx.lr), xx.j-38) 
            if xx.oplat ~= nil then
              makenrubble("vert", xx.mid+xx.v+(xx.lr*99),xx.oplat.y,1,1, 6)
              makenrubble("vert", xx.mid+xx.v+(xx.lr*99),xx.oplat.y,-1,1, 6)
            end
            local temp = retlineplatcheck(xx.mid-(xx.lr*50), xx.y+27,xx.v-(49*xx.lr), xx.j-38) 
            if temp ~= nil then
              xx.oplat = temp
              makenrubble("vert", xx.mid+xx.v-(xx.lr*99),xx.oplat.y,1,1, 6)
              makenrubble("vert", xx.mid+xx.v-(xx.lr*99),xx.oplat.y,-1,1, 6)

            end

            local check = retOWallCheck(xx.mid, xx.y,xx.v+99*xx.lr, xx.j-65)
            xx.owall = check[1]
            xx.ohit = check[2]
            if xx.ohit ~= 0 then

              if check[3]~= nil then

                makenglass(xx.owall,xx.ohit,xx.lr*3,0, 4)
              else

                makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
              end
              if xx.oplat == nil and check[3]~= nil then
                xx.oplat = {y=-1}
              end
            end



            check = retOWallCheck(xx.mid, xx.y,xx.v-99*xx.lr, xx.j-65)
            xx.owall = check[1]
            xx.ohit = check[2]
            if xx.ohit ~= 0 then
              makenglass(xx.owall,xx.ohit,xx.lr*3,0, 4)

              if check[3]~= nil then
                makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
              end
              if xx.oplat == nil and check[3]~= nil then
                xx.oplat = {y=-1}
              end
            end
            ]]--


            for i = -1, 1 do
              hexHit(xx, xx.id, 
                {x=xx.mid+(xx.lr*50)*i, y = xx.y+27},
                {x=xx.mid+xx.v+(xx.lr*59)*i, y = xx.y+27-xx.j},
                {x=xx.mid+xx.v+(xx.lr*99)*i, y = xx.y+60-xx.j},
                {x=xx.mid+(xx.lr*97)*i, y = xx.y+65},
                function(z)

                  xx.cancombo = true
                  z.v = z.v/5
                  z.j = z.j+at.o.k.j
                  if not (z.block and z.lr == -xx.lr) then
                    z.health = z.health - at.o.k.dam
                    z.flinch = true
                    z.ft = z.ft+at.o.k.ft
                  end
                  shakez(at.o.k.z)

                end)
            end

            repplay(xx.orangesou4)


          end
          if xx.animcounter >= 15 then 
            if xx.a4b and not xx.holda and xx.oplat~=nil then
              xx.animcounter = 101
              repplay(xx.flapsou)

            end

            xx.cmbo=true--combo(xx)
          end



        elseif xx.animcounter < 52 then
          xx.im = ok2

        elseif xx.animcounter < 100 then
          xx.animcounter = 0
        elseif xx.animcounter < 110 then
          xx.im = ok4
          xx.jmax = at.o.k.mj*xx.color.s.jump
          xx.j = at.o.k.mj/2
          xx.firstjump = true
        elseif xx.animcounter < 130 then
          xx.im = ok4
          xx.cmbo=true
        elseif xx.animcounter < 1000 then
          xx.animcounter = 0
        end

      elseif xx.attack_num == 3 then
        if xx.animcounter < 3 then
          xx.im = op1

        elseif xx.animcounter<7 then
          xx.im = o32


        elseif xx.animcounter < 40-20 then
          xx.im = o33
          if isabout(xx.animcounter,  8) then
            ocontactstuff(xx, xx.mid, xx.y,xx.v+(42*xx.lr), xx.j-65) 
            repplay(xx.orangesou2)

            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*53), y = xx.y+24},
              {x=xx.mid+xx.v+(xx.lr*63), y = xx.y-xx.j},
              {x=xx.mid+xx.v+(xx.lr*46), y = xx.y+65-xx.j},
              {x=xx.mid+(xx.lr*36), y = xx.y+65},
              function(z)

                xx.cancombo = true
                z.v = z.v+at.o.u.v*xx.lr
                z.j = z.j+at.o.u.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.p.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.u.ft
                end
                shakez(at.o.u.z)

              end)
          end


          if xx.animcounter >= 10 then 
            xx.cmbo=true--combo(xx)
          end


        elseif xx.animcounter < 42-20 then
          xx.cmbo=true--combo(xx)
          xx.im = op2

        elseif xx.animcounter < 44-20 then
          xx.cmbo=true--combo(xx)
          xx.im = op1
        elseif xx.animcounter < 1000 then
          xx.animcounter = 0
        end
      elseif xx.attack_num == 4 then
        if xx.animcounter < 6 then
          xx.im = aop1

        elseif xx.animcounter < 40 then
          xx.im = aop2
          if isabout(xx.animcounter, 6) then

            ocontactstuff(xx, xx.mid+(xx.lr*43), xx.y-24,xx.v+(19*xx.lr), xx.j-57) 
            ocontactstuff(xx, xx.mid+(xx.lr*43), xx.y+24+31,xx.v+(19*xx.lr), xx.j+57) 

            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*43), y = xx.y-24},
              {x=xx.mid+xx.v+(xx.lr*46), y = xx.y-32-xx.j},
              {x=xx.mid+xx.v+(xx.lr*62), y = xx.y+33-xx.j},
              {x=xx.mid+(xx.lr*60), y = xx.y+33},
              function(z)

                xx.cancombo = true
                z.v = z.v/5
                z.j = z.j+at.o.ap.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.ap.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.ap.ft
                end
                shakez(at.o.ap.z)

              end)
            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*43), y = xx.y+24+31},
              {x=xx.mid+xx.v+(xx.lr*46), y = xx.y+32+31-xx.j},
              {x=xx.mid+xx.v+(xx.lr*62), y = xx.y-33+31-xx.j},
              {x=xx.mid+(xx.lr*60), y = xx.y-33+31},
              function(z)

                xx.cancombo = true
                z.v = z.v/5
                z.j = z.j-at.o.ap.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.ap.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.ap.ft
                end
                shakez(at.o.ap.z)

              end)
            repplay(xx.orangesou2)
          end




        elseif xx.animcounter < 30 then
          xx.cmbo=true--combo(xx)
          xx.im = aop1
        else
          xx.animcounter = 0
        end


      else if xx.attack_num == 5 then
        if xx.animcounter < 6 then
          if xx.o5repcounter%2==0 then
            xx.im = ao21
          else
            xx.im = ao23
          end


        elseif xx.animcounter < 23 then

          if isabout(xx.animcounter,  7) then

            ocontactstuff(xx, xx.mid, xx.y,xx.v+81*xx.lr, xx.j-138)


            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*49), y = xx.y+70},
              {x=xx.mid+xx.v+(xx.lr*56), y = xx.y+70-xx.j},
              {x=xx.mid+xx.v+(xx.lr*83), y = xx.y+130-xx.j},
              {x=xx.mid+(xx.lr*79), y = xx.y+138},
              function(z)

                xx.cancombo = true
                z.v = z.v/5
                z.j = z.j+at.o.ak.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.ak.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.ak.ft
                end
                shakez(at.o.ak.z)

              end)
            repplay(xx.orangesou2)
          end


          if xx.oplat ~= nil then 
            xx.float = true
            xx.j = 0
            xx.v = 0

            rumbleme(xx,1/10)
          end

          if xx.o5repcounter%2==0  then
            xx.im = ao22
          else
            xx.im = ao24
          end



        elseif xx.animcounter < 27 then
          if xx.o5repcounter%2==0 then
            xx.im = ao21
          else
            xx.im = ao23
          end


          if xx.oplat ~= nil then
            if xx.oplat[3] ~= nil then
              xx.j = xx.j
            elseif xx.oplat.y == -1 then

              xx.jmax = at.o.k.mj*xx.color.s.jump
              xx.j = at.o.k.mj/2
              xx.firstjump = true
            else

              xx.jmax = at.o.k.mj*xx.color.s.jump
              xx.j = at.o.k.mj/2
              xx.firstjump = true
            end
          end
          xx.cmbo=true--combo(xx)


        elseif xx.animcounter < 40 then
          if xx.o5repcounter%2==0 then
            xx.im = ao21
          else
            xx.im = ao23
          end

          xx.cmbo=true--combo(xx)

        elseif xx.animcounter < 1000 then
          xx.animcounter = 0
        end


      elseif xx.attack_num == 6 then
        
        if xx.animcounter<7 then
          xx.im = ao31


        elseif xx.animcounter < 40 then
          xx.im = ao32
          if xx.animcounter <= 8 then

            ocontactstuff(xx, xx.mid, xx.y,xx.v+(42*xx.lr), xx.j-65) 

            hexHit(xx, xx.id, 
              {x=xx.mid-(xx.lr*17), y = xx.y-23},
              {x=xx.mid+xx.v+(xx.lr*3), y = xx.y-xx.j-52},
              {x=xx.mid+xx.v+(xx.lr*3), y = xx.y-xx.j-52},
              {x=xx.mid-(xx.lr*13), y = xx.y-21},
              function(z)

                xx.cancombo = true
                z.v = z.v+at.o.u.v*xx.lr
                z.j = z.j+at.o.u.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.p.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.u.ft
                end
                shakez(at.o.p.z)

            end)
                      hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*12), y = xx.y-21},
              {x=xx.mid+xx.v-(xx.lr*9), y = xx.y-xx.j-52},
              {x=xx.mid+xx.v-(xx.lr*9), y = xx.y-xx.j-52},
              {x=xx.mid+(xx.lr*8), y = xx.y-21},
              function(z)

                xx.cancombo = true
                z.v = z.v-at.o.u.v*xx.lr
                z.j = z.j+at.o.u.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.p.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.u.ft
                end
                shakez(at.o.p.z)

              end)
            repplay(xx.orangesou2)
          end


          if xx.animcounter >= 15 then 
            xx.cmbo=true--combo(xx)
          end


        elseif xx.animcounter < 42 then
          xx.cmbo=true--combo(xx)
          xx.im = ao31

        elseif xx.animcounter < 44 then
          xx.cmbo=true--combo(xx)
        elseif xx.animcounter < 1000 then
          xx.animcounter = 0
        end

      elseif xx.attack_num == 7 then
        if xx.animcounter < 3 then
        elseif xx.animcounter < 7 then
          if isabout(xx.animcounter,  3) then
            hexHit(xx, xx.id, 
              {x=xx.mid+(xx.lr*90), y = xx.y+31},
              {x=xx.mid+xx.v+(xx.lr*153), y = xx.y-xx.j+67},
              {x=xx.mid+xx.v+(xx.lr*153), y = xx.y+65-xx.j+67},
              {x=xx.mid+(xx.lr*88), y = xx.y+36},
              function(z)

                xx.cancombo = true
                z.v = z.v+at.o.u.v*xx.lr
                z.j = z.j+at.o.u.j
                if not (z.block and z.lr == -xx.lr) then
                  z.health = z.health - at.o.p.dam
                  z.flinch = true
                  z.ft = z.ft+at.o.u.ft
                end
                shakez(at.o.p.z)
                end
              )
            end

            xx.im = orun
            ocontactstuff(xx, xx.mid+(xx.lr*90), xx.y+31,xx.v+(63*xx.lr), xx.j-36) 
            repplay(xx.orangesou4)

          elseif xx.animcounter<=12+10 then
            xx.im = landing
            if xx.oplat~=nil then
              xx.jmax = at.o.k.mj*xx.color.s.jump/3
              xx.firstjump = true
              xx.j = 11
              if xx.animcounter <=11 then
                xx.im = aorun1
              else
                xx.im = aorun2
              end
            end
          elseif xx.animcounter < 1000 then
            xx.animcounter = 0


          end

        end
      end
    end


    function ocontactstuff(xx, ex, why, vee, jay)
      xx.oplat = nil
      xx.oplat = retlineplatcheck(ex, why,vee, jay)
      if xx.oplat ~= nil then 
        if xx.oplat.glass~=nil then 
          makenglass(ex+xx.v+vee,xx.oplat.y,1,1, 5)
          makenglass(ex+xx.v+vee,xx.oplat.y,-1,1, 5)

        else
          makenrubble("vert", ex+xx.v+vee,xx.oplat.y-1,1,1, 5)
          makenrubble("vert", ex+xx.v+vee,xx.oplat.y-1,-1,1, 5)
        end
      end


      local check = retOWallCheck(ex, why,vee, jay)
      xx.owall = check[1]
      xx.ohit = check[2]
      if xx.ohit ~= 0 then
        if check[3]~= nil then
          makenglass(xx.owall,xx.ohit,vee/math.abs(vee),0, 4)
        else
          makenrubble("horiz", xx.owall,xx.ohit,vee/math.abs(vee),0, 4)

        end
        if xx.oplat == nil and check[3]==nil then
          xx.oplat = {y=-1}
        end
      end

    end
  end