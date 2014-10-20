--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction


floor = 1900 - 2
tempyfloor = floor
tempmefloor = floor

--slowdown rate
adecrate = .5
--move rate
amovrate = .7



function platformcheck(x, y, j)


	if themap == "street" then

	if x >= 1118 and x <= 1528 and y <= 979+400 and y - j >= 979+400
		then
		return true
	elseif x >= 2245 and x <= 2750 and y <= 1227+400 and y - j >= 1227+400
		then 
		return true
	elseif x >= 2879 and x <= 3143 and y <= 618+400 and y - j >= 618+400
		then return true
	
	elseif x >= 2749 and x <=2968 and y <= 1270+400 and y - j >= 1270+400
		then return true
	elseif x >= 3294 and x <= 3676 and y <= 618+400 and y - j >= 618+400
		then return true
	elseif x >= 3325 and x <= 3764 and y <= 1270+400 and y - j >= 1270+400
		then return true
	elseif x >= 4485 and x <= 4689 and y <= 1064+400 and y - j >= 1064+400
		then return true
	elseif x >= 5292 and x <= 5469 and y <= 1140+400 and y - j >= 1140+400 
		then return true
	elseif x >= 5654 and x <= 5831 and y <= 1140+400 and y - j >= 1140+400
		then return true
	elseif x >= 5108 and x <= 6013 and y <= 1318+400 and y - j >= 1318+400
		then return true
	elseif y - j >= floor
		then return true
	else return false
end

elseif themap == "library" then
		if x >= 1535 and x < 3200 and y <= 871 and y - j >= 871 
		then return true
	elseif x >= 1616 and x < 3196 and y <= 1516 and y - j >= 1516 
		then return true
	elseif y - j >= floor and x < 1400
		then return true
	elseif y - j >= floor and x >= 1400
		then return true
	else return false
end

elseif themap == "floors" then
	if x >= 418 and x <= 2140 then	


		if x == -20000 then return 0
		elseif x > 581 and x < 1039 and y <= 3004 and y - j >= 3004 then
		return true
		elseif y <= 5616 and y - j >= 5616 then 
		return true
		elseif y <= 5330 and y - j >= 5330 then 
		return true
		elseif y <= 5044 and y - j >= 5044 then 
		return true
		elseif y <= 4758 and y - j >= 4758 then 
		return true
		elseif y <= 4472 and y - j >= 4472 then 
		return true
		elseif y <= 4186 and y - j >= 4186 then 
		return true
		elseif y <= 3900 and y - j >= 3900 then 
		return true
		elseif y <= 3614 and y - j >= 3614 then 
		return true
		elseif y <= 3328 and y - j >= 3328 then 
		return true
		elseif y <= 2756 and y - j >= 2756 then 
		return true
		elseif y <= 2471 and y - j >= 2471 and x < 808 then 
		return true
		elseif y <= 2471 and y - j >= 2471 and x > 1755 and x < 2130 then 
		return true
		elseif y <= 2184 and y - j >= 2184 and x < 643 then 
		return true
		elseif y <= 2184 and y - j >= 2184 and x > 2076 and x < 2136 then 
		return true
		elseif y <= 1898 and y - j >= 1898 and x > 2071 then 
		return true
		elseif y <= 1898 and y - j >= 1898 and x < 636 then 
		return true
		elseif y <= 1612 and y - j >= 1612 and x > 2071 then 
		return true
		end
	elseif y <= 2688 and y - j >= 2688 and x > 2154 and x < 2726 then 
		return true
	elseif y <= 5778 and y - j >= 5778 and x > 2142 and x < 2299 then 
		return true
	elseif x >= 3161 then
		if x < - 200 then return 0
		elseif y <= 5599 and y - j >= 5599 and x < 4901 then 
		return true
		elseif y <= 5300 and y - j >= 5300 and x < 4898 then 
		return true
		elseif y <= 5001 and y - j >= 5001 and x < 4895 then 
		return true
		elseif y <= 4702 and y - j >= 4702 and x < 4889 then 
		return true
		elseif y <= 4403 and y - j >= 4403 and x < 4906 then 
		return true
		elseif y <= 4104 and y - j >= 4104 and x < 4899 then 
		return true
		elseif y <= 3805 and y - j >= 3805 and x < 4784 then 
		return true
		elseif y <= 3506 and y - j >= 3506 and x < 4699  then 
		return true
		elseif y <= 3207 and y - j >= 3207 and (x <= 4168 or x >= 4405) and x < 4889 then 
		return true
		elseif y <= 2829 and y - j >= 2829 and (x <= 3847 or x >= 4335) and x < 4908 then 
		return true
		end
	
	elseif y - j >= floor
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
	elseif x >= 5654 and x <= 5831 and y <= 1140 + 400 and y >= 1110
		then return 1140+400
	elseif x >= 5108 and x <= 6013 and y <= 1318+400 and y >= 1288+400
		then return 1318+400

	else return floor
