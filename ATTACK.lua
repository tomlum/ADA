
--if you.flinch and wall then bounce, switch the flinch direction
--also if hit floor and greatenough time then falls down

--charge blue isn't a big punch, but like a big sword slice where like, big slash
--add groudn flying up fro blue swipes?

--speed + purple = surf on the spikes
--JUST THE PERSON KNOCKS THEM THROUGH THE FLOOR for air attack
--TEST MAKE SURE YOU CAN'T USE ATTACKS AT THE SAME TIME, ESPECIALLY IN AIR
--for combo attacks, make sure the solo attacks say "controller1.a1 and not controller1.a2-3"
--or something, that might not fix it
--maybe if in close range the green attack pushes you back
--maybe rotate me.bolts so they look better, use trig









-- objects = {}
-- table.insert(objects, {mid = 0, midy = 0, })

-- function updateobjects()
-- objects[1]
-- end

--player id is 1 or 2
-- function objectattack(id,x,y,left,right,top,bottom)
--   for i = #objects, 1, -1 do
-- 		local v = objects[i]
--     if id ~= i then
--      
      
      
      
      
--     end
    
--   end
  
  
-- end


shakeme = false
shakeyou = false

nomedodge = false
noyoudodge = false



dying = love.graphics.newImage("me/attack/dying.png")
airdying = love.graphics.newImage("me/attack/airdying.png")

flinch = love.graphics.newImage("me/attack/risepunching.png")
bolt = love.graphics.newImage("me/attack/bolt.png")

climb = love.graphics.newImage("me/attack/climb.png")
climb2 = love.graphics.newImage("me/attack/climb2.png")
climb3 = love.graphics.newImage("me/attack/climb3.png")


hookhead = love.graphics.newImage("me/attack/hookhead.png")
boltup1 = love.graphics.newImage("me/attack/boltup2.png")
boltup1left = love.graphics.newImage("me/attack/boltup2left.png")
boltthrow = love.graphics.newImage("me/attack/boltthrow.png")
flinch = love.graphics.newImage("me/attack/flinch.png")
fallback = love.graphics.newImage("me/attack/fallback.png")
fallforward = love.graphics.newImage("me/attack/fallforward.png")
fallback1 = love.graphics.newImage("me/attack/fallback1.png")
fallforward1 = love.graphics.newImage("me/attack/fallforward1.png")
gettingup1 = love.graphics.newImage("me/attack/gettingup1.png")
gettingup2 = love.graphics.newImage("me/attack/gettingup2.png")
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
blue11 = love.graphics.newImage("me/attack/blue11.png")
blue12 = love.graphics.newImage("me/attack/blue12.png")
blue23 = love.graphics.newImage("me/attack/blue23.png")
blue22 = love.graphics.newImage("me/attack/blue22.png")
blue21 = love.graphics.newImage("me/attack/blue21.png")
blue31 = love.graphics.newImage("me/attack/blue31.png")
blue32 = love.graphics.newImage("me/attack/blue32.png")
blue33 = love.graphics.newImage("me/attack/blue33.png")
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
reelin = love.graphics.newImage("me/attack/blue1start.png")



bc1 = love.graphics.newImage("me/attack/bc1.png")
bc2 = love.graphics.newImage("me/attack/bc12.png")
bc3 = love.graphics.newImage("me/attack/bc3.png")
bcend = love.graphics.newImage("me/attack/bcend.png")
bluecharging = love.graphics.newImage("me/attack/bluecharging.png")
bs = love.graphics.newImage("me/attack/bluespike.png")
bsm = love.graphics.newImage("me/attack/bluespikeprep.png") 

bluepurphit = love.graphics.newImage("me/attack/bp.png")
airbluepurphit = love.graphics.newImage("me/attack/bpup.png")

youprevhealth = 0
meprevhealth = 0



function camshakeflinch()
	yhdif = youprevhealth-you.health
	mhdif = meprevhealth-me.health

	if not (actionshot or youactionshot) then
if ((youprevhealth > you.health or shakeyou) and you.x >= me.x)  then 
	camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + yhdif/2)
		camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + yhdif/2)
    --joystick2:setVibration(1,1)
elseif ((youprevhealth > you.health  or shakeyou) and you.x < me.x) then 
	camera.x = camera.x + math.ceil(math.random()) * (shakedis + yhdif/2)
		camera.y = camera.y + math.ceil(math.random()) * (shakedis + yhdif/2)
    --joystick2:setVibration(1,1)
end

