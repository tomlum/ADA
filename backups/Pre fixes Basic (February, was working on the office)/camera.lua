camerafol = function ()

if camera2.xfollow
then
    if camera2.yfollow
    then
    camera2.x = you.mid - 767
    camera2.y = you.y - 259
    else camera2.x = camera2.x
    camera2.x = you.mid - 767
    camera2.y = camera2.y
    end
  
else
    if camera2.yfollow
    then
    camera2.y = you.y - 259
    camera2.x = camera2.x
    else
    camera2.x = camera2.x
    camera2.y = camera2.y
    end
end


if camera.xfollow
then
    if camera.yfollow
    then
    camera.x = me.mid - 261
    camera.y = me.y - 259
    else camera.x = camera.x
    camera.x = me.mid - 261
    camera.y = camera.y
    end
  
else
    if camera.yfollow
    then
    camera.y = me.y - 259
    camera.x = camera.x
    else
    camera.x = camera.x
    camera.y = camera.y
    end
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