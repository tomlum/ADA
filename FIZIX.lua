--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction


floor = 1900 - 2
you.tempfloor = floor
me.tempfloor = floor


you.jmax = jmax
me.jmax = jmax

maps = {}
me.plat = noplat
you.plat = noplat
noplat = {n=0;}
maps.fightclub = {name = "fightclub", 
  plats = {},
  floor = 896
}
table.insert(maps.fightclub.plats, {n=1, y = 896, x1 = 0, x2 = 100000, floor = true})
table.insert(maps.fightclub.plats, {n=2, y = 465, x1 = 32, x2 = 236})
table.insert(maps.fightclub.plats, {n=3, y = 541, x1 = 839, x2 = 1016})
table.insert(maps.fightclub.plats, {n=4, y = 719, x1 = 655, x2 = 1560})



--glass = true option for some floors


function platformcheckx()

  hboxp() 

end

walls = function ()


  if themap.name == "library" then

    if me.x + me.v >= 1405-35+10 and me.feet > floor - 63 and me.x <= 1405-30+10 and me.dig == 0 then me.x = 1405-35+10 me.v = 0 end
    if you.x + you.v >= 1405-35+10 and you.feet > floor - 63 and you.x <= 1405-30+10 and you.dig == 0 then you.x = 1405-35+10 you.v = 0 end



  end



  if you.x + you.v <= 40 then 
    if you.flinch and math.abs(you.v) > 10 then 
      you.health = you.health - math.abs(you.v/2)
      you.v = -you.v/3
      you.j = math.abs(you.v)
      makerubble(you.mid, you.y,you.v, you.j)
      you.flinchway = -you.flinchway
      repplay(wallhit2)
      you.g = false
      you.y = you.y - 10
    else
      you.x = 40
      you.v = 0
    end

  elseif you.x + you.v >= enviro.rightwall - 75 then
    if you.flinch and math.abs(you.v) > 10 then 
      you.health = you.health - math.abs(you.v/2)
      you.v = -you.v/3
      you.j = math.abs(you.v)
      makerubble(you.mid, you.y,you.v, you.j)
      you.flinchway = -you.flinchway

      repplay(wallhit2)
      you.g = false
      you.y = you.y - 10
    else
      you.x = enviro.rightwall - 75
      you.v = 0
    end
  end

  if me.x + me.v <= 40 then 
    if me.flinch and math.abs(me.v) > 10 then 
      me.health = me.health - math.abs(me.v/2)
      me.v = -me.v/3
      me.j = math.abs(me.v)
      makerubble(me.mid, me.y,me.v, me.j)
      me.flinchway = -me.flinchway

      me.g = false
      me.y = me.y - 10
      repplay(wallhit1)
    else
      me.x = 40
      me.v = 0

    end

  elseif me.x + me.v >= enviro.rightwall - 75 then
    if me.flinch and math.abs(me.v) > 10 then 
      me.health = me.health - math.abs(me.v/2)
      me.v = -me.v/3
      me.j = math.abs(me.v)
      makerubble(me.mid, me.y,me.v, me.j)
      me.flinchway = -me.flinchway

      repplay(wallhit1)
      me.g = false
      me.y = me.y - 10
    else
      me.x = enviro.rightwall - 75
      me.v = 0
    end
  end

end

--FRICTION FUNCTION TO SLOW DOWN


fric = function (xx) 
  
  xx.v = rodib(xx.v,fricrate*rampspeed,xx.push)
  
  
  if not xx.landing
  then
    if xx.v > 0+xx.push and not xx.dodge 
    then
      xx.slide = true
      xx.slidetimer = 0
    elseif xx.v < 0+xx.push and not xx.dodge 
    then
      me.slide = true
      xx.slidetimer = 0
    end
  end
end





function vroomright(xx)
  if xx.v == 0+xx.push and not xx.running
  then xx.v = 1.5+xx.push
  elseif xx.v >0+xx.push and xx.v < speedlimit -accel+xx.push and not xx.running
  then xx.v = xx.v + accel
  elseif xx.v >0+xx.push and xx.v >= speedlimit -accel+xx.push  and not xx.running
  then xx.v = speedlimit -accel+xx.push
  end
