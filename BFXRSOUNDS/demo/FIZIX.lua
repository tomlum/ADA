--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction


floor = 1900 - 3
tempyfloor = floor
tempme.floor = floor

--slowdown rate
adecrate = .5
--move rate
amovrate = .7



function platformcheck(x, y)


	if themap == "street" then

	if x >= 1118 and x <= 1528 and y <= 979+400 and y >= 949+400
		then
		return true
	elseif x >= 2245 and x <= 2750 and y <= 1227+400 and y >= 1197+400
		then 
		return true
	elseif x >= 2879 and x <= 3143 and y <= 618+400 and y >= 588+400
		then return true
	
	elseif x >= 2749 and x <=2968 and y <= 1270+400 and y >= 1240+400
		then return true
	elseif x >= 3294 and x <= 3676 and y <= 618+400 and y >= 588+400
		then return true
	elseif x >= 3325 and x <= 3764 and y <= 1270+400 and y >= 1240+400
		then return true
	elseif x >= 4485 and x <= 4689 and y <= 1064+400 and y >= 1034+400
		then return true
	elseif x >= 5292 and x <= 5469 and y <= 1140+400 and y >= 1110+400 
		then return true
	elseif x >= 5654 and x <= 5831 and y <= 1140+400 and y >= 1110+400
		then return true
	elseif x >= 5108 and x <= 6013 and y <= 1318+400 and y >= 1288+400
		then return true
	elseif y >= floor - 30
		then return true
	else return false
end

elseif themap == "library" then
		if x >= 1535 and x < 3200 and y <= 871 and y >= 841 
		then return true
	elseif x >= 1616 and x < 3196 and y <= 1516 and y >= 1485 
		then return true
	elseif y >= floor - 30 and x < 1407
		then return true
	elseif y >= floor - 30 - 60 and x >= 1407
		then return true
	else return false
end

end

end




function platformy(x, y)

	if themap == "street" then

	if x >= 1118 and x <= 1528 and y <= 979+400 and y >= 949+400
		then
		return 979+400
	elseif x >= 2245 and x <= 2750 and y <= 1227+400 and y >= 1197+400
		then 
		return 1227+400
	elseif x >= 2879 and x <= 3143 and y <= 618+400 and y >= 588+400
		then return 618+400
	
	elseif x >= 2749 and x <=2968 and y <= 1270+400 and y >= 1240+400
		then return 1270+400
	elseif x >= 3294 and x <= 3676 and y <= 618+400 and y >= 588+400
		then return 618+400
	elseif x >= 3325 and x <= 3764 and y <= 1270+400 and y >= 1240+400
		then return 1270+400
	elseif x >= 4485 and x <= 4689 and y <= 1064+400 and y >= 1034+400
		then return 1064+400
	elseif x >= 5292 and x <= 5469 and y <= 1140+400 and y >= 1110 +400
		then return 1140+400
	elseif x >= 5654 and x <= 5831 and y <= 1140 and y >= 1110
		then return 1140+400
	elseif x >= 5108 and x <= 6013 and y <= 1318+400 and y >= 1288+400
		then return 1318+400

	else return floor
end


	elseif themap == "library" then

	

		if x >= 1535 and x < 3200 and y <= 871 and y >= 841 
		then return 871
	elseif x >= 1616 and x < 3196 and y <= 1516 and y >= 1485 
		then return 1516
	elseif y >= floor - 30 and x < 1407
		then return floor
	elseif y >= floor - 30 - 60 and x >= 1407
		then return floor - 60
	else return floor
end


end



end


function platforming()

me.floor = floor
you.floor = floor

if themap == "library" then 

if you.mid >= 1407 then you.floor = 1900 - 63 end
if me.mid >= 1407 then me.floor = 1900 - 63 end

end


tempyfloor = platformy(you.mid, you.feet)
tempme.floor = platformy(me.mid, me.feet)
if tempme.floor < me.floor 
	then me.onplat = true
else me.onplat = false
	if me.feet + 10 < me.floor
		then me.g = false
	end
