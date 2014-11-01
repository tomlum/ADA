--if going toward then speedlimit is dif?

--land from height and make rocks fly up?
--wind ability allows you to move more freely in the air, allows you to drop faster and change direction


floor = 1900 - 2
you.tempfloor = floor
me.tempfloor = floor


you.jmax = jmax
me.jmax = jmax


function platformcheck(x, y, j)

  if themap == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821 and y - j >= 1064+400-821
		then return true
	elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821 and y - j >= 1140+400 -821
		then return true
	elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821 and y - j >= 1140+400-821
		then return true
	elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821 and y - j >= 1318+400-821
		then return true
	elseif y - j >= floor
		then return true
	else return false
end

	elseif themap == "street" then

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
if themap == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821-178 and y >= 1064+400-821-30-178
		then return 1064+400-821-178
	elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821-178 and y >= 1140+400 -821-30-178
		then return 1140+400-821-178
	elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821-178 and y >= 1140+400-821-30-178
		then return 1140+400-821-178
	elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821-178 and y >= 1318+400-821-30-178
		then return 1318+400-821-178
	else return floor
end
	elseif themap == "street" then

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
	elseif x >= 5654 and x <= 5831 and y <= 1140 + 400 and y >= 1110 + 400
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

me.floor = floor
you.floor = floor

if themap == "library" then 

if you.mid >= 1400 then you.floor = 1900 - 65 end
if me.mid >= 1400 then me.floor = 1900 - 65 end

--slope attempt
-- if themap == "library" then 



-- if me.mid > 1207 and me.mid < 1407 then
-- 		me.floor = 1900-(((me.mid-1207)/200)*(63)) end
-- if you.mid > 1207 and you.mid < 1407 then
-- 		you.floor = 1900-(((you.mid-1207)/200)*(63)) end
-- 	if me.mid > 1207 and me.mid < 1407 then
-- 		me.floor = 1900-(((me.mid-1207)/200)*(63)) end
-- if you.mid > 1207 and you.mid < 1407 then
-- 		you.floor = 1900-(((you.mid-1207)/200)*(63)) end
-- if you.mid >= 1407 then you.floor = 1900 - 63 end
-- if me.mid >= 1407 then me.floor = 1900 - 63 end

-- end

end


you.tempfloor = platformy(you.mid, you.feet)
me.tempfloor = platformy(me.mid, me.feet)
if me.tempfloor < me.floor 
	then me.onplat = true
else me.onplat = false
	if me.feet + 10 < me.floor
		then me.g = false
	end
end
if you.tempfloor < you.floor 
	then you.onplat = true
else you.onplat = false
	if you.feet + 10 < you.floor
		then you.g = false
	end
end


end


function spikecheck(x, y)

if themap == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821-178 
		then return 1064+400-821-178
	elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821-178 
		then return 1140+400-821-178
	elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821-178 
		then return 1140+400-821-178
	elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821-178 
		then return 1318+400-821-178
	else return floor
end

elseif themap == "street" then
 
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

if themap == "fightclub" then 
    if x >= 4485-4453 and x <= 4689-4453 and y <= 1064+400-821-178 
		then return 1064+400-821-178
	elseif x >= 5292-4453 and x <= 5469-4453 and y <= 1140+400-821-178 
		then return 1140+400-821-178
	elseif x >= 5654-4453 and x <= 5831-4453 and y <= 1140+400-821-178 
		then return 1140+400-821-178
	elseif x >= 5108-4453 and x <= 6013-4453 and y <= 1318+400-821-178 
		then return 1318+400-821-178
	else return floor
end

elseif themap == "street" then
 
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
you.fric = function (base) 
	if you.v > 1 +base
		then you.v = you.v - fricrate
			

	elseif you.v < -1+base
		then you.v = you.v + fricrate
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


me.fric = function (base) 
	if me.v > 1 +base
		then me.v = me.v - fricrate
			

	elseif me.v < -1+base
		then me.v = me.v + fricrate
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





function vroomright(xx, base)
	if xx.v == 0+base
	then xx.v = 1.5+base
	elseif xx.v >0+base and xx.v < speedminit -accel+base
	then xx.v = xx.v + accel
	
	end
end 

function vroomleft(xx, base)
	if xx.v == 0+base
	then xx.v = -1.5+base
	elseif xx.v < 0+base and xx.v > -speedminit + accel+base
	then xx.v = xx.v - accel
	
	end
end 




--gravity = function (n)
--	if 



me.ctim = 0
you.ctim = 0

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
 
if me.running and math.abs(me.push) > 0 then me.j = 14 me.g = false
me.v = me.v + me.push*4 
end
if you.running and math.abs(you.push) > 0 then  you.j = 14 you.g = false
  you.v = you.v + you.push*4
  end
 
 if me.flinch or math.abs(me.v) <= speedminit then 
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
       
     
    
    
    
  elseif math.abs(me.v) > speedminit-accel*2 and (controller1.left or controller1.right) and me.g and not c1accept() and controller1.run and not controller1.block and not anyofmycombos() and not anyofmyprimes() and not me.slide and not me.dodge then
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

if you.flinch or math.abs(you.v) <= speedminit then 
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
       
     
    
    
    
  elseif math.abs(you.v) > speedminit-accel*2 and (controller2.left or controller2.right) and you.g and not c1accept() and controller2.run and not controller2.block and not anyofyourcombos() and not anyofyourprimes() and not you.slide and not you.dodge then
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




