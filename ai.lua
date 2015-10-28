--DEPRICATED.  To be worked on further some other time

--constantly spinning head and rows of spinning heads in series spinning are great
--default hpx 3 hpy 8


monsters = {}

ehead1 = lg.newImage("enemy/eh1.png")


ea2= {im=lg.newImage("enemy/ea2.png"), head = lg.newImage("enemy/ah2.png"), hpx = 2, hpy = 6, xoff = 7}
ea3= {im=lg.newImage("enemy/ea3.png"), head = lg.newImage("enemy/ah3.png"), hpx = 3, hpy = 2+4, xoff = 12, yoff = 4} --2 or 10????
ea4= {im=lg.newImage("enemy/ea4.png"), head = lg.newImage("enemy/ah4.png"), hpx = 3, hpy = 2+4, xoff = 12, yoff = 4+22} --2 or 10????
ea5= {im=lg.newImage("enemy/ea4.png"), head = lg.newImage("enemy/ah5.png"), hpx = 3, hpy = 2+4, xoff = 12, yoff = 4+22}
ea6= {im=lg.newImage("enemy/ea4.png"), head = lg.newImage("enemy/ah6.png"), hpx = 3, hpy = 2+4, xoff = 12, yoff = 4+22}
ea7= {im=lg.newImage("enemy/ea3.png"), head = lg.newImage("enemy/ah7.png"), hpx = 3, hpy = 2+4, xoff = 12, yoff = 4}
ea8= {im=lg.newImage("enemy/ea2.png"), head = lg.newImage("enemy/ah8.png"), hpx = 2, hpy = 6, xoff = 7}

ebf= {im=lg.newImage("enemy/ebf.png"), head = ehead1, hpx = 3, hpy = 9, xoff = 4}
eff= {im=lg.newImage("enemy/eff.png"), head = ehead1, hpx = 0, hpy = 12, xoff = 7}

ei1= {im=lg.newImage("enemy/ei1.png"), head = ehead1, xoff = 7}
ei2= {im=lg.newImage("enemy/ei2.png"), head = ehead1, hpx = 4, hpy = 11, xoff = 7}
ew1= {im=lg.newImage("enemy/ew1.png"), head = ehead1, xoff = 7}
ew2= {im=lg.newImage("enemy/ew2.png"), head = ehead1, xoff = 7}
ead= {im=lg.newImage("enemy/ead.png"), head = ehead1, xoff = 7+4, yoff = 25}
eau= {im=lg.newImage("enemy/eau.png"), head = ehead1, xoff = 7}

flapj = 12
monairspeed = 5

monbasehealth = 15

at.e = {}
at.e.b = {}
at.e.b.v = 5
at.e.b.j = 10
at.e.b.dam = 5
at.e.b.ft = 12
at.e.b.z = .04



function spawnmon(ex, why)
  local eyedee = 0
  for i,v in ipairs(monsters) do

    eyedee = math.max(eyedee, i+1)
  end
    eyedee = math.max(eyedee, 1)
  
  local temp = {x = ex, y = why, v = 0, j = 0, old_feet = why,
    flinch = false, ft = 0, block = false, weight = 1, width = 40, height = 50, id = eyedee, im = ei1, mid = ex+35/2, lr = 1, wallrubbletimer = 0, health = 1+0*monbasehealth, gothroughplats = false,headrot = 0, headrot2 = 0, headvel = 0, push = 0, mode = "idle", animt = 0, oldemode = "bleh", drawwidth = 24, flinchway = 1, cantfly = false, c = {r = 25, g=25, b= 25}, hit = false}
  --monsters[eyedee] = temp
  table.insert(monsters, temp)
end

function disintegrate(xx,i)
  if xx.health < 0 then
    for i = xx.y, xx.y+xx.height do
      if xx.v==0 then
        
    makenslashsparks(xx.mid,i,xx.lr*(math.abs(xx.y+xx.height-i))/4, xx.j, xx.c.r,xx.c.g,xx.c.b,2)
        else
    makenslashsparks(xx.mid,i,xx.v*(math.abs(xx.y+xx.height-i))/5, xx.j, xx.c.r,xx.c.g,xx.c.b,2)
    end
    end
    table.remove(monsters,i)
  end
  
end

function monplatupdate()
 for i,xx in ipairs(monsters) do

    if rampcanhit and xx.g then
      xx.v = r2b(xx.v,friction*ramp(xx),xx.push)
    end


    xx.x = xx.x+xx.v*ramp(xx)
    xx.y = xx.y-xx.j*ramp(xx)



       extra_height = 0
        if xx.im.extra_height ~= nil then
          extra_height = -xx.im.extra_height
        end
  xx.feet = xx.y+xx.height-extra_height



  end
