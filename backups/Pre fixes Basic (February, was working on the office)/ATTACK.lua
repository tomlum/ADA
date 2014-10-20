--if landing = true no attacking
--for all things have an interuptor to allow taking damage and being moved

--if attack.flinch = true then bla

fist1 = love.graphics.newImage("me/attack/fist1.png")
fist2 = love.graphics.newImage("me/attack/fist2.png")
fist3 = love.graphics.newImage("me/attack/fist3.png")
fistcharged = love.graphics.newImage("me/attack/fistcharged.png")
punching1 = love.graphics.newImage("me/attack/punching1.png")
punching2 = love.graphics.newImage("me/attack/punching2.png")
chargingpunch = love.graphics.newImage("me/attack/chargingpunch.png")
chargepunch = love.graphics.newImage("me/attack/chargepunch.png")
airpunch = love.graphics.newImage("me/attack/risefist.png")
risepunch = love.graphics.newImage("me/attack/risepunching.png")
fallpunch = love.graphics.newImage("me/attack/fallpunching.png")
risepunchslow = love.graphics.newImage("me/attack/risepunchingslow.png")
fallpunchslow = love.graphics.newImage("me/attack/fallpunchingslow.png")
flinch = love.graphics.newImage("me/attack/risepunching.png")
bolt = love.graphics.newImage("me/attack/bolt.png")
boltup1 = love.graphics.newImage("me/attack/boltup2.png")
boltup1left = love.graphics.newImage("me/attack/boltup2left.png")
boltthrow = love.graphics.newImage("me/attack/boltthrow.png")
flinch = love.graphics.newImage("me/attack/flinch.png")
flinchback = love.graphics.newImage("me/attack/flinchback.png")
block = love.graphics.newImage("me/attack/block.png")
boltcharged = love.graphics.newImage("me/attack/boltcharging.png")
boltrelease = love.graphics.newImage("me/attack/boltrelease.png")
airbolt = love.graphics.newImage("me/attack/airbolt.png")
airboltslow = love.graphics.newImage("me/attack/airboltslow.png")
dodge = love.graphics.newImage("me/attack/dodge.png")





youchargecounter = 0
combocounteryou = 0
attacknumberyou = 0
chargecounteryou = 0

delayycounter = 0
dodgeycounter = 0
delaymecounter = 0
dodgemecounter = 0

dodgey = function ()
	if dodgeycounter == 0 and delayycounter > 0
		then
		you.stop = true
		you.jstop = true
		delayycounter = delayycounter - 1
		you.dodge = false
	elseif dodgeycounter > 0
		then you.im = dodge
		you.v = 13
		dodgeycounter = dodgeycounter - 1
		you.dodge = true
		delayycounter = 20
		you.block = true
	elseif dodgeycounter < 0
		then you.im = dodge
		you.v = -13
		dodgeycounter = dodgeycounter + 1
		you.dodge = true
		you.block = true
		delayycounter = 20
	elseif you.block and controller2.right and dodgeycounter == 0
		then
		dodgeycounter = 14
	elseif you.block and controller2.left and dodgeycounter == 0
		then
		dodgeycounter = -14
	else you.jstop = false
		you.dodge = false
	end
	
end

dodgeme = function ()
	if dodgemecounter == 0 and delaymecounter > 0
		then
		me.stop = true
		me.jstop = true
		delaymecounter = delaymecounter - 1
		me.dodge = false
	elseif dodgemecounter > 0
		then me.im = dodge
		me.v = 13
		dodgemecounter = dodgemecounter - 1
		me.dodge = true
		delaymecounter = 20
		me.block = true
	elseif dodgemecounter < 0
		then me.im = dodge
		me.v = -13
		dodgemecounter = dodgemecounter + 1
		me.dodge = true
		me.block = true
		delaymecounter = 20
	elseif me.block and controller1.right and dodgemecounter == 0
		then
		dodgemecounter = 14
	elseif me.block and controller1.left and dodgemecounter == 0
		then
		dodgemecounter = -14
	else me.jstop = false
		me.dodge = false
	end
	
