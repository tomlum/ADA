floor = 1500 - 3
tempyfloor = floor
tempmefloor = floor









platforming = function ()

	if you.x >= 1118 and you.mid <= 1528 and you.feet <= 979 and you.feet >= 949
		then
		tempyfloor = 979
	elseif you.mid >= 2245 and you.mid <= 2750 and you.feet <= 1227 and you.feet >= 1197
		then 
		tempyfloor = 1227


	elseif you.mid >= 2879 and you.xleft <= 3143 and you.feet <= 3143 and you.feet >= 3113
		then tempyfloor = 3143
	
	elseif you.mid >= 2749 and you.mid <=2968 and you.feet <= 1270 and you.feet >= 1240
		then tempyfloor = 1270
		
	

	elseif you.x >= 3294 and you.mid <= 3676 and you.feet <= 618 and you.feet >= 588
		then tempyfloor = 618
	elseif you.mid >= 3325 and you.mid <= 3764 and you.feet <= 1270 and you.feet >= 1240
		then tempyfloor = 1270
	elseif you.mid >= 4485 and you.mid <= 4689 and you.feet <= 1064 and you.feet >= 1034
		then tempyfloor = 1064
	elseif you.mid >= 5292 and you.mid <= 5469 and you.feet <= 1140 and you.feet >= 1110 
		then tempyfloor = 1140
	elseif you.mid >= 5654 and you.mid <= 5831 and you.feet <= 1140 and you.feet >= 1110
		then tempyfloor = 1140
	elseif you.mid >= 5108 and you.mid <= 6013 and you.feet <= 1318 and you.feet >= 1288
		then tempyfloor = 1318



	else you.onplat = false
		tempyfloor = floor
		if you.feet + 10 < floor
		then you.g = false
	end
	end








	if me.x >= 1118 and me.mid <= 1528 and me.feet <= 979 and me.feet >= 949
		then
		tempmefloor = 979
	elseif me.mid >= 2245 and me.mid <= 2750 and me.feet <= 1227 and me.feet >= 1197
		then 
		tempmefloor = 1227


	elseif me.mid >= 2879 and me.xleft <= 3143 and me.feet <= 3143 and me.feet >= 3113
		then tempmefloor = 3143
	
	elseif me.mid >= 2749 and me.mid <=2968 and me.feet <= 1270 and me.feet >= 1240
		then tempmefloor = 1270
		
	

	elseif me.x >= 3294 and me.mid <= 3676 and me.feet <= 618 and me.feet >= 588
		then tempmefloor = 618
	elseif me.mid >= 3325 and me.mid <= 3764 and me.feet <= 1270 and me.feet >= 1240
		then tempmefloor = 1270
	elseif me.mid >= 4485 and me.mid <= 4689 and me.feet <= 1064 and me.feet >= 1034
		then tempmefloor = 1064
	elseif me.mid >= 5292 and me.mid <= 5469 and me.feet <= 1140 and me.feet >= 1110 
		then tempmefloor = 1140
	elseif me.mid >= 5654 and me.mid <= 5831 and me.feet <= 1140 and me.feet >= 1110
		then tempmefloor = 1140
	elseif me.mid >= 5108 and me.mid <= 6013 and me.feet <= 1318 and me.feet >= 1288
		then tempmefloor = 1318



	else me.onplat = false
		tempmefloor = floor
		if me.feet + 10 < floor
		then me.g = false
	end
	end






end
















walls = function ()
	if you.x <= 7 then 
		you.x = 7
		you.v = 0
	elseif you.x >= enviro.rightwall - 40 then
		you.x = enviro.rightwall - 40
		you.v = 0
	end
	if me.x <= 7 then 
		me.x = 7
		me.v = 0
	elseif me.x >= enviro.rightwall - 40 then
		me.x = enviro.rightwall - 40
		me.v = 0
	end


end

--FRICTION FUNCTION TO SLOW DOWN
fricy = function () 
	if you.v > 1 
		then you.v = you.v - 1
			

	elseif you.v < -1
		then you.v = you.v + 1
	else 
		you.v = 0
	end

	if not you.landing
	then
		if you.v > 0
			then
			you.slide = true
			slidetimery = 0
		elseif you.v < 0
			then
			you.slide = true
			slidetimery = 0
		end
	end
end


fricme = function () 
	if me.v > 1 
		then me.v = me.v - 1
			

	elseif me.v < -1
		then me.v = me.v + 1
	else 
		me.v = 0
	end

	if not me.landing
	then
		if me.v > 0
			then
			me.slide = true
			slidetimerme = 0
		elseif me.v < 0
			then
			me.slide = true
			slidetimerme = 0
		end
	end
end





vroomrighty = function ()
	if you.v == 0
	then you.v = 1.5
	elseif you.v > 1 and you.v < 12
	then you.v = you.v + .5
	elseif you.v > 12
	then you.v = 13
	end
end 

vroomlefty = function ()
	if you.v == 0
	then you.v = -1.5
	elseif you.v < -1 and you.v > -12
	then you.v = you.v - .5
	elseif you.v < -12
	then you.v = -13
	end