end

--used to go at the end of love.update
function postmonupdate()
  
  for i,xx in ipairs(monsters) do
 
    disintegrate(xx,i)
    
    end
  
end

function monupdate()
  for i,xx in ipairs(monsters) do

    xx.im = ei1

    monflinching(xx)
    if not xx.flinch then
      trackplayer(xx)
    end
    whichmode(xx)

    if xx.mode == "chase" then
      if xx.flyyoufool then 
        xx.weight = .3
      else
        xx.weight = 1
      end

      if xx.g and xx.flyyoufool then
        xx.j = flapj*math.log(math.abs(xx.target.y-xx.y))/4
      end

    end

    appropriateanim(xx)



    xx.gothroughplats = false

    if math.abs(xx.target.x-xx.x) < armsreach*4 and
    xx.target.y > xx.y+xx.height+30 then xx.gothroughplats = true
    end

    if not xx.g then

      if xx.j > -maxgravity  then
        if xx.j > 0 then
          xx.im = eau
          xx.j = xx.j - risegrav*ramp(xx)*xx.weight
        else
          xx.im = ead
          xx.j = xx.j - dropgrav*ramp(xx)*xx.weight
          if xx.flyyoufool and xx.j < -5 then
            xx.j = flapj*math.log(math.abs(xx.target.y-xx.y))/4
            if xx.mode == "chase" then

              xx.v = xx.chaselr*ramp(xx)
            end
          end
        end
      end
    end







    xx.mid = xx.x + xx.drawwidth/2
    if xx.lr > 0 then
      xx.drawx = xx.mid-xx.drawwidth/2-xx.im.xoff
    else
      xx.drawx = xx.mid+xx.drawwidth/2+xx.im.xoff
    end




  end


end


function flap(xx)


end


markerv = 0
function walkanimation(xx)

  if xx.animt > 45 or not xx.g then xx.animt = 0
  else
    xx.animt = xx.animt + 1
  end
  if xx.g then
    if xx.animt < 12 then
      xx.im = ew1
    elseif xx.animt <= 18 then
      xx.im = ei2
    elseif xx.animt > 18 and xx.animt < 35 then
      xx.im = ew2
      xx.v = xx.v +(
        --(1-(math.random()/100))+
        xx.chaselr)*ramp(xx)
      markerv = xx.v
    end
  end
end

function modemode()


end

function mondraw()

  for i,xx in ipairs(monsters) do

    if xx.im.yoff == nil then
      xx.im.yoff = 0
    end
    if xx.im.hpx == nil then
      xx.im.hpx = 3
      xx.im.hpy = 8
    end

    lg.draw(xx.im.head, xx.mid+xx.im.hpx*xx.lr, xx.y+xx.im.hpy,xx.headrot,xx.lr,1,5, 19)
    lg.draw(xx.im.im, xx.drawx, xx.y+5-xx.im.yoff,0,xx.lr,1)
  end

end

armsreach = 70

function whichmode(xx)
  if xx.flinch then xx.mode = "flinch" 
  else
    if xx.target~= nil then
      if math.abs(xx.tardis) <= armsreach or xx.attacking then
      xx.mode = "attack"
      elseif math.abs(xx.tardis) > armsreach then
        xx.mode = "chase"
      end


    end
  end

  if xx.oldmode ~= xx.mode then
    xx.animt = 0
  end
  xx.oldmode = xx.mode
end

function nearestplayer(x, y)
  local dis = 10000000
  local theid = 0
  for i,v in ipairs(players) do
    if v.is_player ~= nil then
      if math.sqrt((v.x-x)^2 + (v.y+v.height/2-y)^2) < dis then 
        theid = i
        dis = math.sqrt((v.x-x)^2 + (v.y+v.height/2-y)^2)
      end
    end

  end
  return players[theid]

end

function idleanim(xx)


  if xx.animt > 62 then xx.animt = 0
  else
    xx.animt = xx.animt + 1*ramp(xx)
  end

  if xx.animt >50 then xx.im = ei2 else xx.im = ei1 end

end


function monflinching(xx)
  
  if xx.mode == "flinch" then
    if xx.ft > 0 then 
      xx.ft = xx.ft - .5*ramp(xx)
    else xx.ft = 0
      xx.flinch = false
    end

    if xx.animt == 0 then
      xx.animt = xx.ft
      if xx.v/(math.abs(xx.v)) < 0 then
        if xx.lr > 0 then
          xx.flinchway = -1
        else
          xx.flinchway = 11
        end
      else
        if xx.lr > 0 then
          xx.flinchway = 11
        else
          xx.flinchway = -1
        end
      end
    end