if ((meprevhealth > me.health  or shakeme) and me.x < you.x) or shakeboth then 
	camera.x = camera.x + math.ceil(math.random()) * (shakedis + mhdif/2)
		camera.y = camera.y + math.ceil(math.random()) * (shakedis + mhdif/2)
    --joystick:setVibration(1,1)
elseif ((meprevhealth > me.health  or shakeme) and me.x >= me.x) then 
	camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + mhdif/2)
		camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + mhdif/2)
    --joystick:setVibration(1,1)


end
end

shakeme = false
shakeyou = false

end

function isanyonedead()

	if me.health <= 0 then 
		me.stop = true
		me.jstop = true
		if not me.g then me.im = airdying
		else
		me.im = dying
	end

	elseif you.health <= 0 then 
		you.stop = true
		you.jstop = true
		if not you.g then you.im = airdying
		else
		you.im = dying

	end
end
end


function mearmsreach(range)
	if ((you.mid - me.mid) * me.lr) < range
		and (you.mid - me.mid) * me.lr > 0
		then return true
	else return false
end
end

me.armsreach = mearmsreach

function youarmsreach(range)
	if ((me.mid - you.mid) * you.lr) < range
		and (me.mid - you.mid) * you.lr > 0
		then return true
	else return false
end
end

you.armsreach = youarmsreach

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
me.bur = false

mebgc = 0
mebgready = false
mebgcd = 0
mebre = false
me.bgcatch = false

youbpc = 0
youbpready = false
youbpcd = 0
you.bur = false



memidupv = 0
youmidupv = 0



youbgc = 0
youbgready = false
youbgcd = 0
youbre = false
you.bgcatch = false

function you.bluegreen(x)

if you.flinch or mbgcancel then youbgready = false
	youbgc = 0 
	for i = #you.bolts, 1, -1 do
		local v = you.bolts[i]
	if v.s == -200 or v.s == -201 then table.remove(you.bolts)
	end
	end
	
end

if youbgc < 0 then
youbgc = youbgc + 1 
elseif youbgc > 0 then youbgc = youbgc - 1 
youbre = true
else youbre = false
end

if youbgcd > 0 then youbgcd = youbgcd - 1 end

if youbgc == "ble" then youbgc = "bleh!"


elseif youbgc < 10 and youbgc > 0 then
	you.im = reelin
	youbre = true
	

	

elseif you.bgcatch then 
	you.im = reelin
	youbre = true
	youbgc = 9
	you.bgcatch = false
  for i = #you.bolts, 1, -1 do
		local v = you.bolts[i]
	if v.s == -200 or v.s == -201 then table.remove(you.bolts)
	end
	end
	if reel2:isStopped() then
			reel2:play()
		else reel2:rewind()
			reel2:play()
		end
	

	

elseif youbgc > 0 
	then 

	you.im = boltthrow
	

	you.stop = true
	you.jstop = true
	youbre = true 

	if not you.g then youblehfuck = true
	end

	if you.g and youblehfuck then
	youblehfuck = false

	table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -youmidupv, s = -200, v = bboltspeed * you.lr + you.v})	
	if hook2:isStopped() then
			hook2:play()
		else hook2:rewind()
			hook2:play()
		end

	else
	youmidupv = you.j
	table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -you.j, s = -200, v = bboltspeed * you.lr + you.v})	
	if chain2:isStopped() then
			chain2:play()
		else chain2:rewind()
			chain2:play()
		end
	end

	

elseif not x and youbgready then

	you.bgcatch = false
	you.im = boltthrow
	
	youbgready = false
	youbgc = 70
	you.stop = true
	you.jstop = true
	youbgcd = 120
	--this is the head

	table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = -201, v = bboltspeed * you.lr + you.v})	
	youbre = true
	youblehfuck = true

elseif x and youbgc == 0 and youbgcd == 0 
then 

	you.im = blue1start
	youbgready = true
	you.stop = true
	you.jstop = true



end



end







function bluegreen(x)

if me.flinch or mbgcancel then mebgready = false
	mebgc = 0 
	for i = #me.bolts, 1, -1 do
		local v = me.bolts[i]
	if v.s == -200 or v.s == -201 then table.remove(me.bolts)
	end
	end
end

if mebgc < 0 then
mebgc = mebgc + 1 
elseif mebgc > 0 then mebgc = mebgc - 1 
mebre = true
else mebre = false
end

if mebgcd > 0 then mebgcd = mebgcd - 1 end

if mebgc == "ble" then mebgc = "bleh!"


elseif mebgc < 10 and mebgc > 0 then
	me.im = reelin
	mebre = true
	

	