end


	elseif themap == "library" then

	

		if x >= 1535 and x < 3200 and y <= 871 and y >= 841 
		then return 871

		elseif x >= 1905 and x < 2020 and y <= 1198 and y >= 1168 
		then return 1198
		elseif x >= 2271 and x < 2386 and y <= 1198 and y >= 1168  
		then return 1198
		elseif x >= 2637 and x < 2752 and y <= 1198 and y >= 1168 
		then return 1198

		elseif x >= 1893 and x < 2135 and y <= 1804 and y >= 1774 
		then return 1804
			elseif x >= 2321 and x < 2563 and y <= 1804 and y >= 1774 
		then return 1804
			elseif x >= 2749 and x < 2991 and y <= 1804 and y >= 1774 
		then return 1804
			
			elseif x >= 3003 and x < 3118 and y <= 1297 and y >= 1267 
		then return 1297

	elseif x >= 1616 and x < 3196 and y <= 1516 and y >= 1485 
		then return 1516
	elseif y >= floor - 20 and x < 1400
		then return floor
	elseif y >= floor - 20 - 63 and x >= 1400
		then return floor - 63
	else return floor
	end

	elseif themap == "floors" then

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
		elseif y <= 5599 and y >= 5569 and x < 4901 then 
		return 5599
		elseif y <= 5300 and y >= 5270 and x < 4898 then 
		return 5300
		elseif y <= 5001 and y >= 4971 and x < 4895 then 
		return 5001
		elseif y <= 4702 and y >= 4672 and x < 4889 then 
		return 4702
		elseif y <= 4403 and y >= 4373 and x < 4906 then 
		return 4403
		elseif y <= 4104 and y >= 4074 and x < 4899 then 
		return 4104
		elseif y <= 3805 and y >= 3775 and x < 4784 then 
		return 3805
		elseif y <= 3506 and y >= 3476 and x < 4699 then 
		return 3506
		elseif y <= 3207 and y >= 3176 and (x <= 4168 or x >= 4405) and x < 4889  then 
		return 3207
		elseif y <= 2829 and x <= 3847 and (x >= 4335 or y >= 2796) and x < 4908 then 
		return 2829
		else return floor
		end

	else
return floor
end


end



end


function platforming()

mefloor = floor
youfloor = floor

if themap == "library" then 

if you.mid >= 1400 then youfloor = 1900 - 65 end
if me.mid >= 1400 then mefloor = 1900 - 65 end

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


