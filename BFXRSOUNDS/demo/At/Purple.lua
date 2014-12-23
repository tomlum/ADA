
me.spikes = {}
spiketimer = 0
me.spikechargetimer = 0
spikecooldown = 15

mespikeprime = false
mespikeairprime = false
function me.spikes.draw()

for i, v in ipairs(me.spikes) do
	



	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -200 and v.t > 87 then table.remove(me.spikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 65 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	
elseif v.s == -1 and me.spikechargetimer > -chargespikedur-2  then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and me.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and me.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and me.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and me.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and me.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp61, v.x, v.y, 0, v.lr, 1)

	elseif v.s == -1 and v.t > 8 then
			love.graphics.draw(sp12, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and v.t > 8 then
			love.graphics.draw(sp22, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and v.t > 8 then
			love.graphics.draw(sp32, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and v.t > 8 then
			love.graphics.draw(sp42, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and v.t > 8 then
			love.graphics.draw(sp52, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and v.t > 8 then
			love.graphics.draw(sp62, v.x, v.y, 0, v.lr, 1)

		elseif v.s == -1 and v.t > 6 then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and v.t > 6 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and v.t > 6 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and v.t > 6 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and v.t > 6 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and v.t > 6 then
			love.graphics.draw(sp61, v.x, v.y, 0, v.lr, 1)

		

	elseif v.t >= 38 and v.s == 3
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
		elseif v.t >= 38 and v.s == 4
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 2 and v.t > 4
		then
		love.graphics.draw(groundspike3, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 2 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
			elseif v.s == 4 and v.t > 4
		then
		love.graphics.draw(groundspike4, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 4 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 3 and v.t > 4
		then
		love.graphics.draw(groundspike2, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 3 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	


	elseif v.t > 38 and v.s == 0 
		then
		love.graphics.draw(purple5, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 6 and v.s == 0 
		then
		love.graphics.draw(purple4, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 4 and v.s == 0 
		then
		love.graphics.draw(purple3, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 2 and v.s == 0 
		then
		love.graphics.draw(purple2, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 0 and v.s == 0 
		then
		love.graphics.draw(purple1, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	end


	if v.t == 3 and v.s == 0 then
	if me.purpsound:isStopped() then

			me.purpsound:setPitch(.8 + (math.random() * .4) )
			me.purpsound:play()
		else me.purpsound:rewind()
			me.purpsound:setPitch(.8 + (math.random() * .4) )
			me.purpsound:play()
		end
	end

	if v.t == 3 and v.s == 2 then
	if me.airpurp:isStopped() then
			me.airpurp:play()
		else me.airpurp:rewind()
			me.airpurp:play()
		end
	end

	if v.s == -200 and v.t == 65 then
		if me.bpsound:isStopped() then
			me.bpsound:play()
		else me.bpsound:rewind()
			me.bpsound:play()
		
		end
		end

		if me.spikechargetimer == -chargespikedur - 80 -25
		then 
		if me.cp:isStopped() then
			me.cp:play()
		else me.cp:rewind()
			me.cp:play()
		
		end
		end


end

end



function me.spikes.update()
for i, v in ipairs(me.spikes) do

if v.y < 0 then table.remove(me.spikes,i) end

if v.s==-200
		then while (spikecheck(v.x + (150 * v.lr),v.y + 135) ~= spikecheck(v.x,v.y + 135))
			do v.y = spikecheck(v.x + 80*v.lr, v.y + 200) - 140
		end
	end


if v.s >= 2 and math.abs((v.x + (28 * v.lr)) - you.mid) < 40 and you.feet > v.y + 15 and v.y > you.y - 40
				and v.t > 2           										
				then
				you.v = v.lr * 3
				if not (you.block and you.lr ~= v.lr) then
				you.health = you.health - aspikedamage + me.ptopspeed
				you.j = 40
				you.y = v.y - 70
				you.flinch = true
				you.g = false
				you.ft = apft
				end


elseif v.s == -200 and v.t >= 63 and math.abs((v.x + (85 * v.lr)) - you.mid) < 85 and you.feet > v.y + 15 and v.y > you.y - 140
				
				then
				you.v = v.lr * 10
				if not (you.block and you.lr ~= v.lr) then
				you.health = you.health - bspikedamage
				if v.t < 70 then
				you.j = 35
				else you.j = 10
				end
				you.y = v.y - 30
				you.g = false
				you.flinch = true
				you.ft = bpft
				end

	elseif v.s == 0 and math.abs((v.x + (58 * v.lr)) - you.mid) < 18 and you.feet > v.y + 15 and v.y > you.y -40
				and v.t > 2
				then
				you.v = v.lr * 5
				if not (you.block and you.lr ~= v.lr) then
				you.health = you.health - spikedamage
				you.j = 9
				you.g = false
				you.flinch = true
				you.ft = pft
				you.y = you.y - 1
				end
				
				
	end

	--simultaneous remove special me.spikes
	if v.s == 0 and v.t > 40
		then table.remove(me.spikes, i)
	elseif v.s < 0 and v.s > -199 and me.spikechargetimer > -chargespikedur
		then table.remove(me.spikes, i)
			elseif v.s > 0 and v.t > 40
				then table.remove(me.spikes, i)
	elseif v.t >= 88 and v.s >= 0 then
	table.remove(me.spikes, i)
	else v.t = v.t + 1
	end

end
end

me.purp = false
me.spikepause = 0
me.dig = 0


function me.spikes.shoot(x)
me.jstop = true

if me.flinch or me.pcancel then 
	me.spikechargetimer = 0
	me.attack = "none"
	mespikeairprime = false
	mespikeprime = false
	--added this 
	mespikeprime = false --this used to not exist
	me.spikechargetimer = 0
	mespikeairprime = false
	mespikespecial = false
	me.dig = 0
	me.jstop = false

-- -150
elseif mespikespecial
	then
	me.dig = me.dig + 1
	me.dodge = true
	me.block = true
	me.invince = true
	me.im = invis

	if me.dig > -119 then
	mespikespecial = false
	me.invince = false
	

	elseif me.dig > -120
		then me.mid = you.mid 
		me.x = you.x
		me.xanimate = you.xanimate
		
	--purpwhatever
	pw = 20

		blatime = 10
		table.insert(me.spikes, {x = me.mid - 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid - 100, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(me.spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(me.spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(me.spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(me.spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(me.spikes, {x = me.mid + 30, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(me.spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(me.spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(me.spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(me.spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(me.spikes, {x = me.mid + 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(me.spikes, {x = me.mid - 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid - 20, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(me.spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(me.spikes, {x = me.mid - 60, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid + 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(me.spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid - 300, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(me.spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(me.spikes, {x = me.mid - 205, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(me.spikes, {x = me.mid - 205, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(me.spikes, {x = me.mid - 230, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(me.spikes, {x = me.mid + 230, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(me.spikes, {x = me.mid + 240, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(me.spikes, {x = me.mid + 300, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(me.spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(me.spikes, {x = me.mid + 275, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(me.spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	me.spikechargetimer = -150
	mespikeprime = false
	me.im = invis


	elseif me.dig > -129 then me.im = invis
		me.x = you.x
	elseif me.dig > -130 then
		me.im = dig




	

end

elseif mespikeairprime == gogo and me.spikechargetimer < 0
	then
	me.im = spikeland
	me.spikechargetimer = me.spikechargetimer + 1
	me.stop = true
	me.jstop = true
	me.busy = true

	
	
elseif me.g and mespikeairprime
	then me.im = spikeland
	me.busy = true
	mespikeairprime = gogo
	me.spikechargetimer = -90
	me.jstop = true
	me.stop = true



	if me.onplat
		then
	table.insert(me.spikes, {x = me.mid - 18, y = floor - 60, lr = 1, t = -10, s = 4} )
	table.insert(me.spikes, {x = me.mid + 18, y = floor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(me.spikes, {x = me.mid + 40, y = floor - 80, lr = 1, t = -23, s = 3} )
	table.insert(me.spikes, {x = me.mid - 40, y = floor - 80, lr = -1, t = -23, s = 3} )
	table.insert(me.spikes, {x = me.mid + 5, y = floor - 80, lr = 1, t = -18, s = 2} )
	table.insert(me.spikes, {x = me.mid - 5, y = floor - 80, lr = -1, t = -18, s = 2} )
	me.stop = true
	me.v = 0
	me.jstop = true
	me.busy = true
	if math.abs(me.x - you.x) < 20 and me.feet <= you.feet and me.feet > you.y 
		then
	
		if me.onplat
			then
			you.y = you.y + 40
			you.feet = you.feet + 40
			you.j =  me.j - 40
			you.g = false
			you.flinch = true
			you.ft = pft
			you.health = you.health - purpleairfootdam
		else 
			if you.x <= me.x then you.x = you.x - 30
			else you.x = you.x + 30
			end
		end
	end


	elseif not x and me.spikechargetimer > spikechargetime and tempme.floor == floor
	then
	me.attack = "chargespike"
	me.stop = true
	me.busy = true
	me.im = spikeland

	mespikespecial = true
	me.dig = -130
	if dig1:isStopped() then
			dig1:play()
		else dig1:rewind()
			dig1:play()
		end
	me.invince = true


	elseif me.spikechargetimer > spikechargetime and tempme.floor == floor
	then me.stop = true
	me.im = stomps
	me.attack = "chargespike"
	me.busy = true

elseif x and me.spikechargetimer >= 0 then 
	if me.g then
	me.stop = true
	mespikeprime = true
	me.spikechargetimer = me.spikechargetimer + 1
	me.im = stomp1
	me.busy = true
	else
	mespikeairprime = true
	end
elseif mespikeairprime
	then me.im = airspike
	me.spikechargetimer = -10
	me.j = me.j - 1
	me.ptopspeed = me.j
	if me.feet - me.j > you.y and me.feet < you.feet and math.abs(me.x - you.x) < 20 and not you.invince
		then
		you.flinch = true
		you.ft = pft
		you.j = -30
		you.health = you.health - pfootairdam
		
	
	end

elseif me.spikechargetimer < 0
	then 
	me.spikechargetimer = me.spikechargetimer + 1
me.im = stomp2
me.stop = true
me.busy = true
me.jstop = true
	if me.dig < 0 and math.abs(you.mid - me.mid) < 200 and you.feet > me.feet - 130 and me.spikechargetimer < -chargespikedur and me.spikechargetimer > -130 and not you.invince
	then 
		if me.spikechargetimer < -110 then	
	you.j = 30
	you.flinch = true
	you.ft = cpft 
	you.health = you.health - cpdam
		you.g = false
			if me.mid >= you.mid then you.v = -22
			else you.v = 22
			end
		elseif not you.invince
		then
	you.j = 7
	you.flinch = true
	you.ft = cpftpoke 
	you.health = you.health - cpdampoke
		you.g = false
			if me.mid >= you.mid then you.v = -20
			else you.v = 15
			end
		end

	end

	if me.dig < 0 and me.spikechargetimer < -60 then me.im = invis
	end 





elseif mespikeprime
	then
	me.stop = true
	me.busy = true
	me.im = stomp2
	me.attack = "spike"
	me.spikechargetimer = -80
	me.v = 0
	table.insert(me.spikes, {x = me.mid + (0 ) * me.lr, y = tempme.floor , lr = me.lr, t = 0, s = 0})
	table.insert(me.spikes, {x = me.mid + (30 ) * me.lr, y = tempme.floor , lr = me.lr, t = -6, s = 0})
	table.insert(me.spikes, {x = me.mid + (65 ) * me.lr, y = tempme.floor , lr = me.lr, t = -12, s = 0})
	table.insert(me.spikes, {x = me.mid + (100 ) * me.lr, y = tempme.floor , lr = me.lr, t = -18, s = 0})
	table.insert(me.spikes, {x = me.mid + (135 ) * me.lr, y = tempme.floor , lr = me.lr, t = -24, s = 0})
	table.insert(me.spikes, {x = me.mid + (170 ) * me.lr, y = tempme.floor , lr = me.lr, t = -30, s = 0})
	table.insert(me.spikes, {x = me.mid + (205 ) * me.lr, y = tempme.floor , lr = me.lr, t = -36, s = 0})
	table.insert(me.spikes, {x = me.mid + (240 ) * me.lr, y = tempme.floor , lr = me.lr, t = -42, s = 0})
	table.insert(me.spikes, {x = me.mid + (275 ) * me.lr, y = tempme.floor , lr = me.lr, t = -48, s = 0})
	table.insert(me.spikes, {x = me.mid + (310 ) * me.lr, y = tempme.floor , lr = me.lr, t = -54, s = 0})

	for i, v in ipairs(me.spikes) do

		

		-- if i > 1 and me.spikes[i - 1].y > 0
		-- 		then
		-- me.spikes[i].y = me.spikes[i - 1].y - 60 
		-- end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60
	if v.y < 0 then table.remove(me.spikes,i) end
if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then table.remove(me.spikes,i)
	end
end

	mespikeprime = false
	me.busy = true

else 

	mespikeprime = false --this used to not exist
	me.spikechargetimer = 0
	mespikeairprime = false
	mespikespecial = false
	me.dig = 0
	me.jstop = false





end

if me.spikechargetimer < 0 or mespikespecial then me.purp = true
	else me.purp = false
	end




end















you.spikes = {}
you.spikechargetimer = 0
youspikeprime = false
youspikeairprime = false
function you.spikes.draw()
for i, v in ipairs(you.spikes) do
	
	
	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)

	


	elseif v.s == -200 and v.t > 87 then table.remove(you.spikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 65 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
elseif v.s == -1 and you.spikechargetimer > -chargespikedur-2  then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and you.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and you.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and you.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and you.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and you.spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp61, v.x, v.y, 0, v.lr, 1)

	elseif v.s == -1 and v.t > 8 then
			love.graphics.draw(sp12, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and v.t > 8 then
			love.graphics.draw(sp22, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and v.t > 8 then
			love.graphics.draw(sp32, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and v.t > 8 then
			love.graphics.draw(sp42, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and v.t > 8 then
			love.graphics.draw(sp52, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and v.t > 8 then
			love.graphics.draw(sp62, v.x, v.y, 0, v.lr, 1)

		elseif v.s == -1 and v.t > 6 then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and v.t > 6 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and v.t > 6 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and v.t > 6 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and v.t > 6 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and v.t > 6 then
			love.graphics.draw(sp61, v.x, v.y, 0, v.lr, 1)

		

	elseif v.t >= 38 and v.s == 3
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
		elseif v.t >= 38 and v.s == 4
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 2 and v.t > 4
		then
		love.graphics.draw(groundspike3, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 2 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
			elseif v.s == 4 and v.t > 4
		then
		love.graphics.draw(groundspike4, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 4 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 3 and v.t > 4
		then
		love.graphics.draw(groundspike2, v.x, v.y, 0, v.lr, 1)
	elseif v.s == 3 and v.t > 2
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
	


	elseif v.t > 38 and v.s == 0 
		then
		love.graphics.draw(purple5, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 6 and v.s == 0 
		then
		love.graphics.draw(purple4, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 4 and v.s == 0 
		then
		love.graphics.draw(purple3, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 2 and v.s == 0 
		then
		love.graphics.draw(purple2, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	elseif v.t > 0 and v.s == 0 
		then
		love.graphics.draw(purple1, v.x + 30 * v.lr, v.y, 0, v.lr, 1)
	end

	if v.t == 3 and v.s == 0 then
	if you.purpsound:isStopped() then
		you.purpsound:setPitch(.8 + (math.random() * .4) )
			you.purpsound:play()
		else you.purpsound:rewind()
			you.purpsound:setPitch(.8 + (math.random() * .4) )
			you.purpsound:play()
		end
	end

	if v.t == 3 and v.s == 2 then
	if you.airpurp:isStopped() then
			you.airpurp:play()
		else you.airpurp:rewind()
			you.airpurp:play()
		end
	end

	if v.s == -200 and v.t == 65 then
		if you.bpsound:isStopped() then
			you.bpsound:play()
		else you.bpsound:rewind()
			you.bpsound:play()
		
		end
		end

	if you.spikechargetimer == -chargespikedur - 80 - 25
		then 
		if you.cp:isStopped() then
			you.cp:play()
		else you.cp:rewind()
			you.cp:play()
		
		end
		end

end

end



function you.spikes.update()
for i, v in ipairs(you.spikes) do

	if v.y < 0 then table.remove(you.spikes,i) end

if v.s==-200
		then while (spikecheck(v.x + (150 * v.lr),v.y + 135) ~= spikecheck(v.x,v.y + 135))
			do v.y = spikecheck(v.x + 80*v.lr, v.y + 200) - 140
		end
	end

if v.s >= 2 and math.abs((v.x + (28 * v.lr)) - me.mid) < 40 and me.feet > v.y + 15 and v.y > me.y - 40 --used to be -60
				and v.t > 2
				then
				me.v = v.lr * 3
				if not (me.block and me.lr ~= v.lr) then
				me.health = me.health - aspikedamage + you.ptopspeed
				me.j = 40
				me.y = v.y - 30
				me.g = false
				me.flinch = true
				me.ft = apft
				end

elseif v.s == -200 and v.t >= 63 and math.abs((v.x + (85 * v.lr)) - me.mid) < 85 and me.feet > v.y + 15 and v.y > me.y - 140
				
				then
				me.v = v.lr * 10
				if not (me.block and me.lr ~= v.lr) then
				me.health = me.health - bspikedamage
				if v.t < 70 then
				me.j = 35
				else me.j = 10
				end
				me.y = v.y - 70
				me.g = false
				me.flinch = true
				me.ft = bpft
				end



	elseif v.s == 0 and math.abs((v.x + (58 * v.lr)) - me.mid) < 18 and me.feet > v.y + 15 and v.y > me.y - 40
				and v.t > 2
				then
				me.v = v.lr * 5
				if not (me.block and me.lr ~= v.lr) then
				me.health = me.health - spikedamage
				me.j = 9
				me.g = false
				me.flinch = true
				me.ft = pft
				me.y = me.y - 1
				end
				
				
	end

	--simultaneous remove special you.spikes
	if v.s == 0 and v.t > 40
		then table.remove(you.spikes, i)
	elseif v.s < 0 and v.s>-199 and you.spikechargetimer > -chargespikedur
		then table.remove(you.spikes, i)
			elseif v.s > 0 and v.t > 40
				then table.remove(you.spikes, i)
	elseif v.t >= 88 and v.s >= 0 then
	table.remove(you.spikes, i)
	else v.t = v.t + 1
	end

end
end

you.purp = false
me.spikepause = 0
you.dig = 0


function you.spikes.shoot(x)
you.jstop = true

if you.flinch or you.pcancel then 
	you.spikechargetimer = 0
	you.attack = "none"
	youspikeairprime = false
	youspikeprime = false

	youspikeprime = false
	you.spikechargetimer = 0
	youspikeairprime = false
	youspikespecial = false
	you.dig = 0
	you.jstop = false

-- -150
elseif youspikespecial
	then
	you.dig = you.dig + 1
	you.dodge = true
	you.block = true
	you.invince = true
you.im = invis

	if you.dig > -119 then
	youspikespecial = false
	you.invince = false
	

	elseif you.dig > -120
		then you.mid = me.mid 
		you.x = me.x
		you.xanimate = me.xanimate
		
	--purpwhatever

		pw = 20
		blatime = 10
		table.insert(you.spikes, {x = you.mid - 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid - 100, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(you.spikes, {x = you.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(you.spikes, {x = you.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(you.spikes, {x = you.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(you.spikes, {x = you.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(you.spikes, {x = you.mid + 30, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(you.spikes, {x = you.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(you.spikes, {x = you.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(you.spikes, {x = you.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(you.spikes, {x = you.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(you.spikes, {x = you.mid + 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(you.spikes, {x = you.mid - 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid - 20, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(you.spikes, {x = you.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(you.spikes, {x = you.mid - 60, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid + 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(you.spikes, {x = you.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid - 300, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(you.spikes, {x = you.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(you.spikes, {x = you.mid - 205, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(you.spikes, {x = you.mid - 205, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(you.spikes, {x = you.mid - 230, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(you.spikes, {x = you.mid + 230, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(you.spikes, {x = you.mid + 240, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(you.spikes, {x = you.mid + 300, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(you.spikes, {x = you.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(you.spikes, {x = you.mid + 275, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(you.spikes, {x = you.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	you.spikechargetimer = -150
	youspikeprime = false
	you.im = invis


	elseif you.dig > -129 then you.im = invis
		you.x = me.x
	elseif you.dig > -130 then
		you.im = dig




	

end

elseif youspikeairprime == gogo and you.spikechargetimer < 0

	then
	you.im = spikeland
	you.spikechargetimer = you.spikechargetimer + 1
	you.stop = true
	you.jstop = true
	you.busy = true

	
	
elseif you.g and youspikeairprime 
	then you.im = spikeland
	you.busy = true
	youspikeairprime = gogo
	you.spikechargetimer = -90
you.jstop = true
	you.stop = true
	if you.onplat
		then
	table.insert(you.spikes, {x = you.mid - 18, y = floor - 60, lr = 1, t = -10, s = 4} )
	table.insert(you.spikes, {x = you.mid + 18, y = floor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(you.spikes, {x = you.mid + 40, y = floor - 80, lr = 1, t = -23, s = 3} )
	table.insert(you.spikes, {x = you.mid - 40, y = floor - 80, lr = -1, t = -23, s = 3} )
	table.insert(you.spikes, {x = you.mid + 5, y = floor - 80, lr = 1, t = -18, s = 2} )
	table.insert(you.spikes, {x = you.mid - 5, y = floor - 80, lr = -1, t = -18, s = 2} )
	you.stop = true
	you.v = 0
	you.jstop = true
	you.busy = true
	if math.abs(you.x - me.x) < 20 and you.feet <= me.feet and you.feet > me.y 
		then
		
		if you.onplat
			then
			me.y = me.y + 40
			me.feet = me.feet + 40
			me.j =  you.j - 40
			me.g = false
			me.flinch = true
			me.ft = pft
			me.health = me.health - purpleairfootdam
		else if me.x <= you.x then me.x = me.x - 30
			else me.x = me.x + 30
			end
		end
	end


	elseif not x and you.spikechargetimer > spikechargetime and tempyfloor == floor
	then
	you.attack = "chargespike"
	you.stop = true
	you.busy = true
	you.im = spikeland

	youspikespecial = true
	you.dig = -130

		if dig2:isStopped() then
			dig2:play()
		else dig2:rewind()
			dig2:play()
		end

	you.invince = true


	elseif you.spikechargetimer > spikechargetime and tempyfloor == floor
	then you.stop = true
	you.im = stomps
	you.attack = "chargespike"
	you.busy = true

elseif x and you.spikechargetimer >= 0 then 
	if you.g then
	you.stop = true
	youspikeprime = true
	you.spikechargetimer = you.spikechargetimer + 1
	you.im = stomp1
	you.busy = true
	else
	youspikeairprime = true
	end
elseif youspikeairprime
	then you.im = airspike
	you.spikechargetimer = -10
	you.j = you.j - 1
	you.ptopspeed = you.j
	if you.feet - you.j > me.y and you.feet < me.feet and math.abs(you.x - me.x) < 20 and not me.invince
		then 
		me.flinch = true
		me.ft = pft
		me.j = -30
		me.health = me.health - pfootairdam
		
	
	end

elseif you.spikechargetimer < 0
	then 
	you.spikechargetimer = you.spikechargetimer + 1
you.im = stomp2
you.stop = true
you.busy = true
you.jstop = true
if you.dig < 0 and math.abs(me.mid - you.mid) < 200 and me.feet > you.feet - 130 and you.spikechargetimer < -chargespikedur and you.spikechargetimer > -130 and not me.invince
	then 
	if you.spikechargetimer < -110 then	
	me.j = 30
	me.flinch = true
	me.ft = cpft 
	me.health = me.health - cpdam
		me.g = false
	if you.mid >= me.mid then me.v = -22
	else me.v = 22
	end
elseif not me.invince
	then
	me.j = 7
	me.flinch = true
	me.ft = cpftpoke 
	me.health = me.health - cpdampoke
		me.g = false
	if you.mid >= me.mid then me.v = -15
	else me.v = 15
	end
end

end
if you.dig < 0 and you.spikechargetimer < -60 then you.im = invis
	end 





elseif youspikeprime
	then
	you.stop = true
	you.busy = true
	you.im = stomp2
	you.attack = "spike"
	you.spikechargetimer = -80
	you.v = 0
	table.insert(you.spikes, {x = you.mid + (0 ) * you.lr, y = tempyfloor , lr = you.lr, t = 0, s = 0})
	table.insert(you.spikes, {x = you.mid + (30 ) * you.lr, y = tempyfloor , lr = you.lr, t = -6, s = 0})
	table.insert(you.spikes, {x = you.mid + (65 ) * you.lr, y = tempyfloor , lr = you.lr, t = -12, s = 0})
	table.insert(you.spikes, {x = you.mid + (100 ) * you.lr, y = tempyfloor , lr = you.lr, t = -18, s = 0})
	table.insert(you.spikes, {x = you.mid + (135 ) * you.lr, y = tempyfloor , lr = you.lr, t = -24, s = 0})
	table.insert(you.spikes, {x = you.mid + (170 ) * you.lr, y = tempyfloor , lr = you.lr, t = -30, s = 0})
	table.insert(you.spikes, {x = you.mid + (205 ) * you.lr, y = tempyfloor , lr = you.lr, t = -36, s = 0})
	table.insert(you.spikes, {x = you.mid + (240 ) * you.lr, y = tempyfloor , lr = you.lr, t = -42, s = 0})
	table.insert(you.spikes, {x = you.mid + (275 ) * you.lr, y = tempyfloor , lr = you.lr, t = -48, s = 0})
	table.insert(you.spikes, {x = you.mid + (310 ) * you.lr, y = tempyfloor , lr = you.lr, t = -54, s = 0})

	for i, v in ipairs(you.spikes) do

	
		-- if i > 1 and you.spikes[i - 1].y > 0
		-- 		then
		-- you.spikes[i].y = you.spikes[i - 1].y - 60 
		-- end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60
	if v.y < 0 then table.remove(you.spikes,i) end
if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
	then	table.remove(you.spikes,i)
	--formerly then v.y = - 100
	end
end

	youspikeprime = false
	you.busy = true
else youspikeprime = false
	you.spikechargetimer = 0
	youspikeairprime = false
	youspikespecial = false
	you.dig = 0
	you.jstop = false





end

if you.spikechargetimer < 0 or youspikespecial then you.purp = true
	else you.purp = false
	end




end

