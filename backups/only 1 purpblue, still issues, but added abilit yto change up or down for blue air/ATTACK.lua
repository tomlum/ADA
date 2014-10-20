--green and purple based on controller up or down


--if you.flinch and wall then bounce, switch the flinch direction
--also if hit floor and greatenough time then falls down

--maybe no diag air bolt
--does bjsotp interfere with purple and jstop?

--adjust order depending on actionshot so blade is always in front, pretty easy
--use microsoft word replace to copy and paste to number 2
--make purple ground thing happen sooner?
--air spike damage > the higher up you were?
--make purple come up faster?
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
purpbolt = love.graphics.newImage("me/attack/purpbolt.png")
purpbolt2 = love.graphics.newImage("me/attack/purpbolt2.png")
greenpurpprep = love.graphics.newImage("me/attack/greenpurpprep.png")
greenpurpthrow = love.graphics.newImage("me/attack/greenpurpthrow.png")
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
briseprep = love.graphics.newImage("me/attack/blueriseprep.png")
bfallprep = love.graphics.newImage("me/attack/bluefallprep.png")
brise = love.graphics.newImage("me/attack/bluerise.png")
bfall = love.graphics.newImage("me/attack/bluefall.png")
briseend = love.graphics.newImage("me/attack/blueriseend.png")
bfallend = love.graphics.newImage("me/attack/bluefallend.png")
bfall2 = love.graphics.newImage("me/attack/bluefall2.png")
bfall3 = love.graphics.newImage("me/attack/bluefall3.png")
bwalk1 = love.graphics.newImage("me/walk/bluewalk1.png")
bwalk2 = love.graphics.newImage("me/walk/bluewalk2.png")
bwalk3 = love.graphics.newImage("me/walk/bluewalk3.png")
bwalk4 = love.graphics.newImage("me/walk/bluewalk4.png")
bwalk5 = love.graphics.newImage("me/walk/bluewalk5.png")

bc1 = love.graphics.newImage("me/attack/bc1.png")
bc2 = love.graphics.newImage("me/attack/bc12.png")
bc3 = love.graphics.newImage("me/attack/bc3.png")
bcend = love.graphics.newImage("me/attack/bcend.png")
bluecharging = love.graphics.newImage("me/attack/bluecharging.png")
bs = love.graphics.newImage("me/attack/bluespike.png")
bsm = love.graphics.newImage("me/attack/bluespikeprep.png") 

bluepurphit = love.graphics.newImage("me/attack/bp.png")







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

yougpc = 0
yougpready = false
yougpcd = 0
yougur = false

megpc = 0
megpready = false
megpcd = 0
megur = false

mebpc = 0
mebpready = false
mebpcd = 0
mebur = false


function bluepurple(x)
if me.flinch or mbpcancel then mebpready = false
	mebpc = 0 
	me.jstop = false
end

if mebpc < 0 then
mebpc = mebpc + 1 
elseif mebpc > 0 then mebpc = mebpc - 1 
mebur = true
else mebur = false
end

if mebpcd > 0 then mebpcd = mebpcd - 1 end

if mebpc == "ble" then mebpc = "bleh!"

elseif mebpc > 0 
	then me.im = bluepurphit
	me.stop = true
	me.jstop = true

elseif not x and mebpready then
	me.im = bluepurphit
	mebpready = false
	mebpc = 75
	me.stop = true
	me.jstop = true
	mebpcd = 110
	table.insert(spikes, {x = me.mid + 30*me.lr, y = platformy(me.mid + 30*me.lr,me.y - 150)-140, lr = me.lr, t = 60, s = -200})

elseif x and mebpc == 0 and mebpcd == 0 
then me.im = blue1start
	mebpready = true
	me.stop = true
	me.jstop = true
	mebur = true
else me.jstop = false



end
end



function yougreenpurple(x)
if you.flinch or ygpcancel then yougpready = false
	yougpc = 0 
	you.jstop = false
end

if yougpc < 0 then
yougpc = yougpc + 1 
elseif yougpc > 0 then yougpc = yougpc - 1 
yougur = true
else yougur = false
end

if yougpcd > 0 then yougpcd = yougpcd - 1 end

