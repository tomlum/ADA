--if going toward then speedlimit is dif?
--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction
slipoffedges = true

jumpj = 0

floor = 1900 - 2

slowtime = 60
speedramp = false
slow_mo_t = 0



function speedRamp()

  if love.keyboard.isDown("f") then rampspeed = .2 end
  if love.keyboard.isDown("z") or slowbutton
    then slowt = slowt + 1
    if slowt > slowrate then slowt = 0
    end
  else 
    slowrate = 10
    slowt = slowrate
  end
  
  if speedramp then 
    rampspeed = therampspeed
    if ramptimer >= 1 then 
      ramptimer = 0
      rampcanhit = true
    else 
      ramptimer = ramptimer + therampspeed
      rampcanhit = false
    end
  else
    ramptimer = 0
    rampcanhit = true
    if rampspeed + rampnormaldelta < 1 then
      rampspeed = rampspeed + rampnormaldelta
    else
      rampspeed = 1
    end
  end
end

function gavinAndDan()
  if slow_mo_t > 0 then
    slow_mo_t = slow_mo_t - 1
    speedramp = true
    musfadein = -3
  elseif slowww then 
    slowww = false 
    slow_mo_t = slowtime
  else 
    speedramp = false
    slow_mo_t = 0
    if musfade == 0 then
      musfadein = 10
      musfade = 255
      repplay(collides)
      --deathsound:play()
      --bcs:play()
    end


  end



end

function bumpDetection()
  if math.abs(me.v) > math.abs(you.v) then
    bump(me)
    bump(you)
  elseif math.abs(me.v) < math.abs(you.v) then
    bump(you)
    bump(me)
  else
    if math.random()>.5 then 
      bump(me)
      bump(you)
    else 
      bump(you)
      bump(me)
    end

  end
end

function respawntravel(xx)
  if xx.go_here ~= nil then
    xx.gothroughplats = true
    xx.float = true
    xx.im = invis
    local xready = false
    local yready = false
    local xtraveldis = xx.x - xx.go_here.x
    if math.abs(xtraveldis) > 5 then
      xx.stop = true
      xx.x = xx.x-xx.go_here_d.x
      xx.v = 0
    else
      xready = true
    end

    local ytraveldis = xx.y - xx.go_here.y
    if math.abs(ytraveldis) > 5 then
      xx.stop = true
      xx.y = xx.y-xx.go_here_d.y
      xx.j = 0
      xx.v = 0
    else
      yready = true
    end

    if xready and yready then
      xx.go_here = nil
    end

  end
end

function iwanttobreakfree(xx)
  if xx.flinch and xx.holda and not xx.oldholda then
    xx.ft = xx.ft-.5*ramp(xx)

  end

  xx.oldaholda = xx.holda 
end


function relativity(xx)

  if speedramp then 
    if xx.ramptimer > 1 then 
      xx.ramptimer = 0
      xx.rampcanhit = true
    else 
      xx.ramptimer = xx.ramptimer + xx.rampspeed
      xx.rampcanhit = false
    end
  else
    xx.ramptimer = 0
    xx.rampcanhit = true
  end

  if dangerclose and not actionshot then
    if rampspeed - dangerRampDelta > dangerrampspeed
      then
      rampspeed = rampspeed - dangerRampDelta
    else
      rampspeed = dangerrampspeed
    end
  end




  if rampspeed <1 then

    --if xx.id == 1 then
    --  xx.rampspeed = .5
    --else
    if dangerclose and not actionshot then
      xx.rampspeed = rampspeed+(1-rampspeed)/3
      
    else
      xx.rampspeed = rampspeed
    end
    --end
  end


end



you.tempfloor = floor
me.tempfloor = floor

jmax = initjmax * cscale/minzoom
you.jmax = jmax
me.jmax = jmax

me.plat = noplat
you.plat = noplat




