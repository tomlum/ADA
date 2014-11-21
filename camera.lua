--IF Y DIF GREAT THEN GROW THE LINE MORE have an 'or' clause
--HAVE IT SPLIT VERT ALSO? if horiz is same but different vert?

--partition, the hole in the ceiling, the right edge of the apartment

minzoom = .7
maxzoom = .63
minzdis = 1000
maxzdis = 4500

cscale = .7



cammovement = function ()
ydif = math.abs((you.y) - (me.y))

  if ydif <= enviro.screenheight*cscale - head2ceiling - feet2bottom - 60 then
  vertone = true
  else vertone = false
end

if me.y <= you.y then 
midypoint = me.y + (ydif/2) + 30
else midypoint = you.y + (ydif/2) + 30
end


--removed cause stopping at edges is no
  -- if you.mid + you.v < screenwidth*cscale/4
  -- then 
  -- camera2.xfollow = false
  -- youcamlwall = true


  -- elseif you.mid + you.v > enviro.rightwall-screenwidth*cscale/4
  -- then camera2.xfollow = false
  -- youcamrwall = true
  -- else camera2.xfollow = true
  --   youcamlwall = false
  -- end

  if midypoint >= floor - (enviro.screenheight*cscale/2) + (feet2bottom)*cscale
    then
    youcamfloor = true
    mecamfloor = true
  else
    youcamfloor=false
    mecamfloor = false
end
--removed cause stopping at edges is no
  -- if me.mid + me.v < screenwidth*cscale/4
  -- then 
  --   camera.xfollow = false
  --   mecamlwall = true


  -- elseif me.mid + me.v > enviro.rightwall-screenwidth*cscale/4
  -- then camera.xfollow = false
  -- mecamrwall = true
  -- else camera.xfollow = true
  --   mecamlwall = false
  -- end
  
end




midpoint = 0
onescreen = false
vertone = false
camerafol = function ()

xdif = math.abs((you.x) - (me.x))
absdis = math.sqrt(((you.y-me.y)^2)+((you.x-me.x)^2))








if absdis <= minzdis
  then cscale = maxzoom
elseif absdis > maxzdis then
  cscale = minzoom
elseif absdis > minzdis then
  cscale = ((minzoom-maxzoom)*((absdis-minzdis)/(maxzdis-minzdis))) + maxzoom

end 


camera2.scaleX = cscale
camera2.scaleY = cscale

camera.scaleX = cscale
camera.scaleY = cscale



if xdif <= screenwidth*cscale/2 then 
  onescreen = true
  else onescreen = false
end



if me.y <= you.y then 
midypoint = me.y + (ydif/2) + 30
else midypoint = you.y + (ydif/2) + 30
end


--indicator function for when at wall, then midpoint becomes some other constant point

if me.x <= you.x then midpoint = me.mid + (xdif/2)
elseif you.x < me.x then midpoint = you.mid + (xdif/2)
end


mexrig = me.mid - (screenwidth*cscale*.25)
youxrig = you.mid - (screenwidth*cscale*.75)

if not mecamfloor and you.y > me.y then 
  youyrig = you.feet - enviro.screenheight*cscale + feet2bottom 

elseif youcamfloor 
  then
youyrig = floor - enviro.screenheight*cscale + feet2bottom 
elseif not vertone and you.y < me.y then
  youyrig = you.y - head2ceiling*cscale
end


if not youcamfloor and you.y < me.y then 
  meyrig = me.feet - enviro.screenheight*cscale + feet2bottom

elseif mecamfloor 
  then
meyrig = floor - enviro.screenheight*cscale + feet2bottom 
elseif not vertone and me.y < you.y then
  meyrig = me.y - head2ceiling*cscale
end




--removed cause stopping at edges is no
-- if mecamlwall or youcamlwall then camera.x = 0
-- end


-- if mecamrwall or youcamrwall then camera2.x = enviro.rightwall-screenwidth*cscale
-- end




if you.x < me.x then

youxrig = me.mid - (screenwidth*cscale*.75)
mexrig = you.mid - (screenwidth*cscale*.25)

tempyrig = meyrig
meyrig = youyrig
youyrig = tempyrig






if camera.xfollow 
  then