end



attackyou = function ()
	if you.landing 
	then you.busy = true
		 you.airbusy = true
		 you.airtimer = 0
		 you.firstairattack = true
	elseif you.g == false
	then you.busy = true
		you.airbusy = false


	elseif you.flinch
	then you.busy = true
		 you.airbusy = true
	else you.busy = false
		 you.airbusy = true
	end

	if controller2.a2 and you.airbusy == false and you.j > 0 and you.airtimer < 30 and you.firstairattack
	then	you.airtimer = you.airtimer + 1
	if you.slowdown
	then you.im = risepunchslow
	else
	you.im = risepunch
end


	elseif controller2.a2 and you.airbusy == false and you.j < 0 and you.airtimer < 30 and you.firstairattack
	then 
		you.airtimer = you.airtimer + 1
		if you.slowdown then
			you.im = fallpunchslow
else
			you.im = fallpunch
end
	elseif controller2.a2 and youchargecounter >= 50 and you.busy == false
	then you.stop = true
		you.im = chargingpunch

	elseif controller2.a2 and you.attacknumber == 2 and you.busy == false
	then youchargecounter = youchargecounter + 1


	elseif controller2.a2 and you.attacknumber == 1 and you.busy == false
	then youchargecounter = youchargecounter + 1

	elseif controller2.a2 and you.attacknumber == 0 and you.busy == false
	then youchargecounter = youchargecounter + 1

	elseif you.airtimer > 0 
	then you.firstairattack = false

	elseif youchargecounter > 0 and youchargecounter < 50
		then you.attacknumber = you.attacknumber + 1
		youchargecounter = 0
		combocounteryou = 0

	

	elseif youchargecounter >= 50
		then you.attacknumber = 10
		youchargecounter = 0 
		combocounteryou = 0


	else
		youchargecounter = 0
	end





end







attackme = function ()

	if controller1.block and delaymecounter == 0 and not controller1.a1 and not controller1.a2 and not controller1.a3
	then me.im = block
		me.block = true
		me.stop = true

	else me.block = false 
		me.stop = false
	end


	if controller2.block and delayycounter == 0 and not controller2.a1 and not controller2.a2 and not controller2.a3
	then you.im = block
		you.block = true
		you.stop = true

	else you.block = false
		you.stop = false
	end
	








	if me.landing 
	then me.busy = true
		 me.airbusy = true
		 me.airtimer = 0
		 me.firstairattack = true
	elseif me.g == false
	then me.busy = true
		me.airbusy = false


	elseif me.flinch
	then me.busy = true
		 me.airbusy = true
	else me.busy = false
		 me.airbusy = true
	end

	if controller1.a2 and me.airbusy == false and me.j > 0 and me.airtimer < 30 and me.firstairattack
	then	me.airtimer = me.airtimer + 1
	if me.slowdown
	then me.im = risepunchslow
	else
	me.im = risepunch
end


	elseif controller1.a2 and me.airbusy == false and me.j < 0 and me.airtimer < 30 and me.firstairattack
	then 
		me.airtimer = me.airtimer + 1
		if me.slowdown
			then me.im = fallpunchslow
		else
		me.im = fallpunch
	end

	elseif controller1.a2 and chargecounter >= 50 and me.busy == false
	then me.stop = true
		me.im = chargingpunch

	elseif controller1.a2 and me.attacknumber == 2 and me.busy == false
	then chargecounter = chargecounter + 1


	elseif controller1.a2 and me.attacknumber == 1 and me.busy == false
	then chargecounter = chargecounter + 1

	elseif controller1.a2 and me.attacknumber == 0 and me.busy == false
	then chargecounter = chargecounter + 1

	elseif me.airtimer > 0 
	then me.firstairattack = false

	elseif chargecounter > 0 and chargecounter < 50
		then me.attacknumber = me.attacknumber + 1
		chargecounter = 0
		combocounterme = 0

	

	elseif chargecounter >= 50
		then me.attacknumber = 10
		chargecounter = 0 
		combocounterme = 0


	else
		chargecounter = 0
	end

	



