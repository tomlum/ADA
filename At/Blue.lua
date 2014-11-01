



you.bluechargetimer = 0
you.bluepause = 0
younext = 0
ybp = 0
yd = 0
you.bluechargetime = 50


function you.blueblade(x)

	if you.g then youairready = true
end


	local xdif = (me.mid - you.mid) * you.lr


	if you.g then you.airready = true
	end


	if you.bluepause <= 0 or you.flinch or ybcancel then 
		younext = 0
		you.bluechargetimer = 0
		youblu = false
		yd = 0

	else youblu = true
	end

	if not you.g then

	

	if younext == "nevergonnahappen"
		then younext = "oh it happened"


	elseif younext == 202 and not you.g
		then 
			if you.j >= 0
			then you.im = briseend
			else you.im = bfallend
			end
		yd = 0
	elseif younext == 201 and not x and not you.g
		then 
		youairready = false
		if (you.j >= 0 and not controller2.down) or (controller2.up and you.j < 0) then

				if youarmsreach(200) and me.y < you.y and me.y > you.y - 200 and not me.dodge
			then 
		
			me.v = you.v + (5 * you.lr)
			if not (me.block and me.lr ~= you.lr) then
			me.flinch = true
			me.health = me.health - airbluedam
			me.ft = abft
			me.j = you.j + 6
			me.g = false
			end
		end


		yd = 8
		you.im = brise 
		if (controller2.up and you.j < 0) then you.j = 70
		else
		you.j = 19
  end
 
  
		you.v = you.v + .2 * you.lr
		repplay(blues2)



		elseif (you.j < 0 and not controller2.up) or (controller2.down and you.j >= 0) then
		yd = 6

		if (controller2.down and you.j >=0) then you.j = -30
		else
		you.j = you.j - 5

		repplay(blues2)
		end
		you.v = you.v + 1 * you.lr
		if youarmsreach(200) and me.y > you.y and me.y < you.y + 200 and ybp >=12 and not me.dodge
			then 
			me.v = you.v + (10 * you.lr)
			if not (me.block and me.lr ~= you.lr) then
			me.flinch = true
			me.health = me.health - airbluedam
			me.ft = abft
			me.j = you.j - 20
			end
		end



		if ybp == 24 then you.im = bfall
		elseif ybp == 18
		then you.im = bfall2
		else you.im = bfall3
		end
		end

	elseif youairready and x and not you.g and younext <=201 then
		if you.j >= 0 then 
			you.im = briseprep
		else you.im = bfallprep
		end
		younext = 200
		yd = 24
		you.bluepause = 30
		youblu = false

	else yd = 0
		you.bluechargetimer = 0
		youbjstop = false
	end


else

	if younext==20 then you.im = bc2 
			yd = 24
		if youarmsreach(170) and sameheight() and not me.invince then 
				me.flinch = true
				me.ft = bcft
				youactionshot = true
				me.v = 80 * you.lr
				me.health = me.health - bluechargedam
		end
			
	elseif younext==21 then you.im = bc2 
			yd = 24
			repplay(bcs2)
	elseif younext==22 then you.im = bc3 
			yd = 12
			if ybp > 20 and platformcheck(you.mid + (50*you.lr),you.y,-70) and platformcheck(you.mid + (100*you.lr),you.y,-70) then
				makefloorrubble(you.mid + (50*you.lr), you.feet, 3*you.lr,4)
			end
	elseif younext>=23 and younext < 100 then you.im = bcend
			yd = 0 


	elseif not x and younext == 19 
		then you.im = bc1
		yd = 12
		


	elseif you.bluechargetimer > bluechargetime and x and younext <= 19
		then you.im = bluecharging
		you.bluepause = 30
		youblu = false
		yd = 24
		ybp = 24
		younext = 18

	



elseif younext == 12 then
	you.im = bcend
	yd = 0
elseif younext == 11 then
	you.im = bcend
	yd = 12
	you.v = you.v + (-8 * you.lr)

