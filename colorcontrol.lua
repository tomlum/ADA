--is this causing trouble?  Search that phrase
--http://www.flutopedia.com/sound_color.htm


colorchangetime = 20
colorfadetime = 10
colorvib = .1

thecolors = {}
thecolors[0] = {n=0,c={r = 255, g = 255, b = 255},
  s = {def=1, speed = 1, jump = 1, weight = 1, brittle = 1}, logo=questionlogo}
thecolors[1] = {n=1,c={r = 87, g = 0, b = 158},
  s = {def=1.2, speed = .8, jump = .7, weight = 1.3, brittle = 1}, tile = ptile, logo=plogo, sound = colorpsound}
thecolors[2] = {n=2,c={r = 40, g = 255, b = 0},
  s = {def=.7, speed = 1.3, jump = 1.1, weight = 1, brittle = 1}, tile = gtile, logo=glogo, sound = colorgsound}
thecolors[3] = {n=3, tile = otile,c={r = 255, g = 99, b = 0}, logo=ologo, sound = colorgsound,
  s = {def=1, speed = 1, jump = 1.1, weight = .8, brittle = 2}}
thecolors[4] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[5] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[6] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[7] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[8] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[9] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[10] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
thecolors[11] = {n=0, tile = tile,c={r = 255, g = 255, b = 255}, logo=questionlogo}
--transition color, weaker
thecolors[100] = {n=-1,c={r = 0, g = 0, b = 0},
  s = {def=.7, speed = 1, jump = 1, weight = 1, brittle = 1.1}, logo=questionlogo}



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

if fightclub then
  me.rightc = thecolors[3]
  you.rightc = thecolors[1]
  me.leftc = thecolors[1]
  you.leftc = thecolors[2]
else
  me.rightc = thecolors[0]
  you.rightc = thecolors[0]
  me.leftc = thecolors[0]
  you.leftc = thecolors[0]

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
      if xx.cct > 0 then
      xx.colorsound:setPitch((xx.cct+1)/colorchangetime)
      xx.colorsound:setVolume(((xx.cct+1)/(colorchangetime+300)))
    else
      xx.colorsound = xx.cchangeto.sound:clone()
      xx.colorsound:setPitch(.01)
      xx.colorsound:setVolume(.01)
      end
      xx.cct = xx.cct + 1
      if xx.cct%1 == 0 then
      repplay(xx.colorsound)
      end
    end
    xx.ctri = (thecolors[0].c.r-xx.cchangeto.c.r)/colorchangetime
    xx.ctgi = (thecolors[0].c.g-xx.cchangeto.c.g)/colorchangetime
    xx.ctbi = (thecolors[0].c.b-xx.cchangeto.c.b)/colorchangetime


  elseif xx.cct > 0 then
    xx.cct = xx.cct - 3
    if xx.cct > 0 then
      xx.colorsound:setPitch((xx.cct+1)/colorchangetime)
      xx.colorsound:setVolume(((xx.cct+1)/(colorchangetime+300)))
      end
  end

  if xx.cct == colorchangetime then 
    if xx.color.n == -1 then
      xx.color = xx.cchangeto
      xx.runpace = defrunpace /  (xx.color.s.speed*3/4)
    end
  elseif xx.cct <= 0  then
    xx.cct = 0
    xx.runpace = defrunpace
    xx.color = thecolors[0]
  else 
    xx.color = thecolors[100]
    xx.color.c.r = thecolors[0].c.r-xx.ctri * xx.cct
    xx.color.c.g = thecolors[0].c.g-xx.ctgi * xx.cct
    xx.color.c.b = thecolors[0].c.b-xx.ctbi * xx.cct
  end
  
  xx.oldcctn = xx.cchangeto.n
  
end