tempxfol = true
else tempxfol = false
  end

if camera.yfollow 
  then
tempyfol = true
else tempyfol = false
end
camera.xfollow = camera2.xfollow
camera.yfollow = camera2.yfollow
camera2.xfollow = tempxfol
camera2.yfollow = tempyfol
end










if camera.xfollow then
    camera.x = mexrig
end

    camera.y = meyrig
                    



if camera2.xfollow then
    camera2.x = youxrig
end 

    camera2.y = youyrig





if onescreen 
    then 

  camera.x = midpoint - screenwidth*cscale/2
  camera2.x = camera.x


end

if camera.x <= 0 and camera2.x <= 0 then 
  --removed cause stopping at edges is no
  -- camera.x = 0 
  -- camera2.x = camera.x

elseif camera2.x + screenwidth*cscale >= enviro.rightwall and camera.x + screenwidth*cscale >= enviro.rightwall then
--removed cause stopping at edges is no
-- camera2.x = enviro.rightwall - screenwidth*cscale 
-- camera.x = camera2.x
end

--if one screen and leftwall then midpoint = some fixed point away from the wall

if youcamfloor and mecamfloor 
  then bothfloor = true
else bothfloor = false
end

if vertone and not bothfloor then 
  camera.y = midypoint - (screenheight*cscale/2) + 30
  camera2.y = camera.y  

end






--the middle wall thing, divider

if camera.x <= 0 or camera2.x + screenwidth*cscale >= enviro.rightwall then
  --removed cause stopping at edges is no
  -- then xdif = math.abs((camera.x) - (camera2.x)) + screenwidth*cscale/2
end

if xdif > screenwidth*cscale then 
  width = 1.3
  wallx = (screenwidth/2 - 7) + ((1-width) * 7)
elseif xdif <= screenwidth*cscale/2 then 
  width = 0
elseif xdif > screenwidth*cscale/2 then 
  width = (xdif - screenwidth*cscale/2)/(screenwidth*cscale/2) + .3
  wallx = (screenwidth/2 - 7) + ((1-width) * 7)
else wallx = 0

end

if onescreen then width = 0
  wallx = 0
end

bheight = (head2ceiling + 60 + 60)/24
bbheight = (feet2bottom + 60 + 60)/24
beigedif = (enviro.screenheight - head2ceiling - feet2bottom - 60)*cscale
if ydif > beigedif*4 then 
 bwidth = 15
 beigex = (screenwidth/2-6) + ((1-bwidth) * 6)
elseif ydif >= beigedif  then
  bwidth =1 + ((ydif-beigedif)/(beigedif*4)) * 15
elseif ydif <= beigedif
  then
  bwidth = 0
  beigex = 0



end 

topbottomcam()

end




twidth = 0
topy = 0


--length of horiz bar is related to xdif, thickness related to ydif

function topbottomcam()
  
  if me.y < you.y then 

  
  topy = 0
bottomy = enviro.screenheight/2
  
else
  
  
  bottomy = 0
topy = enviro.screenheight/2
  
  end
  
  if xdif <= screenwidth*cscale/4 then 
  twidth = (screenwidth/2)
elseif xdif < screenwidth*cscale/2 then
  twidth = (screenwidth/2) - ((xdif-screenwidth*cscale/4)/(screenwidth*cscale/4))*(screenwidth/2)
  --twidth = screenwidth*cscale/2- ((xdif-screenwidth*cscale/4)/((screenwidth*cscale/2)-screenwidth*cscale/4))*(screenwidth*cscale/2)
 else 
  twidth = 0 
end
  
  
  end









camera = {}
camera.x = 0
camera.y = 1300 - 3 - 510
camera.scaleX = cscale
camera.scaleY = cscale
camera.rotation = 0
camera.xfollow = true
camera.yfollow = true

function camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
  love.graphics.pop()
end

function camera:move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

function camera:rotate(dr)
  self.rotation = self.rotation + dr
end

function camera:scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera:setPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function camera:setScale(sx, sy)
  self.scaleX = sx or self.scaleX
  self.scaleY = sy or self.scaleY

end