elseif younext == 10 and not x
		then you.im = blue33
		yd = 12
		you.bluechargetimer = 0
    if youarmsreach(160) and sameheight() and not me.dodge 
			then 
        
			me.v = you.v + (you.lr * 4)
			if not (me.block and me.lr ~= you.lr) then
			me.flinch = true
			me.ft = bft
			me.health = me.health - bluedam
		end
	end
		--hc(you.mid, you.y+30, you.mid+you.v+250*you.lr, you.y+30-you.j, true, you.lr, true, true, you.v + (20*you.lr), you.j, bluedam, true, bft, 0, 0, false, false, 2)

elseif younext == 9 and not x
		then you.im = blue32
		yd = 24
		you.bluechargetimer = 0
	
	repplay(blues2)
elseif younext == 8 and not x
		then you.im = blue32
		yd = 24
		you.bluechargetimer = 0
elseif younext == 7 and not x
		then you.im = blue31
		yd = 12
		you.bluechargetimer = 0

		
elseif x and younext == 6 or younext == 7 then 
		you.im = blue3start
		younext = 7
		you.bluepause = 25
		youblu = false
		you.bluechargetimer = you.bluechargetimer + 1







	elseif younext == 6
		then you.im = blue23
		yd = 0
	elseif younext == 5
		then you.im = blue22
		yd = 8
		repplay(blues2)	
    if youarmsreach(160) and sameheight() and not me.dodge 
			then 
			me.v = you.v + (you.lr * 4)
			if not (me.block and me.lr ~= you.lr) then
			me.flinch = true
			me.ft = bft
			me.health = me.health - bluedam
		end
	end
		--hc(you.mid, you.y+30, you.mid+you.v+160*you.lr, you.y+30-you.j, true, you.lr, true, true, you.v + (4*you.lr), you.j, bluedam, true, bft, 0, 0, false, false, 2)

	elseif younext == 4 and not x
		then you.im = blue21
		if controller2.right and you.lr > 0 then
			you.v = you.v + 8
		elseif
			controller2.left and you.lr < 0 then 
			you.v = you.v - 8
		else
		you.v = you.v + (4 * you.lr)
		end
		yd = 12
		you.bluechargetimer = 0
	elseif x and younext == 3 or younext == 4 then 
		you.im = blue2start
		younext = 4
		you.bluepause = 25
		youblu = false
		you.bluechargetimer = you.bluechargetimer + 1




	elseif younext == 3 then
		you.im = blue1end
		you.stop = true
		yd = 0
	elseif younext == 2
		then
		you.im = blue12
		yd = 12
		repplay(blues2)		
   
		hc(you.mid, you.y+30, you.mid+you.v+160*you.lr, you.y+30-you.j, true, you.lr, true, true, you.v + (4*you.lr), you.j, bluedam, true, bft/2, 0, 0, false, false, 2)
    
    --hcCheck(you.mid, you.y+30, you.mid+you.v, you.y+30-you.j, 2)
	elseif younext == 1 and not x then
		you.im = blue11
		yd = 24
		if controller2.right and you.lr > 0 then
			you.v = you.v + 7
		elseif
			controller2.left and you.lr < 0 then 
			you.v = you.v - 7
		else
		you.v = you.v + (6 * you.lr)

		end
		you.bluechargetimer = 0
	elseif x and younext == 0 or younext == 1 then 
		you.im = blue1start
		younext = 1
		you.bluepause = 23
		youblu = false
		you.bluechargetimer = you.bluechargetimer + 1
		yd = 0

		if walktimery< 7 then 
		you.im = bwalk1
	elseif walktimery>= 7 and walktimery< 14 then
		you.im = bwalk2
	elseif walktimery>= 14 and walktimery< 21 then
		you.im = bwalk3
	elseif walktimery>= 21 and walktimery< 28 then
		you.im = bwalk4
	elseif walktimery>= 28 and walktimery< 35 then
		you.im = bwalk5
	else
		walktimery= 0
	end



	else yd = 0
		you.bluechargetimer = 0
		youbjstop = false
			
	
	end
end

	if younext > 0 and younext < 200
	then youbjstop = true
