--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction


floor = 5898
tempyfloor = floor
tempmefloor = floor

--slowdown rate
adecrate = .5
--move rate
amovrate = .7



function platformcheck(x, y)

if x >= 418 and x <= 2140 then	


		if x == -20000 then return 0
		elseif x > 581 and x < 1039 and y <= 3004 and y >= 2974 then
		return true
		elseif y <= 5616 and y >= 5586 then 
		return true
		elseif y <= 5330 and y >= 5300 then 
		return true
		elseif y <= 5044 and y >= 5014 then 
		return true
		elseif y <= 4758 and y >= 4728 then 
		return true
		elseif y <= 4472 and y >= 4442 then 
		return true
		elseif y <= 4186 and y >= 4156 then 
		return true
		elseif y <= 3900 and y >= 3870 then 
		return true
		elseif y <= 3614 and y >= 3584 then 
		return true
		elseif y <= 3328 and y >= 3298 then 
		return true
		elseif y <= 2756 and y >= 2726 then 
		return true
		elseif y <= 2471 and y >= 2441 and x < 808 then 
		return true
		elseif y <= 2471 and y >= 2441 and x > 1755 and x < 2130 then 
		return true
		elseif y <= 2184 and y >= 2154 and x < 643 then 
		return true
		elseif y <= 2184 and y >= 2154 and x > 2076 and x < 2136 then 
		return true
		elseif y <= 1898 and y >= 1868 and x > 2071 then 
		return true
		elseif y <= 1898 and y >= 1868 and x < 636 then 
		return true
		elseif y <= 1612 and y >= 1582 and x > 2071 then 
		return true
		end
	elseif y <= 2688 and y >= 2658 and x > 2154 and x < 2726 then 
		return true
	elseif y <= 5778 and y >= 5748 and x > 2142 and x < 2299 then 
		return true
	elseif x >= 3161 then
		if x < - 200 then return 0
		elseif y <= 5599 and y >= 5569 then 
		return true
		elseif y <= 5300 and y >= 5270 then 
		return true
		elseif y <= 5001 and y >= 4971 then 
		return true
		elseif y <= 4702 and y >= 4672 then 
		return true
		elseif y <= 4403 and y >= 4373 then 
		return true
		elseif y <= 4104 and y >= 4074 then 
		return true
		elseif y <= 3805 and y >= 3775 then 
		return true
		elseif y <= 3506 and y >= 3476 then 
		return true
		elseif y <= 3207 and y >= 3176 then 
		return true
		elseif y <= 2829 and y >= 2796 then 
		return true
		end
	
	elseif y >= floor - 30 
		then return true
	else return false
end


end




function platformy(x, y)
	if x >= 418 and x <= 2140 then	


		if x == -20000 then return 0
		elseif x > 581 and x < 1039 and y <= 3004 and y >= 2974 then
		return 3004
		elseif y <= 5616 and y >= 5586 then 
		return 5616
		elseif y <= 5330 and y >= 5300 then 
		return 5330
		elseif y <= 5044 and y >= 5014 then 
		return 5044
		elseif y <= 4758 and y >= 4728 then 
		return 4758
		elseif y <= 4472 and y >= 4442 then 
		return 4472
		elseif y <= 4186 and y >= 4156 then 
		return 4186
		elseif y <= 3900 and y >= 3870 then 
		return 3900
		elseif y <= 3614 and y >= 3584 then 
		return 3614
		elseif y <= 3328 and y >= 3298 then 
		return 3328
		elseif y <= 2756 and y >= 2726 then 
		return 2756
		elseif y <= 2471 and y >= 2441 and x < 808 then 
		return 2471
		elseif y <= 2471 and y >= 2441 and x > 1755 and x < 2130 then 
		return 2471
		elseif y <= 2184 and y >= 2154 and x < 643 then 
		return 2184
		elseif y <= 2184 and y >= 2154 and x > 2076 and x < 2136 then 
		return 2184
		elseif y <= 1898 and y >= 1868 and x > 2071 then 
		return 1898
		elseif y <= 1898 and y >= 1868 and x < 636 then 
		return 1898
		elseif y <= 1612 and y >= 1582 and x > 2071 then 
		return 1612


		else return floor
		end
	elseif y <= 2688 and y >= 2658 and x > 2154 and x < 2726 then 
		return 2688
	elseif y <= 5778 and y >= 5748 and x > 2142 and x < 2299 then 
		return 5778
	elseif x >= 3161 then
		if x < - 200 then return 0
		elseif y <= 5599 and y >= 5569 then 
		return 5599
		elseif y <= 5300 and y >= 5270 then 
		return 5300
		elseif y <= 5001 and y >= 4971 then 
		return 5001
		elseif y <= 4702 and y >= 4672 then 
		return 4702
		elseif y <= 4403 and y >= 4373 then 
		return 4403
		elseif y <= 4104 and y >= 4074 then 
		return 4104
		elseif y <= 3805 and y >= 3775 then 
		return 3805
		elseif y <= 3506 and y >= 3476 then 
		return 3506
		elseif y <= 3207 and y >= 3176 then 
		return 3207
		elseif y <= 2829 and y >= 2796 then 
		return 2829
		else return floor
		end

	else