if me.flinch then me.ctim = 0 end

	if me.ctim > 0 then me.ctim = me.ctim + 1
		me.busy = true
		
		if me.ctim > 11 then
				me.ctim = 0
				if controller1.up then 
					me.g = false
					me.j = hopj
					repplay(me.jumpd) 
				elseif controller1.left then 
					me.g = false
					me.j = hopj2
					me.v = -hopv2
				elseif controller1.right then 
					me.g = false
					me.j = hopj2
					me.v = hopv2
				end

		elseif me.ctim > 7 then
				me.im = climb3
		elseif me.ctim > 4 then
				me.im = climb2

		elseif me.ctim > 0 then
				me.im = climb
				if me.ctim == 2 then
				repplay(climbsound) 
			end
		end
      
	end

if you.flinch then you.ctim = 0 end

	if you.ctim > 0 then you.ctim = you.ctim + 1
		you.busy = true
		if you.ctim > 11 then
				you.ctim = 0
				if controller2.up then 
					you.g = false
					you.j = hopj
					repplay(you.jumpd) 
				elseif controller2.left then 
					you.g = false
					you.j = hopj2
					you.v = -hopv2
				elseif controller2.right then 
					you.g = false
					you.j = hopj2
					you.v = hopv2
				end


		elseif you.ctim > 7 then
				you.im = climb3
		elseif you.ctim > 4 then
				you.im = climb2

		elseif you.ctim > 0 then
				you.im = climb
				if you.ctim == 2 then
				repplay(climbsound2) 
			end
		end
	end
  

end


function movex(xx,z)
  
  xdif = math.abs((you.x) - (me.x))
  
  if xdif >= 2000
  then speedlimit = minmaxdif+speedminit
elseif xdif < 2000 then
  speedlimit = (minmaxdif * ((xdif-500)/1500)) + speedminit
end 




xx.feet = xx.y + 60
	if xx.feet > xx.floor
	then xx.y = xx.floor - 60
end
	if xx.g 
	then 
	xx.j = 0
			if z.up and not xx.flinch and not xx.block and not xx.jstop and not xxbjstop and not xx.busy
				and not z.a1 and not z.a2 and not z.a3 and not xx.bur and not xxpurp
				then 
        if xx.running then
          xx.jt = runjt
          xx.jmax = runjmax
          xx.j = runj
          else
				xx.jt = jt
				xx.jmax = jmax
        xx.j = jumpj
      end
				xx.ht = 7
				xx.firstjump = true
				xx.g = false
				repplay(xx.jumpd)
			elseif z.right and xx.v >= xx.push and xx.stop == false and not xx.flinch
				and not z.left
				then 
				vroomright(xx, xx.push)
			elseif z.left and xx.v <= xx.push and xx.stop == false and not xx.flinch
				and not z.right
				then 
				vroomleft(xx, xx.push)
			elseif z.down and xx.onplat and not xx.busy and not xx.dodge
				and not z.a1 and not z.a2 and not z.a3 and not z.a4
			then
			xx.y = xx.y + 4
			else
	 		xx.fric(xx.push)
			end
	else
			
			if xx.landingcounter > 0
			then
			xx.landingcounter = xx.landingcounter - 1
			end
			if z.block and platformy(xx.mid+(xx.v/2)+(xx.lr*15),xx.feet-40) ~= platformy(xx.mid+(xx.v/2)+(xx.lr*15),xx.y) and platformy(xx.mid+(xx.v/2)+(xx.lr*15),xx.feet-40) ~= xx.floor
				then 
				   if platformy(xx.mid+(xx.v/2)+(xx.lr*15),xx.feet-50) ~= platformy(xx.mid+(xx.v/2)+xx.lr*15,xx.y) then
				xx.ctim = 7
      else xx.ctim = 1
        end
				xx.im = climb
				xx.onplat = true
				xx.j = climbj
				xx.v = xx.v/2
			elseif z.left and xx.v >= 1 + xx.push*1.5
			then xx.v = xx.v - adecrate
				xx.slowdown = true
				
			elseif z.right and xx.v <= -1 + xx.push*1.5
			then xx.v = xx.v + adecrate
				xx.slowdown = true
			elseif z.left and xx.v > - maxairmove + xx.push*1.5
				then xx.v = xx.v -amovrate
				xx.slowdown = false
			elseif z.right and xx.v < maxairmove + xx.push*1.5
				then xx.v = xx.v +amovrate
				xx.slowdown = false
			
			elseif z.down
				then xx.tempfloor = xx.floor
      elseif xx.push > 0 then
             if xx.v > xx.push*1.5 then 
             xx.v = xx.v - 1
             elseif xx.v < xx.push*1.5 then 
             xx.v = xx.v + 1
             end

			
			end
			
			--landing
			if xx.feet - xx.j >= xx.tempfloor
			then 
			if xx.j < -jforlanding or math.abs(xx.v) > speedlimit then 
				xx.landingcounter = landingwait
			xx.landing = true 
      xx.v = xx.v * landingfric
			else
				xx.landingcounter = 0
			end
			xx.j = 0
			xx.y = xx.tempfloor - 60
			xx.g = true
			land2:play()
			xx.slowdown = false
			
			--long jump
    elseif z.up and xx.j > 0 
    and xx.jmax > 0 
												and xx.firstjump
					then xx.jmax = xx.jmax - .7
			--the end arc/fall of any jump or the mini jump
			else
				xx.firstjump = false
				if xx.jt > 4
				then xx.jt = xx.jt -  grav
				elseif xx.jt <= 4 and xx.j > - maxgravity
				then xx.jt = xx.jt -  grav
					xx.j = xx.j - grav
				--elseif xx.jt <= 0 and xx.ht > 0
				--then xx.j = 0
				--	xx.ht = xx.ht - 1	
				else
					xx.j = xx.j
				end
				
			end
	end
end














