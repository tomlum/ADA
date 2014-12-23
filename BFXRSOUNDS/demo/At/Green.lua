

me.throwcounter = 0


me.boltcombocount = 0
me.throwanimatecounter = 0


you.throwcounter = 0


you.boltcombocount = 0
you.throwanimatecounter = 0



you.bolts = {}

function you.bolts.draw()
			for i,v in ipairs(you.bolts) do
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr )/65), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)

		

	end
end
end




function you.bolts.update()
	for i, v in ipairs(you.bolts) do

	


		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle)) 

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (60*math.cos(sangle)) 
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)

		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(you.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(you.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
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
			then table.remove(you.bolts, i)
			you.bgcatch = true
			me.v = -thev(math.abs(you.x - me.x)) * you.lr
			if not (me.block and v.lr~=me.lr) then
			me.ft = thev(math.abs(you.x - me.x))
			me.flinch = true
			end
				


	elseif v.s >= 0 and point * v.lr < (me.mid) * v.lr and (point + v.v) * v.lr  +1> (me.mid + me.v) * v.lr
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(you.bolts, i)
			me.v = me.v + v.lr * 4
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - boltdamage
				
				end	

	end


		if v.time > boltdespawntime
		then table.remove(you.bolts, i)

				elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(you.bolts, i)




	elseif v.s == -1 and platformcheck((v.x + (v.lr*shalfwidth)), v.y - v.upv - 7)
		 then table.remove(you.bolts, i)
			
	table.insert(you.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
	table.insert(you.spikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
	table.insert(you.spikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
	table.insert(you.spikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
	table.insert(you.spikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
	table.insert(you.spikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
	table.insert(you.spikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
	table.insert(you.spikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
	table.insert(you.spikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
	table.insert(you.spikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
	table.insert(you.spikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
	table.insert(you.spikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
	table.insert(you.spikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
	table.insert(you.spikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
	table.insert(you.spikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
	table.insert(you.spikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
	table.insert(you.spikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})
	


for i, v in ipairs(you.spikes) do

		

		if i > 1 and you.spikes[i - 1].y > 0 and you.spikes[i - 1].s ~= -200 
				then
		you.spikes[i].y = you.spikes[i - 1].y - 60 
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

	if you.gfired and you.throwanimatecounter < 5
	then you.throwanimatecounter = you.throwanimatecounter + 1

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

	else you.gfired = false
		you.throwanimatecounter = 0
	end

	if you.gfired and you.throwanimatecounter < 5 or you.boltchargecounter>=50 or you.im==boltrelease then you.gree=true
		else you.gree = false
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


you.boltchargecounter = 0
you.boltchargehold = 20

function you.bolts.shoot(x)

if you.landing
		then you.boltchargecounter = 0
	end

	if you.flinch or you.gcancel then
		you.attack = "none"
		you.boltchargehold = 20
		you.boltchargecounter = 0
		you.prime = false
	end

	if you.boltchargehold < 17
	then you.boltchargehold = you.boltchargehold + 1
		you.im = boltrelease
		you.stop = true
		you.busy = true

	elseif (you.attack == "chargebolt" or you.boltchargecounter == greenchargetime) and not x 
		then
		you.stop = true
		you.attack = null
		you.boltchargecounter = 0
		if cg2:isStopped() then
			cg2:play()
		else cg2:rewind()
			cg2:play()
		end
		table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -18, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(you.bolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 18, s = 1, v = boltspeed * you.lr + you.v})
		
				
	
		you.im = boltrelease
		you.prime = false
		you.boltchargehold = 0
		you.busy = true
	elseif you.boltchargecounter == greenchargetime and you.g and x
		then you.stop = true
		you.attack = "chargebolt"
		you.im = boltcharged
		you.busy = true

	elseif x
	then
		you.prime = true
		you.boltchargecounter = you.boltchargecounter + 1
	


	elseif you.prime == true and you.boltcombocount < 5 and not you.gfired
		then
		you.prime = false
		table.insert(you.bolts, {x = you.mid -10  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		
		if gr2:isStopped() then
			gr2:play()
		else gr2:rewind()
			gr2:play()
		end

		if not you.g then
		table.insert(you.bolts, {x = you.mid -10  * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		end
		you.gfired = true
		you.boltcombocount = you.boltcombocount + 1
		you.throwcounter = 0
		you.boltchargecounter = 0
		
	else you.prime = false
		you.boltchargecounter = 0
		you.attack = none
	end
end















me.bolts = {}


function me.bolts.draw()
			for i,v in ipairs(me.bolts) do
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr )/65), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, math.asin((-v.upv*v.lr)/80), v.lr, 1)




	end

	
end
end





--table.insert(me.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = onplat(v.y) + math.random(8), lr = v.lr, t = 0, s = 0}))
	




function me.bolts.update()
	for i, v in ipairs(me.bolts) do



		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle))

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (65*math.cos(sangle))
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)


		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(me.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(me.bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
		end



		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 
		then
		v.upv = v.upv - 1
		
		end


	if v.s == -201 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr +1 > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(me.bolts, i)
			me.bgcatch = true
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
			then table.remove(me.bolts, i)
			you.v = you.v + v.lr * 4
				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - boltdamage
				
				end	
		end





		if v.time > boltdespawntime
		then table.remove(me.bolts, i)

		elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(me.bolts, i)





	elseif v.s == -1 and platformcheck((v.x + (v.lr*shalfwidth)), v.y - v.upv - 7)
		 then table.remove(me.bolts, i)
			
	table.insert(me.spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = 0, s = 0})
	table.insert(me.spikes, {x = v.x + (35 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -6, s = 0})
	table.insert(me.spikes, {x = v.x + (65 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -12, s = 0})
	table.insert(me.spikes, {x = v.x + (100 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -18, s = 0})
	table.insert(me.spikes, {x = v.x + (135 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -24, s = 0})
	table.insert(me.spikes, {x = v.x + (170 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -30, s = 0})
	table.insert(me.spikes, {x = v.x + (205 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -36, s = 0})
	table.insert(me.spikes, {x = v.x + (240 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -42, s = 0})
	table.insert(me.spikes, {x = v.x + (275 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -48, s = 0})
	table.insert(me.spikes, {x = v.x + (310 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -54, s = 0})
	table.insert(me.spikes, {x = v.x + (345 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -60, s = 0})
	table.insert(me.spikes, {x = v.x + (380 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -76, s = 0})
	table.insert(me.spikes, {x = v.x + (415 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -72, s = 0})
	table.insert(me.spikes, {x = v.x + (440 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -78, s = 0})
	table.insert(me.spikes, {x = v.x + (475 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -84, s = 0})
	table.insert(me.spikes, {x = v.x + (510 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -90, s = 0})
	table.insert(me.spikes, {x = v.x + (545 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -96, s = 0})


	for i, v in ipairs(me.spikes) do

		

		if i > 1 and me.spikes[i - 1].y > 0 and me.spikes[i - 1].s ~= -200
				then
		me.spikes[i].y = me.spikes[i - 1].y - 60 
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

	if me.gfired and me.throwanimatecounter < 5
	then 
		me.throwanimatecounter = me.throwanimatecounter + 1

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

	else me.gfired = false
		me.throwanimatecounter = 0
	end

	if me.gfired and me.throwanimatecounter < 5 or me.boltchargecounter>=50 or me.im==boltrelease then me.gree=true
		else me.gree = false
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



me.boltchargecounter = 0
me.boltchargehold = 20

function me.bolts.shoot(x)
	
if me.landing
		then me.boltchargecounter = 0
	end

	if me.flinch or me.gcancel then
		me.attack = "none"
		me.boltchargehold = 20
		me.boltchargecounter = 0
		me.prime = false
	end

	if me.boltchargehold < 17
	then me.boltchargehold = me.boltchargehold + 1
		me.im = boltrelease
		me.stop = true
		me.busy = true

	elseif (me.attack == "chargebolt" or me.boltchargecounter == greenchargetime) and not x
		then
		me.stop = true
		me.attack = null
		me.boltchargecounter = 0
		if cg1:isStopped() then
			cg1:play()
		else cg1:rewind()
			cg1:play()
		end
		table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 3, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -3, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 6, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -6, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -12, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 12, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -18, s = 1, v = boltspeed * me.lr})
		table.insert(me.bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 18, s = 1, v = boltspeed * me.lr})
		me.im = boltrelease
		me.prime = false
		me.boltchargehold = 0
		me.busy = true
	elseif me.boltchargecounter == greenchargetime and me.g and x
		then me.stop = true
		me.attack = "chargebolt"
		me.im = boltcharged
		me.busy = true

	elseif x
	then
		me.prime = true
		me.boltchargecounter = me.boltchargecounter + 1
	


	elseif me.prime == true and me.boltcombocount < 5 and not me.gfired
		then
		me.prime = false

		table.insert(me.bolts, {x = me.mid -10 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
		
		if gr1:isStopped() then
			gr1:play()
		else gr1:rewind()
			gr1:play()
		end
	



		if not me.g then
		table.insert(me.bolts, {x = me.mid -10 * me.lr , y = me.y + 38, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
	end
		me.gfired = true
		me.boltcombocount = me.boltcombocount + 1
		me.throwcounter = 0
		me.boltchargecounter = 0
		
	else me.prime = false
		me.boltchargecounter = 0
		me.attack = "none"



	end
end


