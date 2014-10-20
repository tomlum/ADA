--if you try charging blue during the charging punch it's weird


--adjust order depending on actionshot so blade is always in front, pretty easy
--use microsoft word replace to copy and paste to number 2
--make purple ground thing happen sooner?
--air spike damage > the higher up you were?
--make purple come up faster?
--MAKE BLUE MORE LIKE A SWORD?  HAVE AN OTHER VARIETY OF MELEE ATTACK?
--charge blue isn't a big punch, but like a big sword slice where like, big slash
--add groudn flying up fro blue swipes?

--speed + purple = surf on the spikes
--JUST THE PERSON KNOCKS THEM THROUGH THE FLOOR for air attack
--TEST MAKE SURE YOU CAN'T USE ATTACKS AT THE SAME TIME, ESPECIALLY IN AIR
--for combo attacks, make sure the solo attacks say "controller1.a1 and not controller1.a2-3"
--or something, that might not fix it
--maybe if in close range the green attack pushes you back
--maybe rotate bolts so they look better, use trig
--can go down while air spike
--temp unable to use attacks?




punchprep = love.graphics.newImage("me/attack/punchprep.png")
bluearm = love.graphics.newImage("me/attack/bluearm.png")
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
dodgeback = love.graphics.newImage("me/attack/dodgeback.png")
dodgeback2 = love.graphics.newImage("me/attack/dodgeback2.png")
dodge = love.graphics.newImage("me/attack/dodge.png")
dodge2 = love.graphics.newImage("me/attack/dodge2.png")
dodge21 = love.graphics.newImage("me/attack/dodge21.png")
stomp1 = love.graphics.newImage("me/attack/stomp1.png")
stomp2 = love.graphics.newImage("me/attack/stomp2.png")
purple1 = love.graphics.newImage("me/attack/purple21.png")
purple2 = love.graphics.newImage("me/attack/purple22.png")
purple3 = love.graphics.newImage("me/attack/purple23.png")
purple4 = love.graphics.newImage("me/attack/purple24.png")
purple5 = love.graphics.newImage("me/attack/purple23.png")
airspike = love.graphics.newImage("me/attack/airspike.png")
spikeland = love.graphics.newImage("me/attack/spikeland.png")
groundspike1 = love.graphics.newImage("me/attack/groundspike21.png")
groundspike2 = love.graphics.newImage("me/attack/groundspike22.png")
groundspike3 = love.graphics.newImage("me/attack/groundspike23.png")
groundspike4 = love.graphics.newImage("me/attack/groundspike3.png")
sp12 = love.graphics.newImage("me/attack/sp112.png")
sp22 = love.graphics.newImage("me/attack/sp122.png")
sp32 = love.graphics.newImage("me/attack/sp132.png")
sp42 = love.graphics.newImage("me/attack/sp142.png")
sp52 = love.graphics.newImage("me/attack/sp52.png")
sp62 = love.graphics.newImage("me/attack/sp62.png")

sp11 = love.graphics.newImage("me/attack/sp111.png")
sp21 = love.graphics.newImage("me/attack/sp121.png")
sp31 = love.graphics.newImage("me/attack/sp131.png")
sp41 = love.graphics.newImage("me/attack/sp141.png")
sp51 = love.graphics.newImage("me/attack/sp51.png")
sp61 = love.graphics.newImage("me/attack/sp61.png")
stomps = love.graphics.newImage("me/attack/stomps.png")
dig = love.graphics.newImage("me/attack/dig.png")
invis = love.graphics.newImage("me/attack/invis.png")
blue1start = love.graphics.newImage("me/attack/blue1start.png")
blue2start = love.graphics.newImage("me/attack/blue2start.png")
blue3start = love.graphics.newImage("me/attack/blue3start.png")
blue1end = love.graphics.newImage("me/attack/blue1end.png")
blue2end = love.graphics.newImage("me/attack/blue2end.png")
blue3end = love.graphics.newImage("me/attack/blue3end.png")
blue11 = love.graphics.newImage("me/attack/blue11.png")
blue12 = love.graphics.newImage("me/attack/blue12.png")
blue23 = love.graphics.newImage("me/attack/blue23.png")
blue22 = love.graphics.newImage("me/attack/blue22.png")
blue21 = love.graphics.newImage("me/attack/blue21.png")
blue31 = love.graphics.newImage("me/attack/blue31.png")
bc1 = love.graphics.newImage("me/attack/bc1.png")
bc2 = love.graphics.newImage("me/attack/bc12.png")
bc3 = love.graphics.newImage("me/attack/bc3.png")
bcend = love.graphics.newImage("me/attack/bcend.png")
bluecharging = love.graphics.newImage("me/attack/bluecharging.png")