if yougpc == "ble" then yougpc = "bleh!"

elseif yougpc > 0 
	then you.im = greenpurpthrow
	you.stop = true
	you.jstop = true

elseif not x and yougpready then
	you.im = greenpurpthrow
	yougpready = false
	yougpc = 40
	you.stop = true
	you.jstop = true
	yougpcd = 90
	table.insert(youbolts, {x = you.mid - 30 + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = -1, v = pboltspeed * you.lr + you.v, time = 0})


elseif x and yougpc == 0 and yougpcd == 0 
then you.im = greenpurpprep
	yougpready = true
	you.stop = true
	you.jstop = true
	yougur = true
else you.jstop = false



end
end




function greenpurple(x)
if me.flinch or mgpcancel then megpready = false
	megpc = 0 
	me.jstop = false
end

if megpc < 0 then
megpc = megpc + 1 
elseif megpc > 0 then megpc = megpc - 1 
megur = true
else megur = false
end

if megpcd > 0 then megpcd = megpcd - 1 end

if megpc == "ble" then megpc = "bleh!"

elseif megpc > 0 
	then me.im = greenpurpthrow
	me.stop = true
	me.jstop = true

elseif not x and megpready then
	me.im = greenpurpthrow
	megpready = false
	megpc = 40
	me.stop = true
	me.jstop = true
	megpcd = 90
	table.insert(bolts, {x = me.mid - 30 + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = -1, v = pboltspeed * me.lr + me.v, time = 0})


elseif x and megpc == 0 and megpcd == 0 
then me.im = greenpurpprep
	megpready = true
	me.stop = true
	me.jstop = true
	megur = true
else me.jstop = false



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



youdodgeanimatetimer = 0






youbluechargetimer = 0
youbluepause = 0
younext = 0
ybp = 0
yd = 0
youbluechargetime = 50


function youblueblade(x)

	if you.g then youairready = true
end


	local xdif = (me.mid - you.mid) * you.lr


	if you.g then you.airready = true
	end


	if youbluepause <= 0 or you.flinch or ybcancel then 
		younext = 0
		youbluechargetimer = 0
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

				if youarmsreach(200) and me.y < you.y and me.y > you.y - 200 
			then 
			me.j = you.j + 6
			me.g = false
			me.v = you.v + (5 * you.lr)
			if not me.dodge and not me.block then
			me.flinch = true
			me.health = me.health - airbluedam
			me.ft = abft
			end
		end


		yd = 8
		you.im = brise 
		if (controller2.up and you.j < 0) then you.j = 24
		else
		you.j = you.j + 2
		end
		you.v = you.v + 1.5 * you.lr





		elseif (you.j < 0 and not controller2.up) or (controller2.down and you.j >= 0) then
		yd = 6

		if (controller2.down and you.j >=0) then you.j = -30
		else
		you.j = you.j - 5
		end
		you.v = you.v + 1 * you.lr
		if youarmsreach(200) and me.y > you.y and me.y < you.y + 200 and ybp >=12
			then 
			me.j = you.j - 20
			me.v = you.v + (5 * you.lr)
			if not me.dodge and not me.block then
			me.flinch = true
			me.health = me.health - airbluedam
			me.ft = abft
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
		youbluepause = 30
		youblu = false

	else yd = 0
		youbluechargetimer = 0
		youbjstop = false
	end