elseif me.bgcatch then 
	me.im = reelin
	mebre = true
	mebgc = 9
	me.bgcatch = false
  for i = #me.bolts, 1, -1 do
		local v = me.bolts[i]
	if v.s == -200 or v.s == -201 then table.remove(me.bolts)
	end
	end
		if reel1:isStopped() then
			reel1:play()
		else reel1:rewind()
			reel1:play()
		end
	

	

elseif mebgc > 0 
	then 

	me.im = boltthrow
	

	me.stop = true
	me.jstop = true
	mebre = true 

	if not me.g then meblehfuck = true
	end

	if me.g and meblehfuck then
	meblehfuck = false

	table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -(memidupv/2) * 2, s = -200, v = bboltspeed * me.lr + me.v})	
	else
	memidupv = me.j
	
	if hook1:isStopped() then
			hook1:play()
		else hook1:rewind()
			hook1:play()
		end
	
	table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -me.j, s = -200, v = bboltspeed * me.lr + me.v})	
	if chain1:isStopped() then
			chain1:play()
		else chain1:rewind()
			chain1:play()
		end
	end
	

elseif not x and mebgready then

	me.bgcatch = false
	me.im = boltthrow
	
	mebgready = false
	mebgc = 70
	me.stop = true
	me.jstop = true
	mebgcd = 120
	--this is the head

	table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = -201, v = bboltspeed * me.lr + me.v})	
	mebre = true
	meblehfuck = true

elseif x and mebgc == 0 and mebgcd == 0 
then 

	me.im = blue1start
	mebgready = true
	me.stop = true
	me.jstop = true



end



end



function you.bluepurple(x)
if you.flinch or ybpcancel then youbpready = false
	youbpc = 0 
end

if youbpc < 0 then
youbpc = youbpc + 1 
elseif youbpc > 0 then youbpc = youbpc - 1 
you.bur = true
else you.bur = false
end

if youbpcd > 0 then youbpcd = youbpcd - 1 end

if youbpc == "ble" then youbpc = "bleh!"

elseif youbpc > 0 
	then 

	if not you.g then you.im = airbluepurphit
	else you.im = bluepurphit
	end

	you.stop = true
	you.jstop = true
	you.bur = true

elseif not x and youbpready then

	if not you.g then you.im = airbluepurphit
	else you.im = bluepurphit
	end
	
	youbpready = false
	youbpc = 75
	you.stop = true
	you.jstop = true
	youbpcd = 110
	you.bur = true
	table.insert(youspikes, {x = you.mid + 30*you.lr, y = spikecheck(you.mid + 30*you.lr, you.y) - 140, lr = you.lr, t = 40, s = -200})
  
  repplay(bpurp2hit)

elseif x and youbpc == 0 and youbpcd == 0 
then 

if not you.g then you.im = briseprep
else you.im = blue1start
end
	youbpready = true
	you.stop = true
	you.jstop = true



end
end


function bluepurple(x)
if me.flinch or mbpcancel then mebpready = false
	mebpc = 0 
end

if mebpc < 0 then
mebpc = mebpc + 1 
elseif mebpc > 0 then mebpc = mebpc - 1 
me.bur = true
else me.bur = false
end

if mebpcd > 0 then mebpcd = mebpcd - 1 end

if mebpc == "ble" then mebpc = "bleh!"

elseif mebpc > 0 
	then 

	if not me.g then me.im = airbluepurphit
	else me.im = bluepurphit
	end

	me.stop = true
	me.jstop = true
	me.bur = true 

elseif not x and mebpready then

	if not me.g then me.im = airbluepurphit
	else me.im = bluepurphit
	end
	
	mebpready = false
	mebpc = 75
	me.stop = true
	me.jstop = true
	mebpcd = 110
	table.insert(spikes, {x = me.mid + 30*me.lr, y = spikecheck(me.mid + 30*me.lr, me.y) - 140, lr = me.lr, t = 40, s = -200})
  repplay(bpurp1hit)
	me.bur = true

elseif x and mebpc == 0 and mebpcd == 0 
then 

if not me.g then me.im = briseprep
else me.im = blue1start
end
	mebpready = true
	me.stop = true
	me.jstop = true



end
end



function you.greenpurple(x)
if you.flinch or ygpcancel then yougpready = false
	yougpc = 0 
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
	table.insert(you.bolts, {x = you.mid + 5 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = yougpupv, s = -1, v = yougpv* you.lr + you.v, time = 0,stuckinwall = false})
	if gp2:isStopped() then
			gp2:play()
		else gp2:rewind()
			gp2:play()
		end
	

