

idle1 = love.graphics.newImage("me/idle/idle1.png")
idle2 = love.graphics.newImage("me/idle/idle2.png")
walk1 = love.graphics.newImage("me/walk/walk51.png")
walk2 = love.graphics.newImage("me/walk/walk52.png")
walk3 = love.graphics.newImage("me/walk/walk53.png")
walk4 = love.graphics.newImage("me/walk/walk54.png")
walk5 = love.graphics.newImage("me/walk/walk55.png")
slide = love.graphics.newImage("me/walk/slide.png")
walkpunch11 = love.graphics.newImage("me/walk/walkpunch11.png")
walkpunch12 = love.graphics.newImage("me/walk/walkpunch12.png")
walkpunch13 = love.graphics.newImage("me/walk/walkpunch13.png")
walkpunch14 = love.graphics.newImage("me/walk/walkpunch14.png")
walkpunch15 = love.graphics.newImage("me/walk/walkpunch15.png")


walkpunch21 = love.graphics.newImage("me/walk/walkpunch21.png")
walkpunch22 = love.graphics.newImage("me/walk/walkpunch22.png")
walkpunch23 = love.graphics.newImage("me/walk/walkpunch23.png")
walkpunch24 = love.graphics.newImage("me/walk/walkpunch24.png")
walkpunch25 = love.graphics.newImage("me/walk/walkpunch25.png")


jumprise = love.graphics.newImage("me/jump/jumprise.png")
jumpfalling = love.graphics.newImage("me/jump/jumpfalling.png")
landing = love.graphics.newImage("me/jump/landing.png")
slowdown = love.graphics.newImage("me/jump/slowdown.png")
arm = love.graphics.newImage("me/jump/arm.png")
lightson = love.graphics.newImage("enviro/lightson.png")
lightsoff = love.graphics.newImage("enviro/lightsoff.png")
lighttimer = 0
lights = function ()
	if lighttimer < 31
		then enviro.light = lightson
		lighttimer = lighttimer + 1
	elseif lighttimer >= 31 and lighttimer < 36
		then enviro.light = lightsoff
		lighttimer = lighttimer + 1
	elseif lighttimer >= 36 and lighttimer < 50
		then enviro.light = lightson
		lighttimer = lighttimer + 1
		elseif lighttimer >= 50 and lighttimer < 70
		then enviro.light = lightsoff
		lighttimer = lighttimer + 1
		elseif lighttimer >= 70
		then
		lighttimer = - 120


end
end






cammovement = function ()
	if you.mid + you.v < 260
	then 
	camera2.xfollow = false
	youcamlwall = true


	elseif you.mid + you.v > enviro.rightwall-250
	then camera2.xfollow = false
	youcamrwall = true
	else camera2.xfollow = true
		youcamlwall = false
	end
	if you.y >= floor - (enviro.screenheight/2) - 30
		then
		camera2.yfollow = false
		camera2.y = floor - enviro.screenheight - 12 + 4
	elseif you.y < (enviro.screenheight/2) + 30
		then
		camera2.yfollow = false
	else
		camera2.yfollow=true
end

	if me.mid + me.v < 260
	then 
		camera.xfollow = false
		mecamlwall = true


	elseif me.mid + me.v > enviro.rightwall-250
	then camera.xfollow = false
	mecamrwall = true
	else camera.xfollow = true
		mecamlwall = false
	end
	if me.y >= floor - (enviro.screenheight/2) - 30
		then
		camera.yfollow = false
		camera.y = floor - enviro.screenheight - 12 + 4
	elseif me.y < (enviro.screenheight/2) + 30
		then
		camera.yfollow = false
	else
		camera.yfollow=true
end
end


--function that adjusts the x for flipping left and right
meyoux = function ()
	me.xleft = me.x + 30
	me.mid = me.x + 15
	you.xleft = you.x + 30
	you.mid = you.x + 15

	

	if lefty 
	then you.xanimate = you.xleft
		 you.leftface = true
	elseif righty 
	then you.xanimate = you.x
		 you.leftface = false

	end
	

	if leftme 
	then me.xanimate = me.xleft
		me.leftface = true
	elseif rightme 
	then me.xanimate = me.x
		me.leftface = false

	end

end