end
if tempyfloor < you.floor 
	then you.onplat = true
else you.onplat = false
	if you.feet + 10 < you.floor
		then you.g = false
	end
end


end


spikecheck = function(x, y)

if themap == "street" then
 
if x >= 2879 and x <= 3143 and y <= 618+400 
		then return 618+400
	elseif x >= 1118 and x <= 1528 and y <= 979+400 
		then
		return 979+400
	elseif x >= 2245 and x <= 2750 and y <= 1227+400 
		then return 1227+400


	
	
	elseif x > 2750 and x <=2968 and y <= 1270 +400
		then return 1270+400

		
		
	

	elseif x >= 3294 and x <= 3676 and y <= 618 +400
		then return 618+400
	elseif x >= 3325 and x <= 3764 and y <= 1270 +400
		then return 1270+400
	elseif x >= 4485 and x <= 4689 and y <= 1064 +400
		then return 1064+400
	elseif x >= 5292 and x <= 5469 and y <= 1140 +400
		then return 1140+400
	elseif x >= 5654 and x <= 5831 and y <= 1140 +400
		then return 1140+400
	elseif x >= 5108 and x <= 6013 and y <= 1318 +400
		then return 1318+400



	else return floor
	end

	elseif themap == "library" then

		if x >= 1535 and x < 3200 and y <= 871 
		then return 871
	elseif x >= 1616 and x < 3196 and y <= 1516
		then return 1516
	elseif y <= floor and x < 1407
		then return floor
	elseif y <= floor - 60 and x >= 1407
		then return floor - 60
	else return floor
end







end
end
























walls = function ()
	if you.x + you.v <= 40 then 
		if you.flinch and math.abs(you.v) > 10 then 
		you.health = you.health - math.abs(you.v/2)
		you.v = -you.v/3
		you.j = math.abs(you.v)
		you.g = false
		you.y = you.y - 10
		else
		you.x = 40
		you.v = 0
		end

	elseif you.x + you.v >= enviro.rightwall - 70 then
		if you.flinch and math.abs(you.v) > 10 then 
		you.health = you.health - math.abs(you.v/2)
		you.v = -you.v/3
		you.j = math.abs(you.v)
		you.g = false
		you.y = you.y - 10
		else
		you.x = enviro.rightwall - 70
		you.v = 0
		end
	end

	if me.x + me.v <= 40 then 
		if me.flinch and math.abs(me.v) > 10 then 
		me.health = me.health - math.abs(me.v/2)
		me.v = -me.v/3
		me.j = math.abs(me.v)
		me.g = false
		me.y = me.y - 10
		else
		me.x = 40
		me.v = 0
	
		end

	elseif me.x + me.v >= enviro.rightwall - 70 then
		if me.flinch and math.abs(me.v) > 10 then 
		me.health = me.health - math.abs(me.v/2)
		me.v = -me.v/3
		me.j = math.abs(me.v)
		me.g = false
		me.y = me.y - 10
		else
		me.x = enviro.rightwall - 70
		me.v = 0
		end
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
		if you.v > 0 and not you.dodge
			then
			you.slide = true
			slidetimery = 0
		elseif you.v < 0 and not you.dodge
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
		if me.v > 0 and not me.dodge
			then
			me.slide = true
			slidetimerme = 0
		elseif me.v < 0 and not me.dodge
			then
			me.slide = true
			slidetimerme = 0
		end
	end
end





vroomrighty = function ()
	if you.v == 0
	then you.v = 1.5
	elseif you.v > 1 and you.v < speedlimit - 1
	then you.v = you.v + .5
	elseif you.v > speedlimit - 1
	then you.v = speedlimit
	end
end 

vroomlefty = function ()
	if you.v == 0
	then you.v = -1.5
	elseif you.v < -1 and you.v > -speedlimit + 1
	then you.v = you.v - .5
	elseif you.v < -speedlimit + 1
	then you.v = -speedlimit + 1
	end
end 

