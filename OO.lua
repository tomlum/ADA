


op1 = {im=love.graphics.newImage("me/attack/op1.png"),c=love.graphics.newImage("me/attack/op1c.png"), xoff = 2}
op2 = {im=love.graphics.newImage("me/attack/op2.png"),c=love.graphics.newImage("me/attack/op2c.png"), xoff = 9,yoff = 15}
op3 = {im=love.graphics.newImage("me/attack/op3.png"),c=love.graphics.newImage("me/attack/op3c.png"), xoff = 9,yoff = 12}
op4 = {im=love.graphics.newImage("me/attack/op4.png"),c=love.graphics.newImage("me/attack/op2c.png"), xoff = 9,yoff = 15}
op5 = {im=love.graphics.newImage("me/attack/op5.png"),c=love.graphics.newImage("me/attack/op3c.png"), xoff = 9,yoff = 12}


ao21 = {im=love.graphics.newImage("me/attack/ao21.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9,yoff = 15, extrah = 5}
ao22 = {im=love.graphics.newImage("me/attack/ao22.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9,yoff = 15, extrah = 5}


ao23 = {im=love.graphics.newImage("me/attack/ao23.png"),c=love.graphics.newImage("me/attack/ao2c.png"), xoff = 9,yoff = 15, extrah = 5}
ao24 = {im=love.graphics.newImage("me/attack/ao24.png"),c=love.graphics.newImage("me/attack/ao3c.png"), xoff = 9-5,yoff = 15-17, extrah = 5}


ok2 = {im=love.graphics.newImage("me/attack/ok2.png"),c=love.graphics.newImage("me/attack/ok2c.png"), xoff = 9,yoff = 15}
ok3 = {im=love.graphics.newImage("me/attack/ok3.png"),c=love.graphics.newImage("me/attack/ok3c.png"), xoff = 97,yoff = 5,cxoff = 23-15, cyoff = -3}
ok4 = {im=love.graphics.newImage("me/attack/ok4.png"),c=love.graphics.newImage("me/attack/ok4c.png"), xoff = 45,yoff = 0,cxoff = -1,cyoff = -6}

at.o = {}
at.o.p = {}
at.o.p.dam = 10
at.o.p.ft = 25
at.o.p.max = 2
at.o.p.z = .08
at.o.p.j = -20

at.o.ak = {}
at.o.ak.dam = 15
at.o.ak.ft = 20
at.o.ak.max = 5
at.o.ak.z = .08
at.o.ak.j = -20


at.o.k = {}
at.o.k.dam = 15
at.o.k.ft = 20
at.o.k.z = .08
at.o.k.j = -20


function orangeyouglad(xx)

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
      if (xx.a2b or xx.a3b) then
        xx.type = 1
        xx.animcounter = 1
        eh = true
      elseif xx.a4 then
        xx.type = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end
    else
      if xx.a4 then
        xx.type = 5
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end

    end


  else

    if xx.type == 1 then
      if xx.animcounter < 3 then
        if xx.repcounter%2==0 then
          xx.im = op1
        else
          xx.im = op1
        end

      elseif xx.animcounter<=7 then
        if xx.repcounter%2==0 then
          xx.im = op2
        else
          xx.im = op4
        end
        repplay(xx.blues)


      elseif xx.animcounter < 40 then
        if xx.animcounter == 8 and rampcanhit then
         

          xx.oplat = retlineplatcheck(xx.mid+(xx.lr*72), xx.y+32,xx.v+(19*xx.lr), xx.j-36) 
          if xx.oplat ~= nil then
            makenrubble("vert", xx.mid+xx.v+(xx.lr*91),xx.oplat.y,1,1, 4)
            makenrubble("vert", xx.mid+xx.v+(xx.lr*91),xx.oplat.y,-1,1, 4)
            
            
             local check = retowallcheck(xx.mid+(xx.lr*72), xx.y+32,xx.v+(19*xx.lr), xx.j-36) 
          xx.owall = check[1]
          xx.ohit = check[2]
          if xx.ohit ~= 0 then
          makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
          end
            
          end
          hboxcs(xx.id, 
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

        if xx.animcounter >= 15 then 
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

        if xx.animcounter == 13+5 and rampcanhit then

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
          makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
          if xx.oplat == nil then
            xx.oplat = {y=-1}
          end
        end
        
        
        
             check = retowallcheck(xx.mid, xx.y,xx.v-99*xx.lr, xx.j-65)
          xx.owall = check[1]
          xx.ohit = check[2]
          if xx.ohit ~= 0 then
          makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
          if xx.oplat == nil then
            xx.oplat = {y=-1}
          end
          end
        
        
        
          for i = -1, 2 do
          hboxcs(xx.id, 
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

    else if xx.type == 5 then
      if xx.animcounter < 6 then
        if xx.repcounter%2==0 then
          xx.im = ao21
        else
          xx.im = ao23
        end


      elseif xx.animcounter < 25 then

        if xx.animcounter == 6 and rampcanhit then
          xx.oplat = retlineplatcheck(xx.mid, xx.y,xx.v+81*xx.lr, xx.j-138)
          if xx.oplat ~= nil then 
            makenrubble("vert", xx.mid+xx.v+(xx.lr*80),xx.oplat.y,1,1, 5)
            makenrubble("vert", xx.mid+xx.v+(xx.lr*80),xx.oplat.y,-1,1, 5)
          end
          
             
             local check = retowallcheck(xx.mid, xx.y,xx.v+81*xx.lr, xx.j-138)
          xx.owall = check[1]
          xx.ohit = check[2]
          if xx.ohit ~= 0 then
          makenrubble("horiz", xx.owall,xx.ohit,xx.lr*3,0, 4)
          if xx.oplat == nil then
            xx.oplat = {y=-1}
          end
          end
          
          hboxcs(xx.id, 
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

        if xx.repcounter%2==0  then
          xx.im = ao22
        else
          xx.im = ao24
        end



      elseif xx.animcounter < 27 then

        if xx.oplat ~= nil then
          if xx.oplat.y == -1 then
            xx.j = 20
            else
          xx.j = 10
          end
        end
        xx.oplat = nil
        combo(xx)
        if xx.repcounter%2==0  then
          xx.im = ao21
        else
          xx.im = ao23
        end

      elseif xx.animcounter < 160 then
        combo(xx)

      elseif xx.animcounter < 1000 then
        xx.animcounter = 0
      end


    end
  end
end
end