function mearmsreach(range)
	if ((you.mid - me.mid) * me.lr) < range
		and (you.mid - me.mid) * me.lr > 0
		then return true
	else return false
end
end

function youarmsreach(range)
	if ((me.mid - you.mid) * you.lr) < range
		and (me.mid - you.mid) * you.lr > 0
		then return true
	else return false
end
end

function sameheight()
if math.abs(me.y - you.y) < 40 then
	return true 
else return false
end
end





youchargecounter = 0
combocounteryou = 0
attacknumberyou = 0
chargecounteryou = 0

delayycounter = 0
dodgeycounter = 0
delaymecounter = 0
dodgemecounter = 0
dodgetime = 27
delaytime = 17
dodgespeed = 13

bluedam = 15
bluechargetimer = 0

youdodgeanimatetimer = 0


mebluepause = 0
menext = 0
mbp = 0
md = 0
bluechargetime = 50
function blueblade(x)
	local xdif = (you.mid - me.mid) * me.lr

	if mebluepause <= 0 then 
		menext = 0
		bluechargetimer = 0
	end


	if menext == "nevergonnahappen"
		then menext = "oh it happened"

	elseif bluechargetimer > bluechargetime and not x
		then
		if menext == 19 then me.im = bc1
			md = 12
		elseif menext==20 then me.im = bc2 
			md = 24
			if mearmsreach(170) and sameheight() and not you.invince then 
				you.flinch = true
				you.ft = bcft
				actionshot = true
				you.v = 80 * me.lr
				you.health = you.health - bluechargedam
			end
		elseif menext==21 then me.im = bc2 
			md = 24
		elseif menext==22 then me.im = bc3 
			md = 12
		elseif menext==23 then me.im = bcend
			md = 0
		end


	elseif bluechargetimer > bluechargetime and x
		then me.im = bluecharging
		mebluepause = 30
		md = 24
		menext = 18
		







	elseif menext == 6
		then me.im = blue23
		md = 0
	elseif menext == 5
		then me.im = blue22
		md = 8
		if mearmsreach(160) and sameheight() and not you.dodge and not you.block
			then 
			you.v = me.v + (me.lr * 4)
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
		end

	elseif menext == 4 and not x
		then me.im = blue21
		if controller1.right or controller1.left then
			me.v = me.v + (me.lr * 8)
		else
		me.v = me.v + (4 * me.lr)
		end
		md = 12
		bluechargetimer = 0
	elseif x and menext == 3 or menext == 4 then 
		me.im = blue2start
		menext = 4
		mebluepause = 28
		bluechargetimer = bluechargetimer + 1




	elseif menext == 3 then
		me.im = blue1end
		me.stop = true
		md = 0
	elseif menext == 2
		then
		me.im = blue12
		md = 12
		if mearmsreach(160) and sameheight() and not you.dodge and not you.block
			then 
			you.v = me.v + (me.lr * 4)
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
		end
	elseif menext == 1 and not x then
		me.im = blue11
		md = 24
		if controller1.right or controller1.left then
			me.v = me.v + (me.lr * 10)
		elseif
			controller1.left and me.lr < 0 then 
			me.v = me.v - 14
		else
		me.v = me.v + (6 * me.lr)

		end
		bluechargetimer = 0
	elseif x and menext == 0 or menext == 1 then 
		me.im = blue1start
		menext = 1
		mebluepause = 23
		bluechargetimer = bluechargetimer + 1
	else md = 0
		bluechargetimer = 0
			
	
	end