vroomrightme = function ()
	if me.v == 0
	then me.v = 1.5
	elseif me.v > 1 and me.v < speedlimit - 1
	then me.v = me.v + .5
	elseif me.v > speedlimit - 1
	then me.v = speedlimit - 1
	end
end 

vroomleftme = function ()
	if me.v == 0
	then me.v = -1.5
	elseif me.v < -1 and me.v > -speedlimit + 1
	then me.v = me.v - .5
	elseif me.v < -speedlimit + 1
	then me.v = -speedlimit + 1
	end
end 




--gravity = function (n)
--	if 



you.jmax = 20
me.jmax = 20

moveyou = function ()
	you.feet = you.y + 60
	if you.feet > you.floor
	then you.y = you.floor - 60
end

	if you.g 
	then 
	you.j = 0
			if controller2.up and not you.flinch and not you.block and not you.jstop and not youbjstop and not you.busy
				and not controller2.a1 and not controller2.a2 and not controller2.a3 and not you.bur and not youpurp
				then 
				you.j = 17
				you.jt = 5
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
			elseif controller2.down and you.onplat and not you.busy
				and not controller2.a1 and not controller2.a2 and not controller2.a3
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

			if controller2.left and you.v >= 1
			then you.v = you.v - adecrate
				you.slowdown = true
				
			elseif controller2.right and you.v <= 1
			then you.v = you.v + adecrate
				you.slowdown = true

			elseif controller2.left and you.v > - 8 
				then you.v = you.v -amovrate
				you.slowdown = false

			elseif controller2.right and you.v < 8
				then you.v = you.v +amovrate
				you.slowdown = false
			
			elseif controller2.down
				then tempyfloor = you.floor


			
			end
			
			--landing
			if you.feet - you.j >= tempyfloor
			then
			you.j = 0
			you.y = tempyfloor - 60
			you.g = true
			you.landing = true
			land2:play()
			you.landingcounter = 8
			you.slowdown = false
			
			--long jump
			elseif controller2.up and you.j > 0 and you.jmax > 0 
												and you.firstjump
					then you.jmax = you.jmax - .7

			--the end arc/fall of any jump or the mini jump

			else

				you.firstjump = false

				if you.jt > 4
				then you.jt = you.jt - 1 
				elseif you.jt <= 4 and you.j > - maxgravity
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
	if me.feet > me.floor
	then me.y = me.floor - 60
end

	if me.g 
	then 
	me.j = 0
			if controller1.up and not me.flinch and not me.block and not me.jstop and not mebjstop and not me.busy
				and not controller1.a1 and not controller1.a2 and not controller1.a3 and not me.bur and not mepurp
				then 
				me.j = 17
				me.jt = 5
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
			if controller1.down and me.onplat and not me.busy
				and not controller1.a1 and not controller1.a2 and not controller1.a3
			then
			--fall through the floor panel-- maybe add a crashing animation to break through
			me.y = me.y + 4
		end

	else
			
			if me.landingcounter > 0
			then
			me.landingcounter = me.landingcounter - 2
			end

			if controller1.left and me.v >= 1
			then me.v = me.v - adecrate
				me.slowdown = true
				
			elseif controller1.right and me.v <= 1
			then me.v = me.v + adecrate
				me.slowdown = true

			elseif controller1.left and me.v > - 8 
				then me.v = me.v - amovrate
				me.slowdown = false

			elseif controller1.right and me.v < 8
				then me.v = me.v + amovrate
				me.slowdown = false

			elseif controller1.down
				then tempme.floor = me.floor

			
			end
			
			--landing
			if me.feet - me.j >= tempme.floor
			then
			me.j = 0
			me.y = tempme.floor - 60
			me.g = true
			me.landing = true
			land1:play()
			me.landingcounter = 8
			me.slowdown = false
			
			--long jump
			elseif controller1.up and me.j > 0 and me.jmax > 0 
												and me.firstjump
					then me.jmax = me.jmax - .7

			--the end arc/fall of any jump or the mini jump

			else

				me.firstjump = false

				if me.jt > 4
				then me.jt = me.jt - 1 
				elseif me.jt <= 4 and me.j > - maxgravity
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









