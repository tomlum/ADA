
spikes = {}
spiketimer = 0
spikechargetimer = 0
spikecooldown = 15

mespikeprime = false
mespikeairprime = false
metopspeed = 0
youtopspeed = 0

spikespace = 10


function spikes.draw()

for i, v in ipairs(spikes) do
	
	if v.y < 0 then table.remove(spikes,i) end


	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -200 and v.t > 87 then table.remove(spikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 65 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	
elseif v.s == -1 and spikechargetimer > -chargespikedur-2  then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and spikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and spikechargetimer > -chargespikedur-2 then
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

		if distan(v.x,v.y,me.x,me.y) < distan(v.x,v.y,you.x,you.y) then
				closestp1 = distan(v.x,v.y,me.x,me.y)
			else closestp1 = distan(v.x,v.y,you.x,you.y)
			end

			if closestp1 >= 2000 then disadj1 = .54
			else disadj1 = .54 - ((math.abs(closestp1-2000)/2000) * .54)
			end
			purp1:setVolume(SFXV-.3-adj-disadj1)



	if purp1:isStopped() then
			purp1:setPitch(.8 + (math.random() * .4) )
			purp1:play()
		else purp1:rewind()
			purp1:setPitch(.8 + (math.random() * .4) )
			purp1:play()
		end
	end

	if v.t == 3 and v.s == 2 then
	if airpurp1:isStopped() then
			airpurp1:play()
		else airpurp1:rewind()
			airpurp1:play()
		end
	end

	if v.s == -200 and v.t == 65 then
		if bp2:isStopped() then
			bp2:play()
		else bp2:rewind()
			bp2:play()
		
		end
		end

		if spikechargetimer == -chargespikedur - 80 -25
		then 
		if cp1:isStopped() then
			cp1:play()
		else cp1:rewind()
			cp1:play()
		
		end
		end


end

end



function spikes.update()
for i, v in ipairs(spikes) do

if v.y < 0 then table.remove(spikes,i) end

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
				you.health = you.health - aspikedamage + metopspeed
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

	--simultaneous remove special spikes
	if v.s == 0 and v.t > 40
		then table.remove(spikes, i)
	elseif v.s < 0 and v.s > -199 and spikechargetimer > -chargespikedur
		then table.remove(spikes, i)
			elseif v.s > 0 and v.t > 40
				then table.remove(spikes, i)
	elseif v.t >= 88 and v.s >= 0 then
	table.remove(spikes, i)
	else v.t = v.t + 1
	end

end
end

mepurp = false
mespikepause = 0
medig = 0


function spikes.shoot(x)

if me.flinch or mpcancel then 
	spikechargetimer = 0
	me.attack = "none"
	mespikeairprime = false
	mespikeprime = false
	--added this 
	mespikeprime = false --this used to not exist
	spikechargetimer = 0
	mespikeairprime = false
	mespikespecial = false
	medig = 0

-- -150
elseif mespikespecial
	then
	medig = medig + 1
	me.dodge = true
	me.block = true
	me.invince = true
	me.im = invis

	if medig > -119 then
	mespikespecial = false
	me.invince = false
	

	elseif medig > -120
		then me.mid = you.mid 
		me.x = you.x
		me.xanimate = you.xanimate
		
	--purpwhatever
	pw = 20

		blatime = 10
		table.insert(spikes, {x = me.mid - 30, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 100, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 75, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 75, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 75, y = mefloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 75, y = mefloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(spikes, {x = me.mid + 30, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 75, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 75, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 75, y = mefloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 75, y = mefloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(spikes, {x = me.mid - 25, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 80, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(spikes, {x = me.mid - 80, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 20, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 25, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(spikes, {x = me.mid - 60, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 30, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(spikes, {x = me.mid - 200, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 300, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 200, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 205, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 205, y = mefloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 230, y = mefloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 230, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 240, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid + 300, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 275, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 275, y = mefloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 275, y = mefloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	
spikechargetimer = -150
	mespikeprime = false
	me.im = invis


	elseif medig > -129 then me.im = invis
		me.x = you.x
	elseif medig > -130 then
		me.im = dig




	

end

elseif mespikeairprime == gogo and spikechargetimer < 0
	then
	me.im = spikeland
	spikechargetimer = spikechargetimer + 1
	me.stop = true
	me.jstop = true
	me.busy = true

	
	
elseif me.g and mespikeairprime
	then me.im = spikeland
	me.busy = true
	mespikeairprime = gogo
	spikechargetimer = -90
	me.jstop = true
	me.stop = true



	if me.onplat
		then
	table.insert(spikes, {x = me.mid - 18, y = mefloor - 60, lr = 1, t = -10, s = 4} )
	table.insert(spikes, {x = me.mid + 18, y = mefloor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(spikes, {x = me.mid + 40, y = mefloor - 80, lr = 1, t = -23, s = 3} )
	table.insert(spikes, {x = me.mid - 40, y = mefloor - 80, lr = -1, t = -23, s = 3} )
	table.insert(spikes, {x = me.mid + 5, y = mefloor - 80, lr = 1, t = -18, s = 2} )
	table.insert(spikes, {x = me.mid - 5, y = mefloor - 80, lr = -1, t = -18, s = 2} )
	table.insert(spikes, {x = me.mid + 75, y = mefloor - 80, lr = 1, t = -28, s = 3} )
	table.insert(spikes, {x = me.mid - 75, y = mefloor - 80, lr = -1, t = -28, s = 3} )
	

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


	elseif not x and spikechargetimer > spikechargetime and tempmefloor == mefloor
	then
	me.attack = "chargespike"
	me.stop = true
	me.busy = true
	me.im = spikeland

	mespikespecial = true
	medig = -130
	if dig1:isStopped() then
			dig1:play()
		else dig1:rewind()
			dig1:play()
		end
	me.invince = true


	elseif spikechargetimer > spikechargetime and tempmefloor == mefloor
	then me.stop = true
	me.im = stomps
	me.attack = "chargespike"
	me.busy = true

elseif x and spikechargetimer >= 0 then 
	if me.g then
	me.stop = true
	mespikeprime = true
	spikechargetimer = spikechargetimer + 1
	me.im = stomp1
	me.busy = true
	else
	mespikeairprime = true
	end
elseif mespikeairprime
	then me.im = airspike
	spikechargetimer = -10
	me.j = me.j - 1
	metopspeed = me.j
	if me.feet - me.j > you.y and me.feet < you.feet and math.abs(me.x - you.x) < 20 and not you.invince
		then
		you.flinch = true
		you.ft = pft
		you.j = -30
		you.health = you.health - pfootairdam
		
	
	end

elseif spikechargetimer < 0
	then 
	spikechargetimer = spikechargetimer + 1
me.im = stomp2
me.stop = true
me.busy = true
me.jstop = true
	if medig < 0 and math.abs(you.mid - me.mid) < 200 and you.feet > me.feet - 130 and spikechargetimer < -chargespikedur and spikechargetimer > -130 and not you.invince
	then 
		if spikechargetimer < -110 then	
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

	if medig < 0 and spikechargetimer < -60 then me.im = invis
	end 





elseif mespikeprime
	then
	me.stop = true
	me.busy = true
	me.im = stomp2
	me.attack = "spike"
	spikechargetimer = -80
	me.v = 0
	table.insert(spikes, {x = me.mid + (0 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = 0, s = 0})
	table.insert(spikes, {x = me.mid + (30 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -6, s = 0})
	table.insert(spikes, {x = me.mid + (65 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -12, s = 0})
	table.insert(spikes, {x = me.mid + (100 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -18, s = 0})
	table.insert(spikes, {x = me.mid + (135 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -24, s = 0})
	table.insert(spikes, {x = me.mid + (170 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -30, s = 0})
	table.insert(spikes, {x = me.mid + (205 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -36, s = 0})
	table.insert(spikes, {x = me.mid + (240 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -42, s = 0})
	table.insert(spikes, {x = me.mid + (275 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -48, s = 0})
	table.insert(spikes, {x = me.mid + (310 + math.random(spikespace)) * me.lr, y = tempmefloor , lr = me.lr, t = -54, s = 0})

	for i,v in ipairs(spikes) do


	

	
		if v.s == 0 and spikecheck(v.x + (80 * v.lr), v.y-1) ~= spikecheck(v.x, v.y-1)
		then 
		v.y = -100
	end

	if v.s == 0 and v.y > 0 then v.y = spikecheck(v.x + (80 * v.lr), v.y - 1) - 60 end



	if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(spikes,i) end
end

	mespikeprime = false
	me.busy = true

else 

	mespikeprime = false --this used to not exist
	spikechargetimer = 0
	mespikeairprime = false
	mespikespecial = false
	medig = 0





end

if spikechargetimer < 0 or mespikespecial then mepurp = true
	else mepurp = false
	end




end















youspikes = {}
youspikechargetimer = 0
youspikeprime = false
youspikeairprime = false
function youspikes.draw()
for i, v in ipairs(youspikes) do
	
	if v.y < 0 then table.remove(youspikes,i) end
	
	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)

	


	elseif v.s == -200 and v.t > 87 then table.remove(youspikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 65 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t >= 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
elseif v.s == -1 and youspikechargetimer > -chargespikedur-2  then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and youspikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and youspikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and youspikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and youspikechargetimer > -chargespikedur-2 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and youspikechargetimer > -chargespikedur-2 then
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

			if distan(v.x,v.y,me.x,me.y) < distan(v.x,v.y,you.x,you.y) then
				closestp2 = distan(v.x,v.y,me.x,me.y)
			else closestp2 = distan(v.x,v.y,you.x,you.y)
			end

			if closestp2 >= 2000 then disadj2 = .54
			else disadj2 = .54 - ((math.abs(closestp2-2000)/2000) * .54)
			end
			purp2:setVolume(SFXV-.3-adj-disadj2)




	if purp2:isStopped() then
		purp2:setPitch(.8 + (math.random() * .4) )
			purp2:play()
		else purp2:rewind()
			purp2:setPitch(.8 + (math.random() * .4) )
			purp2:play()
		end
	end

	if v.t == 3 and v.s == 2 then
	if airpurp2:isStopped() then
			airpurp2:play()
		else airpurp2:rewind()
			airpurp2:play()
		end
	end

	if v.s == -200 and v.t == 65 then
		if bp1:isStopped() then
			bp1:play()
		else bp1:rewind()
			bp1:play()
		
		end
		end

	if youspikechargetimer == -chargespikedur - 80 - 25
		then 
		if cp2:isStopped() then
			cp2:play()
		else cp2:rewind()
			cp2:play()
		
		end
		end

end

end



function youspikes.update()
for i, v in ipairs(youspikes) do

	if v.y < 0 then table.remove(youspikes,i) end

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
				me.health = me.health - aspikedamage + youtopspeed
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

	--simultaneous remove special youspikes
	if v.s == 0 and v.t > 40
		then table.remove(youspikes, i)
	elseif v.s < 0 and v.s>-199 and youspikechargetimer > -chargespikedur
		then table.remove(youspikes, i)
			elseif v.s > 0 and v.t > 40
				then table.remove(youspikes, i)
	elseif v.t >= 88 and v.s >= 0 then
	table.remove(youspikes, i)
	else v.t = v.t + 1
	end

end
end

youpurp = false
mespikepause = 0
youdig = 0


function youspikes.shoot(x)

if you.flinch or ypcancel then 
	youspikechargetimer = 0
	you.attack = "none"
	youspikeairprime = false
	youspikeprime = false

	youspikeprime = false
	youspikechargetimer = 0
	youspikeairprime = false
	youspikespecial = false
	youdig = 0

-- -150
elseif youspikespecial
	then
	youdig = youdig + 1
	you.dodge = true
	you.block = true
	you.invince = true
you.im = invis

	if youdig > -119 then
	youspikespecial = false
	you.invince = false
	

	elseif youdig > -120
		then you.mid = me.mid 
		you.x = me.x
		you.xanimate = me.xanimate
		
	--purpwhatever

		pw = 20
		blatime = 10
		table.insert(youspikes, {x = you.mid - 30, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 100, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 75, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid - 75, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid - 75, y = youfloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid - 75, y = youfloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(youspikes, {x = you.mid + 30, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 75, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 75, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 75, y = youfloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid + 75, y = youfloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(youspikes, {x = you.mid - 25, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 80, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(youspikes, {x = you.mid - 80, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 20, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 25, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(youspikes, {x = you.mid - 60, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 30, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(youspikes, {x = you.mid - 200, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 300, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 200, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid - 205, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid - 205, y = youfloor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid - 230, y = youfloor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 230, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 240, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid + 300, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 275, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 275, y = youfloor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid + 275, y = youfloor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})

	youspikechargetimer = -150
	youspikeprime = false
	you.im = invis


	elseif youdig > -129 then you.im = invis
		you.x = me.x
	elseif youdig > -130 then
		you.im = dig




	

end

elseif youspikeairprime == gogo and youspikechargetimer < 0

	then
	you.im = spikeland
	youspikechargetimer = youspikechargetimer + 1
	you.stop = true
	you.jstop = true
	you.busy = true

	
	
elseif you.g and youspikeairprime 
	then you.im = spikeland
	you.busy = true
	youspikeairprime = gogo
	youspikechargetimer = -90
you.jstop = true
	you.stop = true
	if you.onplat
		then
	table.insert(youspikes, {x = you.mid - 18, y = youfloor - 60, lr = 1, t = -10, s = 4} )
	table.insert(youspikes, {x = you.mid + 18, y = youfloor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(youspikes, {x = you.mid + 40, y = youfloor - 80, lr = 1, t = -23, s = 3} )
	table.insert(youspikes, {x = you.mid - 40, y = youfloor - 80, lr = -1, t = -23, s = 3} )
	table.insert(youspikes, {x = you.mid + 5, y = youfloor - 80, lr = 1, t = -18, s = 2} )
	table.insert(youspikes, {x = you.mid - 5, y = youfloor - 80, lr = -1, t = -18, s = 2} )
	table.insert(youspikes, {x = you.mid + 75, y = youfloor - 80, lr = 1, t = -28, s = 3} )
	table.insert(youspikes, {x = you.mid - 75, y = youfloor - 80, lr = -1, t = -28, s = 3} )
	

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


	elseif not x and youspikechargetimer > spikechargetime and tempyfloor == youfloor
	then
	you.attack = "chargespike"
	you.stop = true
	you.busy = true
	you.im = spikeland

	youspikespecial = true
	youdig = -130

		if dig2:isStopped() then
			dig2:play()
		else dig2:rewind()
			dig2:play()
		end

	you.invince = true


	elseif youspikechargetimer > spikechargetime and tempyfloor == youfloor
	then you.stop = true
	you.im = stomps
	you.attack = "chargespike"
	you.busy = true

elseif x and youspikechargetimer >= 0 then 
	if you.g then
	you.stop = true
	youspikeprime = true
	youspikechargetimer = youspikechargetimer + 1
	you.im = stomp1
	you.busy = true
	else
	youspikeairprime = true
	end
elseif youspikeairprime
	then you.im = airspike
	youspikechargetimer = -10
	you.j = you.j - 1
	youtopspeed = you.j
	if you.feet - you.j > me.y and you.feet < me.feet and math.abs(you.x - me.x) < 20 and not me.invince
		then 
		me.flinch = true
		me.ft = pft
		me.j = -30
		me.health = me.health - pfootairdam
		
	
	end

elseif youspikechargetimer < 0
	then 
	youspikechargetimer = youspikechargetimer + 1
you.im = stomp2
you.stop = true
you.busy = true
you.jstop = true
if youdig < 0 and math.abs(me.mid - you.mid) < 200 and me.feet > you.feet - 130 and youspikechargetimer < -chargespikedur and youspikechargetimer > -130 and not me.invince
	then 
	if youspikechargetimer < -110 then	
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
if youdig < 0 and youspikechargetimer < -60 then you.im = invis
	end 





elseif youspikeprime
	then
	you.stop = true
	you.busy = true
	you.im = stomp2
	you.attack = "spike"
	youspikechargetimer = -80
	you.v = 0
	table.insert(youspikes, {x = you.mid + (0 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = 0, s = 0})
	table.insert(youspikes, {x = you.mid + (30 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -6, s = 0})
	table.insert(youspikes, {x = you.mid + (65 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -12, s = 0})
	table.insert(youspikes, {x = you.mid + (100 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -18, s = 0})
	table.insert(youspikes, {x = you.mid + (135 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -24, s = 0})
	table.insert(youspikes, {x = you.mid + (170 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -30, s = 0})
	table.insert(youspikes, {x = you.mid + (205 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -36, s = 0})
	table.insert(youspikes, {x = you.mid + (240 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -42, s = 0})
	table.insert(youspikes, {x = you.mid + (275 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -48, s = 0})
	table.insert(youspikes, {x = you.mid + (310 + math.random(spikespace)) * you.lr, y = tempyfloor , lr = you.lr, t = -54, s = 0})

	for i, v in ipairs(youspikes) do

		
	if spikecheck(v.x + (80 * v.lr), v.y-1) ~= spikecheck(v.x, v.y-1)
	then v.y = -100
	end

	if v.s == 0 and v.y > 0 then v.y = spikecheck(v.x + (80 * v.lr), v.y - 1) - 60 end
	

	if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
		if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
		if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
		if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
		if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
		if themap == "library" and v.y >= 1900 - 100 and v.x >= 1407 then table.remove(youspikes,i) end
	


end

	youspikeprime = false
	you.busy = true
else youspikeprime = false
	youspikechargetimer = 0
	youspikeairprime = false
	youspikespecial = false
	youdig = 0





end

if youspikechargetimer < 0 or youspikespecial then youpurp = true
	else youpurp = false
	end




end