end



























boltspeed = 30
boltdamage = 5
punchdamage = 5
chargepunchdamage = 200
flinchtime = 30

flinchingyou = function ()
	if you.flinchtimer > flinchtime
	then you.stop = false
		you.flinch = false
		you.flinchtimer = 0

	elseif you.flinch then
	you.flinchtimer = you.flinchtimer + 1
	you.stop = true
		if you.lr * me.lr < 0
		then
		you.im = flinch
		else you.im = flinchback
		end
	end
end

flinchingme = function ()
	if me.flinchtimer > flinchtime
	then me.stop = false
		me.flinch = false
		me.flinchtimer = 0

	elseif me.flinch then
	me.flinchtimer = me.flinchtimer + 1
	me.stop = true
		if me.lr * you.lr < 0
		then
		me.im = flinch
		else me.im = flinchback
		end
	end
end







flinchchecky = function ()
if me.attack == "punch1" and (me.mid - you.mid) * me.lr > -80
	and (me.mid - you.mid) * me.lr < 0
	and you.y > me.y - 40 and you.y < me.y + 40

then 
	you.x = me.mid + 50 * me.lr - 15
	you.v = me.v + me.lr * 3
	if not you.block
	then
	you.flinch = true
	you.health = you.health - punchdamage
	end
elseif me.attack == "punch2" and (me.mid - you.mid) * me.lr > -80 
	and (me.mid - you.mid) * me.lr < 0
	and you.y > me.y - 40 and you.y < me.y + 40
then 
	you.x = me.mid + 50 * me.lr - 15
	you.v = me.v + me.lr * 3
	if not you.block
	then
	you.flinch = true
	you.health = you.health - punchdamage
	end
elseif me.attack == "punch3" and (me.mid - you.mid) * me.lr > -80 
	and (me.mid - you.mid) * me.lr < 0
	and you.y > me.y - 40 and you.y < me.y + 40
then 
	you.x = me.mid + 50 * me.lr - 15
	you.v = me.v + me.lr * 3
	if not you.block
	then
	you.health = you.health - punchdamage
	you.flinch = true
	end
elseif me.attack == "punchcharge" and (me.mid - you.mid) * me.lr > -130 
	and (me.mid - you.mid) * me.lr < 0
	and you.y > me.y - 40 and you.y < me.y + 40
then you.flinch = true
	you.x = me.mid + 50 * me.lr - 15
	you.v = 100 * me.lr
	you.health = you.health - chargepunchdamage
elseif me.attack == "punchrise" and (me.mid - you.mid) * me.lr > -74
	and (me.mid - you.mid) * me.lr < 15
 	and you.y > me.y - 96 and you.y < me.y + 14
 	then
 	you.flinch = true
	you.x = me.mid + 55 * me.lr - 15
	you.y = me.y - 50
	you.v = me.v
	you.j = me.j
	you.health = you.health - punchdamage
	elseif me.attack == "punchfall" and (me.mid - you.mid) * me.lr > -74
 	and (me.mid - you.mid) * me.lr < 15
	and you.y > me.y and you.y < me.y + 60
 	then
 	you.flinch = true
	you.x = me.mid + 55 * me.lr - 15
	you.y = me.y + 50
	you.v = me.v
	you.j = me.j
	you.health = you.health - punchdamage
	
end
end



flinchcheckme = function ()
if you.attack == "punch1" and (you.mid - me.mid) * you.lr > -80
	and (you.mid - me.mid) * you.lr < 0
	and me.y > you.y - 40 and me.y < you.y + 40

then 
	me.x = you.mid + 50 * you.lr - 15
	me.v = you.v + you.lr * 3
	if not me.block
	then
	me.flinch = true
	me.health = me.health - punchdamage
	end
