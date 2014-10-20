
idle1 = love.graphics.newImage("me/idle1.png")
idle2 = love.graphics.newImage("me/idle2.png")
walk1 = love.graphics.newImage("me/walk31.png")
walk2 = love.graphics.newImage("me/walk32.png")
walk3 = love.graphics.newImage("me/walk23.png")
walk4 = love.graphics.newImage("me/walk4.png")
jumprise = love.graphics.newImage("me/jumprise.png")
jumpfalling = love.graphics.newImage("me/jumpfalling.png")
landing = love.graphics.newImage("me/landing.png")

righty = you.v > 0
lefty = you.v < 0
rightme = me.v > 0
leftme = me.v < 0

--function that adjusts the x for flipping left and right
meyoux = function ()
	me.xleft = me.x + 30
	me.mid = me.x / 2 + me.xleft / 2
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2

	if lefty
	then you.xanimate = you.xleft
	elseif righty
	then you.xanimate = you.x
	end

	if leftme
	then me.xanimate = me.xleft
	elseif rightme 
	then me.xanimate = me.x
	end

end

idelybla = 0
walktimery = 0

orient = function ()
	righty = you.v > 0
	lefty = you.v < 0
	rightme = me.v > 0
	leftme = me.v < 0
	if lefty
	then 
	you.lr = -1
	elseif righty
	then you.lr = 1
		end
	if leftme 
	then me.lr = -1
	elseif righty
	then me.lr = 1
		end
end

idley = function ()
	if idelybla < 17 then 
		you.im = idle1
		idelybla = idelybla + 1
	elseif idelybla >= 17 and idelybla < 33 then
		you.im = idle2
		idelybla = idelybla + 1
	elseif idelybla >=33 then
		idelybla = 0
	end
end

walky = function ()
	if walktimery < 10 then 
		you.im = walk1
		walktimery = walktimery + 1
	elseif walktimery >= 10 and walktimery < 19 then
		you.im = walk3
		walktimery = walktimery + 1
	else
		walktimery = 0
	end
end

jumpey = function ()
	if you.j > 0 then 
		you.im = jumprise
	else you.im = jumpfalling
end
end

landycheck = function ()
	if you.landingcounter == 0	
	then you.landing = false
	elseif you.landing
	then you.landingcounter = you.landingcounter - 1
end
end




 

animatey = function ()
	landycheck()
	if you.landing
	then you.im = landing
	elseif you.g and you.v == 0 
	then idley()
	walktimery = 0
	elseif not you.g
	then
	jumpey()
	else
		walky()

	end
end

			