end 

function vroomleft(xx)
  if xx.v == 0+xx.push and not xx.running
  then xx.v = -1.5+xx.push
  elseif xx.v < 0+xx.push and xx.v > -speedlimit + accel+xx.push and not xx.running
  then xx.v = xx.v - accel
  elseif xx.v < 0+xx.push and xx.v <= -speedlimit + accel+xx.push and not xx.running
  then xx.v = -speedlimit + accel+xx.push
  end
end 




--gravity = function (n)
--	if 



me.ctim = 0
you.ctim = 0

me.running = false
you.running = false

--if me.running then jump height is half

function fallthroughglassfloor()

  if themap.name == "floors" and
  me.mid > 2154 and me.mid < 2726 and me.y < 3000 and me.y > 2000 and me.running
  then me.g = false me.y = me.y + 2 me.onplat = false
  end

end


function runrunrun()

  if not me.g then me.running = false end
  if not you.g then you.running = false end

  if me.running and math.abs(me.push) > 0 then me.j = 14 me.g = false
    me.v = me.v + me.push*4 
  end
  if you.running and math.abs(you.push) > 0 then  you.j = 14 you.g = false
    you.v = you.v + you.push*4
  end

  if me.flinch or math.abs(me.v) <= speedminit then 
    me.running = false
  elseif me.running then 
    me.a1 = false
    me.a2 = false
    me.a3 = false
    me.a4 = false


  end

  if me.run and me.running and (me.right or me.left) and me.run and not me.block and not anyofmycombos() and not anyofmyprimes() and not me.slide and not me.dodge then         
    if me.right and me.v > 0 then
      me.v = runspeed
    elseif me.left and me.v < 0 then
      me.v = -runspeed
    end





  elseif math.abs(me.v) > speedminit-accel*2 and (me.left or me.right) and me.g and not c1accept() and me.run and not me.block and not anyofmycombos() and not me.slide and not me.dodge then
    me.a1 = false
    me.a2 = false
    me.a3 = false
    me.a4 = false
    me.running = true
    melimitbreak = true
    if me.right and me.v > 0 then
      me.v = runspeed
    elseif me.left and me.v < 0 then
      me.v = -runspeed
    end


  end

  if you.flinch or math.abs(you.v) <= speedlimit then 
    you.running = false
  elseif you.running then 
    you.a1 = false
    you.a2 = false
    you.a3 = false
    you.a4 = false


  end

  if you.run and you.running and (you.right or you.left) and you.run and not you.block and not anyofyourcombos() and not anyofyourprimes() and not you.slide and not you.dodge then         
    if you.right and you.v > 0 then
      you.v = runspeed
    elseif you.left and you.v < 0 then
      you.v = -runspeed
    end





  elseif math.abs(you.v) > speedlimit-accel*2 and (you.left or you.right) and you.g and not c1accept() and you.run and not you.block and not anyofyourcombos() and not anyofyourprimes() and not you.slide and not you.dodge then
    you.a1 = false
    you.a2 = false
    you.a3 = false
    you.a4 = false
    you.running = true
    youlimitbreak = true
    if you.right and you.v > 0 then
      you.v = runspeed
    elseif you.left and you.v < 0 then
      you.v = -runspeed
    end


  end




end

climbs = function(xx)




  if xx.flinch then xx.ctim = 0 end

  if xx.ctim > 0 then xx.ctim = xx.ctim + 1
    xx.busy = true

    if xx.ctim > 10 then
      xx.ctim = 0
      if xx.up then 
        xx.g = false
        xx.j = hopj
        repplay(xx.jumpd) 
      elseif me.left then 
        xx.g = false
        xx.j = hopj2
        xx.v = -hopv2
      elseif xx.right then 
        xx.g = false
        xx.j = hopj2
        xx.v = hopv2
      end

    elseif xx.ctim > 7 then
      xx.im = climb3
      xx.j = climbj
    elseif xx.ctim > 4 then
      xx.im = climb2
      xx.j = climbj

    elseif xx.ctim > 0 then
      xx.im = climb
      if xx.ctim == 4 then
        repplay(xx.climbsound) 
      end
    end

  end