function updateboxes()
  if the_maps[mapNum].boxes ~= nil and not pause then
    for i,xx in ipairs(players) do 
      for j,b in ipairs(the_maps[mapNum].boxes) do
        local xline = {p1 = {x = xx.mid, y = xx.y+xx.height/2},
        p2 = {x = xx.mid+xx.v, y = xx.y+xx.height/2-xx.j}
      }
      local bline1 = {p1 = {x = b.p1.x - b.size, y = b.p1.y-b.size},
      p2 = {x = b.p1.x + b.size, y = b.p1.y+b.size}
    }
    local bline2 = {p1 = {x = b.p1.x - b.size, y = b.p1.y+b.size},
    p2 = {x = b.p1.x + b.size, y = b.p1.y-b.size}
  }
  if lint(xline, bline1) or lint(xline, bline2) then
    if b.kind == "paper" and math.sqrt(xx.v^2 + xx.j^2) > paperweight then
      makenpaper(b.p1.x+math.random(-b.size,b.size),
        b.p1.y+math.random(-b.size,b.size)
        ,xx.v,xx.j,b.density)
    elseif b.kind == "leaf" then
      makenleaves(b.p1.x+math.random(-b.size,b.size),
        b.p1.y+math.random(-b.size,b.size)
        ,xx.v,xx.j,b.density)

    end
  end

end
end
end

end

function ramp(xx)
  return xx.rampspeed
end






--glass = true option for some floors


function platformcheckx()

  hexPlat() 

  hboxwall()

end




--bounce method, if hit squares and not dodge then yeah
function bump(xx)
  if not xx.dodge then
    hexHit(xx, xx.id, 
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y},
      {x=xx.mid, y = xx.y+55},
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y+xx.height},
      {x=xx.mid, y = xx.y+5},
      function(z)
        if not(xx.color.n==2 and xx.attack_num==1) and not (z.color.n==2 and z.attack_num==1) and not z.flinch then
          if xx.v * (z.x - xx.x) > 0 and math.abs(z.x-xx.x)>5 then
            if z.flinch then
              z.v = (z.v*1/4) + (xx.v*3/4)
            else
              z.v = (z.v*1/4) + (xx.v*3/4)
            end
          end
        end
        end, true)
  end
end



--FRICTION FUNCTION TO SLOW DOWN


function transferofenergy(xx)
  if xx.g and xx.j<0 then 
    if xx.v > 0 then
      xx.v = xx.v - xx.j/10 
    elseif xx.v < 0 then
      xx.v = xx.v + xx.j/10 
    else 
      if math.random() > .5 then
        xx.v = xx.v + xx.j/20 
      else
        xx.v = xx.v - xx.j/20
      end
    end
  end

end

slide_time = 6

function fric(xx) 

  if xx.dodgetype == 0 then
    xx.v = r2b(xx.v,friction*ramp(xx),0)
  end

  if not xx.landing and not ((xx.v < 0 and xx.leftb) or (xx.v > 0 and xx.rightb))
    then
    if xx.v > 0 and not xx.dodge 
      then
      xx.slide = true
      xx.slidetimer = slide_time
    elseif xx.v < 0 and not xx.dodge 
      then
      xx.slide = true
      xx.slidetimer = slide_time
    end
  end
end





function vroomright(xx)
  if (xx.animcounter == 0 or xx.greenkcondition) and not (xx.landing and xx.purplanding) and not xx.running then
    if xx.v == 0
      then xx.v = 1.5
    elseif xx.v >0 and xx.v < (speedlimit -accel)*xx.color.s.speed*xx.speedpenalty*whiplash 
      then xx.v = xx.v + (accel)*xx.color.s.speed*xx.speedpenalty
    elseif xx.v >0 and xx.v >= (speedlimit -accel)*xx.color.s.speed*xx.speedpenalty*whiplash 
      then xx.v = (speedlimit -accel)*xx.color.s.speed*xx.speedpenalty
    end
  end
end 

function vroomleft(xx)
  if (xx.animcounter == 0 or xx.greenkcondition) and not (xx.landing and xx.purplanding) and not xx.running then
    if xx.v == 0 
      then xx.v = -1.5
    elseif xx.v < 0 and xx.v > (-speedlimit + accel)*xx.color.s.speed*xx.speedpenalty*whiplash
      then xx.v = xx.v - (accel)*xx.color.s.speed*xx.speedpenalty
    elseif xx.v < 0 and xx.v <= (-speedlimit + accel)*xx.color.s.speed*xx.speedpenalty*whiplash
      then xx.v = (-speedlimit + accel)*xx.color.s.speed*xx.speedpenalty
    end
  end
end 




