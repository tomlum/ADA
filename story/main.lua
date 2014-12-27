success = love.window.setMode(1440, 900, {resizable=true, fullscreen = false, vsync=true})





function love.load()

screenwidth = love.graphics.getWidth()
	screenheight = love.graphics.getHeight()

chapter = 1

function si(x,t)
if t == 1 then return
	t*screenwidth/1440
elseif t == 2 then return 
	t * screenheight/900
end
end

require "camera"

background1 = love.graphics.newImage("backs/background.png")
background1:setFilter("nearest")
paralax1 = love.graphics.newImage("backs/paralax1.png")
paralax1:setFilter("nearest")

me={}
you={}

if chapter == 1 then 
	me = {}
	you = {}
me.x = 40
you.x = 50

me.mid = me.x
you.mid = you.x

me.y = 640
you.y = 640

me.feet = me.y + 10
you.feet = you.y + 10

end

end









function love.update()


	screenwidth = love.graphics.getWidth()
	screenheight = love.graphics.getHeight()

if chapter == 1 then

	me.start = love.keyboard.isDown("q")
	me.left = love.keyboard.isDown("a")
	me.right = love.keyboard.isDown("d")
	me.a1 = love.keyboard.isDown("t")


	you.left = love.keyboard.isDown("j")
	you.right = love.keyboard.isDown("l")
  you.a1 = love.keyboard.isDown("up")
  

if me.up then me.y = me.y - 10
elseif me.down then me.y = me.y + 10
elseif me.right then me.x = me.x + 10
elseif me.left then me.x = me.x - 10
end

if you.up then you.y = you.y - 10
elseif you.down then you.y = you.y + 10
elseif you.right then you.x = you.x + 10
elseif you.left then you.x = you.x - 10
end

me.feet = me.y + 10
you.feet = you.y + 10

me.mid = me.x + 10
you.mid = you.x + 10

cammovement()
camerafol()

end

end


function love.draw()


if chapter == 1 then 
	
	love.graphics.setScissor(0, 0, screenwidth/2, screenheight)
	camera:set()
	love.graphics.draw(paralax1,0,0,0,20, 20)
	love.graphics.draw(background1,0,0,0,20, 20)
	love.graphics.rectangle("fill",me.x,me.y,70,120)
  love.graphics.rectangle("fill",you.x,you.y,70,120)

	camera:unset()
	love.graphics.setScissor()






	
	love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, screenheight)
  
	camera2:set()
		love.graphics.draw(paralax1,0,0,0,20, 20)
	love.graphics.draw(background1,0,0,0,20, 20)
	love.graphics.rectangle("fill",me.x,me.y,70,120)
  love.graphics.rectangle("fill",you.x,you.y,70,120)


	camera2:unset()
	love.graphics.setScissor()



end




end