if mbp > -100 
		then
		mbp = mbp - md
	end

	if mbp == 0
		then menext = menext + 1
		mbp = 24
	end

	


	if mebluepause > 0
		then
	mebluepause = mebluepause - 1
	me.stop = true
	end
end



dodgey = function ()


	if you.flinch 
			then me.dodgecounter = 0
			you.jstop = false
		you.dodge = false
		you.dodgetype = "none"
		you.pause = false
	end

	if dodgeycounter == 0 and delayycounter > 0
		then
		
		you.stop = true
		you.jstop = true
		delayycounter = delayycounter - 1
		you.dodge = false
		if you.dodgetype == "front2" or you.dodgetype == "back2"
		then 
		you.x = you.x - 1 * you.lr
		else you.x = you.x + 2 * you.lr
		you.pause = false
		end

		


		if you.flinch 
			then me.dodgecounter = 0
			you.jstop = false
		you.dodge = false
		you.dodgetype = "none"
		you.pause = false
	end


	elseif dodgeycounter > 0
		then 

		if you.dodgetype == "front"
		then	you.im = dodge
		if leftyy and not rightyy
			then you.dodgetype = "front2"
			you.im = dodge2
			you.pause = true
			dodgeycounter = 5
		end
		elseif you.dodgetype == "front2"
		then
		you.im = dodge2
		you.pause = true
		elseif you.dodgetype == "back2"
			then 
			you.im = dodgeback2
			you.pause = true

		elseif you.dodgetype == "back"
		then
		you.im = dodgeback
		if you.lr < 0
		then 
		you.im = dodgeback2
		you.dodgetype = "back2"
		you.pause = true
		end
		end



		you.v = dodgespeed
		dodgeycounter = dodgeycounter - 1
		you.dodge = true
		delayycounter = delaytime
		you.block = true
	elseif dodgeycounter < 0
		then 

		if you.dodgetype == "front"
		then	you.im = dodge
		if rightyy and not leftyy
			then you.dodgetype = "front2"
			you.im = dodge2
			you.pause = true
			dodgeycounter = -5
		end
		elseif you.dodgetype == "front2"
		then
		you.im = dodge2
		you.pause = true
		elseif you.dodgetype == "back2"
			then 
			you.im = dodgeback2
			you.pause = true

		elseif you.dodgetype == "back"
		then
		you.im = dodgeback
		if you.lr > 0
		then 
		you.im = dodgeback2
		you.dodgetype = "back2"
		you.pause = true
		end
		end



		you.v = - dodgespeed
		dodgeycounter = dodgeycounter + 1
		you.dodge = true
		delayycounter = delaytime
		you.block = true
	elseif you.block and controller2.right and dodgeycounter == 0 and not you.slide
		then
		you.dodge = true
		you.stop = false
		dodgeycounter = dodgetime
		if you.leftface
			then
			you.dodgetype = "back"
			dodgeycounter = dodgeycounter - 11
			else you.dodgetype = "front"
		end
	elseif you.block and controller2.left and dodgeycounter == 0 and not you.slide
		then
		you.dodge = true
		you.stop = false
		dodgeycounter = - dodgetime
		if not you.leftface
			then
			you.dodgetype = "back"
			dodgeycounter = dodgeycounter + 11
			else you.dodgetype = "front"
		end
	else you.jstop = false
		you.dodge = false
		you.dodgetype = "none"
		you.pause = false

	end

	if you.im == dodge2
	then 
		if youdodgeanimatetimer == 6
			then
			you.im = dodge2
		elseif youdodgeanimatetimer < 6
		then
		youdodgeanimatetimer = youdodgeanimatetimer + 1
		you.im = dodge21
		end
	else youdodgeanimatetimer = 0

	end
	
end


medodgeanimatetimer = 0








---
--dodge speed based on me.v
---






dodgeme = function ()