--gravity = function (n)
  --	if 



  me.ctim = 0
  you.ctim = 0

  me.running = false
  you.running = false

  me.runpace = defrunpace
  you.runpace = defrunpace

  --if me.running then jump height is half

  function fallthroughglassfloor(xx)

    if xx.running and xx.plat.glass ~= nil then
      xx.j = -4
      xx.y = xx.y + 5
      xx.gothroughplats = true
      for i = -10, 10 do
        makenglass(xx.mid+i,xx.plat.y,xx.v/2,xx.j, 1)
      end
    end

  end


  function runrunrun(xx)
    fallthroughglassfloor(xx)
    if not xx.g then xx.running = false end

    if xx.flinch or math.abs(xx.v) <= speedminit then 
      xx.running = false
    elseif xx.running then 
      xx.a1 = false
      xx.a2 = false
      xx.a3 = false
      xx.a4 = false


    end

    if xx.runtap and xx.running and (xx.right or xx.left) and not xx.block and not xx.dodge then         
      if xx.right and xx.v > 0 then
        xx.v = xx.color.s.speed*runspeed*xx.speedpenalty
      elseif xx.left and xx.v < 0 then
        xx.v = -xx.color.s.speed*runspeed*xx.speedpenalty
      end





    elseif math.abs(xx.v) > xx.color.s.speed*xx.speedpenalty*speedminit-accel*2 and (xx.left or xx.right) and xx.g and xx.runtap and not xx.block and not xx.dodge and xx.attack_num ~= 2 then
      xx.a1 = false
      xx.a2 = false
      xx.a3 = false
      xx.a4 = false
      xx.running = true
      if xx.right and xx.v > 0 then
        xx.v = runspeed
      elseif xx.left and xx.v < 0 then
        xx.v = -runspeed
      end


    end



  end

  function climbs(xx)

    if xx.flinch then xx.ctim = 0 end

    if xx.ctim > 0 then xx.ctim = xx.ctim + 1
      xx.busy = true

      if xx.ctim > 10 then
        xx.ctim = 0
        if xx.up then 
          xx.g = false
          xx.j = hopj
          repplay(xx.jumpd) 
        elseif xx.left then 
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
  me.speedpenalty = 1
  you.speedpenalty = 1



  function speedpenaltycalc(xx,yy)
    if
      (xx.v * (xx.x - yy.x)/(math.abs(xx.x - yy.x))) > 0
      then xx.speedpenalty = .7
    else
      xx.speedpenalty = 1
    end
  end


  me.jump_delay_counter = 0
  you.jump_delay_counter = 0

  --[[Resets
  xx.can_super_jump = false
  xx.float = false
  xx.stop = false
  ]]
  function movex(xx,yy)


    doubleDirection(xx)

    if xx.dodge or (xx.block and xx.g)
      then xx.a1, xx.a2, xx.a3, xx.a4, xx.up = false,false,false,false,false
    end

    respawntravel(xx)
    relativity(xx)
    speedpenaltycalc(xx,yy)
    runrunrun(xx)
    transferofenergy(xx)

    if xx.stop then xx.firstjump = false end

    if xx.landing_counter > landing_wait then
      xx.stop=true
      xx.holda = true
    end

    if ((xx.g and xx.double_down ) or (not xx.g and xx.down and not xx.runb)) and not (xx.stop and not xx.grabbing) then 
      xx.gothroughplats = true
    end


    ------?????--------
    if xx.flinch then
      xx.jt = 0
    end

    if not xx.g or (not xx.up and xx.jump_delay_counter<=0) or xx.flinch then
      xx.jump_delay_counter = jump_delay
    end


    if xx.jump_delay_counter < jump_delay and not hitpause then
      xx.jump_delay_counter = xx.jump_delay_counter - 1
    end

    if xx.superjumptimer > 0 and xx.jump_delay_counter < jump_delay then
      xx.jump_delay_counter = 0
    end

    xdif = math.abs((you.x) - (me.x))

    if xdif >= 2100
      then speedlimit = minMaxSpeedDif+speedminit
      runspeed = initrunspeed+minMaxSpeedDif
    elseif xdif < 700 then
      speedlimit = speedminit
      runspeed = initrunspeed
    else
      speedlimit = (minMaxSpeedDif * ((xdif-700)/1400)) + speedminit
      runspeed = (minMaxSpeedDif * ((xdif-700)/1400)) + initrunspeed
    end 

    local extra_height = 0

    if xx.im.extra_height ~= nil then
      extra_height = -xx.im.extra_height
    end
    xx.feet = xx.y+xx.height-extra_height

    if xx.g then 

      if xx.j < 0 then xx.j = 0 
      end

      if ((xx.up or xx.jump_delay_counter <= 0) and not xx.flinch and not xx.block and not xx.jstop and not xx.busy and xx.animcounter == 0)
        or (xx.up and xx.greenkcondition)

        then 

        if xx.jump_delay_counter == jump_delay then
          xx.jump_delay_counter = xx.jump_delay_counter - 1

        elseif xx.jump_delay_counter > 0 then

        else

          makeLandDust(xx.mid, xx.feet, xx.v, math.random(3,5))
          repplay(xx.jumpd)
          if xx.running then
            xx.jt = runjt
            xx.jmax = runjmax*xx.color.s.jump/the_map.gravity
            xx.j = runj
          else
            xx.jt = regJT
            xx.jmax = jmax*xx.color.s.jump
            if xx.can_super_jump then
              xx.j = jumpj*superJumpRatio*xx.color.s.jump/the_map.gravity
            else
              xx.j = jumpj*xx.color.s.jump/the_map.gravity
            end
          end

        end
        xx.ht = 7
        xx.firstjump = true
        xx.g = false
      elseif xx.right and xx.v >= 0 and not xx.stop and not xx.flinch and xx.landing_counter < land_pause_time and not xx.dodge
        and not xx.left 
        then 
        vroomright(xx)
      elseif xx.left and xx.v <= 0 and xx.stop == false and not xx.flinch and xx.landing_counter < land_pause_time and not xx.dodge
        and not xx.right 
        then 
        vroomleft(xx)

      else
        fric(xx)
      end
    else

      if xx.landing_counter > 0
        then
        xx.landing_counter = xx.landing_counter - 1*ramp(xx)
        else xx.landing_counter = 0
        end

        if xx.blockb and (xx.using_keyboard or xx.a1b) and math.abs(xx.j) + math.abs(xx.v)< velforclimb and climbplatcheck(xx.x, xx.y, xx.lr, xx.height, xx.v, xx.j) and xx.j > 0 then 
          if climbplatcheck(xx.x, xx.y+xx.height/2, xx.lr, xx.height/2, xx.v, xx.j) then
            xx.ctim = 7
          else 
            xx.ctim = 1
          end
          xx.im = climb
          xx.onplat = true
          xx.j = climbj
          xx.v = xx.v/2
        elseif xx.left and xx.v >= 1 
          then 
          if xx.flinch then
            xx.v = xx.v - adecrate/5*ramp(xx)
          else
            xx.v = xx.v - adecrate*ramp(xx)
          end
          xx.slowdown = true

        elseif xx.right and xx.v <= -1 
          then 
          if xx.flinch then
            xx.v = xx.v + adecrate/5*ramp(xx)
          else
            xx.v = xx.v + adecrate*ramp(xx)
          end
          xx.slowdown = true
        elseif xx.left and xx.v > - maxairmove 
          then 
          if xx.flinch then
            xx.v = xx.v - amovrate/5*ramp(xx)
          else
            xx.v = xx.v - amovrate*ramp(xx)
          end
          xx.slowdown = false
        elseif xx.right and xx.v < maxairmove 
          then 
          if xx.flinch then
            xx.v = xx.v + amovrate/5*ramp(xx)
          else
            xx.v = xx.v + amovrate*ramp(xx)
          end
          xx.slowdown = false


        end

        --landing
        if xx.up and xx.j > 0 
          and xx.jmax > 0 
          and xx.firstjump and not xx.flinch
          then xx.jmax = xx.jmax - jumpheight*ramp(xx)
          --the end arc/fall of any jump or the mini jump
        else
          xx.firstjump = false
          if xx.jt > 0 then 
            xx.jt = xx.jt -  1*ramp(xx)
          elseif xx.jt <= 0 and xx.j > - maxgravity*xx.color.s.weight then 
            xx.jt = xx.jt -  1*ramp(xx)
            if xx.j >= 0 and not xx.float then
              --[[if xx.jumptimer > 0 and xx. then
              xx.jumptimer = xx.jumptimer - 1*ramp(xx)
            else
              ]]--
              xx.j = xx.j - risegrav*ramp(xx)*xx.color.s.weight
              --end
            elseif not xx.float then
              xx.j = xx.j - dropgrav*ramp(xx)*xx.color.s.weight
            end
            --elseif xx.jt <= 0 and xx.ht > 0
            --then xx.j = 0
            --	xx.ht = xx.ht - 1	
          end




        end
      end



      xx.can_super_jump = false
      xx.float = false
      xx.stop = false



    end



    function applyMovements()
      for i,xx in ipairs(players) do
        xx.y = xx.y - xx.j*.9*xx.rampspeed
        xx.x = xx.x + xx.v*xx.rampspeed
      end
    end