elseif x and yougpc == 0 and yougpcd == 0 
then you.im = greenpurpprep
	yougpready = true
	you.stop = true
	you.jstop = true




end
end




function greenpurple(x)
if me.flinch or mgpcancel then megpready = false
	megpc = 0 
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
	table.insert(me.bolts, {x = me.mid + 5 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = megpupv, s = -1, v = megpv* me.lr + me.v, time = 0, stuckinwall = false})
	if gp1:isStopped() then
			gp1:play()
		else gp1:rewind()
			gp1:play()
		
	end

elseif x and megpc == 0 and megpcd == 0 
then me.im = greenpurpprep
	megpready = true
	me.stop = true
	me.jstop = true



end
end




youchargecounter = 0
combocounteryou = 0
attacknumberyou = 0
chargecounteryou = 0

delayycounter = 0
dodgeycounter = 0
delaymecounter = 0
me.dodgecounter = 0
dodgetime = 27
delaytime = 17
dodgespeed = 13



youdodgeanimatetimer = 0



	


dodgey = function ()



	if you.flinch 
			then you.dodgecounter = 0
		you.dodge = false
		you.dodgetype = "none"
		you.pause = false
    delayycounter = 0
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
	elseif you.block and controller2.right and dodgeycounter == 0 and not you.slide and	not noyoudodge and not you.landing
   and not 
  (you.san
  or you.gree
 or youblu
 or you.purp
 or youyell)
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
	elseif you.block and controller2.left and dodgeycounter == 0 and not you.slide and 	not noyoudodge and not you.landing
  and not 
  (you.san
  or you.gree
 or youblu
 or you.purp
 or youyell)
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

	if you.dodgetype == "front" and r2slidesound then 
		slidedodge2:play()
		r2slidesound = false
	elseif you.dodgetype == "back" and r2slidesound then
		backdodge2:play()
		r2slidesound = false
	elseif you.dodgetype == "none" then r2slidesound = true

	end
	
end


medodgeanimatetimer = 0








---
--dodge speed based on me.v
---






dodgeme = function ()



if me.flinch 
			then me.dodgecounter = 0
		me.dodge = false
		me.dodgetype = "none"
		me.pause = false
    delaymecounter = 0
	end

	if me.dodgecounter == 0 and delaymecounter > 0
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




	elseif me.dodgecounter > 0
		then 

		if me.dodgetype == "front"
		then	me.im = dodge
		if leftmeme and not rightmeme
			then me.dodgetype = "front2"
			me.im = dodge2
			me.pause = true
			me.dodgecounter = 5
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
		me.dodgecounter = me.dodgecounter - 1
		me.dodge = true
		delaymecounter = delaytime
		me.block = true
	elseif me.dodgecounter < 0
		then 

		if me.dodgetype == "front"
		then	me.im = dodge
			if rightmeme and not leftmeme
			then me.dodgetype = "front2"
			me.im = dodge2
			me.dodgecounter = -5
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
		me.dodgecounter = me.dodgecounter + 1
		me.dodge = true
		me.block = true
		delaymecounter = delaytime
	elseif me.block and controller1.right and me.dodgecounter == 0 and not me.slide and not nomedodge and not me.landing
  and not 
  (me.san
 or me.gree
 or meblu
 or me.purp
 or meyell)
		then
		me.dodge = true
		me.stop = false
		me.dodgecounter = dodgetime
		if me.leftface
			then
			me.dodgetype = "back"
			me.dodgecounter = me.dodgecounter - 11
			else me.dodgetype = "front"
		end
	elseif me.block and controller1.left and me.dodgecounter == 0 and not me.slide and not nomedodge and not me.landing
  and not 
  (me.san
 or me.gree
 or meblu
 or me.purp
 or meyell)
		then
		me.dodge = true
		me.stop = false
		me.dodgecounter = -dodgetime
		if not me.leftface
			then
			me.dodgetype = "back"
			me.dodgecounter = me.dodgecounter + 11
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

	if me.dodgetype == "front" and r1slidesound then 
		slidedodge:play()
		r1slidesound = false
	elseif me.dodgetype == "back" and r1slidesound then
		backdodge:play()
		r1slidesound = false
	elseif me.dodgetype == "none" then r1slidesound = true

	end

	
end