if you.flinch 
			then me.dodgecounter = 0
			you.jstop = false
		you.dodge = false
		you.dodgetype = "none"
		you.pause = false
	end

	if dodgemecounter == 0 and delaymecounter > 0
		then
		
		me.stop = true
		me.jstop = true
		delaymecounter = delaymecounter - 1
		me.dodge = false
		if me.dodgetype == "front2" or me.dodgetype == "back2"
		then 
		me.x = me.x - 1 * me.lr
		else me.x = me.x + 2 * me.lr
		me.pause = false
		end

		if me.dodgetype == "front2"
		then me.im = dodge2
		end




	elseif dodgemecounter > 0
		then 

		if me.dodgetype == "front"
		then	me.im = dodge
		if leftmeme and not rightmeme
			then me.dodgetype = "front2"
			me.im = dodge2
			me.pause = true
			dodgemecounter = 5
		end
		elseif me.dodgetype == "front2"
		then
		me.im = dodge2
		me.pause = true
		elseif me.dodgetype == "back2"
			then 
			me.im = dodgeback2
			me.pause = true

		elseif me.dodgetype == "back"
		then
		me.im = dodgeback
		if me.lr < 0
		then 
		me.im = dodgeback2
		me.dodgetype = "back2"
		me.pause = true
		end
		end



		me.v = dodgespeed
		dodgemecounter = dodgemecounter - 1
		me.dodge = true
		delaymecounter = delaytime
		me.block = true
	elseif dodgemecounter < 0
		then 

		if me.dodgetype == "front"
		then	me.im = dodge
			if rightmeme and not leftmeme
			then me.dodgetype = "front2"
			me.im = dodge2
			dodgemecounter = -5
			end
		elseif me.dodgetype == "front2"
		then
		me.im = dodge2
		me.pause = true
		elseif me.dodgetype == "back2"
			then 
			me.im = dodgeback2
			me.pause = true
		elseif me.dodgetype == "back"
		then
		me.im = dodgeback
		if me.lr > 0 
		then 
		me.im = dodgeback2
		me.dodgetype = "back2"
		me.pause = true
		end
		end

		
		
		
		me.v = -dodgespeed
		dodgemecounter = dodgemecounter + 1
		me.dodge = true
		me.block = true
		delaymecounter = delaytime
	elseif me.block and controller1.right and dodgemecounter == 0 and not me.slide
		then
		me.dodge = true
		me.stop = false
		dodgemecounter = dodgetime
		if me.leftface
			then
			me.dodgetype = "back"
			dodgemecounter = dodgemecounter - 11
			else me.dodgetype = "front"
		end
	elseif me.block and controller1.left and dodgemecounter == 0 and not me.slide
		then
		me.dodge = true
		me.stop = false
		dodgemecounter = -dodgetime
		if not me.leftface
			then
			me.dodgetype = "back"
			dodgemecounter = dodgemecounter + 11
			else me.dodgetype = "front"
		end
	else 
		--me.jstop = false used to be here
		me.dodge = false
		me.dodgetype = "none"
		me.pause = false

	end

	if me.im == dodge2
	then 
		if medodgeanimatetimer == 6
			then
			me.im = dodge2
		elseif medodgeanimatetimer < 6
		then
		medodgeanimatetimer = medodgeanimatetimer + 1
		me.im = dodge21
		end
	else medodgeanimatetimer = 0

	end
	
end



function attackyou(x)
	
	--blu base on chargecounter/attacknumber?

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

	if x and you.airbusy == false and you.j > 0 and you.airtimer <= 1 and you.firstairattack
	then
	you.airtimer = 1

	elseif you.airtimer > 0 and you.j >= 0  and you.airtimer < 30
	then	you.airtimer = you.airtimer + 1
	if you.slowdown
	then you.im = risepunchslow
	else
	you.im = risepunch
end


	elseif x and you.airbusy == false and you.j < 0 and you.airtimer <= 1 and you.firstairattack
	then 
	you.airtimer = 1

	elseif you.airtimer > 0 and you.j < 0 and you.airtimer < 30
		then
		you.airtimer = you.airtimer + 1
		if you.slowdown then
			you.im = fallpunchslow
