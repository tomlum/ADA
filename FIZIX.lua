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
function spikecheck(x, y)

  if themap.name == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821-178 
    then return 1064+400-821-178
    elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821-178 
    then return 1140+400-821-178
    elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821-178 
    then return 1140+400-821-178
    elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821-178 
    then return 1318+400-821-178
    else return floor
    end

  elseif themap.name == "street" then

    if x >= 2879 and x <= 3143 and y <= 618+400 
    then return 618+400
    elseif x >= 1118 and x <= 1528 and y <= 979+400 
    then
      return 979+400
    elseif x >= 2245 and x <= 2750 and y <= 1227+400 
    then return 1227+400




    elseif x > 2750 and x <=2968 and y <= 1270 +400
    then return 1270+400





    elseif x >= 3294 and x <= 3676 and y <= 618 +400
    then return 618+400
    elseif x >= 3325 and x <= 3764 and y <= 1270 +400
    then return 1270+400
    elseif x >= 4485 and x <= 4689 and y <= 1064 +400
    then return 1064+400
    elseif x >= 5292 and x <= 5469 and y <= 1140 +400
    then return 1140+400
    elseif x >= 5654 and x <= 5831 and y <= 1140 +400
    then return 1140+400
    elseif x >= 5108 and x <= 6013 and y <= 1318 +400
    then return 1318+400



    else return floor
    end

  elseif themap.name == "library" then

    if x >= 1535 and x < 3200 and y <= 871 
    then return 871
    elseif x >= 1616 and x < 3196 and y <= 1516
    then return 1516
    elseif y <= floor and x < 1400
    then return floor
    elseif y <= floor - 63 and x >= 1400
    then return floor - 63
    else return floor
    end
  elseif themap.name == "floors" then

    if x >= 418 and x <= 2140 then	


      if x == -20000 then return 0
      elseif y <= 1612 then 
        return 1612
      elseif y <= 1898 and (x < 636 or x > 2071) then 
        return 1898
      elseif y <= 2184 and (x < 643 or x < 2136) then 
        return 2184
      elseif y <= 2471 and (x < 808 or (x > 1755 and x < 2130)) then 
        return 2471
      elseif y <= 2756 then 
        return 2756
      elseif x > 581 and x < 1039 and y <= 3004 then
        return 3004
      elseif y <= 3328 then 
        return 3328
      elseif y <= 3614 then 
        return 3614
      elseif y <= 3900 then 
        return 3900
      elseif y <= 4186 then 
        return 4186
      elseif y <= 4472 then 
        return 4472
      elseif y <= 4758 then 
        return 4758
      elseif y <= 5044 then 
        return 5044
      elseif y <= 5330 then 
        return 5330
      elseif y <= 5616 and y >= 5586 then 
        return 5616
      else return floor
      end
    elseif x >= 3161 then
      if x < - 200 then return 0
      elseif y <= 2829  and (x <= 3847 or x >= 4335) and x < 4908 then 
        return 2829
      elseif y <= 3207 and (x <= 4168 or x >= 4405) and x < 4889 then 
        return 3207
      elseif y <= 3506 and x < 4699 then 
        return 3506
      elseif y <= 3805 and x < 4784 then 
        return 3805
      elseif y <= 4104 and x < 4899 then 
        return 4104
      elseif y <= 4403 and x < 4906 then 
        return 4403
      elseif y <= 4702 and x < 4889 then 
        return 4702
      elseif y <= 5001 and x < 4895 then 
        return 5001
      elseif y <= 5300 and x < 4898 then 
        return 5300
      elseif y <= 5599 and x < 4901 then 
        return 5599
      else return floor
      end

    else
      return floor
    end







  end
end