function spikecheck(x, y)

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
	elseif y <= floor and x < 1400
		then return floor
	elseif y <= floor - 63 and x >= 1400
		then return floor - 63
	else return floor
	end
	elseif themap == "floors" then

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
		elseif y <= 2829  and (x <= 3847 or x >= 4335) and x < 4908 then 
		return 2829
		elseif y <= 3207 and (x <= 4168 or x >= 4405) and x < 4889 then 
		return 3207
		elseif y <= 3506 and x < 4699 then 
		return 3506
		elseif y <= 3805 and x < 4784 then 
		return 3805
		elseif y <= 4104 and x < 4899 then 
		return 4104
		elseif y <= 4403 and x < 4906 then 
		return 4403
		elseif y <= 4702 and x < 4889 then 
		return 4702
		elseif y <= 5001 and x < 4895 then 
		return 5001
		elseif y <= 5300 and x < 4898 then 
		return 5300
		elseif y <= 5599 and x < 4901 then 
		return 5599
		else return floor
		end

	else
return floor
end







end
end


minecheck = function(x, y)

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


		elseif x >= 1905 and x < 2020 and y <= 1198 
		then return 1198
		elseif x >= 2271 and x < 2386 and y <= 1198  
		then return 1198
		elseif x >= 2637 and x < 2752 and y <= 1198 
		then return 1198
		elseif x >= 3003 and x < 3118 and y <= 1297 
		then return 1297


		elseif x >= 1616 and x < 3196 and y <= 1516
		then return 1516

		elseif x >= 1893 and x < 2135 and y <= 1804 
		then return 1804
			elseif x >= 2321 and x < 2563 and y <= 1804 
		then return 1804
			elseif x >= 2749 and x < 2991 and y <= 1804 
		then return 1804



	elseif y <= floor and x < 1400
		then return floor
	elseif y <= floor - 63 and x >= 1400
		then return floor - 63
	else return floor
end

elseif themap == "floors" then 

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
		elseif y <= 2829 and (x <= 3847 or x >= 4335) and x < 4908 then 
		return 2829
		elseif y <= 3207 and (x <= 4168 or x >= 4405) and x < 4889 then 
		return 3207
		elseif y <= 3506 and x < 4699 then 
		return 3506
		elseif y <= 3805 and x < 4784 then 
		return 3805
		elseif y <= 4104 and x < 4899 then 
		return 4104
		elseif y <= 4403 and x < 4906 then 
		return 4403
		elseif y <= 4702 and x < 4889 then 
		return 4702
		elseif y <= 5001 and x < 4895 then 
		return 5001
		elseif y <= 5300 and x < 4898 then 
		return 5300
		elseif y <= 5599 and x < 4901 then 
		return 5599
		else return floor
		end

	else
return floor
end





end
end























walls = function ()


	if themap == "library" then

		if me.x + me.v >= 1405-35+10 and me.feet > floor - 63 and me.x <= 1405-30+10 and medig == 0 then me.x = 1405-35+10 me.v = 0 end
		if you.x + you.v >= 1405-35+10 and you.feet > floor - 63 and you.x <= 1405-30+10 and youdig == 0 then you.x = 1405-35+10 you.v = 0 end



	end



	if you.x + you.v <= 40 then 
		if you.flinch and math.abs(you.v) > 10 then 
		you.health = you.health - math.abs(you.v/2)
		you.v = -you.v/3
		you.j = math.abs(you.v)
		makerubble(you.mid, you.y,you.v, you.j)
    youflinchway = -youflinchway
		repplay(wallhit2)
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
		makerubble(you.mid, you.y,you.v, you.j)
    youflinchway = -youflinchway
    
		repplay(wallhit2)
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
		makerubble(me.mid, me.y,me.v, me.j)
    meflinchway = -meflinchway
    
		me.g = false
		me.y = me.y - 10
		repplay(wallhit1)
		else
		me.x = 40
		me.v = 0
	
		end

	elseif me.x + me.v >= enviro.rightwall - 75 then
		if me.flinch and math.abs(me.v) > 10 then 
		me.health = me.health - math.abs(me.v/2)
		me.v = -me.v/3
		me.j = math.abs(me.v)
		makerubble(me.mid, me.y,me.v, me.j)
    meflinchway = -meflinchway
    
		repplay(wallhit1)
		me.g = false
		me.y = me.y - 10
		else
		me.x = enviro.rightwall - 75
		me.v = 0
		end
	end

