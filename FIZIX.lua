--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction

me.rampspeed = 1
you.rampspeed = 1
me.ramptimer = 0
you.ramptimer = 0
me.rampcanhit = 0
you.rampcanhit = 0

jumpj = 0

floor = 1900 - 2

bobx = 0
boby = 0
function fractalrespawn(xx)

local newplat
  
  local firsttime = true
  
  while(firsttime) do
    firsttime = false
    local rannum = math.random(1, #themap.plats)
    newplat = themap.plats[rannum]
    xx.gohere = {}
    xx.gohere.x = math.random(newplat.x1+15, newplat.x2-15)
    xx.gohere.y = newplat.y-100
    bobx = xx.gohere.x
    boby = xx.gohere.y
    
    xx.gohered = {}
    xx.gohered.x = (xx.x-xx.gohere.x)/40
    xx.gohered.y = (xx.y-xx.gohere.y)/40
    
  end


  


end

function kothrespawn(xx)
  local newplat = kothplat
  while(newplat == kothplat) do
    local rannum = math.random(1,#themaps[mapNum].plats)
    local newplat = themaps[mapNum].plats[rannum]
    xx.gohere = {}
    xx.gohere.x = math.random(newplat.x1+15, newplat.x2-15)
    xx.gohere.y = newplat.y-100
    
    xx.gohered = {}
    xx.gohered.x = (xx.x-xx.gohere.x)/40
    xx.gohered.y = (xx.y-xx.gohere.y)/40
    
  end


  


end

function respawntravel(xx)
  if xx.gohere ~= nil then
    xx.gothroughplats = true
    xx.float = true
    xx.im = invis
    local xready = false
    local yready = false
  local xtraveldis = xx.x - xx.gohere.x
  if math.abs(xtraveldis) > 5 then
    xx.stop = true
    xx.x = xx.x-xx.gohered.x
    xx.v = 0
  else
    xready = true
  end

  local ytraveldis = xx.y - xx.gohere.y
  if math.abs(ytraveldis) > 5 then
    xx.stop = true
    xx.y = xx.y-xx.gohered.y
    xx.j = 0
    xx.v = 0
  else
    yready = true
  end
  
  if xready and yready then
    xx.gohere = nil
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

  if dangerclose and not actionshot and not love.keyboard.isDown("x") then
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
    if dangerclose and not actionshot and not love.keyboard.isDown("x") then
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



table.insert(themaps[2].plats, {n=1,y = themaps[2].floor, x1 = 0, x2 = 1404+1, floor = true})
table.insert(themaps[2].plats, {n=2,y = 964, x1 = 1404, x2 = themaps[2].rightwall+1, floor = true})
table.insert(themaps[2].plats, {n=3,y = 644, x1 = 1616, x2 = 3196})
table.insert(themaps[2].plats, {n=4,y = 426, x1 = 3003, x2 = 3118})
table.insert(themaps[2].plats, {n=5,y = 327, x1 = 2637, x2 = 2637+115})
table.insert(themaps[2].plats, {n=6,y = 327, x1 = 2271, x2 = 2271+115})
table.insert(themaps[2].plats, {n=7,y = 327, x1 = 1907, x2 = 1907+115})


table.insert(themaps[2].plats, {n=8,y = 327, x1 = 2637, x2 = 2637+115})

table.insert(themaps[2].plats, {n=9,y = 934, x1 = 527, x2 = 677})

table.insert(themaps[2].plats, {n=10,y = 933, x1 = 1893, x2 = 2135})
table.insert(themaps[2].plats, {n=11,y = 933, x1 = 2321, x2 = 2563})
table.insert(themaps[2].plats, {n=12,y = 933, x1 = 2749, x2 = 2991})

table.insert(themaps[2].plats, {n=13,y = 0, x1 = 1535, x2 = 3200})

table.insert(themaps[2].walls, {n=14,y1 = 0, y2 = 806, x=1614})

table.insert(themaps[2].walls, {n=15,y1 = 964, y2 = 3000, x=1408, barrier = true})
table.insert(themaps[2].walls, {n=16,y1 = -1, y2 = themaps[2].floor, x=0, barrier = true})
table.insert(themaps[2].walls, {n=17,y1 = -1, y2 = themaps[2].floor, x=themaps[2].rightwall, barrier = true})

table.insert(themaps[1].plats, {n=1, y = themaps[1].floor, x1 = 0, x2 = themaps[1].rightwall+1, floor = true})
table.insert(themaps[1].plats, {n=2, y = 1379, x1 = 1120, x2 = 1529})
table.insert(themaps[1].plats, {n=3, y = 1379, x1 = 1120, x2 = 1529})
table.insert(themaps[1].plats, {n=4, y = 1627, x1 = 2245, x2 = 2751})
table.insert(themaps[1].plats, {n=5, x1 = 2751, x2 = 2971, y = 1670})
table.insert(themaps[1].plats, {n=6, x1 = 3325, x2 = 3765, y = 1669})
table.insert(themaps[1].plats, {n=7, x1 = 4479, x2 = 4688, y = 1462})
table.insert(themaps[1].plats, {n=8, x1 = 5104, x2 = 6018, y = 1718})
table.insert(themaps[1].plats, {n=9, x1 = 5286, x2 = 5472, y = 1540})
table.insert(themaps[1].plats, {n=10, x1 = 5650, x2 = 5836, y = 1540})
table.insert(themaps[1].walls, {n=11, y1 = -1, y2 = themaps[1].floor, x=0, barrier = true})
table.insert(themaps[1].walls, {n=12, y1 = -1, y2 = themaps[1].floor, x=themaps[1].rightwall, barrier = true})


table.insert(themaps[100].plats, {n=1, y = 896, x1 = 0, x2 = 2000+1, floor = true})
table.insert(themaps[100].plats, {n=2, y = 465, x1 = 32, x2 = 236})
table.insert(themaps[100].plats, {n=3, y = 541, x1 = 839, x2 = 1016})
table.insert(themaps[100].plats, {n=4, y = 719, x1 = 655, x2 = 1560})
table.insert(themaps[100].walls, {n=1, y1 = -1, y2 = themaps[100].floor, x=0, barrier = true})
table.insert(themaps[100].walls, {n=2, y1 = -1, y2 = themaps[100].floor, x=2000, barrier = true})

table.insert(themaps[100].walls, {n=2, y1 = 3, y2 = themaps[100].floor+1, x=500, glasswall = themaps[3].floor})







table.insert(themaps[3].plats, {n=1, y = themaps[3].floor, x1 = 0, x2 = themaps[3].rightwall+1, floor = true})
table.insert(themaps[3].walls, {y1 = -1, y2 = themaps[3].floor+1, x=0})
table.insert(themaps[3].walls, {y1 = -1, y2 = themaps[3].floor+1, x=themaps[3].rightwall})





table.insert(themaps[3].plats, {n=1,y = 2688, x1 = 2154, x2 = 2726,glass = true})

table.insert(themaps[3].plats, {n=2,y = 5616, x1 = 419, x2 = 2139})
table.insert(themaps[3].plats, {n=3,y = 2756, x1 = 419, x2 = 2139})
table.insert(themaps[3].plats, {n=4,y = 2756-286, x1 = 419, x2 = 809})
table.insert(themaps[3].plats, {n=5,y = 2756-286, x1 = 1756, x2 = 2139})
table.insert(themaps[3].plats, {n=6,y = 2756-286*2, x1 = 419, x2 = 645})
table.insert(themaps[3].plats, {n=7,y = 2756-286*2, x1 = 2075, x2 = 2139})
table.insert(themaps[3].plats, {n=8,y = 2756-286*3, x1 = 419, x2 = 636})
table.insert(themaps[3].plats, {n=9,y = 2756-286*3, x1 = 2070, x2 = 2139})
table.insert(themaps[3].plats, {n=10,y = 2756-286*4, x1 = 2072, x2 = 2139})
table.insert(themaps[3].boxes, {p1 = {x = 750, y = 5585},  size = 8, kind = "paper", density = 2})
table.insert(themaps[3].boxes, {p1 = {x = 847, y = 5295},  size = 8, kind = "paper", density = 6})
table.insert(themaps[3].boxes, {p1 = {x = 1530, y = 5294},  size = 8, kind = "paper", density = 4})
table.insert(themaps[3].boxes, {p1 = {x = 1741, y = 5294},  size = 14, kind = "paper", density = 5})
table.insert(themaps[3].boxes, {p1 = {x = 1568, y = 5582},  size = 8, kind = "paper", density = 4})
table.insert(themaps[3].boxes, {p1 = {x = 1814, y = 5012},  size = 8, kind = "paper", density = 4})
table.insert(themaps[3].boxes, {p1 = {x = 741, y = 5010},  size = 8, kind = "paper", density = 5})
table.insert(themaps[3].boxes, {p1 = {x = 972, y = 5010},  size = 8, kind = "paper", density = 2})
table.insert(themaps[3].boxes, {p1 = {x = 616, y = 4435},  size = 8, kind = "paper", density = 7})
table.insert(themaps[3].boxes, {p1 = {x = 1928, y = 4416},  size = 40, kind = "paper", density = 20})
table.insert(themaps[3].boxes, {p1 = {x = 1536, y = 3580},  size = 5, kind = "paper", density = 2})



function updateboxes()
  if themaps[mapNum].boxes ~= nil and not pause then
    for i,xx in ipairs(players) do 
      for j,b in ipairs(themaps[mapNum].boxes) do
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


for i=1, 8 do
  table.insert(themaps[3].plats, {y = 5616-286*i, x1 = 419, x2 = 2139})
end

for i=1, 10 do
  local bleh = 0
  local blehy = 0
  if i == 1 then
    bleh = 4901
  elseif i == 2 then
    bleh = 4898
  elseif i == 3 then
    bleh = 4895
  elseif i == 4 then
    bleh = 4889
  elseif i == 5 then
    bleh = 4906
  elseif i == 6 then
    bleh = 4899
  elseif i == 7 then
    bleh = 4784
  elseif i == 8 then
    bleh = 4699
  elseif i == 9 then
    bleh = 4889
  elseif i == 10 then
    bleh = 3847
    blehy = 79
    table.insert(themaps[3].plats, {y = themaps[3].floor-299*i-blehy, x1 = 4335, x2 = 4908})
  end
  table.insert(themaps[3].plats, {y = themaps[3].floor-299*i-blehy, x1 = 3160, x2 = bleh})
end
table.insert(themaps[3].plats, {y = 5778, x1 = 2142, x2 = 2299})
table.insert(themaps[3].plats, {y = 3004, x1 = 581, x2 = 1039})


table.insert(themaps[3].walls, {y1 = 1900, y2 = themaps[3].floor+1, x=419, glasswall = 5618})
table.insert(themaps[3].walls, {y1 = 2763, y2 = 5778, x=2139, glasswall = 5618})
table.insert(themaps[3].walls, {y1 = 1613, y2 = 2184, x=2139, glasswall = y2})
table.insert(themaps[3].walls, {y1 = 2830, y2 = themaps[3].floor+1, x=3159})




table.insert(themaps[3].plats, {y = themaps[3].floor, x1 = 0, x2 = themaps[3].rightwall+1, floor = true})
for i,v in ipairs(themaps[3].plats) do
  themaps[3].plats[i].n = i
end




--glass = true option for some floors


function platformcheckx()

  hboxp() 

  hboxwall()

end




--bounce method, if hit squares and not dodge then yeah
function bump(xx)
  if not xx.dodge then
    hboxcss(xx.id, 
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y},
      {x=xx.mid, y = xx.y+55},
      {x=xx.mid+(xx.v + (8 * (xx.v/(math.abs(xx.v))))), y = xx.y+xx.height},
      {x=xx.mid, y = xx.y+5},
      function(z)
        if not(xx.color.n==2 and xx.type==1) and not (z.color.n==2 and z.type==1) and not z.flinch then
          if xx.v * (z.x - xx.x) > 0 and math.abs(z.x-xx.x)>5 then
            if z.flinch then
              z.v = (z.v*1/4) + (xx.v*3/4)
            else
              z.v = (z.v*1/4) + (xx.v*3/4)
            end
          end
        end
      end)
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

fric = function (xx) 

  xx.v = rodib(xx.v,fricrate*ramp(xx),xx.push)

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
  if (xx.animcounter == 0 or xx.greenkcondition) and not (xx.landing and xx.purplanding) and not xx.running then
    if xx.v == 0+xx.push
    then xx.v = 1.5+xx.push
    elseif xx.v >0+xx.push and xx.v < (speedlimit -accel+xx.push)*xx.color.s.speed*xx.speedpenalty*whiplash 
    then xx.v = xx.v + (accel+xx.push)*xx.color.s.speed*xx.speedpenalty
    elseif xx.v >0+xx.push and xx.v >= (speedlimit -accel+xx.push)*xx.color.s.speed*xx.speedpenalty*whiplash 
    then xx.v = (speedlimit -accel+xx.push)*xx.color.s.speed*xx.speedpenalty
    end
  end
end 

function vroomleft(xx)
  if (xx.animcounter == 0 or xx.greenkcondition) and not (xx.landing and xx.purplanding) and not xx.running then
    if xx.v == 0+xx.push 
    then xx.v = -1.5+xx.push
    elseif xx.v < 0+xx.push and xx.v > (-speedlimit + accel+xx.push)*xx.color.s.speed*xx.speedpenalty*whiplash
    then xx.v = xx.v - (accel+xx.push)*xx.color.s.speed*xx.speedpenalty
    elseif xx.v < 0+xx.push and xx.v <= (-speedlimit + accel+xx.push)*xx.color.s.speed*xx.speedpenalty*whiplash
    then xx.v = (-speedlimit + accel+xx.push)*xx.color.s.speed*xx.speedpenalty
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

  if xx.running and math.abs(xx.push) > 0 then 
    --xx.j = 14 xx.g = false
    xx.v = xx.v + xx.push
  end
  if xx.flinch or math.abs(xx.v) <= speedminit then 
    xx.running = false
  elseif xx.running then 
    xx.a1 = false
    xx.a2 = false
    xx.a3 = false
    xx.a4 = false


  end

  if xx.runb and xx.running and (xx.right or xx.left) and xx.runb and not xx.block and not xx.slide and not xx.dodge then         
    if xx.right and xx.v > 0 then
      xx.v = xx.color.s.speed*runspeed*xx.speedpenalty
    elseif xx.left and xx.v < 0 then
      xx.v = -xx.color.s.speed*runspeed*xx.speedpenalty
    end





  elseif math.abs(xx.v) > xx.color.s.speed*xx.speedpenalty*speedminit-accel*2 and (xx.left or xx.right) and xx.g  and xx.runb and not xx.block and not xx.slide and not xx.dodge and xx.type ~= 2 then
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

function movex(xx,yy)
  respawntravel(xx)
  relativity(xx)
  speedpenaltycalc(xx,yy)
  runrunrun(xx)
  transferofenergy(xx)
  z = xx
  if xx.landingcounter > landing_wait then
    xx.stop=true
    xx.holda = true
  end

  if (xx.g and xx.doubledown) or (not xx.g and xx.down) then 
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
  then speedlimit = minMaxSpeedDif+speedminit
    runspeed = initrunspeed+minMaxSpeedDif
  elseif xdif < 700 then
    speedlimit = speedminit
    runspeed = initrunspeed
  else
    speedlimit = (minMaxSpeedDif * ((xdif-700)/1400)) + speedminit
    runspeed = (minMaxSpeedDif * ((xdif-700)/1400)) + initrunspeed
  end 




  extrah = 0
  if xx.im.extrah ~= nil then
    extrah = -xx.im.extrah
  end
  xx.feet = xx.y+xx.height-extrah

  if xx.g 
  then 
    if xx.j < 0 then xx.j = 0 
    end
    if (xx.up and not xx.flinch and not xx.block and not xx.jstop and not xx.busy and xx.animcounter == 0)
    or (xx.up and xx.greenkcondition)
    then 
      if xx.running then
        xx.jt = runjt
        xx.jmax = runjmax*xx.color.s.jump
        xx.j = runj
      else
        xx.jt = regJT
        xx.jmax = jmax*xx.color.s.jump
        if xx.cansuperjump then
          xx.j = jumpj*superJumpRatio*xx.color.s.speed
        else
          xx.j = jumpj*xx.color.s.speed
        end

      end
      xx.ht = 7
      xx.firstjump = true
      xx.g = false
      repplay(xx.jumpd)
    elseif z.right and xx.v >= xx.push and not xx.stop and not xx.flinch and xx.landingcounter < land_pause_time
    and not z.left 
    then 
      vroomright(xx)
    elseif z.left and xx.v <= xx.push and xx.stop == false and not xx.flinch and xx.landingcounter < land_pause_time
    and not z.right 
    then 
      vroomleft(xx)

    else
      fric(xx)
    end
  else

    if xx.landingcounter > 0
    then
      xx.landingcounter = xx.landingcounter - 1*ramp(xx)
    else xx.landingcounter = 0
      
    end
    if z.blockb and xx.a1b and math.abs(z.j) + math.abs(z.v)< velforclimb and climbplatcheck(xx.x, xx.y, xx.lr, xx.height, xx.v, xx.j) and xx.j > 0
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
    then 
      if xx.flinch then
        xx.v = xx.v - adecrate/5*ramp(xx)
      else
        xx.v = xx.v - adecrate*ramp(xx)
      end
      xx.slowdown = true
      xx.im = slowdown

    elseif z.right and xx.v <= -1 + xx.push*1.5
    then 
      if xx.flinch then
        xx.v = xx.v + adecrate/5*ramp(xx)
      else
        xx.v = xx.v + adecrate*ramp(xx)
      end
      xx.slowdown = true
      xx.im = slowdown  
    elseif z.left and xx.v > - maxairmove + xx.push*1.5
    then 
      if xx.flinch then
        xx.v = xx.v - amovrate/5*ramp(xx)
      else
        xx.v = xx.v - amovrate*ramp(xx)
      end
      xx.slowdown = false
    elseif z.right and xx.v < maxairmove + xx.push*1.5
    then 
      if xx.flinch then
        xx.v = xx.v + amovrate/5*ramp(xx)
      else
        xx.v = xx.v + amovrate*ramp(xx)
      end
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
    and xx.firstjump and not xx.flinch
    then xx.jmax = xx.jmax - jumpheight*ramp(xx)
      --the end arc/fall of any jump or the mini jump
    else
      xx.firstjump = false
      if xx.jt > 0
      then xx.jt = xx.jt -  1*ramp(xx)
      elseif xx.jt <= 0 and xx.j > - maxgravity*xx.color.s.weight
      then xx.jt = xx.jt -  1*ramp(xx)
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
  xx.cansuperjump = false

  xx.float = false
end