minecheck = function(x, y)

  if themap.name == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821-178 
    then return 1064+400-821-178
    elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821-178 
    then return 1140+400-821-178
    elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821-178 
    then return 1140+400-821-178
    elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821-178 
    then return 1318+400-821-178
    else return floor
    end

  elseif themap.name == "street" then

    if x >= 2879 and x <= 3143 and y <= 618+400 
    then return 618+400
    elseif x >= 1118 and x <= 1528 and y <= 979+400 
    then
      return 979+400
    elseif x >= 2245 and x <= 2750 and y <= 1227+400 
    then return 1227+400




    elseif x > 2750 and x <=2968 and y <= 1270 +400
    then return 1270+400





    elseif x >= 3294 and x <= 3676 and y <= 618 +400
    then return 618+400
    elseif x >= 3325 and x <= 3764 and y <= 1270 +400
    then return 1270+400
    elseif x >= 4485 and x <= 4689 and y <= 1064 +400
    then return 1064+400
    elseif x >= 5292 and x <= 5469 and y <= 1140 +400
    then return 1140+400
    elseif x >= 5654 and x <= 5831 and y <= 1140 +400
    then return 1140+400
    elseif x >= 5108 and x <= 6013 and y <= 1318 +400
    then return 1318+400



    else return floor
    end

  elseif themap.name == "library" then

    if x >= 1535 and x < 3200 and y <= 871 
    then return 871


    elseif x >= 1905 and x < 2020 and y <= 1198 
    then return 1198
    elseif x >= 2271 and x < 2386 and y <= 1198  
    then return 1198
    elseif x >= 2637 and x < 2752 and y <= 1198 
    then return 1198
    elseif x >= 3003 and x < 3118 and y <= 1297 
    then return 1297


    elseif x >= 1616 and x < 3196 and y <= 1516
    then return 1516

    elseif x >= 1893 and x < 2135 and y <= 1804 
    then return 1804
    elseif x >= 2321 and x < 2563 and y <= 1804 
    then return 1804
    elseif x >= 2749 and x < 2991 and y <= 1804 
    then return 1804



    elseif y <= floor and x < 1400
    then return floor
    elseif y <= floor - 63 and x >= 1400
    then return floor - 63
    else return floor
    end

  elseif themap.name == "floors" then 

    if x >= 418 and x <= 2140 then	


      if x == -20000 then return 0
      elseif y <= 1612 then 
        return 1612
      elseif y <= 1898 and (x < 636 or x > 2071) then 
        return 1898
      elseif y <= 2184 and (x < 643 or x < 2136) then 
        return 2184
      elseif y <= 2471 and (x < 808 or (x > 1755 and x < 2130)) then 
        return 2471
      elseif y <= 2756 then 
        return 2756
      elseif x > 581 and x < 1039 and y <= 3004 then
        return 3004
      elseif y <= 3328 then 
        return 3328
      elseif y <= 3614 then 
        return 3614
      elseif y <= 3900 then 
        return 3900
      elseif y <= 4186 then 
        return 4186
      elseif y <= 4472 then 
        return 4472
      elseif y <= 4758 then 
        return 4758
      elseif y <= 5044 then 
        return 5044
      elseif y <= 5330 then 
        return 5330
      elseif y <= 5616 and y >= 5586 then 
        return 5616
      else return floor
      end

    elseif y <= 2688 and x > 2154 and x < 2726 then 
      return 2688
    elseif y <= 5778 and x > 2142 and x < 2299 then 
      return 5778
    elseif x >= 3161 then
      if x < - 200 then return 0
      elseif y <= 2829 and (x <= 3847 or x >= 4335) and x < 4908 then 
        return 2829
      elseif y <= 3207 and (x <= 4168 or x >= 4405) and x < 4889 then 
        return 3207
      elseif y <= 3506 and x < 4699 then 
        return 3506
      elseif y <= 3805 and x < 4784 then 
        return 3805
      elseif y <= 4104 and x < 4899 then 
        return 4104
      elseif y <= 4403 and x < 4906 then 
        return 4403
      elseif y <= 4702 and x < 4889 then 
        return 4702
      elseif y <= 5001 and x < 4895 then 
        return 5001
      elseif y <= 5300 and x < 4898 then 
        return 5300
      elseif y <= 5599 and x < 4901 then 
        return 5599
      else return floor
      end

    else
      return floor
    end





  end
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
  
  if xx.v > xx.push then 
    if xx.v - fricrate < xx.push then
      xx.v = xx.push
    else
      xx.v = xx.v - fricrate
    end
  elseif xx.v < xx.push then 
    if xx.v + fricrate > xx.push then
      xx.v = xx.push
    else
      xx.v = xx.v + fricrate
    end
  end
  
  
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





  elseif math.abs(me.v) > speedminit-accel*2 and (me.left or me.right) and me.g and not c1accept() and me.run and not me.block and not anyofmycombos() and not anyofmyprimes() and not me.slide and not me.dodge then
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