else

	if younext==20 then you.im = bc2 
			yd = 24
		if youarmsreach(170) and sameheight() and not me.invince then 
				me.flinch = true
				me.ft = bcft
				actionshot = true
				me.v = 80 * you.lr
				me.health = me.health - bluechargedam
		end
			
	elseif younext==21 then you.im = bc2 
			yd = 24
	elseif younext==22 then you.im = bc3 
			yd = 12
	elseif younext>=23 and younext < 100 then you.im = bcend
			yd = 0 


	elseif not x and younext == 19 
		then you.im = bc1
		yd = 12
		


	elseif youbluechargetimer > bluechargetime and x and younext <= 19
		then you.im = bluecharging
		youbluepause = 30
		youblu = false
		yd = 24
		ybp = 24
		younext = 18

	




	elseif younext == 6
		then you.im = blue23
		yd = 0
	elseif younext == 5
		then you.im = blue22
		yd = 8
		if blues4:isStopped() then
			blues4:play()
		else blues4:rewind()
		end
		if youarmsreach(160) and sameheight() and not me.dodge and not me.block
			then 
			me.v = you.v + (you.lr * 4)
			me.flinch = true
			me.ft = bft
			me.health = me.health - bluedam
		end

	elseif younext == 4 and not x
		then you.im = blue21
		if controller2.right then
			you.v = you.v + 8
		elseif
			controller2.left and you.lr < 0 then 
			you.v = you.v - 8
		else
		you.v = you.v + (4 * you.lr)
		end
		yd = 12
		youbluechargetimer = 0
	elseif x and younext == 3 or younext == 4 then 
		you.im = blue2start
		younext = 4
		youbluepause = 28
		youblu = false
		youbluechargetimer = youbluechargetimer + 1




	elseif younext == 3 then
		you.im = blue1end
		you.stop = true
		yd = 0
	elseif younext == 2
		then
		you.im = blue12
		yd = 12
		if blues3:isStopped() then
			blues3:play()
		else blues3:rewind()
		end
		if youarmsreach(160) and sameheight() and not me.dodge and not me.block
			then 
			me.v = you.v + (you.lr * 4)
			me.flinch = true
			me.ft = bft
			me.health = me.health - bluedam
		end
	elseif younext == 1 and not x then
		you.im = blue11
		yd = 24
		if controller2.right then
			you.v = you.v + 7
		elseif
			controller2.left and you.lr < 0 then 
			you.v = you.v - 7
		else
		you.v = you.v + (6 * you.lr)

		end
		youbluechargetimer = 0
	elseif x and younext == 0 or younext == 1 then 
		you.im = blue1start
		younext = 1
		youbluepause = 23
		youblu = false
		youbluechargetimer = youbluechargetimer + 1
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
		youbluechargetimer = 0
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

	


	if youbluepause > 0
		then
	youbluepause = youbluepause - 1
	you.stop = true
	end

	if younext == 1 then you.stop = false
	end
end














bluechargetimer = 0
mebluepause = 0
menext = 0
mbp = 0
md = 0
bluechargetime = 50


function blueblade(x)

	if me.g then meairready = true
end


	local xdif = (you.mid - me.mid) * me.lr


	if me.g then me.airready = true
	end


	if mebluepause <= 0 or me.flinch or mbcancel then 
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

				if mearmsreach(200) and you.y < me.y and you.y > me.y - 200 
			then 
			you.j = me.j + 6
			you.g = false
			you.v = me.v + (5 * me.lr)
			if not you.dodge and not you.block then
			you.flinch = true
			you.health = you.health - airbluedam
			you.ft = abft
			end
		end


		md = 8
		me.im = brise 
		if (controller1.up and me.j < 0) then me.j = 24
		else
		me.j = me.j + 2
		end
		me.v = me.v + 1.5 * me.lr





		elseif (me.j < 0 and not controller1.up) or (controller1.down and me.j >= 0) then

		md = 6
		if (controller1.down and me.j >=0) then me.j = -30
		else
		me.j = me.j - 5
		end
		me.v = me.v + 1 * me.lr
		if mearmsreach(200) and you.y > me.y and you.y < me.y + 200 and mbp >=12
			then 
			you.j = me.j - 20
			you.v = me.v + (5 * me.lr)
			if not you.dodge and not you.block then
			you.flinch = true
			you.health = you.health - airbluedam
			you.ft = abft
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
		mebluepause = 30
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
	elseif menext>=23 and menext < 100 then me.im = bcend
			md = 0 


	elseif not x and menext == 19 
		then me.im = bc1
		md = 12
		


	elseif bluechargetimer > bluechargetime and x and menext <= 19
		then me.im = bluecharging
		mebluepause = 30
		md = 24
		menext = 18
		meblu = false

	




	elseif menext == 6
		then me.im = blue23
		md = 0
	elseif menext == 5
		then me.im = blue22
		md = 8
		if blues2:isStopped() then
			blues2:play()
		else blues2:rewind()
		end
		if mearmsreach(160) and sameheight() and not you.dodge and not you.block
			then 
			you.v = me.v + (me.lr * 4)
			you.flinch = true
			you.ft = bft
			you.health = you.health - bluedam
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
		mebluepause = 28
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
		if blues:isStopped() then
			blues:play()
		else blues:rewind()
		end
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
		mebluepause = 23
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

	


	if mebluepause > 0
		then
	mebluepause = mebluepause - 1
	me.stop = true
	end