elseif you.attack == "punch2" and (you.mid - me.mid) * you.lr > -80 
	and (you.mid - me.mid) * you.lr < 0
	and me.y > you.y - 40 and me.y < you.y + 40
then 
	me.x = you.mid + 50 * you.lr - 15
	me.v = you.v + you.lr * 3
	if not me.block
	then
	me.flinch = true
	me.health = me.health - punchdamage
	end
elseif you.attack == "punch3" and (you.mid - me.mid) * you.lr > -80 
	and (you.mid - me.mid) * you.lr < 0
	and me.y > you.y - 40 and me.y < you.y + 40
then 
	me.x = you.mid + 50 * you.lr - 15
	me.v = you.v + you.lr * 3
	if not me.block
	then
	me.flinch = true
	me.health = me.health - punchdamage
	end
elseif you.attack == "punchcharge" and (you.mid - me.mid) * you.lr > -130 
	and (you.mid - me.mid) * you.lr < 0
	and me.y > you.y - 40 and me.y < you.y + 40
then me.flinch = true
	me.x = you.mid + 50 * you.lr - 15
	me.v = 100 * you.lr
	me.health = me.health - chargepunchdamage
elseif you.attack == "punchcharge" and (you.mid - me.mid) * you.lr > -130 
	and (you.mid - me.mid) * you.lr < 0
	and me.y > you.y - 40 and me.y < you.y + 40
then me.flinch = true
	me.x = you.mid + 50 * you.lr - 15
	me.v = 100 * you.lr
	me.health = me.health - chargepunchdamage
elseif you.attack == "punchrise" and (you.mid - me.mid) * you.lr > -74
	and (you.mid - me.mid) * you.lr < 15
 	and me.y > you.y - 96 and me.y < you.y + 14
 	then
 	me.flinch = true
	me.x = you.mid + 55 * you.lr - 15
	me.y = you.y - 50
	me.v = you.v
	me.j = you.j
	me.health = me.health - punchdamage
elseif you.attack == "punchfall" and (you.mid - me.mid) * you.lr > -74
	and (you.mid - me.mid) * you.lr < 15
 	and me.y > you.y and me.y < you.y + 60
 	then
 	me.flinch = true
	me.x = you.mid + 55 * you.lr - 15
	me.y = you.y + 50
	me.v = you.v
	me.j = you.j
	me.health = me.health - punchdamage

	

end
end











methrowcounter = 0


meboltcombocount = 0
methrowanimatecounter = 0


youthrowcounter = 0


youboltcombocount = 0
youthrowanimatecounter = 0



youbolts = {}

function youbolts.draw()
		for i,v in ipairs(youbolts) do
			if v.upv == 0 then
		love.graphics.draw(bolt, v.x, v.y)
			elseif v.upv > 0 and v.lr > 0 then 
				love.graphics.draw(boltup1, v.x, v.y)
				elseif v.upv < 0 and v.lr > 0 then 
				love.graphics.draw(boltup1left, v.x, v.y)
				elseif v.upv > 0 and v.lr < 0 then 
				love.graphics.draw(boltup1left, v.x, v.y)
					elseif v.upv < 0 or v.lr < 0 then 
				love.graphics.draw(boltup1, v.x, v.y)

	end
	end
end




function youbolts.update()
	for i, v in ipairs(youbolts) do
		if v.time > 300
		then table.remove(youbolts, i)


	elseif v.y - v.upv + 25 > floor
		then v.y = floor - 10
	elseif (v.x + 30 + (30 * v.lr)) * v.lr < me.mid * v.lr and (v.x + 30 + (30 * v.lr)) * v.lr + boltspeed > me.mid * v.lr and not me.dodge
		and v.y > me.y and v.y < me.feet
			then table.remove(youbolts, i)
				if not me.block 
				then
				me.health = me.health - boltdamage
				end
			

	else

		v.x = v.x + boltspeed * v.lr
		v.time = v.time + 1
		if v.upv > 0
			then
		v.y = v.y - v.upv - 8
	elseif v.upv < 0
			then
		v.y = v.y - v.upv + 8
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



	if youthrowcounter > 50
	then youboltcombocount = 0
		youthrowcounter = 0
		you.prime = false
	elseif youboltcombocount < 3 and youthrowcounter > 30
		then youboltcombocount = 0
			youthrowcounter = 0

	elseif youboltcombocount < 3 and youboltcombocount > 0 then
		youthrowcounter = youthrowcounter + 1
	elseif youboltcombocount >= 3
		then
		youthrowcounter = youthrowcounter + 1
	end


	
		
		