return floor
end


end


function platforming()







mefloor = floor
youfloor = floor

if themap == "library" then 

if you.mid >= 1407 then youfloor = 1900 - 65 end
if me.mid >= 1407 then mefloor = 1900 - 65 end

--slope attempt
-- if themap == "library" then 



-- if me.mid > 1207 and me.mid < 1407 then
-- 		mefloor = 1900-(((me.mid-1207)/200)*(63)) end
-- if you.mid > 1207 and you.mid < 1407 then
-- 		youfloor = 1900-(((you.mid-1207)/200)*(63)) end
-- 	if me.mid > 1207 and me.mid < 1407 then
-- 		mefloor = 1900-(((me.mid-1207)/200)*(63)) end
-- if you.mid > 1207 and you.mid < 1407 then
-- 		youfloor = 1900-(((you.mid-1207)/200)*(63)) end
-- if you.mid >= 1407 then youfloor = 1900 - 63 end
-- if me.mid >= 1407 then mefloor = 1900 - 63 end

-- end

end


tempyfloor = platformy(you.mid, you.feet)
tempmefloor = platformy(me.mid, me.feet)
if tempmefloor < mefloor 
	then me.onplat = true
else me.onplat = false
	if me.feet + 10 < mefloor
		then me.g = false
	end
end
if tempyfloor < youfloor 
	then you.onplat = true
else you.onplat = false
	if you.feet + 10 < youfloor
		then you.g = false
	end
end


end


spikecheck = function(x, y)

	if x >= 418 and x <= 2140 then	


		if x == -20000 then return 0
		elseif y <= 1612 then 
		return 1612
		elseif y <= 1898 and (x < 636 or x > 2071) then 
		return 1898
		elseif y <= 2184 and (x < 643 or x < 2136) then 
		return 2184
		elseif y <= 2471 and (x < 808 or (x > 1755 and x < 2130)) then 
		return 2471
		elseif y <= 2756 then 
		return 2756
		elseif x > 581 and x < 1039 and y <= 3004 then
		return 3004
		elseif y <= 3328 then 
		return 3328
		elseif y <= 3614 then 
		return 3614
		elseif y <= 3900 then 
		return 3900
		elseif y <= 4186 then 
		return 4186
		elseif y <= 4472 then 
		return 4472
		elseif y <= 4758 then 
		return 4758
		elseif y <= 5044 then 
		return 5044
		elseif y <= 5330 then 
		return 5330
		elseif y <= 5616 and y >= 5586 then 
		return 5616
		else return floor
		end
	elseif x >= 3161 then
		if x < - 200 then return 0
		elseif y <= 2829 then 
		return 2829
		elseif y <= 3207 then 
		return 3207
		elseif y <= 3506 then 
		return 3506
		elseif y <= 3805 then 
		return 3805
		elseif y <= 4104 then 
		return 4104
		elseif y <= 4403 then 
		return 4403
		elseif y <= 4702 then 
		return 4702
		elseif y <= 5001 then 
		return 5001
		elseif y <= 5300 then 
		return 5300
		elseif y <= 5599 then 
		return 5599
		else return floor
		end

	else
return floor
end
	



end


minecheck = function(x, y)