end

--FRICTION FUNCTION TO SLOW DOWN
fricy = function (base) 
	if you.v > 1 +base
		then you.v = you.v - 1
			

	elseif you.v < -1+base
		then you.v = you.v + 1
	else 
		you.v = 0+base
	end

	if not you.landing
	then
		if you.v > 0+base and not you.dodge
			then
			you.slide = true
			slidetimery = 0
		elseif you.v < 0+base and not you.dodge
			then
			you.slide = true
			slidetimery = 0
		end
	end
end


fricme = function (base) 
	if me.v > 1 +base
		then me.v = me.v - 1
			

	elseif me.v < -1+base
		then me.v = me.v + 1
	else 
		me.v = 0+base
	end

	if not me.landing
	then
		if me.v > 0+base and not me.dodge
			then
			me.slide = true
			slidetimerme = 0
		elseif me.v < 0+base and not me.dodge
			then
			me.slide = true
			slidetimerme = 0
		end
	end
end





function vroomrighty(base)
	if you.v == 0+base
	then you.v = 1.5+base
	elseif you.v >0+base and you.v < speedlimit - 1+base
	then you.v = you.v + .5
	elseif you.v > speedlimit - 1+base and not youlimitbreak
	then you.v = you.v -.5
	end
end 

function vroomlefty(base)
	if you.v == 0+base
	then you.v = -1.5+base
	elseif you.v < 0+base and you.v > -speedlimit + 1+base
	then you.v = you.v - .5
	elseif you.v < -speedlimit + 1+base and not youlimitbreak
	then you.v = you.v + .5
	end
end 

function vroomrightme(base)
	if me.v == 0+base
	then me.v = 1.5+base
	elseif me.v >0+base and me.v < speedlimit - 1+base
	then me.v = me.v + .5
	elseif me.v > speedlimit - 1+base and not melimitbreak
	then me.v = me.v - .5
	end
end 

function vroomleftme(base)
	if me.v == 0+base
	then me.v = -1.5+base
	elseif me.v < 0+base and me.v > -speedlimit + 1+base
	then me.v = me.v - .5
	elseif me.v < -speedlimit + 1+base and not melimitbreak
	then me.v = me.v + .5
	end
end 




--gravity = function (n)
--	if 



you.jmax = 18
me.jmax = 18
mctim = 0
yctim = 0

me.running = false
you.running = false

--if me.running then jump height is half

function fallthroughglassfloor()
  
   if themap == "floors" and
   me.mid > 2154 and me.mid < 2726 and me.y < 3000 and me.y > 2000 and me.running
   then me.g = false me.y = me.y + 2 me.onplat = false
  end
  
  end


function runrunrun()
 
 if not me.g then me.running = false end
  if not you.g then you.running = false end
 
if me.running and me.push > 0 then me.j = 14 me.g = false
me.v = me.v + me.push*4 
end
if you.running and you.push > 0 then  you.j = 14 you.g = false
  you.v = you.v + you.push*4
  end
 
 if me.flinch or math.abs(me.v) < speedlimit then 
       me.running = false
  elseif me.running then 
     controller1.a1 = false
     controller1.a2 = false
     controller1.a3 = false
     controller1.a4 = false
     
      
  end
  
  if controller1.run and me.running and (controller1.right or controller1.left) and controller1.run and not controller1.block and not anyofmycombos() and not anyofmyprimes() and not me.slide and not me.dodge then         
          if controller1.right and me.v > 0 then
            me.v = runspeed
          elseif controller1.left and me.v < 0 then
            me.v = -runspeed
          end
       
     
    
    
    
  elseif math.abs(me.v) > 7 and (controller1.left or controller1.right) and me.g and not c1accept() and controller1.run and not controller1.block and not anyofmycombos() and not anyofmyprimes() and not me.slide and not me.dodge then
     controller1.a1 = false
     controller1.a2 = false
     controller1.a3 = false
     controller1.a4 = false
      me.running = true
      melimitbreak = true
      if controller1.right and me.v > 0 then
        me.v = runspeed
      elseif controller1.left and me.v < 0 then
        me.v = -runspeed
        end
 
 