camera2 = {}
camera2.x = 0
camera2.y = 1300 - 3 - 510
camera2.scaleX = cscale
camera2.scaleY = cscale
camera2.rotation = 0
camera2.xfollow = true
camera2.yfollow = true

function camera2:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera2:unset()
  love.graphics.pop()
end

function camera2:move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

function camera2:rotate(dr)
  self.rotation = self.rotation + dr
end

function camera2:scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera2:setPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function camera2:setScale(sx, sy)
  self.scaleX = sx or self.scaleX
  self.scaleY = sy or self.scaleY
end









function drawleft()
  
  love.graphics.draw(enviro.sky, camera.x, 0, 0, 500, 1.1)
	--love.graphics.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)
	if themap == "library" then 
	love.graphics.draw(enviro.paralax2, camera.x/1.5 + (screenwidth/4)/1.5 - 400,camera.y/1.2 + enviro.screenheight / 1.2 - 12 - paralaxoffset-940)
		end
	love.graphics.draw(enviro.paralax, camera.x / 2 + ((screenwidth/4)/2*cscale) - 200, (camera.y/2) + (enviro.screenheight/2*cscale) - 12 - paralaxoffset - 800)
	love.graphics.draw(enviro.floor, 0, 0)
  if themap == "street" then
  drawstreetprestuff()
  end

	if me.flinch then 
	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey,mefacerot)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)
	
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey,youfacerot)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else
	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)
	
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey, youfacerot)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	drawmyroulette()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey,mefacerot)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	
end
	
	medrawmines()
	spikes.draw()
	bolts.draw()
	drawtornado()


	love.graphics.setColor(220,220,220)
	youdrawmines()
	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	youdrawtornado()
	love.graphics.setColor(255, 255, 255, 255)
	

	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()
	elseif themap == "floors" then
		drawfloorsstuff()
	end
  if fightclub then drawallhex() end
end


function drawright()
  
  
  love.graphics.draw(enviro.sky, camera.x, 0, 0, 500, 1.1)
	--love.graphics.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)
	if themap == "library" then 
	love.graphics.draw(enviro.paralax2, camera2.x/1.5 + (screenwidth/4)/1.5 - 400,camera2.y/1.2 + enviro.screenheight / 1.2 - 12 - paralaxoffset-940)
		end

	love.graphics.draw(enviro.paralax, camera2.x / 2 + ((screenwidth/4)/2*cscale) - 200, camera2.y / 2 + (enviro.screenheight/2*cscale) - 12 - paralaxoffset - 800)
	love.graphics.draw(enviro.floor,0, 0)
  if themap == "street" then
  drawstreetprestuff()
  end

	if me.flinch then 
	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey,mefacerot)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)
	
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey,youfacerot)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	else

	drawyourroulette()
	love.graphics.setColor(155, 155, 155, 255)
	love.graphics.draw(you.im, you.xanimate-you.xoffset, you.y-you.yoffset, 0, you.lr, 1)
	
	love.graphics.setColor(a22r,a22g,a22b,255)
	love.graphics.draw(you.face, you.facex, you.feet + you.facey,youfacerot)
	love.graphics.draw(you.crest, you.crestx, you.cresty)
	love.graphics.setColor(255, 255, 255, 255)

	drawmyroulette()
	love.graphics.draw(me.im, me.xanimate-me.xoffset, me.y-me.yoffset, 0, me.lr, 1)
	love.graphics.setColor(a31r,a31g,a31b,255)
	love.graphics.draw(me.face, me.facex, me.feet + me.facey,mefacerot)
	love.graphics.draw(me.crest, me.crestx, me.cresty)
	love.graphics.setColor(255, 255, 255, 255)
	
end
	medrawmines()
	spikes.draw()
	bolts.draw()
	drawtornado()
	love.graphics.setColor(220,220,220)
	youdrawmines()

	love.graphics.setColor(155,155,155)
	youspikes.draw()
	youbolts.draw()
	youdrawtornado()
	love.graphics.setColor(255, 255, 255, 255)
	if themap == "street" then
	drawstreetstuff()
	elseif themap == "library" then
		drawlibrarystuff()
	elseif themap == "floors" then
		drawfloorsstuff()

	end
  if fightclub then drawallhex()end
end