if x >= 418 and x <= 2140 then	


		if x == -20000 then return 0
		elseif y <= 1612 then 
		return 1612
		elseif y <= 1898 and (x < 636 or x > 2071) then 
		return 1898
		elseif y <= 2184 and (x < 643 or x < 2136) then 
		return 2184
		elseif y <= 2471 and (x < 808 or (x > 1755 and x < 2130)) then 
		return 2471
		elseif y <= 2756 then 
		return 2756
		elseif x > 581 and x < 1039 and y <= 3004 then
		return 3004
		elseif y <= 3328 then 
		return 3328
		elseif y <= 3614 then 
		return 3614
		elseif y <= 3900 then 
		return 3900
		elseif y <= 4186 then 
		return 4186
		elseif y <= 4472 then 
		return 4472
		elseif y <= 4758 then 
		return 4758
		elseif y <= 5044 then 
		return 5044
		elseif y <= 5330 then 
		return 5330
		elseif y <= 5616 and y >= 5586 then 
		return 5616
		else return floor
		end

	elseif y <= 2688 and x > 2154 and x < 2726 then 
		return 2688
	elseif y <= 5778 and x > 2142 and x < 2299 then 
		return 5778
	elseif x >= 3161 then
		if x < - 200 then return 0
		elseif y <= 2829 then 
		return 2829
		elseif y <= 3207 then 
		return 3207
		elseif y <= 3506 then 
		return 3506
		elseif y <= 3805 then 
		return 3805
		elseif y <= 4104 then 
		return 4104
		elseif y <= 4403 then 
		return 4403
		elseif y <= 4702 then 
		return 4702
		elseif y <= 5001 then 
		return 5001
		elseif y <= 5300 then 
		return 5300
		elseif y <= 5599 then 
		return 5599
		else return floor
		end

	else
return floor
end
	



end























walls = function ()


	if themap == "library" then

		if me.x + me.v >= 1405-30 and me.feet > floor - 63 and medig == 0 then me.x = 1405-30 me.v = 0 end
		if you.x + you.v >= 1405-30 and you.feet > floor - 63 and youdig == 0 then you.x = 1405-30 you.v = 0 end



	end



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

	elseif you.x + you.v >= enviro.rightwall - 75 then
		if you.flinch and math.abs(you.v) > 10 then 
		you.health = you.health - math.abs(you.v/2)
		you.v = -you.v/3
		you.j = math.abs(you.v)
		you.g = false
		you.y = you.y - 10
		else
		you.x = enviro.rightwall - 75
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

	elseif me.x + me.v >= enviro.rightwall - 75 then
		if me.flinch and math.abs(me.v) > 10 then 
		me.health = me.health - math.abs(me.v/2)
		me.v = -me.v/3
		me.j = math.abs(me.v)
		me.g = false
		me.y = me.y - 10
		else
		me.x = enviro.rightwall - 75
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
	elseif you.v > speedlimit - 1 and not youlimitbreak
	then you.v = speedlimit
	end
end 

vroomlefty = function ()
	if you.v == 0
	then you.v = -1.5
	elseif you.v < -1 and you.v > -speedlimit + 1
	then you.v = you.v - .5
	elseif you.v < -speedlimit + 1 and not youlimitbreak
	then you.v = -speedlimit + 1
	end
end 

vroomrightme = function ()
	if me.v == 0
	then me.v = 1.5
	elseif me.v > 1 and me.v < speedlimit - 1
	then me.v = me.v + .5
	elseif me.v > speedlimit - 1 and not melimitbreak
	then me.v = speedlimit - 1
	end
end 

vroomleftme = function ()
	if me.v == 0
	then me.v = -1.5
	elseif me.v < -1 and me.v > -speedlimit + 1
	then me.v = me.v - .5
	elseif me.v < -speedlimit + 1 and not melimitbreak
	then me.v = -speedlimit + 1
	end
end 


--gravity = function (n)
--	if 



you.jmax = 18
me.jmax = 18

moveyou = function ()
	you.feet = you.y + 60
	if you.feet > youfloor
	then you.y = youfloor - 60
end

	if you.g 
	then 
	you.j = 0
			if controller2.up and not you.flinch and not you.block and not you.jstop and not youbjstop and not you.busy
				and not controller2.a1 and not controller2.a2 and not controller2.a3 and not youbur and not youpurp
				then 
				you.j = 17
				you.jt = 5
				you.ht = 7
				you.jmax = 18
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
				then tempyfloor = youfloor


			
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
	if me.feet > mefloor
	then me.y = mefloor - 60
end

	if me.g 
	then 
	me.j = 0
			if controller1.up and not me.flinch and not me.block and not me.jstop and not mebjstop and not me.busy
				and not controller1.a1 and not controller1.a2 and not controller1.a3 and not mebur and not mepurp
				then 
				me.j = 17
				me.jt = 5
				me.ht = 7
				me.jmax = 18
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
				then tempmefloor = mefloor

			
			end
			
			--landing
			if me.feet - me.j >= tempmefloor
			then
			me.j = 0
			me.y = tempmefloor - 60
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