function blocknbusy()

	if controller1.block and delaymecounter == 0 and not controller1.a1 and not controller1.a2 and not controller1.a3 and me.g and not me.dodge and not me.landing
	then me.im = block
		me.block = true
		me.stop = true
		

	else me.block = false 
		me.stop = false
	end


	if controller2.block and delayycounter == 0 and not controller2.a1 and not controller2.a2 and not controller2.a3 and you.g and not you.dodge and not you.landing
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




















oldyft = 0
oldyg = 0
oldmeft = 0
oldmeg = 0
mefalltimer = 0
youfalltimer = 0
youflinchway = 1
meflinchway = 1
gflinchyleft = 1
gflinchmeleft = -1





flinchingyou = function ()
if you.ft > 0 then you.ft = you.ft - 1
  end

camshakeflinch()


	if youprevhealth > you.health then 
    youflinchway = me.lr * you.lr
		if you.flinch then 
    
      if you.g then gflinchyleft = you.ft end
      if you.flinchtimer == 0 then
    youfalltimer = 0
    end
    repplay(flinch2)
		else 
		repplay(minch2)
	  end
	end



if meprevhealth > me.health then 
    meflinchway = me.lr * you.lr
		if me.flinch then 
    meflinchway = me.lr * you.lr
      if me.g then gflinchmeleft = me.ft end
      if me.flinchtimer == 0 then
    mefalltimer = 0
    end
    repplay(flinch1)
    

		else 
		repplay(minch1)
	end
end



if oldyft < you.ft then
inityflinch = you.ft
end

if not you.g then youfalltimer = 0 end
if not oldyg and you.g then gflinchyleft = you.ft-you.flinchtimer end

	if you.flinchtimer > you.ft
	then 
		you.flinch = false
		you.flinchtimer = 0

	elseif you.flinch then
	you.flinchtimer = you.flinchtimer + 1
	you.stop = true
		if youflinchway > 0 then 

      if you.g and gflinchyleft>fallflinchtime then
        youfalltimer = youfalltimer + 1
        if youfalltimer <= 5 then you.im = fallforward1
        elseif you.ft - you.flinchtimer < 2 then you.im = gettingup2
      elseif youfalltimer >5 then you.im = fallforward
        youfacerot = 1.57 * me.lr
        end
      elseif inityflinch > fallflinchtime and not you.g then
      you.im = fallforward1
      else you.im = flinch
    end
    
    
		elseif youflinchway < 0 then 
      if you.g and gflinchyleft>fallflinchtime then
        youfalltimer = youfalltimer + 1
        if youfalltimer <= 5 then you.im = fallback1
          you.xoffset = 4
        elseif you.ft - you.flinchtimer < 2 then you.im = gettingup1
          you.xoffset = 6
        elseif youfalltimer >5 then you.im = fallback
          you.xoffset = 20
        end
      elseif inityflinch > fallflinchtime and not you.g then
      you.im = fallback1
      you.xoffset = 4
      else you.im = flinch
      end
		end
	end
  
  oldyft = you.ft
  oldyg = you.g

  
end

flinchingme = function ()
 if me.ft > 0 then me.ft = me.ft - 1
  end


if oldmeft < me.ft then
initmeflinch = me.ft
end
if not me.g then mefalltimer = 0 end
if not oldmeg and me.g then gflinchmeleft = me.ft-me.flinchtimer end
	if me.flinchtimer > me.ft
	then 
		me.flinch = false
		me.flinchtimer = 0
	elseif me.flinch then
	me.flinchtimer = me.flinchtimer + 1
	me.stop = true
		if meflinchway > 0 then 
      if me.g and gflinchmeleft>fallflinchtime then
        mefalltimer = mefalltimer + 1
        if mefalltimer <= 5 then me.im = fallforward1
        elseif me.ft - me.flinchtimer < 2 then me.im = gettingup2
        elseif mefalltimer >5 then me.im = fallforward
        end
      elseif initmeflinch > fallflinchtime and not me.g then
      me.im = fallforward1
      else me.im = flinch
    end
    
    
		elseif meflinchway < 0 then 
      if me.g and gflinchmeleft>fallflinchtime then
        mefalltimer = mefalltimer + 1
        if mefalltimer <= 5 then me.im = fallback1
          me.xoffset = 4
        elseif me.ft - me.flinchtimer < 2 then me.im = gettingup1
          me.xoffset = 6
        elseif mefalltimer >5 then me.im = fallback
          me.xoffset = 20
        end
      elseif initmeflinch > fallflinchtime and not me.g then
      me.im = fallback1
      me.xoffset = 4
      else me.im = flinch
      end
		end
	end
    oldmeft = me.ft
    oldmeg = me.g
end



