end


youboltchargecounter = 0
youboltchargehold = 20

function youbolts.shoot()
	if youboltchargehold < 17
	then youboltchargehold = youboltchargehold + 1
		you.im = boltrelease
		you.stop = true

	elseif you.attack == "chargebolt" and not controller2.a1 
		then
		you.stop = false
		you.attack = null
		youboltchargecounter = 0
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = .1, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -.1, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 7, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -7, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -14, s = 1})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 14, s = 1})
		you.im = boltrelease
		you.prime = false
		youboltchargehold = 0
	elseif youboltchargecounter == 50
		then you.stop = true
		you.attack = "chargebolt"
		you.im = boltcharged

	elseif controller2.a1
	then
		you.prime = true
		youboltchargecounter = youboltchargecounter + 1
	


	elseif you.prime == true and youboltcombocount < 5 and not youfired
		then
		you.prime = false
		table.insert(youbolts, {x = you.mid - 30 + 30 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = you.j, s = 0})
		youfired = true
		youboltcombocount = youboltcombocount + 1
		youthrowcounter = 0
		youboltchargecounter = 0
		
	else you.prime = false
		youboltchargecounter = 0
	end
end















bolts = {}


function bolts.draw()
			for i,v in ipairs(bolts) do
			if v.upv == 0 then
		love.graphics.draw(bolt, v.x, v.y)
			elseif v.upv > 0 and v.lr > 0 then 
				love.graphics.draw(boltup1, v.x, v.y)
				elseif v.upv < 0 and v.lr > 0 then 
				love.graphics.draw(boltup1left, v.x, v.y)
				elseif v.upv > 0 and v.lr < 0 then 
				love.graphics.draw(boltup1left, v.x, v.y)
					elseif v.upv < 0 or v.lr < 0 then 
				love.graphics.draw(boltup1, v.x, v.y)


	end
	end
end

function bolts.update()
	for i, v in ipairs(bolts) do
		if v.time > 300
		then table.remove(bolts, i)

	elseif v.y - v.upv + 25 > floor
		then v.y = floor - 10
	elseif (v.x + 30 + (30 * v.lr)) * v.lr < you.mid * v.lr and (v.x + 30 + (30 * v.lr)) * v.lr + boltspeed > you.mid * v.lr and not you.dodge
	and v.y > you.y and v.y < you.feet
			then table.remove(bolts, i)
				if not you.block
				then
				you.health = you.health - boltdamage
				end	

	else
		v.x = v.x + boltspeed * v.lr
		v.time = v.time + 1
		if v.upv > 0
			then
		v.y = v.y - v.upv - 8
		elseif v.upv < 0
			then
		v.y = v.y - v.upv + 8
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



	if methrowcounter > 50
	then meboltcombocount = 0
		methrowcounter = 0
		me.prime = false
	elseif meboltcombocount < 3 and methrowcounter > 30
		then meboltcombocount = 0
			methrowcounter = 0

	elseif meboltcombocount < 3 and meboltcombocount > 0 then
		methrowcounter = methrowcounter + 1
	elseif meboltcombocount >= 3
		then
		methrowcounter = methrowcounter + 1
	end


	
end



meboltchargecounter = 0
meboltchargehold = 20

