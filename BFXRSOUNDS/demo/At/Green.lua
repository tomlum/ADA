

me.throwcounter = 0


me.boltcombocount = 0
methrowanimatecounter = 0


you.throwcounter = 0


you.boltcombocount = 0
youthrowanimatecounter = 0



youbolts = {}

function youbolts.draw()
			for i,v in ipairs(youbolts) do
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr )/65), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)

		

	end
end
end




function youbolts.update()
	for i, v in ipairs(youbolts) do

	


		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle)) 

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (60*math.cos(sangle)) 
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)

		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(youbolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(youbolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
		end


		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 
		then
		v.upv = v.upv - 1
		
		end


	if v.s == -1 and spoint * v.lr < (me.mid) * v.lr and (spoint + v.v) * v.lr  +1 > (me.mid + me.v) * v.lr
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then 
			me.v = me.v + v.lr * 32
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - pboltdam
				
				end	


	elseif v.s == -201 and spoint * v.lr < (me.mid) * v.lr and (spoint + v.v) * v.lr  +1> (me.mid + me.v) * v.lr
	and not me.dodge
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(youbolts, i)
			ybgcatch = true
			me.v = -thev(math.abs(you.x - me.x)) * you.lr
			if not (me.block and v.lr~=me.lr) then
			me.ft = thev(math.abs(you.x - me.x))
			me.flinch = true
			end
				


	elseif v.s >= 0 and point * v.lr < (me.mid) * v.lr and (point + v.v) * v.lr  +1> (me.mid + me.v) * v.lr
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(youbolts, i)
			me.v = me.v + v.lr * 4
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - boltdamage
				
				end	

	end


		if v.time > boltdespawntime
		then table.remove(youbolts, i)

				elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(youbolts, i)




	elseif v.s == -1 and platformcheck((v.x + (v.lr*shalfwidth)), v.y - v.upv - 7)
		 then table.remove(youbolts, i)
			
	table.insert(youspikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
	table.insert(youspikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
	table.insert(youspikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
	table.insert(youspikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
	table.insert(youspikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
	table.insert(youspikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
	table.insert(youspikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
	table.insert(youspikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
	table.insert(youspikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
	table.insert(youspikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
	table.insert(youspikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
	table.insert(youspikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
	table.insert(youspikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
	table.insert(youspikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
	table.insert(youspikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
	table.insert(youspikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
	table.insert(youspikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})
	


for i, v in ipairs(youspikes) do

		

		if i > 1 and youspikes[i - 1].y > 0 and youspikes[i - 1].s ~= -200 
				then
		youspikes[i].y = youspikes[i - 1].y - 60 
		end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

	if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
		end
		end




	elseif v.y - v.upv + 4 >= floor
		then v.y = floor + (v.upv*.7) 
		v.x = v.x + v.v
		v.v = 0
		v.time = v.time + 1

 	



			

	else

		v.x = v.x + v.v
		v.time = v.time + 1
		
		if v.s == -200 or v.s == -201 then
		v.y = v.y
		else 
		v.y = v.y - v.upv
		end
	end
	end

	if youfired and youthrowanimatecounter < 5
	then youthrowanimatecounter = youthrowanimatecounter + 1

	if you.j ~= 0
		then
		if you.slowdown
		then
		you.im = airboltslow
	else
		you.im = airbolt
		end
	else
	you.im = boltthrow
	end	

	else youfired = false
		youthrowanimatecounter = 0
	end

	if youfired and youthrowanimatecounter < 5 or youboltchargecounter>=50 or you.im==boltrelease then yougree=true
		else yougree = false
	end

	if you.throwcounter > 50
	then you.boltcombocount = 0
		you.throwcounter = 0
		you.prime = false
	elseif you.boltcombocount < 3 and you.throwcounter > 30
		then you.boltcombocount = 0
			you.throwcounter = 0

	elseif you.boltcombocount < 3 and you.boltcombocount > 0 then
		you.throwcounter = you.throwcounter + 1
	elseif you.boltcombocount >= 3
		then
		you.throwcounter = you.throwcounter + 1
	end


	
		
		
end


youboltchargecounter = 0
youboltchargehold = 20

function youbolts.shoot(x)

if you.landing
		then youboltchargecounter = 0
	end

	if you.flinch or you.gcancel then
		you.attack = "none"
		youboltchargehold = 20
		youboltchargecounter = 0
		you.prime = false
	end

	if youboltchargehold < 17
	then youboltchargehold = youboltchargehold + 1
		you.im = boltrelease
		you.stop = true
		you.busy = true

	elseif (you.attack == "chargebolt" or youboltchargecounter == greenchargetime) and not x 
		then
		you.stop = true
		you.attack = null
		youboltchargecounter = 0
		if cg2:isStopped() then
			cg2:play()
		else cg2:rewind()
			cg2:play()
		end
		table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -18, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 18, s = 1, v = boltspeed * you.lr + you.v})
		
				
	
		you.im = boltrelease
		you.prime = false
		youboltchargehold = 0
		you.busy = true
	elseif youboltchargecounter == greenchargetime and you.g and x
		then you.stop = true
		you.attack = "chargebolt"
		you.im = boltcharged
		you.busy = true

	elseif x
	then
		you.prime = true
		youboltchargecounter = youboltchargecounter + 1
	


	elseif you.prime == true and you.boltcombocount < 5 and not youfired
		then
		you.prime = false
		table.insert(youbolts, {x = you.mid -10  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		
		if gr2:isStopped() then
			gr2:play()
		else gr2:rewind()
			gr2:play()
		end

		if not you.g then
		table.insert(youbolts, {x = you.mid -10  * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		end
		youfired = true
		you.boltcombocount = you.boltcombocount + 1
		you.throwcounter = 0
		youboltchargecounter = 0
		
	else you.prime = false
		youboltchargecounter = 0
		you.attack = none
	end
end















bolts = {}


function bolts.draw()
			for i,v in ipairs(bolts) do
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr )/65), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)




	end

	
end
end





--table.insert(spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = onplat(v.y) + math.random(8), lr = v.lr, t = 0, s = 0}))
	




function bolts.update()
	for i, v in ipairs(bolts) do



		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle))

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (65*math.cos(sangle))
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)


		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
		end



		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 
		then
		v.upv = v.upv - 1
		
		end


	if v.s == -201 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr +1 > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(bolts, i)
			bgcatch = true
			you.v = -thev(math.abs(you.x - me.x)) * me.lr
			if not (you.block and v.lr~=you.lr) then
			you.ft = thev(math.abs(you.x - me.x))
			you.flinch = true
			end


	elseif v.s == -1 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr  +1 > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet then
			you.v = you.v + v.lr * 32
				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - pboltdam
				
				end	


	elseif v.s >= 0 and point * v.lr < (you.mid) * v.lr and (point + v.v) * v.lr  +1 > (you.mid + you.v) * v.lr
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(bolts, i)
			you.v = you.v + v.lr * 4
				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - boltdamage
				
				end	
		end





		if v.time > boltdespawntime
		then table.remove(bolts, i)

		elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(bolts, i)





	elseif v.s == -1 and platformcheck((v.x + (v.lr*shalfwidth)), v.y - v.upv - 7)
		 then table.remove(bolts, i)
			
	table.insert(spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
	table.insert(spikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
	table.insert(spikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
	table.insert(spikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
	table.insert(spikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
	table.insert(spikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
	table.insert(spikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
	table.insert(spikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
	table.insert(spikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
	table.insert(spikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
	table.insert(spikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
	table.insert(spikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
	table.insert(spikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
	table.insert(spikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
	table.insert(spikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
	table.insert(spikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
	table.insert(spikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})


	for i, v in ipairs(spikes) do

		

		if i > 1 and spikes[i - 1].y > 0 and spikes[i - 1].s ~= -200
				then
		spikes[i].y = spikes[i - 1].y - 60 
		end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

	if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
		end
		end

	




















	elseif v.s >= 0 and v.y - v.upv + 4 >= floor
		then v.y = floor + (v.upv*.7) 
		v.x = v.x + v.v
		v.v = 0
		v.time = v.time + 1

 	



	else
		v.x = v.x + v.v
		v.time = v.time + 1
		if v.s == -200 or v.s == -201 then
		v.y = v.y
		else 
		v.y = v.y - v.upv
		end
	
	end
	end

	if mefired and methrowanimatecounter < 5
	then 
		methrowanimatecounter = methrowanimatecounter + 1

		if me.j ~= 0
		then
		if me.slowdown
		then
		me.im = airboltslow
	else
		me.im = airbolt
		end
	else
	me.im = boltthrow
	end	

	else mefired = false
		methrowanimatecounter = 0
	end

	if mefired and methrowanimatecounter < 5 or meboltchargecounter>=50 or me.im==boltrelease then megree=true
		else megree = false
	end


	if me.throwcounter > 50
	then me.boltcombocount = 0
		me.throwcounter = 0
		me.prime = false
	elseif me.boltcombocount < 3 and me.throwcounter > 30
		then me.boltcombocount = 0
			me.throwcounter = 0

	elseif me.boltcombocount < 3 and me.boltcombocount > 0 then
		me.throwcounter = me.throwcounter + 1
	elseif me.boltcombocount >= 3
		then
		me.throwcounter = me.throwcounter + 1
	end




	
end



meboltchargecounter = 0
meboltchargehold = 20

function bolts.shoot(x)
	
if me.landing
		then meboltchargecounter = 0
	end

	if me.flinch or me.gcancel then
		me.attack = "none"
		meboltchargehold = 20
		meboltchargecounter = 0
		me.prime = false
	end

	if meboltchargehold < 17
	then meboltchargehold = meboltchargehold + 1
		me.im = boltrelease
		me.stop = true
		me.busy = true

	elseif (me.attack == "chargebolt" or meboltchargecounter == greenchargetime) and not x
		then
		me.stop = true
		me.attack = null
		meboltchargecounter = 0
		if cg1:isStopped() then
			cg1:play()
		else cg1:rewind()
			cg1:play()
		end
		table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -18, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 18, s = 1, v = boltspeed * me.lr})
		me.im = boltrelease
		me.prime = false
		meboltchargehold = 0
		me.busy = true
	elseif meboltchargecounter == greenchargetime and me.g and x
		then me.stop = true
		me.attack = "chargebolt"
		me.im = boltcharged
		me.busy = true

	elseif x
	then
		me.prime = true
		meboltchargecounter = meboltchargecounter + 1
	


	elseif me.prime == true and me.boltcombocount < 5 and not mefired
		then
		me.prime = false

		table.insert(bolts, {x = me.mid -10 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
		
		if gr1:isStopped() then
			gr1:play()
		else gr1:rewind()
			gr1:play()
		end
	



		if not me.g then
		table.insert(bolts, {x = me.mid -10 * me.lr , y = me.y + 38, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
	end
		mefired = true
		me.boltcombocount = me.boltcombocount + 1
		me.throwcounter = 0
		meboltchargecounter = 0
		
	else me.prime = false
		meboltchargecounter = 0
		me.attack = "none"



	end
end