end

  
end

function appropriateanim(xx)



  if xx.mode == "flinch" then
    if xx.flinchway > 1 then xx.im = eff
    else xx.im = ebf
    end


  elseif xx.mode == "chase" then
    walkanimation(xx) 
  elseif xx.mode == "idle" then
    idleanim(xx)

  elseif xx.mode == "attack" then
    monbite(xx) 



  end

end



function monbite(xx) 
  xx.attacking = true
  xx.animt = xx.animt + 1*ramp(xx)
  if xx.animt <4 then xx.im = ea2
  elseif xx.animt <4*2 then xx.im = ea3
  elseif xx.animt <4*3 then xx.im = ea4
  elseif xx.animt <4*4 then xx.im = ea5
elseif xx.animt <4*5+10+10 then 
  xx.im = ea6
  if xx.animt < 4*4+1 and rampcanhit then

     hexHit(xx, xx.id, 
            {x=xx.mid, y = xx.y+15},
            {x=xx.mid+63*math.cos(xx.headrot)*xx.lr, y = xx.y+15+63*math.sin(xx.headrot)*xx.lr},
             {x=xx.mid, y = xx.y+15},
            {x=xx.mid+63*math.cos(xx.headrot)*xx.lr, y = xx.y+15+63*math.sin(xx.headrot)*xx.lr},
            function(z)

              z.v = z.v/3 + math.cos(xx.headrot)*at.e.b.v*xx.lr
              z.j = z.j/3 + math.sin(xx.headrot)*at.e.b.j*xx.lr
              z.g = false
              if not (z.block and z.lr == -xx.lr) then
                z.health = z.health - at.e.b.dam
                z.flinch = true
                z.ft = z.ft+at.e.b.ft
              end
              shakez(at.e.b.z)

          end, true)
  end
  elseif xx.animt <4*6+13+10 then xx.im = ea7
elseif xx.animt <4*7+16+10 then xx.im = ea8
elseif xx.animt <4*7+16+55 then

else
  xx.animt = 0
  xx.attacking = false

  end



end

function trackplayer(xx)
  xx.target = nearestplayer(xx.x,xx.y)
  xx.tardis = math.sqrt((xx.target.mid-xx.mid)^2 + (xx.target.y+xx.target.height/2-xx.y)^2)
  if xx.target.x > xx.x then 
    xx.chaselr = math.log(math.abs(xx.target.x-xx.x))/5
  else
    xx.chaselr = -math.abs(math.log(math.abs(xx.target.x-xx.x))/5)
  end

  if not xx.flinch then
    if xx.target.y+100 < xx.y and not xx.cantfly then 
      xx.flyyoufool = true
    else
      xx.flyyoufool = false
    end
  end
if not (xx.mode == "attack" and xx.animt < 4*6+13+10 ) then
  xx.headrot2 = math.max(math.atan((xx.target.y+xx.target.height/5-xx.y)/(xx.target.mid-xx.mid)), math.rad(-60))
  if xx.headrot2 > math.rad(-50) then
    xx.headrot2 = math.min(math.atan((xx.target.y+xx.target.height/5-xx.y)/(xx.target.mid-xx.mid)), math.rad(30))
  end
  end

  if xx.headrot2-.1 > xx.headrot then 
    xx.headrot = xx.headrot + .04+math.random()/100
  elseif xx.headrot2+.1 < xx.headrot then
    xx.headrot = xx.headrot - .04+math.random()/100

  end


  --xx.headrot = math.atan((np.y-xx.y)/(np.x-xx.x))

  local hrot = math.deg(xx.headrot)
  if not (xx.mode == "attack" and xx.animt < 4*6+13+10 )  then
  if xx.target.x < xx.x and (xx.headrot >= math.rad(-58) or xx.headrot <= math.rad(28)) and xx.lr > 0  then
    xx.lr = -1
    if xx.headrot > 0 then
      xx.headrot = math.rad(0)-xx.headrot - 0
    else
      xx.headrot = math.rad(0)-xx.headrot + 0
    end
  elseif xx.lr < 0 and xx.target.x >= xx.x and (xx.headrot >= math.rad(-58) or xx.headrot <= math.rad(28)) then
    xx.lr = 1

    if xx.headrot > 0 then
      xx.headrot = -math.rad(60)-xx.headrot - 0
    else
      xx.headrot = math.rad(0)-xx.headrot + 0
    end
  end
  end
end