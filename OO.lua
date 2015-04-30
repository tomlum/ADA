


op1 = {im=love.graphics.newImage("me/attack/op1.png"),c=love.graphics.newImage("me/attack/op1c.png"), xoff = 2}
op2 = {im=love.graphics.newImage("me/attack/op2n.png"),c=love.graphics.newImage("me/attack/opcn.png"), xoff = 9,yoff = 10, cxoff = 9, cyoff = 22}
op3 = {im=love.graphics.newImage("me/attack/op3n.png"),c=love.graphics.newImage("me/attack/opcn.png"), xoff = 9,yoff = 12, cxoff = 9, cyoff = 24}
op4 = {im=love.graphics.newImage("me/attack/op4n.png"),c=love.graphics.newImage("me/attack/opcn.png"), xoff = 9,yoff = 10, cxoff = 9, cyoff = 22}
op5 = {im=love.graphics.newImage("me/attack/op5n.png"),c=love.graphics.newImage("me/attack/opcn.png"), xoff = 9,yoff = 12, cxoff = 9, cyoff = 24}


ao21 = {im=love.graphics.newImage("me/attack/ao21.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9, yoff = 17, extrah = 5, cxoff = -2, cyoff = -8}
ao22 = {im=love.graphics.newImage("me/attack/ao22temp2.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9+10, cxoff = -2, cyoff = -8, extrah = 5}


ao23 = {im=love.graphics.newImage("me/attack/ao23.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9,yoff = 17, extrah = 5, cxoff = -2, cyoff = -8}
ao24 = {im=love.graphics.newImage("me/attack/ao24.png"),c=love.graphics.newImage("me/attack/ao3c.png"), xoff = 9-5,yoff = 0, cyoff = 0, extrah = 5}


ok2 = {im=love.graphics.newImage("me/attack/ok2.png"),c=love.graphics.newImage("me/attack/ok2c.png"), xoff = 9,yoff = 15}
ok3 = {im=love.graphics.newImage("me/attack/ok3.png"),c=love.graphics.newImage("me/attack/ok3c.png"), xoff = 97,yoff = 5,
cxoff = 90,cyoff = 19}
ok4 = {im=love.graphics.newImage("me/attack/ok4.png"),c=love.graphics.newImage("me/attack/ok4c.png"), xoff = 45,yoff = 0,cxoff = -1,cyoff = -6}


o32 = {im=love.graphics.newImage("me/attack/o32.png"),c=love.graphics.newImage("me/attack/op32c.png"), 
  xoff = 9,yoff = -5, cxoff = 8, cyoff = 7}

o33 = {im=love.graphics.newImage("me/attack/o33.png"),c=love.graphics.newImage("me/attack/o33c.png"), 
  cxoff = 2,cyoff = 8}

ao31 = {im=love.graphics.newImage("me/attack/ao31.png"),c=love.graphics.newImage("me/attack/ao31c.png"), xoff = 9, yoff = 0, cxoff = -2+9, cyoff = -8}
ao32 = {im=love.graphics.newImage("me/attack/ao32.png"),c=love.graphics.newImage("me/attack/ao32c.png"), yoff =2, cxoff = -2, cyoff = -5}



aop1 = {im=love.graphics.newImage("me/attack/aop1.png"),c=love.graphics.newImage("me/attack/aop1c.png"), xoff = 5,yoff = 17, extrah = 5, cxoff = 5, cyoff = 24}
aop2 = {im=love.graphics.newImage("me/attack/aop2.png"),c=love.graphics.newImage("me/attack/aop2c.png"),xoff = 2,yoff = 32, extrah = 5, cxoff = 5, cyoff = 40}


at.o = {}
at.o.p = {}
at.o.p.dam = 10
at.o.p.ft = 25
at.o.p.max = 2
at.o.p.z = .08
at.o.p.j = -20

at.o.ap = {}
at.o.ap.dam = 10
at.o.ap.ft = 25
at.o.ap.z = .08
at.o.ap.j = -20

at.o.ak = {}
at.o.ak.dam = 15
at.o.ak.ft = 20
at.o.ak.max = 5
at.o.ak.z = .08
at.o.ak.j = -10
me.o5repcounter = 0
you.o5repcounter = 0


at.o.k = {}
at.o.k.dam = 15
at.o.k.ft = 20
at.o.k.z = .08
at.o.k.j = -20

at.o.u = {}
at.o.u.dam = 15
at.o.u.ft = 30
at.o.u.j = 25
at.o.u.v = 0



function orangeyouglad(xx)
  if xx.g then 
      xx.o5repcounter = 0 end

  if xx.flinch then 
    xx.oplat = nil
  end

  if xx.animcounter > 0 then
    xx.stop = true
  end
  if xx.animcounter < 17 and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then

    if xx.g then 

      if (xx.a1) then
        xx.type = 3
        xx.animcounter = 1
      elseif (xx.a2 or xx.a3) then
        xx.type = 1
        xx.animcounter = 1
      elseif xx.a4 then
        xx.type = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end
    else
      
      if (xx.a1) then
        xx.type = 6
        xx.animcounter = 1
      elseif (xx.a2 or xx.a3) then
        xx.type = 4
        xx.animcounter = 1
      elseif xx.a4 and xx.o5repcounter < at.o.ak.max  then
        xx.type = 5
        xx.animcounter = 1
        xx.combo = xx.combo + 1
         xx.o5repcounter =  xx.o5repcounter +1
      end

    end


  else

    if xx.type == 1 then
      if xx.animcounter<=7 then
        if xx.repcounter%2==0 then
          xx.im = op2
        else
          xx.im = op4
        end
        repplay(xx.orangesou)


      elseif xx.animcounter < 40 then
        if xx.animcounter == 8 and xx.rampcanhit then

          xx.oplat = nil
          ocontactstuff(xx, xx.mid+(xx.lr*72), xx.y+32,xx.v+(19*xx.lr), xx.j-36) 

          hboxcs(xx, xx.id, 
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
          combo(xx)
        end


      elseif xx.animcounter < 42 then
        combo(xx)
        if xx.repcounter%2==0  then
          xx.im = op2
        else
          xx.im = op3
        end

      elseif xx.animcounter < 44 then
        combo(xx)

        if xx.repcounter%2==0  then
          xx.im = op1
        else
          xx.im = op1
        end
      elseif xx.animcounter < 70 then
        xx.stop = false
      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end

    elseif xx.type == 2 then
      if xx.animcounter < 3 then
        xx.im = op1

      elseif xx.animcounter<=12+5 then
        xx.im = ok2


      elseif xx.animcounter < 50 then
        xx.im = ok3

        if xx.animcounter == 13+5 and xx.rampcanhit then

          xx.oplat = nil
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

          local check = retowallcheck(xx.mid, xx.y,xx.v+99*xx.lr, xx.j-65)
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



          check = retowallcheck(xx.mid, xx.y,xx.v-99*xx.lr, xx.j-65)
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
            hboxcs(xx, xx.id, 
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


        end
        if xx.animcounter >= 15 then 
          if xx.a4b and not xx.holda and xx.oplat~=nil then
            xx.animcounter = 101
            xx.oplat = nil
          end

          combo(xx)
        end



      elseif xx.animcounter < 42 then
        xx.im = ok2

      elseif xx.animcounter < 44 then
        combo(xx)
      elseif xx.animcounter < 100 then
        xx.animcounter = 0
      elseif xx.animcounter < 110 then
        xx.im = ok4
        xx.j = 14
      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end

    elseif xx.type == 3 then
      if xx.animcounter < 3 then
          xx.im = op1

      elseif xx.animcounter<=7 then
          xx.im = o32


      elseif xx.animcounter < 40-20 then
          xx.im = o33
        if xx.animcounter == 8 and xx.rampcanhit then

          xx.oplat = nil
          ocontactstuff(xx, xx.mid, xx.y,xx.v+(42*xx.lr), xx.j-65) 

          hboxcs(xx, xx.id, 
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
              shakez(at.o.p.z)

            end)
        end


        if xx.animcounter >= 10 then 
          combo(xx)
        end


      elseif xx.animcounter < 42-20 then
        combo(xx)
          xx.im = op2

      elseif xx.animcounter < 44-20 then
        combo(xx)
          xx.im = op1
      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end
elseif xx.type == 4 then
      if xx.animcounter < 6 then
          xx.im = aop1

      elseif xx.animcounter < 40 then
          xx.im = aop2
        if xx.animcounter == 6 and xx.rampcanhit then

          ocontactstuff(xx, xx.mid+(xx.lr*43), xx.y-24,xx.v+(19*xx.lr), xx.j-57) 
          ocontactstuff(xx, xx.mid+(xx.lr*43), xx.y+24+31,xx.v+(19*xx.lr), xx.j+57) 

          hboxcs(xx, xx.id, 
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
        hboxcs(xx, xx.id, 
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
        end


        if xx.animcounter >= 10 then 
          combo(xx)
        end


      elseif xx.animcounter < 40 then
        combo(xx)
          xx.im = aop1
      else
        xx.animcounter = 0
      end


    else if xx.type == 5 then
      if xx.animcounter < 6 then
        if xx.o5repcounter%2==0 then
          xx.im = ao21
        else
          xx.im = ao23
        end


      elseif xx.animcounter < 23 then

        if xx.animcounter == 6 and xx.rampcanhit then

          xx.oplat = nil
          ocontactstuff(xx, xx.mid, xx.y,xx.v+81*xx.lr, xx.j-138)


          hboxcs(xx, xx.id, 
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
        end


        if xx.oplat ~= nil then 
          xx.float = true
          xx.j = 0
          xx.v = 0
        end

        if xx.o5repcounter%2==0  then
          xx.im = ao22
        else
          xx.im = ao24
        end



      elseif xx.animcounter < 27 then

        if xx.oplat ~= nil then
          if xx.oplat[3] ~= nil then
            xx.j = xx.j
          elseif xx.oplat.y == -1 then
            xx.j = 20
          else
            xx.j = 10
          end
        end
        xx.oplat = nil
        combo(xx)
        if xx.o5repcounter%2==0  then
          xx.im = ao21
        else
          xx.im = ao23
        end

      elseif xx.animcounter < 60 then
        combo(xx)

      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end


  elseif xx.type == 6 then
      if xx.animcounter < 3 then
          xx.im = aop1

      elseif xx.animcounter<=7 then
          xx.im = ao31


      elseif xx.animcounter < 40 then
          xx.im = ao32
        if xx.animcounter == 8 and xx.rampcanhit then

          xx.oplat = nil
          ocontactstuff(xx, xx.mid, xx.y,xx.v+(42*xx.lr), xx.j-65) 

          hboxcs(xx, xx.id, 
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
              shakez(at.o.p.z)

            end)
        end


        if xx.animcounter >= 15 then 
          combo(xx)
        end


      elseif xx.animcounter < 42 then
        combo(xx)
          xx.im = ao31

      elseif xx.animcounter < 44 then
        combo(xx)
          xx.im = aop1
      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end
  end
end
end


function ocontactstuff(xx, ex, why, vee, jay)

  if xx.oplat == nil and retlineplatcheck(ex, why,vee, jay) == nil then xx.oplat = nil end
  if retlineplatcheck(ex, why,vee, jay) ~= nil then 
    xx.oplat = retlineplatcheck(ex, why,vee, jay)
    if xx.glass~=nil then 
      makenglass(ex+xx.v+vee,xx.oplat.y,1,1, 5)
      makenglass(ex+xx.v+vee,xx.oplat.y,-1,1, 5)

    else
      makenrubble("vert", ex+xx.v+vee,xx.oplat.y,1,1, 5)
      makenrubble("vert", ex+xx.v+vee,xx.oplat.y,-1,1, 5)
    end
  end


  local check = retowallcheck(ex, why,vee, jay)
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