end



if ybp > -10000000000 
		then
		ybp = ybp - yd
	end

	if ybp <= 0
		then younext = younext + 1
		ybp = 24
	end

	


	if you.bluepause > 0
		then
	you.bluepause = you.bluepause - 1
	you.stop = true
	end

	if younext == 1 then you.stop = false
	end
end














bluechargetimer = 0
me.bluepause = 0
menext = 0
mbp = 0
md = 0



function blueblade(x)

	if me.g then meairready = true
end


	local xdif = (you.mid - me.mid) * me.lr


	if me.g then me.airready = true
	end


	if me.bluepause <= 0 or me.flinch or mbcancel then 
		menext = 0
		bluechargetimer = 0
		meblu = false
		md = 0
		mbp = 24
	else meblu = true
	end

	if not me.g then

	

	if menext == "nevergonnahappen"
		then menext = "oh it happened"


	elseif menext == 202 and not me.g
		then 
			if me.j >= 0
			then me.im = briseend
			else me.im = bfallend
			end
		md = 0
	elseif menext == 201 and not x and not me.g
		then 
		meairready = false
		if (me.j >= 0 and not controller1.down) or (controller1.up and me.j < 0) then

				if mearmsreach(200) and you.y < me.y and you.y > me.y - 200 and not you.dodge
			then 
			you.v = me.v + (5 * me.lr)
			if not (you.block and me.lr ~= you.lr) then
			you.flinch = true
			you.health = you.health - airbluedam
			you.ft = abft
			you.j = me.j + 6
			you.g = false
			end
		end


		md = 8
		me.im = brise 
		if (controller1.up and me.j < 0) then me.j = 70
		else
		me.j = 19
		
		end
		me.v = me.v + .2 * me.lr
		repplay(blues)



		elseif (me.j < 0 and not controller1.up) or (controller1.down and me.j >= 0) then

		md = 6
		if (controller1.down and me.j >=0) then me.j = -30
		else
		me.j = me.j - 5

		repplay(blues)
		end
		me.v = me.v + 1 * me.lr
		if mearmsreach(200) and you.y > me.y and you.y < me.y + 200 and mbp >=12 and not you.dodge
			then 
			you.v = me.v + (10 * me.lr)
			if not (you.block and me.lr ~= you.lr) then
			you.flinch = true
			you.health = you.health - airbluedam
			you.ft = abft
			you.j = me.j - 20
			end
		end

		if mbp == 24 then me.im = bfall
		elseif mbp == 18
		then me.im = bfall2
		else me.im = bfall3
		end
		end

	elseif meairready and x and not me.g and menext <=201 then
		if me.j >= 0 then 
			me.im = briseprep
		else me.im = bfallprep
		end
		menext = 200
		md = 24
		me.bluepause = 25
		meblu = false

	else md = 0
		bluechargetimer = 0
		mebjstop = false
	end


else

	if menext==20 then me.im = bc2 
			md = 24

		if mearmsreach(170) and sameheight() and not you.invince then 
				you.flinch = true
				you.ft = bcft
				actionshot = true
				you.v = 80 * me.lr
				you.health = you.health - bluechargedam
		end
			
	elseif menext==21 then me.im = bc2 
			if bcs:isStopped() then
			bcs:play()
		else bcs:rewind()
		end
			md = 24
	elseif menext==22 then me.im = bc3 
			md = 12
			if mbp > 20 and platformcheck(me.mid + (50*me.lr),me.y,-70) and platformcheck(me.mid + (100*me.lr),me.y,-70) then
				makefloorrubble(me.mid + (50*me.lr), me.feet, 3*me.lr,4)
			end
	elseif menext>=23 and menext < 100 then me.im = bcend
			md = 0 


	elseif not x and menext == 19 
		then me.im = bc1
		md = 12
		


	elseif bluechargetimer > bluechargetime and x and menext <= 19
		then me.im = bluecharging
		me.bluepause = 30
		md = 24
		menext = 18
		meblu = false

	