end 

vroomrightme = function ()
	if me.v == 0
	then me.v = 1.5
	elseif me.v > 1 and me.v < 12
	then me.v = me.v + .5
	elseif me.v > 12
	then me.v = 13
	end
end 

vroomleftme = function ()
	if me.v == 0
	then me.v = -1.5
	elseif me.v < -1 and me.v > -12
	then me.v = me.v - .5
	elseif me.v < -12
	then me.v = -13
	end
end 




--gravity = function (n)
--	if 





moveyou = function ()
	you.feet = you.y + 60
	if you.feet > floor
	then you.y = floor - 60
end

	if you.g 
	then 
	you.j = 0
			if controller2.up and not you.flinch and not you.block and not you.jstop
				then 
				you.j = 17
				you.jt = 10
				you.ht = 7
				you.jmax = 20
				you.firstjump = true
				you.g = false
			elseif controller2.right and you.v >= 0 and you.stop == false and not you.flinch
				and not controller2.left
				then 
				vroomrighty()
			elseif controller2.left and you.v <= 0 and you.stop == false and not you.flinch
				and not controller2.right
				then 
				vroomlefty()
			elseif controller2.down and you.onplat
			then
			--fall through the floor panel-- maybe add a crashing animation to break through
			you.y = you.y + 4
			else
	 		fricy()
			end

	else
			
			if you.landingcounter > 0
			then
			you.landingcounter = you.landingcounter - 2
			end

			if controller2.left and you.v >= .3
			then you.v = you.v - .3
				you.slowdown = true
				
			elseif controller2.right and you.v <= -.3
			then you.v = you.v + .3
				you.slowdown = true
			elseif controller2.left and you.v > 0
				then you.v = 0
			elseif controller2.right and you.v < 0
				then you.v = 0
			elseif controller2.down
				then tempyfloor = floor


			
			end
			
			--landing
			if you.feet - you.j >= tempyfloor
			then
			you.j = 0
			you.y = tempyfloor - 60
			you.g = true
			you.landing = true
			you.onplat = true
			you.landingcounter = 8
			you.slowdown = false
			
			--long jump
			elseif controller2.up and you.j > 0 and you.jmax > 0 
												and you.firstjump
					then you.jmax = you.jmax - 1

			--the end arc/fall of any jump or the mini jump

			else

				you.firstjump = false

				if you.jt > 4
				then you.jt = you.jt - 1 
				elseif you.jt <= 4 and you.j > - 30
				then you.jt = you.jt - 1 
					you.j = you.j - 1
				--elseif you.jt <= 0 and you.ht > 0
				--then you.j = 0
				--	you.ht = you.ht - 1	
				else
					you.j = you.j
				end

				

			end

	end
end






moveme = function ()
	me.feet = me.y + 60

	me.feet = me.y + 60
	if me.feet > floor
	then me.y = floor - 60
end

	if me.g 
	then 
	me.j = 0
			if controller1.up and not me.flinch and not me.block and not me.jstop
				then 
				me.j = 17
				me.jt = 10
				me.ht = 7
				me.jmax = 20
				me.firstjump = true
				me.g = false
			elseif controller1.right and me.v >= 0 and me.stop == false and not me.flinch
				and not controller1.left
				then 
				vroomrightme()
			elseif controller1.left and me.v <= 0 and me.stop == false and not me.flinch
				and not controller1.right
				then
				vroomleftme()
			
			else
	 		fricme()
			end
			if controller1.down and me.onplat
			then
			--fall through the floor panel-- maybe add a crashing animation to break through
			me.y = me.y + 4
		end

	else
			
			if me.landingcounter > 0
			then
			me.landingcounter = me.landingcounter - 2
			end

			if controller1.left and me.v >= .3
			then me.v = me.v - .3
				me.slowdown = true
			elseif controller1.right and me.v <= -.3
			then me.v = me.v + .3
				me.slowdown = true
			elseif controller1.left and me.v > 0
				then me.v = 0
			elseif controller1.rightwall and me.v < 0
				then me.v = 0
			elseif controller1.down
				then tempmefloor = floor

			
			end
			
			--landing
			if me.feet - me.j >= tempmefloor
			then
			me.j = 0
			me.y = tempmefloor - 60
			me.g = true
			me.landing = true
			me.onplat = true
			me.landingcounter = 8
			me.slowdown = false
			
			--long jump
			elseif controller1.up and me.j > 0 and me.jmax > 0 
												and me.firstjump
					then me.jmax = me.jmax - 1

			--the end arc/fall of any jump or the mini jump

			else

				me.firstjump = false

				if me.jt > 4
				then me.jt = me.jt - 1 
				elseif me.jt <= 4 and me.j > - 30
				then me.jt = me.jt - 1 
					me.j = me.j - 1
				--elseif you.jt <= 0 and you.ht > 0
				--then you.j = 0
				--	you.ht = you.ht - 1	
				else
					me.j = me.j
				end

				

			end

	end
end









