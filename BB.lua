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

uppercutkb = 2
uppercutdam = 4
uppercutj = 22
uppercutft = 20

sparkspeed = 3

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
me.bbpc = 0
me.bbpready = false
you.type = 1
you.bbpc = 0
you.bbpready = false
me.clicka = false
you.clicka = false
me.holda = false
you.holda = false



bbnumpunch = 3

function holdmanage(xx)
  if (xx.a1b or xx.a2b or xx.a3b or xx.a4b) then
    if not xx.holda then
      xx.holda = true
    end
  else xx.holda = false
  end
end


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


  if xx.anibusy --or not xx.readya
  then
    cancelas(xx)
  end

  xx.anibusy = false

  if xx.animcounter > 0 then
    xx.block = false
    xx.jstop = true
    xx.animcounter = xx.animcounter + 1
  elseif xx.animcounter == 0 then 
    xx.combo = 0
    xx.cancombo = false
  end



  if xx.combo > xx.maxcombo then
    cancelas(xx)
  end

end

function combo(xx, func)

  if func ~= nil then
    func()
  end

  if xx.color.n ~= xx.cchangeto.n and xx.cancombo
  then
    xx.actionshot = true
    xx.cancombo = false
  end
  if not xx.holda then
    if xx.a2 or xx.a3 then
      if xx.color.n==0 then
        if xx.bbpc < bbnumpunch then
          xx.bbpc = xx.bbpc+1
          if xx.bbpc == 1 then xx.combo = xx.combo + 1 end
          xx.animcounter = 1
          if math.abs(xx.type) < 2 then
            xx.type = -xx.type
          else xx.type = 1
          end
        end
      elseif xx.color.n==1 and xx.ppnum < numofps then
        xx.type = 1
        xx.animcounter = 1
        xx.ppnum = xx.ppnum + 1
        if xx.ppnum == 1 then xx.combo = xx.combo + 1 end
      elseif xx.color.n==2 and xx.ggpc < maxgps then
        xx.type = 1
        xx.animcounter = 1
        xx.ggpc = xx.ggpc + 1
        if xx.ggpc == 1 then xx.combo = xx.combo + 1 end


      end

    elseif xx.a4 and xx.type ~= 2 then
      if xx.color.n==0 then
        xx.combo = xx.combo + 1
        xx.animcounter = 1
        xx.type = 2

      elseif xx.color.n==1 and xx.ppnum < numofps then
        xx.type = 2
        xx.animcounter = 1
        xx.ppnum = xx.ppnum + 1
        xx.combo = xx.combo + 1
      end
    elseif xx.a1 then
      if xx.color.n==0 then
        xx.type = 3
        xx.animcounter = 1
        xx.combo = xx.combo + 1
      end




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
        if xx.v * (z.x - xx.x) > 0 then
          z.x = z.x + (xx.v*2/3)
        end
      end)
  end
end

punch1 = {im=love.graphics.newImage("me/attack/punch1.png"),c=love.graphics.newImage("me/attack/punch1c.png"),xoff = 15}
punch2 = {im=love.graphics.newImage("me/attack/punch2.png"),c=love.graphics.newImage("me/attack/punch2c.png"),xoff = 15}
punch3 = {im=love.graphics.newImage("me/attack/punch3.png"),c=love.graphics.newImage("me/attack/punch3c.png"),xoff = 15}
punch4 = {im=love.graphics.newImage("me/attack/punch4.png"),c=love.graphics.newImage("me/attack/punch4c.png"),xoff = 15}
punch5 = {im=love.graphics.newImage("me/attack/punch5.png"),c=love.graphics.newImage("me/attack/punch5c.png"),xoff = 15}
punch6 = {im=love.graphics.newImage("me/attack/punch6.png"),c=love.graphics.newImage("me/attack/punch6c.png"),xoff = 15}
kick1 = {im = love.graphics.newImage("me/attack/kick1.png"), c = love.graphics.newImage("me/attack/kick1c.png")}
kick2 = {im = love.graphics.newImage("me/attack/kick2.png"), c = love.graphics.newImage("me/attack/kick2c.png")}
kick3 = {im = love.graphics.newImage("me/attack/kick3.png"), c = love.graphics.newImage("me/attack/kick3c.png")}
uppercut = {im=love.graphics.newImage("me/attack/uppercut.png"),c=love.graphics.newImage("me/attack/uppercutc.png")}