elseif menext == 12 then
	me.im = bcend
	md = 0
elseif menext == 11 then
	me.im = bcend
	md = 12
	me.v = me.v + (-8 * me.lr)

elseif menext == 10 and not x
		then me.im = blue33
		md = 12
		me.bluechargetimer = 0
		if mearmsreach(250) and sameheight() and not you.dodge 
			then 
			you.v = me.lr * 20
			if not(you.block and me.lr ~= you.lr) then
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
		end
		end

elseif menext == 9 and not x
		then me.im = blue32
		md = 24
		bluechargetimer = 0
	
	repplay(blues2)
elseif menext == 8 and not x
		then me.im = blue32
		md = 24
		bluechargetimer = 0
elseif menext == 7 and not x
		then me.im = blue31
		md = 12
		bluechargetimer = 0

		
elseif x and menext == 6 or menext == 7 then 
		me.im = blue3start
		menext = 7
		me.bluepause = 25
		meblu = false
		bluechargetimer = bluechargetimer + 1







	elseif menext == 6
		then me.im = blue23
		md = 0
	elseif menext == 5
		then me.im = blue22
		md = 8
		repplay(blues)		
		if mearmsreach(160) and sameheight() and not you.dodge 
			then 
			you.v = me.v + (me.lr * 4)
			if not (you.block and me.lr ~= you.lr) then
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
		end
	end

	elseif menext == 4 and not x
		then me.im = blue21
		if controller1.right and me.lr > 0 then
			me.v = me.v + 8
		elseif
			controller1.left and me.lr < 0 then 
			me.v = me.v - 8
		else
		me.v = me.v + (4 * me.lr)
		end
		md = 12
		bluechargetimer = 0
	elseif x and menext == 3 or menext == 4 then 
		me.im = blue2start
		menext = 4
		me.bluepause = 28
		bluechargetimer = bluechargetimer + 1
		meblu = false




	elseif menext == 3 then
		me.im = blue1end
		me.stop = true
		md = 0
	elseif menext == 2
		then
		me.im = blue12
		md = 12
		repplay(blues)		
    --[[if mearmsreach(160) and sameheight() and not you.dodge 
			then 

			you.v = me.v + (me.lr * 4)
			if not (you.block and me.lr ~= you.lr) then
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
		end
    end
--    ]]--
    hc(me.mid, me.y+30, me.mid+me.v+160*me.lr, me.y+30-you.j, true, me.lr, true, true, me.v + (4*me.lr), me.j, bluedam, true, bft/2, 0, 0, false, false, 1)
	
		
		
	elseif menext == 1 and not x then
		me.im = blue11
		md = 24
		if controller1.right and me.lr > 0 then
			me.v = me.v + 7
		elseif
			controller1.left and me.lr < 0 then 
			me.v = me.v - 7
		else
		me.v = me.v + (6 * me.lr)

		end
		bluechargetimer = 0
	elseif x and menext == 0 or menext == 1 then 
		me.im = blue1start
		menext = 1
		me.bluepause = 23
		meblu = false
		bluechargetimer = bluechargetimer + 1
		md = 0
		if walktimerme < 7 then 
		me.im = bwalk1
	elseif walktimerme >= 7 and walktimerme < 14 then
		me.im = bwalk2
	elseif walktimerme >= 14 and walktimerme < 21 then
		me.im = bwalk3
	elseif walktimerme >= 21 and walktimerme < 28 then
		me.im = bwalk4
	elseif walktimerme >= 28 and walktimerme < 35 then
		me.im = bwalk5
	else
		walktimerme = 0
	end

	else md = 0
		bluechargetimer = 0
		mebjstop = false
			
	
	end
end

	if menext > 0 and menext < 200
	then mebjstop = true
end



if mbp > -1000000000 
		then
		mbp = mbp - md
	end

	if mbp <= 0
		then menext = menext + 1
		mbp = 24
	end

	


	if me.bluepause > 0
		then
	me.bluepause = me.bluepause - 1
	me.stop = true
	end

if menext == 1 then me.stop = false
	end

end