end

if you.flinch or math.abs(you.v) < speedlimit then 
       you.running = false
  elseif you.running then 
     controller2.a1 = false
     controller2.a2 = false
     controller2.a3 = false
     controller2.a4 = false
    
      
  end
  
  if controller2.run and you.running and (controller2.right or controller2.left) and controller2.run and not controller2.block and not anyofyourcombos() and not anyofyourprimes() and not you.slide and not you.dodge then         
          if controller2.right and you.v > 0 then
            you.v = runspeed
          elseif controller2.left and you.v < 0 then
            you.v = -runspeed
          end
       
     
    
    
    
  elseif math.abs(you.v) > 7 and (controller2.left or controller2.right) and you.g and not c1accept() and controller2.run and not controller2.block and not anyofyourcombos() and not anyofyourprimes() and not you.slide and not you.dodge then
     controller2.a1 = false
     controller2.a2 = false
     controller2.a3 = false
     controller2.a4 = false
      you.running = true
      youlimitbreak = true
      if controller2.right and you.v > 0 then
        you.v = runspeed
      elseif controller2.left and you.v < 0 then
        you.v = -runspeed
        end
 
 
end




end

climbs = function()




if me.flinch then mctim = 0 end

	if mctim > 0 then mctim = mctim + 1
		me.busy = true
		
		if mctim > 11 then
				mctim = 0
				if controller1.up then 
					me.g = false
					me.j = hopv 
					repplay(jumpd) 
				elseif controller1.left then 
					me.g = false
					me.j = hopv/2
					me.v = -hopv2
				elseif controller1.right then 
					me.g = false
					me.j = hopv/2
					me.v = hopv2
				end

		elseif mctim > 7 then
				me.im = climb3
		elseif mctim > 4 then
				me.im = climb2

		elseif mctim > 0 then
				me.im = climb
				if mctim == 2 then
				repplay(climbsound) 
			end
		end
      
	end

if you.flinch then yctim = 0 end

	if yctim > 0 then yctim = yctim + 1
		you.busy = true
		if yctim > 11 then
				yctim = 0
				if controller2.up then 
					you.g = false
					you.j = hopv  
					repplay(jumpd2) 
				elseif controller2.left then 
					you.g = false
					you.j = hopv/2
					you.v = -hopv2
				elseif controller2.right then 
					you.g = false
					you.j = hopv/2
					you.v = hopv2
				end


		elseif yctim > 7 then
				you.im = climb3
		elseif yctim > 4 then
				you.im = climb2

		elseif yctim > 0 then
				you.im = climb
				if yctim == 2 then
				repplay(climbsound2) 
			end
		end
	end
  