function bolts.shoot()
	
	if meboltchargehold < 17
	then meboltchargehold = meboltchargehold + 1
		me.im = boltrelease
		me.stop = true

	elseif me.attack == "chargebolt" and not controller1.a1 
		then
		me.stop = false
		me.attack = null
		meboltchargecounter = 0
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = .1, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -.1, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 7, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -7, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -14, s = 1})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 14, s = 1})
		me.im = boltrelease
		me.prime = false
		meboltchargehold = 0
	elseif meboltchargecounter == 50
		then me.stop = true
		me.attack = "chargebolt"
		me.im = boltcharged

	elseif controller1.a1
	then
		me.prime = true
		meboltchargecounter = meboltchargecounter + 1
	


	elseif me.prime == true and meboltcombocount < 5 and not mefired
		then
		me.prime = false
		table.insert(bolts, {x = me.mid - 30 + 30 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = me.j, s = 0})
		mefired = true
		meboltcombocount = meboltcombocount + 1
		methrowcounter = 0
		meboltchargecounter = 0
		
	else me.prime = false
		meboltchargecounter = 0
	end
end




















chargecounter = 0
combocounterme = 0
attacknumberme = 0






attacktimerme = function ()
	if combocounterme < 30 and me.attacknumber > 0
	then combocounterme = combocounterme + 1
	elseif combocounterme >= 30 then 
		me.attacknumber = 0
		combocounterme = 0
		me.stop = false
	end


	
	if me.v ~= 0 and me.attacknumber >=1 and me.attacknumber <= 3 
		then
		if walktimerme < 7 and combocounterme < 15 then 
		me.im = walkpunch11
	elseif walktimerme >= 7 and walktimerme < 14 and combocounterme < 15 then
		me.im = walkpunch12
	elseif walktimerme >= 14 and walktimerme < 21 and combocounterme < 15 then
		me.im = walkpunch13
	elseif walktimerme >= 21 and walktimerme < 28 and combocounterme < 15 then
		me.im = walkpunch14
	elseif walktimerme >= 28 and walktimerme < 35 and combocounterme < 15 then
		me.im = walkpunch15
	end


	elseif me.v ~= 0 and mefired and me.j == 0
		then
		if walktimerme < 7 and combocounterme < 15 then 
		me.im = walkpunch21
	elseif walktimerme >= 7 and walktimerme < 14 and combocounterme < 15 then
		me.im = walkpunch22
	elseif walktimerme >= 14 and walktimerme < 21 and combocounterme < 15 then
		me.im = walkpunch23
	elseif walktimerme >= 21 and walktimerme < 28 and combocounterme < 15 then
		me.im = walkpunch24
	elseif walktimerme >= 28 and walktimerme < 35 and combocounterme < 15 then
		me.im = walkpunch15
	end


	
	elseif me.v == 0
	then
	if
	me.attacknumber == 1 and combocounterme < 15
	then me.im = punching1
		--sub if for the various walk cycles conditions
	elseif me.attacknumber == 2 and combocounterme < 15
	then me.im = punching2
	elseif me.attacknumber == 3 and combocounterme < 15
	then me.im = punching1
	elseif me.attacknumber == 10 then 
		me.im = chargepunch
		me.stop = true

end
end
end