function breadandbutter(xx)


  if xx.animcounter > 7 then
    xx.stop = true
  end
  if xx.animcounter < 17 and xx.animcounter > 0  then
    xx.anibusy = true
  end

  if xx.animcounter == 0 then

    if (xx.a2 or xx.a3) and xx.color.n == 0 and not xx.holda then
      if xx.type >1 then 
        xx.type = 1
      end
      xx.type = -xx.type
      xx.animcounter = 1
      xx.combo = xx.combo + 1
      xx.bbpc = 1
    elseif xx.a4 then
      xx.type = 2
      xx.animcounter = 1
      xx.combo = xx.combo + 1
    elseif xx.a1 then
      xx.type = 3
      xx.animcounter = 1
      xx.combo = xx.combo + 1
    end

  else

    if xx.type <= 1 then
      if xx.animcounter < 6 then
        if xx.type> 0 then
          xx.im = punch1
        else
          xx.im = punch4
        end

      elseif xx.animcounter < 10 then
        if xx.type>0 then
          xx.im = punch2
        else
          xx.im = punch5
        end
        repplay(xx.blues)
        if xx.animcounter == 6 then
          hboxcs(xx.id, 
            {x=xx.mid, y = xx.y+24},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+26},
            {x=xx.mid, y = me.y+30},
            {x=xx.mid+xx.v+(xx.lr*24), y = xx.y+32},
            function(z)
              xx.cancombo = true
              z.health = z.health - bbpdam
              if xx.bbpc == animcounter then
                z.v = xx.lr*bbpkb*3
              else
                z.v = xx.lr*bbpkb
              end
              z.flinch = true
              z.ft = bbft
              if #joysticks>=xx.id then
                xx.joystick:setVibration(.7,1)
              end

              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

            end)
        end
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



    elseif xx.type == 2 then
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
            xx.cancombo = true
            z.health = z.health - bbkdam
            z.v = xx.lr*bbkkb
            z.flinch = true
            z.ft = bbft
            if #joysticks>=xx.id then
              xx.joystick:setVibration(1,1)
            end
            makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)

          end)
      elseif xx.animcounter < 43 then
        xx.im = kick3
        xx.xoffset = 15
        xx.yoffset = 10
        if xx.animcounter >= 17 then 
          combo(xx)
        end
      elseif xx.animcounter >= 43 then
        xx.animcounter = 0
        xx.bbpc = 0
      end
    elseif xx.type ==3 then
      if xx.animcounter < 9 then
        xx.im = punch6
        xx.xoffset = 15
      elseif xx.animcounter < 16 then
        xx.im = uppercut
        xx.xoffset = 15
        if xx.animcounter == 9 then
          hboxcs(xx.id, 
            {x=me.mid, y = me.y+30},
            {x=me.mid+me.v+(me.lr*11), y = me.y+8},
            {x=me.mid, y = me.y+20},
            {x=me.mid+me.v+(me.lr*17), y = me.y+8},

            function(z)
              xx.cancombo = true
              z.health = z.health - uppercutdam
              z.v = uppercutkb
              z.j = uppercutj
              z.flinch = true
              z.ft = uppercutft
              if #joysticks>=xx.id then
                xx.joystick:setVibration(1,1)
              end
              makesparks(xx.y+30,xx.v+xx.x+xx.lr*(15),sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b)
            end)
        end
      elseif xx.animcounter >= 16 then
        xx.animcounter = 0
        xx.bbpc = 0
      end
    end
  end
end