end




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
        if you.running then
          you.jt = 2
          you.jmax = 8
          you.j = 12
          else
				you.jt = 5
				you.jmax = 18
        you.j = 17
      end
				you.ht = 7
				you.firstjump = true
				you.g = false
				repplay(jumpd2)
			elseif controller2.right and you.v >= you.push and you.stop == false and not you.flinch
				and not controller2.left
				then 
				vroomrighty(you.push)
			elseif controller2.left and you.v <= you.push and you.stop == false and not you.flinch
				and not controller2.right
				then 
				vroomlefty(you.push)
			elseif controller2.down and you.onplat and not you.busy and not you.dodge
				and not controller2.a1 and not controller2.a2 and not controller2.a3
			then
			--fall through the floor panel-- maybe add a crashing animation to break through
			you.y = you.y + 4
			else
	 		fricy(you.push)
			end

	else
			
			if you.landingcounter > 0
			then
			you.landingcounter = you.landingcounter - 2
			end

			if controller2.block and platformy(you.mid+(you.v/2)+you.lr*15,you.feet-40) ~= platformy(you.mid+(you.v/2)+you.lr*15,you.y) and platformy(you.mid,you.y-40)-62 ~= youfloor
				then 
				   if platformy(you.mid+(you.v/2)+you.lr*15,you.feet-50) ~= platformy(you.mid+(you.v/2)+you.lr*15,you.y) then
				yctim = 7
      else yctim = 1
        end
				you.im = climb
				you.onplat = true
				you.j = climbv
				you.v = you.v/2
			elseif controller2.left and you.v >= 1 + you.push*1.5
			then you.v = you.v - adecrate
				you.slowdown = true
				
			elseif controller2.right and you.v <= -1 + you.push*1.5
			then you.v = you.v + adecrate
				you.slowdown = true

			elseif controller2.left and you.v > - 8 + you.push*1.5
				then you.v = you.v -amovrate
				you.slowdown = false

			elseif controller2.right and you.v < 8 + you.push*1.5
				then you.v = you.v +amovrate
				you.slowdown = false
			
			elseif controller2.down
				then tempyfloor = youfloor
      elseif you.push > 0 then
             if you.v > you.push*1.5 then 
             you.v = you.v - 1
             elseif you.v < you.push*1.5 then 
             you.v = you.v + 1
             end


			
			end
			
			--landing
			if you.feet - you.j >= tempyfloor
			then 
			if you.j < -10 then 
				you.landingcounter = 8
			else
				you.landingcounter = 0
			end
			you.j = 0
			you.y = tempyfloor - 60
			you.g = true
			you.landing = true
			land2:play()
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
        if me.running then
         me.jt = 2
				me.jmax = 8
        me.j = 12
          else
			me.jt = 5
				me.jmax = 18
        me.j = 17
        end
				me.ht = 7
				me.firstjump = true
				me.g = false
				repplay(jumpd)
			elseif controller1.right and me.v >= me.push and me.stop == false and not me.flinch
				and not controller1.left
				then 
				vroomrightme(me.push)
			elseif controller1.left and me.v <= me.push and me.stop == false and not me.flinch
				and not controller1.right
				then
				vroomleftme(me.push)
			
			else
	 		fricme(me.push)
			end
			if controller1.down and me.onplat and not me.busy and not me.dodge
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

			if controller1.block and platformy(me.mid+(me.v/2)+me.lr*15,me.feet-40) ~= platformy(me.mid+(me.v/2)+me.lr*15,me.y) and platformy(me.mid,me.y-40)-62 ~= mefloor
				then 
          if platformy(me.mid+(me.v/2)+me.lr*15,me.feet-50) == platformy(me.mid+(me.v/2)+me.lr*15,me.y) then
				mctim = 7
      else mctim = 1
        end
				me.im = climb
				me.onplat = true
				me.j = climbv
				me.v = me.v/2
				me.landingcounter = 0
			elseif controller1.left and me.v >= 1 + me.push*1.5
			then me.v = me.v - adecrate
				me.slowdown = true
				
			elseif controller1.right and me.v <= -1 + me.push*1.5
			then me.v = me.v + adecrate
				me.slowdown = true

			elseif controller1.left and me.v > - 8 + me.push*1.5
				then me.v = me.v - amovrate
				me.slowdown = false

			elseif controller1.right and me.v < 8 + me.push*1.5
				then me.v = me.v + amovrate
				me.slowdown = false

			elseif controller1.down
				then tempmefloor = mefloor
      elseif me.push > 0 then
             if me.v > me.push*1.5 then 
             me.v = me.v - 1
             elseif me.v > me.push*1.5 then 
             me.v = me.v + 1
             end

			
			end
			
			--landing
			if me.feet - me.j >= tempmefloor
			then
			if me.j < -10 then 
			me.landingcounter = 8
			else me.landingcounter = 0
			end
			me.j = 0
			me.y = tempmefloor - 60
			me.g = true
			me.landing = true
			land1:play()
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