idley = 0
idleme = 0
ay = 0
walktimerme = 0
walktimery = 0

orient = function ()
	if not you.slowdown and not you.slide and not you.stop and not you.pause
		then
	rightyy = controller2.right
	leftyy = controller2.left
end

	if rightyy and not leftyy then righty = true
				lefty = false
		elseif leftyy and not rightyy then lefty = true
				righty = false
			else righty = righty 
				 lefty = lefty
	end


	if not me.slowdown and not me.slide and not me.stop and not me.pause
		then
	rightmeme = controller1.right
	leftmeme = controller1.left
end

	if rightmeme and not leftmeme then rightme = true
				leftme = false
		elseif leftmeme and not rightmeme then leftme = true
				rightme = false
			else rightme = rightme
				 leftme = leftme
	end



	if lefty
	then 
	you.lr = -1
	elseif righty
	then you.lr = 1
	else you.lr = you.lr
		end

	if leftme 
	then me.lr = -1
	elseif rightme
	then me.lr = 1
		end
end




idleanimatey = function ()
	if idley < 17 then 
		you.im = idle1
		idley = idley + 1
	elseif idley >= 17 and idley < 33 then
		you.im = idle2
		idley = idley + 1
	elseif idley >=33 then
		idley = 0
	end
end

idleanimateme = function ()

	if idleme < 17 then 
		me.im = idle1
		idleme = idleme + 1
	elseif idleme >= 17 and idleme < 33 then
		me.im = idle2
		idleme = idleme + 1
	elseif idleme >=33 then
		idleme = 0
	end

end



walky = function ()
	if walktimery < 7 then 
		you.im = walk1
		walktimery = walktimery + 1
	elseif walktimery >= 7 and walktimery < 14 then
		you.im = walk2
		walktimery = walktimery + 1
	elseif walktimery >= 14 and walktimery < 21 then
		you.im = walk3
		walktimery = walktimery + 1
	elseif walktimery >= 21 and walktimery < 28 then
		you.im = walk4
		walktimery = walktimery + 1
	elseif walktimery >= 28 and walktimery < 35 then
		you.im = walk5
		walktimery = walktimery + 1
	else
		walktimery = 0
	end
end

walkme = function ()
	if walktimerme < 7 then 
		me.im = walk1
		walktimerme = walktimerme + 1
	elseif walktimerme >= 7 and walktimerme < 14 then
		me.im = walk2
		walktimerme = walktimerme + 1
	elseif walktimerme >= 14 and walktimerme < 21 then
		me.im = walk3
		walktimerme = walktimerme + 1
	elseif walktimerme >= 21 and walktimerme < 28 then
		me.im = walk4
		walktimerme = walktimerme + 1
	elseif walktimerme >= 28 and walktimerme < 35 then
		me.im = walk5
		walktimerme = walktimerme + 1
	else
		walktimerme = 0
	end
end

jumpy = function ()
	if you.j > 0 then 
		you.im = jumprise
	else you.im = jumpfalling
end
end

jumpme = function ()
	if me.j > 0 then 
		me.im = jumprise
	else me.im = jumpfalling
end
end

landycheck = function ()
	if you.landingcounter <= 0	
	then you.landing = false
	else
	you.landingcounter = you.landingcounter - 1

end
end

landmecheck = function ()
	if me.landingcounter <= 0	
	then me.landing = false
	else
	me.landingcounter = me.landingcounter - 1

end
end

slidetimery = 0
slidetimerme = 0

slideycheck = function ()
	if slidetimery < 6
	then 
	slidetimery = slidetimery + 1
	elseif slidetimery >= 6
	then you.slide = false
		
	end
end

slidemecheck = function ()
	if slidetimerme < 6
	then 
	slidetimerme = slidetimerme + 1
	elseif slidetimerme >= 6
	then me.slide = false
		
	end
end



animate = function ()
	landycheck()
	slideycheck()
	if you.slide 
	then you.im = slide

	elseif you.slowdown
	then you.im = slowdown

	elseif you.landing
	then you.im = landing

	elseif you.g and you.v == 0 and not you.slide 
	then idleanimatey()
	walktimery = 0

	elseif not you.g
	then
	jumpy()

	else
		walky()

	end




	landmecheck()
	slidemecheck()
	if me.slide 
	then me.im = slide

	elseif me.slowdown
	then me.im = slowdown

	elseif me.landing
	then me.im = landing

	elseif me.g and me.v == 0 and not me.slide 
	then idleanimateme()
	walktimerme = 0

	elseif not me.g
	then
	jumpme()

	else
		walkme()

	end


