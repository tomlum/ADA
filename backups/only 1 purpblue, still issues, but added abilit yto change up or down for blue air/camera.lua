--IF Y DIF GREAT THEN GROW THE LINE MORE have an 'or' clause
--HAVE IT SPLIT VERT ALSO? if horiz is same but different vert?

midpoint = 0
onescreen = false
vertone = false
camerafol = function ()

xdif = math.abs((you.x) - (me.x))
ydif = math.abs((you.y) - (me.y))


if xdif <= 500
  then speedlimit = 13
elseif xdif >= 2000
  then speedlimit = 17
elseif xdif < 2000 then
  speedlimit = (4 * ((xdif-500)/1500)) + 13
end 



if xdif <= 500 then 
  onescreen = true
  else onescreen = false
end

if ydif <= enviro.screenheight - 120 - 4 - 12 then
  vertone = true
  else vertone = false
end

if me.y <= you.y then 
midypoint = me.y + (ydif/2)
else midypoint = you.y + (ydif/2)
end


--indicator function for when at wall, then midpoint becomes some other constant point
if me.x <= you.x then midpoint = me.mid + (xdif/2)
elseif you.x < me.x then midpoint = you.mid + (xdif/2)
end


mexrig = me.mid - 250 - 12

if not mecamfloor and you.y > me.y then 
  youyrig = you.y - (enviro.screenheight) + 60 + 12 + 8

elseif youcamfloor 
  then
youyrig = floor - 60 - (enviro.screenheight) + 60 + 12 + 8
elseif not vertone and you.y < me.y then
  youyrig = you.y - 30 - 12 - 8 
end


if not youcamfloor and you.y < me.y then 
  meyrig = me.y - (enviro.screenheight) + 60 + 12 + 8

elseif mecamfloor 
  then
meyrig = floor - 60 - (enviro.screenheight) + 60 + 12 + 8
elseif not vertone and me.y < you.y then
  meyrig = me.y - 30 - 12 - 8 
end


youxrig = you.mid - 750 - 12



if mecamlwall or youcamlwall then camera.x = 10 - 12
end

--WORK ON THIS
--WORK ON THIS

if mecamrwall or youcamrwall then camera2.x = enviro.rightwall-1000
end




if you.x < me.x then

youxrig = me.mid - 750 - 12
if not mecamfloor and you.y > me.y then 
  meyrig = you.y - (enviro.screenheight) + 60 + 12 + 8

elseif youcamfloor 
  then
youyrig = floor - 60 - (enviro.screenheight) + 60 + 12 + 8
elseif not vertone and you.y < me.y then
  meyrig = you.y - 30 - 12 - 8 
end


if not youcamfloor and you.y < me.y then 
  youyrig = me.y - (enviro.screenheight) + 60 + 12 + 8

elseif mecamfloor 
  then
youyrig = floor - 60 - (enviro.screenheight) + 60 + 12 + 8
elseif not vertone and me.y < you.y then
  youyrig = me.y - 30 - 12 - 8 
end
mexrig = you.mid - 250 - 12



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



--MAYBE GET RID OF THIS?!?!?!?!?!?!?!?!?!?!?!?!!?!?!?!?!?!?!?!?!?!??!
--if mecamrwall or youcamrwall then
--  midpoint = rightwall-1250
--  elseif mecamlwall or youcamlwall then
--    midpoint = 510
--  end


if onescreen then
  camera.x = midpoint - 500 - 12
  camera2.x = camera.x
end

if youcamfloor and mecamfloor 
  then bothfloor = true
else bothfloor = false
end

if vertone and not bothfloor then 
  camera.y = midypoint - (enviro.screenheight/2) + 30 - 12
  camera2.y = camera.y  

end




--the middle wall thing, divider
if xdif > 1000 then 
  width = 1.2
  wallx = 505
elseif xdif <= 500 then 
  width = 0
elseif xdif > 500 then 
  width = (xdif - 400)/500
  wallx = 506 + ((1-width) * 6)


end

if ydif > 1500 then 
 bwidth = 1
 beigex = 506
elseif ydif >= enviro.screenheight - 120 - 4 - 12 then
  bwidth =.05 + (ydif - enviro.screenheight + 120 + 4) / (1500 - enviro.screenheight + 120 + 4 + 12)
  beigex = 506 + ((1-bwidth) * 6)
elseif ydif <= enviro.screenheight - 120 - 4 - 12
  then
  bwidth = 0
  beigex = 0



end

end















camera = {}
camera.x = 0
camera.y = 1300 - 3 - 510
camera.scaleX = 1
camera.scaleY = 1
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
camera2.scaleX = 1
camera2.scaleY = 1
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