else
			you.im = fallpunch
end
	elseif x and youchargecounter >= 50 and you.busy == false
	then you.stop = true
		you.im = chargingpunch 
		you.busy = true

	elseif x and you.attacknumber == 2 and you.busy == false
	then youchargecounter = youchargecounter + 1


	elseif x and you.attacknumber == 1 and you.busy == false
	then youchargecounter = youchargecounter + 1

	elseif x and you.attacknumber == 0 and you.busy == false
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
		you.busy = true


	else
		youchargecounter = 0
	end





end







function attackme(x)

	if controller1.block and delaymecounter == 0 and not controller1.a1 and not controller1.a2 and not controller1.a3 and me.g and not me.dodge
	then me.im = block
		me.block = true
		me.stop = true

	else me.block = false 
		me.stop = false
	end


	if controller2.block and delayycounter == 0 and not controller2.a1 and not controller2.a2 and not controller2.a3 and you.g and not me.dodge
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


	if x and me.airbusy == false and me.j > 0 and me.airtimer <= 1 and me.firstairattack
	then	me.airtimer = 1

	elseif me.airtimer > 0 and me.j >= 0 and me.airtimer < 30
	then
	me.airtimer = me.airtimer + 1
	if me.slowdown
	then me.im = risepunchslow
	else
	me.im = risepunch
	end


	elseif x and me.airbusy == false and me.j < 0 and me.airtimer <= 1 and me.firstairattack
	then 
		me.airtimer = 1

	elseif me.airtimer > 0 and me.j < 0 and me.airtimer < 30
		then
		me.airtimer = me.airtimer + 1
		if me.slowdown
			then me.im = fallpunchslow
		else
		me.im = fallpunch
	end

	elseif x and chargecounter >= 50 and me.busy == false
	then me.stop = true
		me.im = chargingpunch
		me.busy = true

	elseif x and me.attacknumber == 2 and me.busy == false
	then chargecounter = chargecounter + 1


	elseif x and me.attacknumber == 1 and me.busy == false
	then chargecounter = chargecounter + 1

	elseif x and me.attacknumber == 0 and me.busy == false
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
		me.busy = true

	else
		chargecounter = 0
	end




end




























boltspeed = 30

punchdamage = 5
flinchtime = 30

flinchingyou = function ()
	if you.flinchtimer > you.ft
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
	if me.flinchtimer > me.ft
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
	elseif (v.x + 30 + (30 * v.lr)) * v.lr < me.mid * v.lr and (v.x + 30 + (30 * v.lr)) * v.lr + math.abs(v.v) > me.mid * v.lr and not me.dodge
		and v.y > me.y and v.y < me.feet
			then table.remove(youbolts, i)
			me.v = me.v + v.lr * 4
				if not me.block 
				then
				me.health = me.health - boltdamage
				me.flinch = true
				me.ft = gft
				end
			

	else

		v.x = v.x + v.v
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

function youbolts.shoot(x)