end

me.oldg = true
you.oldg = true

me.gothroughplats = false
you.gothroughplats = false

function movex(xx,z)
  if z.down then 
    xx.gothroughplats = true
  else
    xx.gothroughplats = false
  end

  ------?????--------
  if xx.flinch then
    xx.jt = 0
  end


  xdif = math.abs((you.x) - (me.x))

  if xdif >= 2100
  then speedlimit = minmaxdif+speedminit
    runspeed = initrunspeed+minmaxdif
  elseif xdif < 700 then
    speedlimit = speedminit
    runspeed = initrunspeed
  else
    speedlimit = (minmaxdif * ((xdif-700)/1400)) + speedminit
    runspeed = (minmaxdif * ((xdif-700)/1400)) + initrunspeed
  end 




  xx.feet = xx.y + 60
  if xx.g 
  then 
    if xx.j < 0 then xx.j = 0
    end
    if z.up and not xx.flinch and not xx.block and not xx.jstop and not xx.busy
    and not z.a1 and not z.a2 and not z.a3 and not xx.bur and not xxpurp
    then 
      if xx.running then
        xx.jt = runjt
        xx.jmax = runjmax
        xx.j = runj
      else
        xx.jt = jt
        xx.jmax = jmax
        xx.j = jumpj
      end
      xx.ht = 7
      xx.firstjump = true
      xx.g = false
      repplay(xx.jumpd)
    elseif z.right and xx.v >= xx.push and xx.stop == false and not xx.flinch
    and not z.left
    then 
      vroomright(xx)
    elseif z.left and xx.v <= xx.push and xx.stop == false and not xx.flinch
    and not z.right
    then 
      vroomleft(xx)
    elseif z.down and xx.onplat and not xx.busy and not xx.dodge
    and not z.a1 and not z.a2 and not z.a3 and not z.a4
    then
      xx.y = xx.y + 4
    else
      fric(xx)
    end
  else

    if xx.landingcounter > 0
    then
      xx.landingcounter = xx.landingcounter - 1
    end
    if z.blockb and math.abs(z.j) + math.abs(z.v)< velforclimb and climbplatcheck(xx.x, xx.y, xx.lr, xx.height, xx.v, xx.j)
    then 
      if climbplatcheck(xx.x, xx.y+xx.height/2, xx.lr, xx.height/2, xx.v, xx.j) then
        xx.ctim = 7
      else xx.ctim = 1
      end
      xx.im = climb
      xx.onplat = true
      xx.j = climbj
      xx.v = xx.v/2
    elseif z.left and xx.v >= 1 + xx.push*1.5
    then xx.v = xx.v - adecrate
      xx.slowdown = true

    elseif z.right and xx.v <= -1 + xx.push*1.5
    then xx.v = xx.v + adecrate
      xx.slowdown = true
    elseif z.left and xx.v > - maxairmove + xx.push*1.5
    then xx.v = xx.v -amovrate
      xx.slowdown = false
    elseif z.right and xx.v < maxairmove + xx.push*1.5
    then xx.v = xx.v +amovrate
      xx.slowdown = false

    elseif xx.push > 0 then
      bloop = 2
      if xx.v > xx.push*1.5 then 
        xx.v = xx.v - 1
      elseif xx.v < xx.push*1.5 then 
        xx.v = xx.v + 1
      end


    end

    --landing
    if z.up and xx.j > 0 
    and xx.jmax > 0 
    and xx.firstjump
    then xx.jmax = xx.jmax - .7*rampspeed
      --the end arc/fall of any jump or the mini jump
    else
      xx.firstjump = false
      if xx.jt > 0
      then xx.jt = xx.jt -  1*rampspeed
      elseif xx.jt <= 0 and xx.j > - maxgravity
      then xx.jt = xx.jt -  1*rampspeed
        if xx.j >= 0 then
          xx.j = xx.j - risegrav*rampspeed
        else

          xx.j = xx.j - dropgrav*rampspeed
        end
        --elseif xx.jt <= 0 and xx.ht > 0
        --then xx.j = 0
        --	xx.ht = xx.ht - 1	
      end




    end
  end
end














