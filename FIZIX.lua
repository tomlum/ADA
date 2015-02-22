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
  plats = {}, walls = {},
  floor = 896
}
table.insert(maps.fightclub.plats, {n=1, y = 896, x1 = 0, x2 = 100000, floor = true})
table.insert(maps.fightclub.plats, {n=2, y = 465, x1 = 32, x2 = 236})
table.insert(maps.fightclub.plats, {n=3, y = 541, x1 = 839, x2 = 1016})
table.insert(maps.fightclub.plats, {n=4, y = 719, x1 = 655, x2 = 1560})

table.insert(maps.fightclub.walls, {n=1, y1 = -1, x=0, barrier = true})
table.insert(maps.fightclub.walls, {n=2, y1 = -1, x=2000, barrier = true})



--glass = true option for some floors


function platformcheckx()

  hboxp() 

  hboxwall()

end


--FRICTION FUNCTION TO SLOW DOWN


function transferofenergy(xx)
  if xx.g and xx.j<0 then 
    if xx.v > 0 then
      xx.v = xx.v - xx.j/2 
    elseif xx.v < 0 then
      xx.v = xx.v + xx.j/2 
    else 
      if math.random() > .5 then
      xx.v = xx.v + xx.j/3 
      else
      xx.v = xx.v - xx.j/3 
        end
      end
    end
  
end

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
      xx.slide = true
      xx.slidetimer = 0
    end
  end
end





function vroomright(xx)
  if xx.v == 0+xx.push and not xx.running
  then xx.v = 1.5+xx.push
  elseif xx.v >0+xx.push and xx.v < (speedlimit -accel+xx.push)*xx.color.s.speed and not xx.running
  then xx.v = xx.v + (accel+xx.push)*xx.color.s.speed
  elseif xx.v >0+xx.push and xx.v >= (speedlimit -accel+xx.push)*xx.color.s.speed  and not xx.running
  then xx.v = (speedlimit -accel+xx.push)*xx.color.s.speed
  end
end 

function vroomleft(xx)
  if xx.v == 0+xx.push and not xx.running
  then xx.v = -1.5+xx.push
  elseif xx.v < 0+xx.push and xx.v > (-speedlimit + accel+xx.push)*xx.color.s.speed and not xx.running
  then xx.v = xx.v - (accel+xx.push)*xx.color.s.speed
  elseif xx.v < 0+xx.push and xx.v <= (-speedlimit + accel+xx.push)*xx.color.s.speed and not xx.running
  then xx.v = (-speedlimit + accel+xx.push)*xx.color.s.speed
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
  for i,xx in ipairs(hitt) do 
    if not xx.g then xx.running = false end

    if xx.running and math.abs(xx.push) > 0 then xx.j = 14 xx.g = false
      xx.v = xx.v + xx.push*4 
    end
    if xx.flinch or math.abs(xx.v) <= speedminit then 
      xx.running = false
    elseif xx.running then 
      xx.a1 = false
      xx.a2 = false
      xx.a3 = false
      xx.a4 = false


    end

    if xx.run and xx.running and (xx.right or xx.left) and xx.run and not xx.block and not xx.slide and not xx.dodge then         
      if xx.right and xx.v > 0 then
        xx.v = runspeed
      elseif xx.left and xx.v < 0 then
        xx.v = -runspeed
      end





    elseif math.abs(xx.v) > speedminit-accel*2 and (xx.left or xx.right) and xx.g  and xx.run and not xx.block and not xx.slide and not xx.dodge then
      xx.a1 = false
      xx.a2 = false
      xx.a3 = false
      xx.a4 = false
      xx.running = true
      xx.limitbreak = true
      if xx.right and xx.v > 0 then
        xx.v = runspeed
      elseif xx.left and xx.v < 0 then
        xx.v = -runspeed
      end


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

function movex(xx)
  
transferofenergy(xx)
  z = xx
  if xx.landingcounter > landingwait then
        xx.stop=true
        xx.holda = true
      end
  
  if z.down  then 
    xx.gothroughplats = true
  else
    xx.gothroughplats = false
  end
  
  xx.forcethroughplats = false

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
        xx.j = jumpj*xx.color.s.jump
      end
      xx.ht = 7
      xx.firstjump = true
      xx.g = false
      repplay(xx.jumpd)
    elseif z.right and xx.v >= xx.push and xx.stop == false and not xx.flinch and xx.landingcounter < 6
    and not z.left
    then 
      vroomright(xx)
    elseif z.left and xx.v <= xx.push and xx.stop == false and not xx.flinch and xx.landingcounter < 6
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
      xx.landingcounter = xx.landingcounter - 1*rampspeed
    else xx.landingcounter = 0
    end
    if z.blockb and math.abs(z.j) + math.abs(z.v)< velforclimb and climbplatcheck(xx.x, xx.y, xx.lr, xx.height, xx.v, xx.j) and xx.j > 0
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
    then xx.v = xx.v - adecrate*rampspeed
      xx.slowdown = true

    elseif z.right and xx.v <= -1 + xx.push*1.5
    then xx.v = xx.v + adecrate*rampspeed
      xx.slowdown = true
    elseif z.left and xx.v > - maxairmove + xx.push*1.5
    then xx.v = xx.v -amovrate*rampspeed
      xx.slowdown = false
    elseif z.right and xx.v < maxairmove + xx.push*1.5
    then xx.v = xx.v +amovrate*rampspeed
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














