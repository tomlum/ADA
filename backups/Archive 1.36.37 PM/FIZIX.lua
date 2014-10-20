

--bla bla, if turning, then me = meturning (which is a love.graphics.newImage)

	groundy = 140



groundhuhy = function (ey)
	if ey == groundy 
		then garb = true
	else
		garb = false
end
end









--FRICTION FUNCTION TO SLOW DOWN
fricy = function (n) 
	if n > 1 
		then frcy = n - 1
	elseif n < -1
		then frcy = n + 1
	else 
		frcy = 0
	end
end

vroomrighty = function (v)
	if v == 0
	then vry = 1.5
	elseif v > 1 and v < 18
	then vry = vry + .5
	elseif v > 18
	then vry = 18.5
	end
end 

vroomlefty = function (v)
	if v == 0
	then vry = -1.5
	elseif v < -1 and v > -18
	then vry = vry - .5
	elseif v < -18
	then vry = -18.5
	end
end 

--gravity = function (n)
--	if 







moveyou = function ()
	you.feet = you.y - 60
	
	if you.g 
	then 
	you.j = 0
			if love.keyboard.isDown("up")
				then 
				you.j = 17
				you.jt = 10
				you.ht = 7
				you.jmax = 20
				you.landingcounter = 8
			elseif not you.g
				then 
				you.j = -1
			elseif love.keyboard.isDown("right") and you.v >= 0
				then 
				vroomrighty(you.v)
				you.v = vry
			elseif love.keyboard.isDown("left") and you.v <= 0
				then
				vroomlefty(you.v)
				you.v = vry
			elseif love.keyboard.isDown("down")
			then
			--fall through the floor panel-- maybe add a crashing animation to break through
			you.y = you.y + 4
			else
	 		fricy(you.v)
			you.v = frcy
			end

	else
			if love.keyboard.isDown("left") and you.v > 0
			then you.v = you.v - .2
				
			elseif love.keyboard.isDown("right") and you.v < 0
			then you.v = you.v + .2
			
			end
			
			--landing
			if you.feet + you.j > groundy 
			then
			you.j = 0
			you.y = groundy + 60
			you.g = true
			you.landing = true
			
			--long jump
			elseif love.keyboard.isDown("up") and you.j > 0 and you.jmax > 0
					then you.jmax = you.jmax - 1
			--the end arc/fall of any jump or the mini jump

			elseif you.feet - you.j < groundy 
			then
				if you.jt > 4
				then you.jt = you.jt - 1 
				elseif you.jt <= 4 
				then you.jt = you.jt - 1 
					you.j = you.j - 1
				elseif you.jt == 0 and you.ht > 0
				then you.j = 0
					you.ht = you.ht - 1	
				else
					you.j = -8
				end

				

			end

--IN THE AIR YOU CAN HIT THE OPPOSITE DIRECTION TO SLOWYOURSELF DOWN TO ZERO, ANIMATION IS ARMS OUT OR SOMETHING
	end
--INITIAL JUMP FROM GROUND? TRUE = THE MAX THEN IT DECREASES LIKE YEJ = YEJ-1
end











moveme = function ()
	if love.keyboard.isDown("d")
		then
		me.x = me.x + 5

	elseif love.keyboard.isDown("a")
		then
		me.x = me.x - 5

	elseif love.keyboard.isDown("w")
	then
		me.y = me.y - 5
	elseif love.keyboard.isDown("s")
	then
		me.y = me.y + 5
	
	end

end