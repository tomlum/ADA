--is this causing trouble?  Search that phrase
--http://www.flutopedia.com/sound_color.htm


colorchangetime = 8
colorfadetime = 5
colorvib = .1


me.shade={r=120,g=120,b=120}
you.shade={r=190,g=190,b=190}
me.outline={r=53,g=53,b=53}
you.outline={r=53,g=53,b=53}

gold = {r = 232, g = 207, b = 0}
purple = {r = 87, g = 0, b = 158}
orange = {r = 255, g = 99, b = 0}
red = {r = 255, g = 0, b = 0}
green = {r = 0, g = 255, b = 0}
seafoam = {r=0,g=255,b=255}
turq = {r=145,g=222,b=161}
pink = {r=255,g=0,b=255}

color1 = xcolor("dark mauve")
color2 = xcolor("dark gold")
color3 =  xcolor("dark seafoam")
color4 = xcolor("lemon")

thecolors = {}


function colorshift(c,rate)
local dr = math.floor(math.random(-rate,rate))
local dg = math.floor(math.random(-rate,rate))
local db = math.floor(math.random(-rate,rate))
if c.r + dr > 255 or c.r+dr<0 then
  c.r = c.r - dr
else
  c.r = c.r + dr
end


if c.g + dg > 255 or c.g+dg<0 then
  c.g = c.g - dg
else
  c.g = c.g + dg
end


if c.b + db > 255 or c.b+db<0 then
  c.b = c.b - db
else
  c.b = c.b + db
end


end


thecolors[0] = {n=0,c={r = 255, g = 255, b = 255}, c2=c,
  s = {def=1, speed = 1, jump = 1, weight = 1, brittle = 1}, logo=questionlogo}

thecolors[1] = {n=1,c=color1,c2=c,
  s = {def=1.2, speed = .8, jump = .7, weight = 1.3, brittle = 1}, tile = ptile, logo=plogo, sound = colorpsound}
thecolors[2] = {n=2,c=color2,c2=c,
  s = {def=.7, speed = 1.3, jump = 1.1, weight = 1, brittle = 1}, tile = gtile, logo=glogo, sound = colorgsound}
thecolors[3] = {n=3, tile = otile,c=color3,c2=c, logo=ologo, sound = colorgsound,
  s = {def=1, speed = 1, jump = 1.1, weight = .8, brittle = 2}}
thecolors[4] = {n=4, tile = tile,c=color4,c2=c, logo=questionlogo, sound = colorpsound,
  s = {def=.8, speed = 1.2, jump = 1.1, weight = .9, brittle = 1.2}
  }
thecolors[5] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[6] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[7] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[8] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[9] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[10] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[11] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
--transition color, weaker
thecolors[-1] = {n=-1,c={r = 0, g = 0, b = 0},
  s = {def=.7, speed = 1, jump = 1, weight = 1, brittle = 1.1}, c2={r = 255, g = 255, b = 255}, logo=questionlogo}



if fightclub or noload then
  me.rightc = thecolors[mercolor]
  you.rightc = thecolors[yourcolor]
  me.leftc = thecolors[melcolor]
  you.leftc = thecolors[youlcolor]
else
  me.rightc = thecolors[0]
  you.rightc = thecolors[0]
  me.leftc = thecolors[0]
  you.leftc = thecolors[0]

end


me.color = thecolors[0]
you.color = thecolors[0]

function tilefadef(inf,f,rate)


  if inf > 0 then 
    return f + rate
  elseif inf < 0 then 
    return f - rate
  else 
    return 255
  end

end

function tilefadeinf(inf, f, rate)
  if inf >= 0 and f + rate >= 255 then
    if tilefadehold > 100 then
      tilefadehold = 0
      return -1
    else
      tilefadehold = tilefadehold + 3
      return 0
    end
  elseif inf < 0 and f - rate <= 0 then
    return 1
  end
  return inf

end



me.cchangeto = {n = 0, {r = 255, g = 255, b = 255}}
you.cchangeto = {n = 0, {r = 255, g = 255, b = 255}}

function ColorChange(xx)

  if xx.rightbump then 
    xx.cchangeto = xx.rightc
  elseif xx.leftbump then
    xx.cchangeto = xx.leftc 
  else xx.cchangeto = thecolors[0]
  end


  if xx.animcounter > 1 then
    xx.oldtype = xx.type
  end

end



me.colorchangetimer = 0
you.colorchangetimer = 0

--changeto red interval
me.ctri = 0
me.ctgi = 0
me.ctbi = 0
you.ctri = 0
you.ctgi = 0
you.ctbi = 0

me.cct = 0
you.cct = 0


function ColorChanging(xx)
  if not xx.actionshot and xx.color.n~=-1 then 
    xx.cantreturntothis = xx.color.n
  end
  if xx.cchangeto.n > 0  then
    if xx.oldcctn ~= xx.cchangeto.n and xx.oldcctn ~= 0 then
      xx.atcc = false
    end
    if xx.cct < colorchangetime and (not combopause or (xx.animcounter == 0 or xx.actionshot))  then
      xx.cct = xx.cct + 1
      --[[
      if xx.cct > 0 then
      xx.colorsound:setPitch((xx.cct+1)/colorchangetime)
      xx.colorsound:setVolume(((xx.cct+1)/(colorchangetime+300)))
    else
      xx.colorsound = xx.cchangeto.sound:clone()
      xx.colorsound:setPitch(.01)
      xx.colorsound:setVolume(.01)
      end
      if xx.cct%1 == 0 then
      repplay(xx.colorsound)
    end
    ]]--
    end
    xx.ctri = (thecolors[0].c.r-xx.cchangeto.c.r)/colorchangetime
    xx.ctgi = (thecolors[0].c.g-xx.cchangeto.c.g)/colorchangetime
    xx.ctbi = (thecolors[0].c.b-xx.cchangeto.c.b)/colorchangetime

  elseif xx.cct > 0 then
    xx.cct = xx.cct - 3
    --[[
    if xx.cct > 0 then
      xx.colorsound:setPitch((xx.cct+1)/colorchangetime)
      xx.colorsound:setVolume(((xx.cct+1)/(colorchangetime+300)))
    end
    ]]--
  end

  if xx.cct == colorchangetime then 
    if xx.color.n == -1 then
      xx.color = clone(xx.cchangeto)
      xx.runpace = defrunpace /  (xx.color.s.speed*3/4)
    end
  elseif xx.cct <= 0  then
    xx.cct = 0
    xx.runpace = defrunpace
    xx.color = thecolors[0]
  else 
    xx.color = thecolors[-1]
    xx.color.c.r = thecolors[0].c.r-xx.ctri * xx.cct
    xx.color.c.g = thecolors[0].c.g-xx.ctgi * xx.cct
    xx.color.c.b = thecolors[0].c.b-xx.ctbi * xx.cct
  end
  
  xx.oldcctn = xx.cchangeto.n
  
   if xx.color.n == 4 then
      local t = thecolors[4].s
      xx.color.s = {def=t.def+rsdel*xx.rlvl, speed = t.speed-rsdel*xx.rlvl, jump = t.jump-rsdel*xx.rlvl, weight = t.weight+rsdel*xx.rlvl, brittle = t.brittle-rsdel*xx.rlvl}

    end
  
end