attacktimeryou = function ()
	if combocounteryou < 30 and you.attacknumber > 0
	then combocounteryou = combocounteryou + 1
	elseif combocounteryou >= 30 then 
		you.attacknumber = 0
		combocounteryou = 0
		you.stop = false
	end


	
	if you.v ~= 0 and you.attacknumber >=1 and you.attacknumber <= 3 
		then
		if walktimery < 7 and combocounteryou < 15 then 
		you.im = walkpunch11
	elseif walktimery >= 7 and walktimery < 14 and combocounteryou < 15 then
		you.im = walkpunch12
	elseif walktimery >= 14 and walktimery < 21 and combocounteryou < 15 then
		you.im = walkpunch13
	elseif walktimery >= 21 and walktimery < 28 and combocounteryou < 15 then
		you.im = walkpunch14
	elseif walktimery >= 28 and walktimery < 35 and combocounteryou < 15 then
		you.im = walkpunch15
	end

	elseif you.v ~= 0 and youfired and you.j == 0
		then
		if walktimery < 7 and combocounteryou < 15 then 
		you.im = walkpunch21
	elseif walktimery >= 7 and walktimery < 14 and combocounteryou < 15 then
		you.im = walkpunch22
	elseif walktimery >= 14 and walktimery < 21 and combocounteryou < 15 then
		you.im = walkpunch23
	elseif walktimery >= 21 and walktimery < 28 and combocounteryou < 15 then
		you.im = walkpunch24
	elseif walktimery >= 28 and walktimery < 35 and combocounteryou < 15 then
		you.im = walkpunch25
	end



	
	elseif you.v == 0
	then
	if
	you.attacknumber == 1 and combocounteryou < 15
	then you.im = punching1
		--sub if for the various walk cycles conditions
	elseif you.attacknumber == 2 and combocounteryou < 15
	then you.im = punching2
	elseif you.attacknumber == 3 and combocounteryou < 15
	then you.im = punching1
	elseif you.attacknumber == 10 then 
		you.im = chargepunch
		you.stop = true

end
end
end



throwme = function ()

	if me.im == risepunch or me.im == risepunchslow 
	then love.graphics.draw(airpunch, me.mid + 9 * me.lr, me.y - 34, 0, me.lr, 1)
	me.attack = "punchrise"
	elseif me.attack == "chargebolt"
	then me.attack = me.attack
	elseif me.im == fallpunch or me.im == fallpunchslow
	then love.graphics.draw(airpunch, me.mid + 9 * me.lr, me.y + 80, 0, me.lr, -1)
	me.attack = "punchfall"

	elseif me.attacknumber == 1 and combocounterme < 6 
	then love.graphics.draw(fist1, me.xanimate + 21 * me.lr, me.y + 14, 0, me.lr, 1)
	me.attack = "punch1"
	elseif me.attacknumber == 2 and combocounterme < 6 
	then love.graphics.draw(fist2, me.xanimate + 19 * me.lr, me.y + 14, 0, me.lr, 1)
	me.attack = "punch2"
	elseif me.attacknumber == 3 and combocounterme < 6 
	then love.graphics.draw(fist3, me.xanimate + 21 * me.lr, me.y + 14, 0, me.lr, 1)
	me.attack = "punch3"
	elseif me.im == chargepunch
	then love.graphics.draw(fistcharged, me.xanimate + 21 * me.lr, me.y + 3, 0, me.lr, 1)
	me.attack = "punchcharge"
	else me.attack = "null"

		

end
end

throwyou = function ()

	if you.im == risepunch or you.im == risepunchslow
	then love.graphics.draw(airpunch, you.mid + 9 * you.lr, you.y - 34, 0, you.lr, 1)
	you.attack = "punchrise"
	elseif you.attack == "chargebolt"
	then you.attack = you.attack
	elseif you.im == fallpunch or you.im == fallpunchslow
	then love.graphics.draw(airpunch, you.mid + 9 * you.lr, you.y + 80, 0, you.lr, -1)
	you.attack = "punchfall"

	elseif you.attacknumber == 1 and combocounteryou < 6 
	then love.graphics.draw(fist1, you.xanimate + 21 * you.lr, you.y + 14, 0, you.lr, 1)
	you.attack = "punch1"
	elseif you.attacknumber == 2 and combocounteryou < 6 
	then love.graphics.draw(fist2, you.xanimate + 19 * you.lr, you.y + 14, 0, you.lr, 1)
	you.attack = "punch2"
	elseif you.attacknumber == 3 and combocounteryou < 6 
	then love.graphics.draw(fist3, you.xanimate + 21 * you.lr, you.y + 14, 0, you.lr, 1)
	you.attack = "punch3"
	elseif you.im == chargepunch
	then love.graphics.draw(fistcharged, you.xanimate + 21 * you.lr, you.y + 3, 0, you.lr, 1)
	you.attack = "punchcharge"
	else you.attack = "null"

		

end
end