if menext == 1 then me.stop = false
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
	else 
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









function blocknbusy()

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
	
	if me.landing or me.flinch 
	then me.busy = true
	else me.busy = false
	end

	if you.landing or you.flinch 
	then you.busy = true
	else you.busy = false
	end



end






























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




















methrowcounter = 0


meboltcombocount = 0
methrowanimatecounter = 0


youthrowcounter = 0


youboltcombocount = 0
youthrowanimatecounter = 0



youbolts = {}

function youbolts.draw()
			for i,v in ipairs(youbolts) do
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin(math.abs(v.upv)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			


	end
end
end




function youbolts.update()
	for i, v in ipairs(youbolts) do
		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle)) - 5

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (60*math.cos(sangle)) - 5
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)
		


		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 
		then
		v.upv = v.upv - 1
		
		end

		if v.time > 500
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
	table.insert(youspikes, {x = v.x + (580 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -102, s = 0})
	table.insert(youspikes, {x = v.x + (615 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -108, s = 0})
	table.insert(youspikes, {x = v.x + (650 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -114, s = 0})



for i, v in ipairs(youspikes) do

		

		if i > 1 and youspikes[i - 1].y and youspikes[i - 1].s ~= -200 > 0
				then
		youspikes[i].y = youspikes[i - 1].y - 60 
		end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

	if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
		end
		end










	elseif v.y - v.upv >= floor
		then v.y = floor + (v.upv/2) 
		v.x = v.x + v.v
		v.v = 0

 	

	elseif v.s == -1 and point * v.lr < (me.mid) * v.lr and (point + v.v) * v.lr > (me.mid + you.v) * v.lr
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(youbolts, i)
			me.v = me.v + v.lr * 4
				if not me.block
				then
				me.health = me.health - pboltdam
				
				end	


	elseif v.s >= 0 and point * v.lr < (me.mid) * v.lr and (point + v.v) * v.lr > (me.mid + you.v) * v.lr
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(youbolts, i)
			me.v = me.v + v.lr * 4
				if not me.block
				then
				me.health = me.health - boltdamage
				
				end	
				

			

	else

		v.x = v.x + v.v
		v.time = v.time + 1
		
		v.y = v.y - v.upv
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

	if you.flinch or ygcancel then
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

	elseif you.attack == "chargebolt" and not x 
		then
		you.stop = true
		you.attack = null
		youboltchargecounter = 0
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -18, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid + 35 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 18, s = 1, v = boltspeed * you.lr + you.v})
		
				
	
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
		table.insert(youbolts, {x = you.mid + 30 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
		if not you.g then
		table.insert(youbolts, {x = you.mid + 30 * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = you.j, s = 0, v = boltspeed * you.lr + you.v})
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
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, math.asin(math.abs(v.upv)/80), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, math.asin((-v.upv*v.lr)/65), v.lr, 1)
			


	end

	
end
end





--table.insert(spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = onplat(v.y) + math.random(8), lr = v.lr, t = 0, s = 0}))
	