if you.landing
		then youboltchargecounter = 0
	end

	if you.flinch then
		you.attack = "none"
		youboltchargehold = 20
		youboltchargecounter = 0
	end

	if youboltchargehold < 17
	then youboltchargehold = youboltchargehold + 1
		you.im = boltrelease
		you.stop = true
		you.busy = true

	elseif you.attack == "chargebolt" and not x 
		then
		you.stop = true
		you.attack = null
		youboltchargecounter = 0
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = .1, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -.1, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 7, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -7, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -14, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 14, s = 1, v = boltspeed * you.lr + you.v})
		you.im = boltrelease
		you.prime = false
		youboltchargehold = 0
		you.busy = true
	elseif youboltchargecounter == 50 and you.g
		then you.stop = true
		you.attack = "chargebolt"
		you.im = boltcharged
		you.busy = true

	elseif x
	then
		you.prime = true
		youboltchargecounter = youboltchargecounter + 1
	


	elseif you.prime == true and youboltcombocount < 5 and not youfired
		then
		you.prime = false
		table.insert(youbolts, {x = you.mid - 30 + 30 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		if not you.g then
		table.insert(youbolts, {x = you.mid - 30 + 30 * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		end
		youfired = true
		youboltcombocount = youboltcombocount + 1
		youthrowcounter = 0
		youboltchargecounter = 0
		
	else you.prime = false
		youboltchargecounter = 0
		you.attack = none
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
	elseif (v.x + 30 + (30 * v.lr)) * v.lr < you.mid * v.lr and (v.x + 30 + (30 * v.lr)) * v.lr + math.abs(v.v) > you.mid * v.lr and not you.dodge
	and v.y > you.y and v.y < you.feet
			then table.remove(bolts, i)
			you.v = you.v + v.lr * 4
				if not you.block
				then
				you.health = you.health - boltdamage
				you.flinch = true
				you.ft = gft
				end	

	else
		v.x = v.x + v.v
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

function bolts.shoot(x)
	
if me.landing
		then meboltchargecounter = 0
	end

	if me.flinch then
		me.attack = "none"
		meboltchargehold = 20
		meboltchargecounter = 0
	end

	if meboltchargehold < 17
	then meboltchargehold = meboltchargehold + 1
		me.im = boltrelease
		me.stop = true
		me.busy = true

	elseif me.attack == "chargebolt" and not x
		then
		me.stop = true
		me.attack = null
		meboltchargecounter = 0
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = .1, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -.1, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 7, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -7, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -14, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 14, s = 1, v = boltspeed * me.lr})
		me.im = boltrelease
		me.prime = false
		meboltchargehold = 0
		me.busy = true
	elseif meboltchargecounter == 50 and me.g
		then me.stop = true
		me.attack = "chargebolt"
		me.im = boltcharged
		me.busy = true

	elseif x
	then
		me.prime = true
		meboltchargecounter = meboltchargecounter + 1
	


	elseif me.prime == true and meboltcombocount < 5 and not mefired
		then
		me.prime = false
		table.insert(bolts, {x = me.mid - 30 + 30 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
		if not me.g then
		table.insert(bolts, {x = me.mid - 30 + 30 * me.lr , y = me.y + 38, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
	end
		mefired = true
		meboltcombocount = meboltcombocount + 1
		methrowcounter = 0
		meboltchargecounter = 0
		
	else me.prime = false
		meboltchargecounter = 0
		me.attack = "none"



	end
end


spikes = {}
spiketimer = 0
spikechargetimer = 0
spikecooldown = 15
spikechargetime = 50
mespikeprime = false
mespikeairprime = false
function spikes.draw()
for i, v in ipairs(spikes) do
	
	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)


elseif v.s == -1 and spikechargetimer > -51  then
			love.graphics.draw(sp11, v.x, v.y, 0, v.lr, 1)
		elseif v.s == - 2 and spikechargetimer > -51 then
			love.graphics.draw(sp21, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -3 and spikechargetimer > -51 then
			love.graphics.draw(sp31, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -4 and spikechargetimer > -51 then
			love.graphics.draw(sp41, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -5 and spikechargetimer > -51 then
			love.graphics.draw(sp51, v.x, v.y, 0, v.lr, 1)
			elseif v.s == -6 and spikechargetimer > -51 then
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


end

end



function spikes.update()
for i, v in ipairs(spikes) do


if v.s == 2 and math.abs((v.x + (28 * v.lr)) - you.mid) < 15 and you.feet > v.y - 15 
				and v.t > 2
				then
				you.v = v.lr * 3
				if not you.block then
				you.health = you.health - spikedamage
				you.j = 30
				you.y = v.y - 70
				you.flinch = true
				you.ft = pft
				end
	elseif v.s == 3 and math.abs((v.x + (28 * v.lr)) - you.mid) < 15 and you.feet > v.y - 15
				and v.t > 2
				then
				you.v = v.lr * 3
				if not you.block then
				you.health = you.health - spikedamage
				you.j = 30
				you.y = v.y - 70
				you.flinch = true
				you.ft = pft
				end
			elseif v.s == 4 and math.abs((v.x + (28 * v.lr)) - you.mid) < 15 and you.feet > v.y - 15 
				and v.t > 2
				then
				you.v = v.lr * 3
				if not you.block then
				you.health = you.health - spikedamage
				you.j = 30
				you.y = v.y - 70
				you.flinch = true
				you.ft = pft
				end
	elseif v.s == 0 and math.abs((v.x + (56 * v.lr)) - you.mid) < 18 and you.feet > v.y - 15 
				and v.t > 2
				then
				you.v = v.lr * 5
				if not you.block then
				you.health = you.health - spikedamage
				you.j = 9
				you.g = false
				--you.y = v.y - 70
				--IS THIS NECESSARY?!?!?!
				you.flinch = true
				you.ft = pft
				end
				
				
	end

	--simultaneous remove special spikes
	if v.s == 0 and v.t > 40
		then table.remove(spikes, i)
	elseif v.s < 0 and spikechargetimer > -60
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
me.jstop = true

if me.flinch then 
	spikechargetimer = 0
	me.attack = "none"

-- -150
elseif mespikespecial
	then
	medig = medig + 1
	me.dodge = true
	me.black = true
	me.invince = true
	me.im = invis

	if medig > -119 then
	mespikespecial = false
	me.invince = false
	

	elseif medig > -130
		then me.mid = you.mid 
		me.x = you.x
		me.mid = you.mid
		me.xanimate = you.xanimate
		
		blatime = 20
		table.insert(spikes, {x = me.mid - 30, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 100, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - 20 * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - 20 * math.random() - blatime, s = -6})
	table.insert(spikes, {x = me.mid + 30, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 140, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - 20 * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - 20 * math.random() - blatime, s = -6})

	table.insert(spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 80, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -4})

table.insert(spikes, {x = me.mid - 80, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 20, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -3})

table.insert(spikes, {x = me.mid - 60, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 10, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid + 30, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -3})
	

	table.insert(spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 300, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 205, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 205, y = floor - 70, lr = 1, t = - 20 * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 230, y = floor - 140, lr = 1, t = - 20 * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 230, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 240, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid + 300, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 275, y = floor - 70, lr = -1, t = - 20 * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - 20 * math.random() - blatime, s = -4})
	spikechargetimer = -170
	mespikeprime = false
	me.im = invis


	elseif medig > -149 then me.im = invis
	elseif medig > -150 then
		me.im = dig




	

end

elseif mespikeairprime == go and spikechargetimer < 0

	then
	me.im = spikeland
	spikechargetimer = spikechargetimer + 1
	me.stop = true
	me.jstop = true

	
	
elseif me.g and mespikeairprime
	then me.im = spikeland
	me.busy = true
	mespikeairprime = go
	spikechargetimer = -150
	me.jstop = true
	me.stop = true
	if me.onplat
		then
	table.insert(spikes, {x = me.mid - 18, y = floor - 60, lr = 1, t = -10, s = 4} )
	table.insert(spikes, {x = me.mid + 18, y = floor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(spikes, {x = me.mid + 40, y = floor - 80, lr = 1, t = -23, s = 3} )
	table.insert(spikes, {x = me.mid - 40, y = floor - 80, lr = -1, t = -23, s = 3} )
	table.insert(spikes, {x = me.mid + 5, y = floor - 80, lr = 1, t = -18, s = 2} )
	table.insert(spikes, {x = me.mid - 5, y = floor - 80, lr = -1, t = -18, s = 2} )
	me.stop = true
	me.v = 0
	me.jstop = true
	me.busy = true
	if math.abs(me.x - you.x) < 20 and me.feet <= you.feet and me.feet > you.y 
		then
		you.x = you.x + me.lr * 30
		if me.onplat
			then
			you.y = you.y + 40
			you.feet = you.feet + 40
			you.x = you.x - me.lr * 30
			you.j = -40
			you.g = false
			you.flinch = true
			you.ft = pft
			you.health = you.health - purpleairfootdam
		end
	end


	elseif not x and spikechargetimer > spikechargetime and tempmefloor == floor
	then
	me.attack = "chargespike"
	me.stop = true
	me.busy = true
	me.im = spikeland

	mespikespecial = true
	medig = -150
	me.invince = true


	elseif spikechargetimer > spikechargetime and tempmefloor == floor
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
	if me.feet - me.j > you.y and me.feet < you.feet and math.abs(me.x - you.x) < 20 
		then
		you.flinch = true
		you.ft = pft
		you.j = -30
		you.health = you.health - 20
		
	
	end

elseif spikechargetimer < 0
	then 
	spikechargetimer = spikechargetimer + 1
me.im = stomp2
me.stop = true
me.busy = true
me.jstop = true
if medig < 0 and math.abs(you.mid - me.mid) < 200 and you.feet > me.feet - 130 and spikechargetimer > -150
	then 

	you.j = 40
	you.flinch = true
	you.ft = pft
	you.health = you.health - 50
		you.g = false
	if me.mid >= you.mid then you.v = -30
	else you.v = 30
end
end
if medig < 0 and spikechargetimer < -60 then me.im = invis
	end 





elseif mespikeprime
	then
	me.im = stomp2
	me.attack = "spike"
	spikechargetimer = -80
	me.v = 0
	table.insert(spikes, {x = me.mid + (0 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = 0, s = 0})
	table.insert(spikes, {x = me.mid + (30 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -6, s = 0})
	table.insert(spikes, {x = me.mid + (65 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -12, s = 0})
	table.insert(spikes, {x = me.mid + (100 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -18, s = 0})
	table.insert(spikes, {x = me.mid + (135 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -24, s = 0})
	table.insert(spikes, {x = me.mid + (170 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -30, s = 0})
	table.insert(spikes, {x = me.mid + (205 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -36, s = 0})
	table.insert(spikes, {x = me.mid + (240 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -42, s = 0})

	for i, v in ipairs(spikes) do

		

		if i > 1 and spikes[i - 1].y > 0
				then
		spikes[i].y = spikes[i - 1].y - 60 
		end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
	end
end

	mespikeprime = false
	me.busy = true
else me.spikeprime = false
	spikechargetimer = 0
	mespikeairprime = false
	mespikespecial = false
	medig = 0
	me.jstop = false





end

if spikechargetimer < 0 or mespikespecial then mepurp = true
	else mepurp = false
	end




end

















chargecounter = 0
combocounterme = 0
attacknumberme = 0






attacktimerme = function ()
	if combocounterme < 45 and me.attacknumber > 0
	then combocounterme = combocounterme + 1
	elseif combocounterme >= 45 then 
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
		me.busy = true

end
end

--TEST TEST TEST TEST

end



attacktimeryou = function ()
	if combocounteryou < 45 and you.attacknumber > 0
	then combocounteryou = combocounteryou + 1
	elseif combocounteryou >= 45 then 
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
		you.busy = true

end
end
end



throwme = function ()
	meblu = true
	if me.im == risepunch or me.im == risepunchslow 
	then love.graphics.draw(airpunch, me.mid + 9 * me.lr, me.y - 34, 0, me.lr, 1)
	me.attack = "punchrise"
	elseif me.attack == "chargebolt"
	then me.attack = me.attack
	meblu = false
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
	me.busy = true
	else me.attack = "null"
		meblu = false

		

end
end

throwyou = function ()
	
	youblu = true
	if me.im == punchprep
	then love.graphics.draw(bluearm, you.x - 6, you.y, 0, you.lr, 1)
	elseif you.im == risepunch or you.im == risepunchslow
	then love.graphics.draw(airpunch, you.mid + 9 * you.lr, you.y - 34, 0, you.lr, 1)
	you.attack = "punchrise"
	elseif you.attack == "chargebolt"
	then you.attack = you.attack
	youblu = false
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
	you.busy = true
	else you.attack = "null"
		youblu = false

		

end
end
