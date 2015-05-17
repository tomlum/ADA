--IF Y DIF GREAT THEN GROW THE LINE MORE have an 'or' clause
--HAVE IT SPLIT VERT ALSO? if horiz is same but different vert?

--partition, the hole in the ceiling, the right edge of the apartment

floor = 800

cscale = 1440/screenwidth
--cscale = 1

head2ceiling = 50
feet2bottom = 50

rightwall = 1440

function cammovement()
  
  
  
 cscale = 1440/screenwidth
  
ydif = math.abs((you.y) - (me.y))

  if ydif <= screenheight*cscale - head2ceiling - feet2bottom - 60 then
  vertone = true
  else vertone = false
end

if me.y <= you.y then 
midypoint = me.y + (ydif/2) + 30
else midypoint = you.y + (ydif/2) + 30
end


  if midypoint >= floor - (screenheight*cscale/2) + feet2bottom
    then
    youcamfloor = true
    mecamfloor = true
  else
    youcamfloor=false
    mecamfloor = false
end
end




midpoint = 0
onescreen = false
vertone = false
camerafol = function ()

xdif = math.abs((you.x) - (me.x))


if xdif <= screenheight*cscale/2
  then speedlimit = 13
elseif xdif >= 2000
  then speedlimit = 17
elseif xdif < 2000 then
  speedlimit = (4 * ((xdif-500)/1500)) + 13
end 



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
  youyrig = you.feet - screenheight*cscale + feet2bottom 

elseif youcamfloor 
  then
youyrig = floor - screenheight*cscale + feet2bottom 
elseif not vertone and you.y < me.y then
  youyrig = you.y - head2ceiling 
end


if not youcamfloor and you.y < me.y then 
  meyrig = me.feet - screenheight*cscale + feet2bottom

elseif mecamfloor 
  then
meyrig = floor - screenheight*cscale + feet2bottom 
elseif not vertone and me.y < you.y then
  meyrig = me.y - head2ceiling 
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

elseif camera2.x + screenwidth*cscale >= rightwall and camera.x + screenwidth*cscale >= rightwall then
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

if camera.x <= 0 or camera2.x + screenwidth*cscale >= rightwall then
  --removed cause stopping at edges is no
  -- then xdif = math.abs((camera.x) - (camera2.x)) + screenwidth*cscale/2
end

if xdif > screenwidth*cscale then 
  width = 1.3
  wallx = (screenwidth/2 - 7) + ((1-width) * 7)
elseif xdif <= screenwidth/2 then 
  width = 0
elseif xdif > screenwidth/2 then 
  width = (xdif - screenwidth/2)/(screenwidth/2) + .3
  wallx = (screenwidth/2 - 7) + ((1-width) * 7)
else wallx = 0

end

if onescreen then width = 0
  wallx = 0
end

bheight = (head2ceiling + 60 + 60)/24
bbheight = (feet2bottom + 60 + 60)/24
beigedif = screenheight - head2ceiling - feet2bottom - 60
if ydif > beigedif*2 then 
 bwidth = 1.3
 beigex = (screenwidth/2-6) + ((1-bwidth) * 6)
elseif ydif >= beigedif  then
  bwidth =.3 + (ydif - beigedif)/beigedif
  beigex = (screenwidth/2-6) + ((1-bwidth) * 6)
elseif ydif <= beigedif
  then
  bwidth = 0
  beigex = 0



end 

end















camera = {}
camera.x = 0
camera.y = 0
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
camera2.y = 0
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