function bolts.update()
	for i, v in ipairs(bolts) do



		local sangle = math.asin(math.abs(v.upv)/80)
		local shalfwidth = (80*math.cos(sangle)) - 5

		local angle = math.asin(math.abs(v.upv)/65)
		local halfwidth = (65*math.cos(sangle)) - 5
		local spoint = v.x + (shalfwidth *v.lr)
		local point = v.x + (halfwidth *v.lr)


		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 
		then
		v.upv = v.upv - 1
		
		end

		if v.time > 500
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
	table.insert(spikes, {x = v.x + (580 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -102, s = 0})
	table.insert(spikes, {x = v.x + (615 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -108, s = 0})
	table.insert(spikes, {x = v.x + (650 + math.random(8)) * v.lr, y = v.y , lr = v.lr, t = -114, s = 0})



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

	



















	elseif v.s >= 0 and v.y - v.upv >= floor
		then v.y = floor + (v.upv/2) 
		v.x = v.x + v.v
		v.v = 0

 	

	elseif v.s == -1 and point * v.lr < (you.mid) * v.lr and (point + v.v) * v.lr > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(bolts, i)
			you.v = you.v + v.lr * 4
				if not you.block
				then
				you.health = you.health - pboltdam
				
				end	




	elseif v.s >= 0 and point * v.lr < (you.mid) * v.lr and (point + v.v) * v.lr > (you.mid + you.v) * v.lr
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(bolts, i)
			you.v = you.v + v.lr * 4
				if not you.block
				then
				you.health = you.health - boltdamage
				
				end	









	else
		v.x = v.x + v.v
		v.time = v.time + 1
		v.y = v.y - v.upv 
	
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

	if me.flinch or mgcancel then
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

	elseif me.attack == "chargebolt" and not x
		then
		me.stop = true
		me.attack = null
		meboltchargecounter = 0
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -18, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid + 35 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 18, s = 1, v = boltspeed * me.lr})
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
		table.insert(bolts, {x = me.mid + 30 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
		if not me.g then
		table.insert(bolts, {x = me.mid + 30 * me.lr , y = me.y + 38, lr = me.lr, time = 0, upv = me.j, s = 0, v = boltspeed * me.lr + me.v})
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
spikechargetime = 100
mespikeprime = false
mespikeairprime = false
function spikes.draw()
for i, v in ipairs(spikes) do
	
	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)
		elseif v.s == -200 and v.t > 87 then table.remove(spikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t < 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t < 100 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
	
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




end

end



function spikes.update()
for i, v in ipairs(spikes) do


if v.s==-200
		then while (platformy(v.x + (150 * v.lr),v.y + 135) ~= platformy(v.x,v.y + 135))
			do v.y = (platformy(v.x + 80*v.lr, v.y + 160) - 140)
		end
	end


if v.s >= 2 and math.abs((v.x + (28 * v.lr)) - you.mid) < 20 and you.feet > v.y + 15 and v.y > you.y - 40
				and v.t > 2           										
				then
				you.v = v.lr * 3
				if not you.block then
				you.health = you.health - aspikedamage
				you.j = 40
				you.y = v.y - 70
				you.flinch = true
				you.g = false
				you.ft = apft
				end


elseif v.s == -200 and v.t >= 63 and math.abs((v.x + (85 * v.lr)) - you.mid) < 85 and you.feet > v.y + 15 and v.y > you.y - 140
				
				then
				you.v = v.lr * 10
				if not you.block then
				you.health = you.health - bspikedamage
				if v.t < 70 then
				you.j = 35
				else you.j = 10
				end
				you.y = v.y - 70
				you.g = false
				you.flinch = true
				you.ft = bpft
				end

	elseif v.s == 0 and math.abs((v.x + (56 * v.lr)) - you.mid) < 18 and you.feet > v.y + 15 and v.y > you.y -40
				and v.t > 2
				then
				you.v = v.lr * 5
				if not you.block then
				you.health = you.health - spikedamage
				you.j = 9
				you.g = false
				you.flinch = true
				you.ft = pft
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
me.jstop = true

if me.flinch or mpcancel then 
	spikechargetimer = 0
	me.attack = "none"
	mespikeairprime = false
	mespikeprime = false

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

		blatime = 20
		table.insert(spikes, {x = me.mid - 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 100, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(spikes, {x = me.mid + 30, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(spikes, {x = me.mid - 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 20, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(spikes, {x = me.mid - 60, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid - 300, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid - 205, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid - 205, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid - 230, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 230, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(spikes, {x = me.mid + 240, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(spikes, {x = me.mid + 300, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(spikes, {x = me.mid + 275, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(spikes, {x = me.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	spikechargetimer = -150
	mespikeprime = false
	me.im = invis


	elseif medig > -129 then me.im = invis
		me.x = you.x
	elseif medig > -130 then
		me.im = dig




	

end

elseif mespikeairprime == go and spikechargetimer < 0

	then
	me.im = spikeland
	spikechargetimer = spikechargetimer + 1
	me.stop = true
	me.jstop = true
	me.busy = true

	
	
elseif me.g and mespikeairprime
	then me.im = spikeland
	me.busy = true
	mespikeairprime = go
	spikechargetimer = -90
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
	
		if me.onplat
			then
			you.y = you.y + 40
			you.feet = you.feet + 40
			you.j =  me.j - 30
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


	elseif not x and spikechargetimer > spikechargetime and tempmefloor == floor
	then
	me.attack = "chargespike"
	me.stop = true
	me.busy = true
	me.im = spikeland

	mespikespecial = true
	medig = -130
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
		you.health = you.health - pfootairdam
		
	
	end

elseif spikechargetimer < 0
	then 
	spikechargetimer = spikechargetimer + 1
me.im = stomp2
me.stop = true
me.busy = true
me.jstop = true
if medig < 0 and math.abs(you.mid - me.mid) < 200 and you.feet > me.feet - 130 and spikechargetimer < -chargespikedur and spikechargetimer > -120
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
else
	you.j = 7
	you.flinch = true
	you.ft = cpftpoke 
	you.health = you.health - cpdampoke
		you.g = false
	if me.mid >= you.mid then you.v = -15
	else you.v = 15
	end
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
	table.insert(spikes, {x = me.mid + (275 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -48, s = 0})
	table.insert(spikes, {x = me.mid + (310 + math.random(8)) * me.lr, y = tempmefloor + math.random(8), lr = me.lr, t = -54, s = 0})

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

else 

	mespikeprime = false --this used to not exist
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















youspikes = {}
youspikechargetimer = 0
youspikeprime = false
youspikeairprime = false
function youspikes.draw()
for i, v in ipairs(youspikes) do
	
	if v.t >= 38 and v.s == 2 
		then
		love.graphics.draw(groundspike1, v.x, v.y, 0, v.lr, 1)

	elseif v.s == -200 and v.t > 87 then table.remove(spikes, i)
	elseif v.s == -200 and v.t > 86 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t < 63 then love.graphics.draw(bsm, v.x, v.y, 0, v.lr, 1)
	elseif v.s == -200 and v.t < 100 then love.graphics.draw(bs, v.x, v.y, 0, v.lr, 1)
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


end

end



function youspikes.update()
for i, v in ipairs(youspikes) do


if v.s >= 2 and math.abs((v.x + (28 * v.lr)) - me.mid) < 30 and me.feet > v.y + 15 and v.y > me.y - 40 --used to be -60
				and v.t > 2
				then
				me.v = v.lr * 3
				if not me.block then
				me.health = me.health - aspikedamage
				me.j = 40
				me.y = v.y - 70
				me.g = false
				me.flinch = true
				me.ft = apft
				end
	elseif v.s == 0 and math.abs((v.x + (56 * v.lr)) - me.mid) < 18 and me.feet > v.y + 15 and v.y > me.y - 40
				and v.t > 2
				then
				me.v = v.lr * 5
				if not me.block then
				me.health = me.health - spikedamage
				me.j = 9
				me.g = false
				me.flinch = true
				me.ft = pft
				end
				
				
	end

	--simultaneous remove special youspikes
	if v.s == 0 and v.t > 40
		then table.remove(youspikes, i)
	elseif v.s < 0 and youspikechargetimer > -chargespikedur
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
you.jstop = true

if you.flinch or ypcancel then 
	youspikechargetimer = 0
	you.attack = "none"
	youspikeairprime = false
	youspikeprime = false

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
		blatime = 20
		table.insert(youspikes, {x = you.mid - 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 100, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid - 75, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid - 75, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -6})
	table.insert(youspikes, {x = you.mid + 30, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 75, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid + 75, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -6})

	table.insert(youspikes, {x = you.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})

table.insert(youspikes, {x = you.mid - 80, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 20, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 25, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})

table.insert(youspikes, {x = you.mid - 60, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 30, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	

	table.insert(youspikes, {x = you.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid - 300, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid - 200, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid - 205, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid - 205, y = floor - 70, lr = 1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid - 230, y = floor - 140, lr = 1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 230, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -1})
	table.insert(youspikes, {x = you.mid + 240, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -2})
	table.insert(youspikes, {x = you.mid + 300, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -3})
	table.insert(youspikes, {x = you.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	table.insert(youspikes, {x = you.mid + 275, y = floor - 70, lr = -1, t = - pw * math.random() - blatime, s = -5})
	table.insert(youspikes, {x = you.mid + 275, y = floor - 140, lr = -1, t = - pw * math.random() - blatime, s = -4})
	youspikechargetimer = -150
	youspikeprime = false
	you.im = invis


	elseif youdig > -129 then you.im = invis
		you.x = me.x
	elseif youdig > -130 then
		you.im = dig




	

end

elseif youspikeairprime == go and youspikechargetimer < 0

	then
	you.im = spikeland
	youspikechargetimer = youspikechargetimer + 1
	you.stop = true
	you.jstop = true
	you.busy = true

	
	
elseif you.g and youspikeairprime
	then you.im = spikeland
	you.busy = true
	youspikeairprime = go
	youspikechargetimer = -90
you.jstop = true
	you.stop = true
	if you.onplat
		then
	table.insert(youspikes, {x = you.mid - 18, y = floor - 60, lr = 1, t = -10, s = 4} )
	table.insert(youspikes, {x = you.mid + 18, y = floor - 60, lr = -1, t = -10, s = 4} )
	end
	table.insert(youspikes, {x = you.mid + 40, y = floor - 80, lr = 1, t = -23, s = 3} )
	table.insert(youspikes, {x = you.mid - 40, y = floor - 80, lr = -1, t = -23, s = 3} )
	table.insert(youspikes, {x = you.mid + 5, y = floor - 80, lr = 1, t = -18, s = 2} )
	table.insert(youspikes, {x = you.mid - 5, y = floor - 80, lr = -1, t = -18, s = 2} )
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
			me.j =  you.j - 30
			me.g = false
			me.flinch = true
			me.ft = pft
			me.health = me.health - purpleairfootdam
		else if me.x <= you.x then me.x = me.x - 30
			else me.x = me.x + 30
			end
		end
	end


	elseif not x and youspikechargetimer > spikechargetime and tempyfloor == floor
	then
	you.attack = "chargespike"
	you.stop = true
	you.busy = true
	you.im = spikeland

	youspikespecial = true
	youdig = -130
	you.invince = true


	elseif youspikechargetimer > spikechargetime and tempyfloor == floor
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
	if you.feet - you.j > me.y and you.feet < me.feet and math.abs(you.x - me.x) < 20 
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
if youdig < 0 and math.abs(me.mid - you.mid) < 200 and me.feet > you.feet - 130 and youspikechargetimer < -chargespikedur and youspikechargetimer > -120
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
else
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
	you.im = stomp2
	you.attack = "spike"
	youspikechargetimer = -80
	you.v = 0
	table.insert(youspikes, {x = you.mid + (0 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = 0, s = 0})
	table.insert(youspikes, {x = you.mid + (30 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -6, s = 0})
	table.insert(youspikes, {x = you.mid + (65 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -12, s = 0})
	table.insert(youspikes, {x = you.mid + (100 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -18, s = 0})
	table.insert(youspikes, {x = you.mid + (135 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -24, s = 0})
	table.insert(youspikes, {x = you.mid + (170 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -30, s = 0})
	table.insert(youspikes, {x = you.mid + (205 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -36, s = 0})
	table.insert(youspikes, {x = you.mid + (240 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -42, s = 0})
	table.insert(youspikes, {x = you.mid + (275 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -48, s = 0})
	table.insert(youspikes, {x = you.mid + (310 + math.random(8)) * you.lr, y = tempyfloor + math.random(8), lr = you.lr, t = -54, s = 0})

	for i, v in ipairs(youspikes) do

		

		if i > 1 and youspikes[i - 1].y > 0
				then
		youspikes[i].y = youspikes[i - 1].y - 60 
		end
		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
	end
end

	youspikeprime = false
	you.busy = true
else youspikeprime = false
	youspikechargetimer = 0
	youspikeairprime = false
	youspikespecial = false
	youdig = 0
	you.jstop = false





end

if youspikechargetimer < 0 or youspikespecial then youpurp = true
	else youpurp = false
	end




end