end




--can add me
facemovement = function ()
	if you.slide
	then you.facedis = 1
	elseif you.landing
	then you.facedis = 5
	else you.facedis = 2
	end


	
	
	if you.im == dodge
	then you.facey = you.y + 28
		you.facedis = 4
	elseif you.im == dodge21
		then
		you.facey = you.y + 26
		you.facedis = 22
		elseif you.im == dodge2
		then
		you.facey = you.y + 23
		you.facedis = 19

	elseif you.im == idle1
	then  
	you.facey = you.feet - 54
	elseif you.im == idle2
	then 
	you.facey = you.feet - 53


	elseif you.landing
	then you.facey = you.feet - 42
	
	elseif you.j > 0 then you.facey = you.feet - 56
	elseif you.j < 0 then you.facey = you.feet - 53




	else you.facey = you.feet - 54
	end







	if me.slide
	then me.facedis = 1
	elseif me.landing
	then me.facedis = 5
	else me.facedis = 2
	end

	if me.im == idle1
	then  
	me.facey = me.feet - 54
	elseif me.im == idle2
	then 
	me.facey = me.feet - 53

	elseif me.landing
	then me.facey = me.feet - 42
	
	elseif me.j > 0 then me.facey = me.feet - 56
	elseif me.j < 0 then me.facey = me.feet - 53
	else me.facey = me.feet - 54
	end

	if you.leftface
	then you.facex = you.mid - you.facedis - 4  
	else you.facex = you.mid + you.facedis - 6
	end

	if me.leftface
	then me.facex = me.mid - me.facedis - 4  
	else me.facex = me.mid + me.facedis - 6
	end


end

--crestmovement = function ()
--	if 

--can add me
armanimatey = function ()
	if you.slowdown and you.leftface and not you.dodge and not you.pause and not you.stop and you.im ~= airspike
	then 
	love.graphics.draw(arm, you.x + 21, you.y + 20)
	elseif you.slowdown and not you.leftface and not you.dodge and not you.pause and not you.stop and you.im ~= airspike
	then
	love.graphics.draw(arm, you.xleft - 21, you.y + 20, 0, -1, 1)
	end


	
end


armanimateme = function ()
	if me.slowdown and me.leftface and not me.dodge and not me.pause and not me.stop and not me.stop and me.im ~= airspike
	then 
	love.graphics.draw(arm, me.x + 21, me.y + 20)
	elseif me.slowdown and not me.leftface and not me.dodge and not me.pause and me.im ~= airspike
	then
	love.graphics.draw(arm, me.xleft - 21, me.y + 20, 0, -1, 1)
	end


end


crestmovement = function ()


	if you.im == dodge21
		then
		you.crestdis = 15
	elseif you.landing
	then 
		you.crestdis = 1
	elseif you.im == dodge
		then
		you.crestdis = 3





	else 
		you.crestdis = 0
	end

	if you.landing
	then you.cresty = you.y + 37
	elseif you.im == idle2
	then you.cresty = you.y + 28
--
	elseif you.im == dodge
		then you.cresty = you.y + 46
	elseif you.im == block or you.im == dodge2 or you.im == chargepunch
		then you.cresty = - 100
	elseif you.im == dodge21
		then you.cresty = you.y + 43
--
	else you.cresty = you.y + 27
	end

	if you.leftface 
		then you.crestx = you.mid - you.crestdis - 1
	else 
	you.crestx = you.mid + you.crestdis - 2
	end



	if me.im == dodge21
		then
		me.crestdis = 15
	elseif me.landing
	then 
		me.crestdis = 1
	else 
		me.crestdis = 0
	end

	if me.landing
	then me.cresty = me.y + 37
	elseif me.im == idle2 
	then me.cresty = me.y + 28
	else me.cresty = me.y + 27
	end

	if me.leftface 
		then me.crestx = me.mid - me.crestdis - 1
	else 
	me.crestx = me.mid + me.crestdis - 2
	end
end



			