--maybe if... dying then color fades in color?  Or becomes darker!!!
--trails or something, sparks
--WHILE COMBO, ANIMCOUNTER NEVER GOES BELOW 1 (USUALLY RESETS TO 1)
--FLINCH IS RESPONSIBLE FOR LOWERING combo TO 0 and animcounter to 0
--General combo funciton responsible for keeping track of combo and attacking, not individual functions
bbpdam = 6
bbkdam = 12
--knockback
bbpkb = 7
bbkkb = 20
bbft = 15


sparkspeed = 3

maxcombo = 4
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
me.bbpc = 0
me.bbpready = false
me.clicka = false
you.clicka = false

bbnumpunch = 2

function combomanage(xx)


  if (xx.a1 or xx.a2 or xx.a3 or xx.a4) then
    if not xx.clicka then
      xx.clicka = true
      xx.readya = true
    else 
      xx.readya = false
    end
  else
    xx.clicka = false
    xx.readya = false
  end

  if xx.anibusy or not xx.readya then
    cancelas(xx)
  end

  xx.anibusy = false

  if xx.animcounter > 0 then
    xx.block = false
    xx.animcounter = xx.animcounter + 1
  elseif xx.animcounter == 0 then xx.combo = 0
  end

  if xx.flinch then xx.animcounter = 0
  end

  if xx.combo > xx.maxcombo then
    cancelas(xx)
  end



end

function combo(xx)
  if xx.a2 or xx.a3 then
    if xx.color.n==0 then
      if xx.bbpc < bbnumpunch then
        xx.bbpc = xx.bbpc+1
        xx.animcounter = 1
        xx.type = -xx.type
      end
    end
  end
  if xx.a4 then
    if xx.color.n==0 then
      xx.combo = xx.combo + 1
      xx.animcounter = 1
      xx.type = 2
    end
  end
end


function cancelas(xx) 
  xx.a1, xx.a2, xx.a3, xx.a4 = false, false, false, false
end

--bounce method, if hit squares and not dodge then yeah
function bump(xx)
  if not xx.dodge then
    hboxcs(xx.id, 
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y+55},
      {x=xx.mid+((8 * (-xx.v/(math.abs(xx.v))))), y = xx.y+55},
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y+5},
      {x=xx.mid+((8 * (-xx.v/(math.abs(xx.v))))), y = xx.y+5},
      function(z)
        z.x = z.x + (xx.v*2/3)
      end)
  end
end

punch1 = love.graphics.newImage("me/attack/punch1.png")
punch2 = love.graphics.newImage("me/attack/punch2.png")
punch3 = love.graphics.newImage("me/attack/punch3.png")
punch4 = love.graphics.newImage("me/attack/punch4.png")
punch5 = love.graphics.newImage("me/attack/punch5.png")
punch6 = love.graphics.newImage("me/attack/punch6.png")
kick1 = love.graphics.newImage("me/attack/kick1.png")
kick2 = love.graphics.newImage("me/attack/kick2.png")
kick3 = love.graphics.newImage("me/attack/kick3.png")



function breadandbutter(xx, inuse)

  if inuse then

    if xx.animcounter > 7 then
      xx.stop = true
    end
    if xx.animcounter < 17 and xx.animcounter > 0  then
      xx.anibusy = true
    end

    if xx.animcounter == 0 then

      if (xx.a2 or xx.a3) then
        if xx.type >1 then 
          xx.type = 1
        end
        xx.type = -xx.type
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end

      if xx.a4 then
        xx.type = 2
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end

    else

      if xx.type < 2 then
        if xx.animcounter < 6 then
          if xx.type> 0 then
            xx.im = punch1
          else
            xx.im = punch4
          end
          xx.xoffset = 15

        elseif xx.animcounter < 10 then
          if xx.type>0 then
            xx.im = punch2
          else
            xx.im = punch5
          end
          xx.xoffset = 15
          repplay(xx.blues)
          hboxcs(xx.id, 
            {x=xx.mid, y = xx.y+24},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+26},
            {x=xx.mid, y = me.y+30},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+32},
            function(z)
              z.health = z.health - bbpdam
              if xx.bbpc == animcounter then
                z.v = xx.lr*bbpkb*3
              else
                z.v = xx.lr*bbpkb
              end
              z.flinch = true
              z.ft = bbft

              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.c.r,xx.c.g,xx.c.b)

            end)
          xx.v = xx.v + (xx.lr*3)

        elseif xx.animcounter < 37 then
          if xx.type>0 then
            xx.im = punch3
          else
            xx.im = punch6
          end
          xx.xoffset = 15

          if xx.animcounter >= 17 then 
            combo(xx)
          end

        elseif xx.animcounter >= 37 then
          xx.animcounter = 0
          xx.bbpc = 0
        end



      elseif xx.type ==2 then
        if xx.animcounter < 12 then
          xx.im = kick1
          xx.xoffset = 15
          xx.yoffset = 10
        elseif xx.animcounter < 18 then
          xx.im = kick2
          xx.xoffset = 15
          xx.yoffset = 10
          hboxcs(xx.id, 
            {x=me.mid, y = me.y+31},
            {x=me.mid+me.v+(me.lr*28), y = me.y+31},
            {x=me.mid, y = me.y+37},
            {x=me.mid+me.v+(me.lr*28), y = me.y+39},

            function(z)
              z.health = z.health - bbkdam
              z.v = xx.lr*bbkkb
              z.flinch = true
              z.ft = bbft
              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.c.r,xx.c.g,xx.c.b)

            end)
        elseif xx.animcounter < 43 then
          xx.im = kick3
          xx.xoffset = 15
          xx.yoffset = 10
        elseif xx.animcounter == 43 then
          xx.animcounter = 0
          xx.bbpc = 0
        end
      end
    end
  end

end