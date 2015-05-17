mymines = {}
yourmines = {}

megyhold = 0
megyct = false

yougyhold = 0
yougyct = false

mebyhold = 0
mebyct = 0
mebexpc = 0
mebyready = false

youbyhold = 0
youbyct = 0
youbexpc = 0
youbyready = false

mepyhold = 0
mepyct = 0

youpyhold = 0
youpyct = 0

youyhold = 0
youyct = 0

meyhold = 0
meyct = 0


function yougy(x)
if you.flinch or mgycancel then 
	yougyct = false
	yougyhold = 0
end



if yougyhold > 0 then 
	yougyhold = yougyhold - .5
	you.stop = true
	you.jstop = true
	yougyct = false
	yougell = true
	if you.g then 
	you.im = gythrow
	else you.im = jgythrow
	end


elseif yougyct and not x then
	if you.g then 
	you.im = gythrow
	else you.im = jgythrow
	end
	yougyhold = 25
	you.stop = true
	you.jstop = true
	table.insert(yourmines, {x = you.mid, y = you.y, s = 100,explode = 0, j = (you.j*1.5) + grenadethrowy, v = you.v + (grenadethrowv * you.lr), fuse = dettime,rotate = 0})
	yougyct = false
elseif x and yougyhold == 0
	then 
	yougyct = true
	if you.g then 
	you.im = gyready
	else you.im = jgyready
	end
	you.stop = true
	you.jstop = true
else
	yougell = false
end
end



function megy(x)
if me.flinch or mgycancel then 
	megyct = false
	megyhold = 0
end



if megyhold > 0 then 
	megyhold = megyhold - .5
	me.stop = true
	me.jstop = true
	megyct = false
	megell = true
	if me.g then 
	me.im = gythrow
	else me.im = jgythrow
	end


elseif megyct and not x then
	if me.g then 
	me.im = gythrow
	else me.im = jgythrow
	end
	megyhold = 25
	me.stop = true
	me.jstop = true
	table.insert(mymines, {x = me.mid, y = me.y, s = 100,explode = 0, j = (me.j*1.5) + grenadethrowy, v = me.v + (grenadethrowv * me.lr), fuse = dettime,rotate = 0})
	megyct = false
elseif x and megyhold == 0
	then 
	megyct = true
	if me.g then 
	me.im = gyready
	else me.im = jgyready
	end
	me.stop = true
	me.jstop = true
else
	megell = false
end
end








function youby(x) 
	if you.flinch or ybycancel then 
	youbyready = false
	youbyct = 0 
	youbyhold = 0
	youbexpc = 0
	youbyready = true
end
if you.g then youbyready = true end

if youbyhold > 0 then 
	youbyhold = youbyhold - 1
	you.stop = true
	you.jstop = true
	youbyct = 0
	youbell = true
	if youarmsreach(55) and sameheight() and youbexpc < 100 and not you.dodge and youbexpc == 0
	then youbexpc = 1
	you.actionshot = true
	me.flinch = true
	me.ft = byft
	me.v = you.lr * 50
	me.health = me.health - bydam
	youbyhold = 55
	end

	if youbexpc > 0 then youbexpc = youbexpc + 1
	end
	if you.g and youbexpc > 100 then youbyhold = 0 end


	if youbexpc > 206 then you.im = aby2end 
	elseif youbexpc > 204 then you.im = aby24 you.j = 36
	elseif youbexpc > 202 then you.im = aby23 you.j = 1
		repplay(yellow2)
		if (math.abs(me.mid - you.mid))<18 and me.y > you.y and me.y < you.y + 160 then
			me.flinch = true
		me.ft = byft
		me.v = you.lr * 10
		me.g = false
		me.j = -40
		me.health = me.health - bydam
		youbyhold = 55
		end 
	elseif youbexpc > 200 then you.im = aby22 you.j = 1

	elseif youbexpc > 106 then you.im = abyend you.yoffset = 132	
	elseif youbexpc > 104 then you.im = aby4 you.yoffset = 132	you.j = -20
	elseif youbexpc > 102 then you.im = aby3 you.yoffset = 132	you.j = 1
		repplay(yellow2)
		if (math.abs(me.mid - you.mid))<18 and me.y < you.y and me.y > you.y - 160 then
			me.flinch = true
		me.ft = byft
		me.v = you.lr * 10
		me.g = false
		me.j = 40
		me.health = me.health - bydam
		youbyhold = 55
		end 
	elseif youbexpc > 100 then you.im = aby2 you.yoffset = 132 you.j = 1

	elseif youbexpc > 10 then 
		if youbexpc%25>12 then you.im = yblueend
		else you.im = yblueend2
		end

	elseif youbexpc > 8 then you.im = yblue5
		you.v = -you.lr * 20
	elseif youbexpc > 6 then you.im = yblue4
	elseif youbexpc > 4 then you.im = yblue3
	elseif youbexpc > 2 then you.im = yblue2
	elseif youbexpc > 0 then you.im = yblue
	else		
	you.im = yblue
	end


elseif youbyct > 0 and not x and not you.g then
	youbyready = false

	if (you.j >= 0 and not you.down) or (you.up and you.j < 0) then
	youbyhold = 25
	youbexpc = 100
	you.im = aby2 
	you.yoffset = 132
	you.j = 1
	elseif (you.j < 0 and not you.up) or (you.down and you.j >= 0) then
	youbyhold = 25
	youbexpc = 200
	you.im = aby22 
	you.j = 1
	end

elseif youbyct > 0 and you.g and not x then
	you.im = yblue
	youbyhold = 15
	you.stop = true
	you.jstop = true
	youbyct = 0
	youbexpc = 0
	

elseif x and youbyhold == 0 and youbyready
	then 

	if you.j > 0 then you.im = briseprep
	elseif you.j < 0 then you.im = bfallprep
	else you.im = blue1start end

	youbyct = youbyct + 1
	you.stop = true
	you.jstop = true
	youbexpc = 0
else youbell = false
		youbexpc = 0
		youbyct = 0 
end
end





function meby(x) 
	if me.flinch or mbycancel then 
	mebyready = false
	mebyct = 0 
	mebyhold = 0
	mebexpc = 0
	mebyready = true
end
if me.g then mebyready = true end

if mebyhold > 0 then 
	mebyhold = mebyhold - 1
	me.stop = true
	me.jstop = true
	mebyct = 0
	mebell = true
	if mearmsreach(55) and sameheight() and mebexpc < 100 and not you.dodge and mebexpc == 0
	then mebexpc = 1
	me.actionshot = true
	you.flinch = true
	you.ft = byft
	you.v = me.lr * 50
	you.health = you.health - bydam
	mebyhold = 55
	end

	if mebexpc > 0 then mebexpc = mebexpc + 1
	end
	if me.g and mebexpc > 100 then mebyhold = 0 end


	if mebexpc > 206 then me.im = aby2end 
	elseif mebexpc > 204 then me.im = aby24 me.j = 36
	elseif mebexpc > 202 then me.im = aby23 me.j = 1
		repplay(yellow1)
		if (math.abs(me.mid - you.mid))<18 and you.y > me.y and you.y < me.y + 160 then
			you.flinch = true
		you.ft = byft
		you.v = me.lr * 10
		you.g = false
		you.j = -40
		you.health = you.health - bydam
		mebyhold = 55
		end 
	elseif mebexpc > 200 then me.im = aby22 me.j = 1

	elseif mebexpc > 106 then me.im = abyend me.yoffset = 132	
	elseif mebexpc > 104 then me.im = aby4 me.yoffset = 132	me.j = -20
	elseif mebexpc > 102 then me.im = aby3 me.yoffset = 132	me.j = 1
		repplay(yellow1)
		if (math.abs(me.mid - you.mid))<18 and you.y < me.y and you.y > me.y - 160 then
			you.flinch = true
		you.ft = byft
		you.v = me.lr * 10
		you.g = false
		you.j = 40
		you.health = you.health - bydam
		mebyhold = 55
		end 
	elseif mebexpc > 100 then me.im = aby2 me.yoffset = 132 me.j = 1

	elseif mebexpc > 10 then 
		if mebexpc%25>12 then me.im = yblueend
		else me.im = yblueend2
		end

	elseif mebexpc > 8 then me.im = yblue5
		me.v = -me.lr * 20
	elseif mebexpc > 6 then me.im = yblue4
	elseif mebexpc > 4 then me.im = yblue3
	elseif mebexpc > 2 then me.im = yblue2
	elseif mebexpc > 0 then me.im = yblue
	else		
	me.im = yblue
	end


elseif mebyct > 0 and not x and not me.g then
	mebyready = false

	if (me.j >= 0 and not me.down) or (me.up and me.j < 0) then
	mebyhold = 25
	mebexpc = 100
	me.im = aby2 
	me.yoffset = 132
	me.j = 1
	elseif (me.j < 0 and not me.up) or (me.down and me.j >= 0) then
	mebyhold = 25
	mebexpc = 200
	me.im = aby22 
	me.j = 1
	end

elseif mebyct > 0 and me.g and not x then
	me.im = yblue
	mebyhold = 15
	me.stop = true
	me.jstop = true
	mebyct = 0
	mebexpc = 0
	

elseif x and mebyhold == 0 and mebyready
	then 

	if me.j > 0 then me.im = briseprep
	elseif me.j < 0 then me.im = bfallprep
	else me.im = blue1start end

	mebyct = mebyct + 1
	me.stop = true
	me.jstop = true
	mebexpc = 0
else mebell = false
		mebexpc = 0
		mebyct = 0 
end
end




function mepy(x) 
	if me.flinch or ypycancel then 
	mepyready = false
	mepyct = 0 
	mepyhold = 0
end

if mepyhold > 0 then 
	mepyhold = mepyhold - 1
	me.stop = true
	me.jstop = true
	mepyct = 0
	mepell = true
	if me.g then 
	me.im = ythrow
else me.im = jythrow
	end


elseif mepyct > 0 and not x then
	if me.g then 
	me.im = ythrow
else me.im = jythrow
	end
	mepyhold = 25
	me.stop = true
	me.jstop = true
	table.insert(mymines, {x = me.mid, y = me.y+30, s = -1,explode = purplefuse})
	mepyct = 0

elseif x 
	then 
	mepyct = mepyct + 1
	me.im = pyready
	me.stop = true
	me.jstop = true
	if me.g then 
	me.im = pyready
else me.im = jpyready
	end


else mepell = false
end
end


function youpy(x) 
	if you.flinch or ypycancel then 
	youpyready = false
	youpyct = 0 
	youpyhold = 0
end

if youpyhold > 0 then 
	youpyhold = youpyhold - 1
	you.stop = true
	you.jstop = true
	youpyct = 0
	youpell = true
	if you.g then 
	you.im = ythrow
else you.im = jythrow
	end


elseif youpyct > 0 and not x then
	if you.g then 
	you.im = ythrow
else you.im = jythrow
	end
	youpyhold = 25
	you.stop = true
	you.jstop = true
	table.insert(yourmines, {x = you.mid, y = you.y+30, s = -1,explode = purplefuse})
	youpyct = 0
elseif x 
	then 
	youpyct = youpyct + 1
	if you.g then 
	you.im = pyready
else you.im = jpyready
	end
	you.stop = true
	you.jstop = true
else youpell = false
end









end







function youmines(x)

youatleastonemine = false
for i,v in ipairs(yourmines)do
		if v.s == 0 then youatleastonemine = true end
	end



if you.flinch or you.ycancel then 
	youyready = false
	youyct = 0 
	youyhold = 0
end


if youyhold < 0 then 
	youyhold = youyhold + 1
	you.stop = true
	you.jstop = true
	youyct = 0
	youyell = true
	if you.g then
	you.im = ycthrow
	else you.im = jycthrow
	end

elseif youyhold > 0 then 
	youyhold = youyhold - 1
	you.stop = true
	you.jstop = true
	youyct = 0
	youyell = true
	if you.g then 
	you.im = ythrow
else you.im = jythrow
	end

elseif youyct > ychargetime and not x and youatleastonemine then
	if you.g then
	you.im = ycthrow
	else you.im = jycthrow
	end
	youyhold = -15
	you.stop = true
	you.jstop = true
	for i,v in ipairs(yourmines)do
		if v.s == 0 then v.s = 1 v.explode = 1 end
	end
	youyct = 0


elseif youyct > ychargetime and youatleastonemine then
	if you.g then
	you.im = ycready
	else you.im = jycready
	end
	you.stop = true
	you.jstop = true

elseif youyct > 0 and not x then
	if you.g then 
	you.im = ythrow
else you.im = jythrow
	end
	youyhold = 7
	you.stop = true
	you.jstop = true
	table.insert(yourmines, {x = you.mid, y = you.y+30, s = 0,explode = 0})
	youyct = 0
elseif x 
	then 
	youyct = youyct + 1
	if you.g then 
	you.im = yready
else you.im = jyready
	end
	you.stop = true
	you.jstop = true
else youyell = false
end







end


function youdrawmines()
for i,v in ipairs(yourmines) do

	if table.getn(yourmines) >= 6 then table.remove(yourmines, i-5) end


	for n,spike in ipairs(me.spikes) do 
	if spike.t > 0 and math.abs((spike.x + 15) - v.x) < 30 and v.explode == 0 then
		v.explode = 1

	end
	end


	if v.s == 1 or v.s == 0 or v.s == -1 then
	if v.y + minedropgrav < minecheck(v.x, v.y) then v.y = v.y + minedropgrav
		-- if + minegrav * 2 then sound of it landing
	else v.y = minecheck(v.x,v.y)
	end
	end



	if v.s == 100 then 
		if v.j > - 6 then
		v.j = v.j - .15
		end

		if v.x + v.v >= enviro.rightwall-38 
			then v.x = enviro.rightwall-38 v.rotate = -1.57 v.v = 0 v.j = 0

		elseif v.x + v.v <= 60 
			then v.x = 60 v.rotate = 1.57 v.v = 0 v.j = 0

		elseif v.y - v.j < minecheck(v.x + v.v, v.y) 
			then v.y = v.y - v.j
			v.rotate = v.rotate + .1
		-- if + minegrav * 2 then sound of it landing
		else v.y = minecheck(v.x + v.v,v.y)
			v.rotate = 0
			v.j = 0
			v.v = 0
		end

		v.x = v.x + v.v
		v.fuse = v.fuse - 1

		if v.fuse < 0 then 
			repplay(grenade2)
			table.remove(yourmines, i)
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 0, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 1, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -1, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 2, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -2, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 3, s = 0, v = boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -3, s = 0, v = boltspeed * 1})

	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 0, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 1, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -1, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 2, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -2, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 3, s = 0, v = -boltspeed * 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -3, s = 0, v = -boltspeed * 1})

	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = .000001})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 2})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -2})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 3})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -3})

	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = .000001})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 2})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -1})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -2})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 3})
	table.insert(you.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -3})

	

		end



	lg.draw(grenade, v.x - 10, v.y - 16, v.rotate)
	end






if v.s == -1 then
	if math.abs(me.mid-v.x) < 300 and me.feet >= v.y - 200 and me.y < v.y and v.explode >= 0 then 
		
		table.remove(yourmines,i)
		
	table.insert(you.spikes, {x = v.x + (0 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = 0, s = 0, ss = 2})
	table.insert(you.spikes, {x = v.x + (-30 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -6, s = 0, ss = 2})
	table.insert(you.spikes, {x = v.x + (-65 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -12, s = 0, ss = 2})
	table.insert(you.spikes, {x = v.x + (-100 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -18, s = 0, ss = 2})
	table.insert(you.spikes, {x = v.x + (-135 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -24, s = 0, ss = 2})
	
table.insert(you.spikes, {x = v.x + (0 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = 0, s = 0, ss =1})
	table.insert(you.spikes, {x = v.x + (30 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -6, s = 0, ss =1})
	table.insert(you.spikes, {x = v.x + (65 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -12, s = 0, ss =1})
	table.insert(you.spikes, {x = v.x + (100 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -18, s = 0, ss =1})
	table.insert(you.spikes, {x = v.x + (135 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -24, s = 0, ss =1})




	for p, spike in ipairs(you.spikes) do

		

		if p > 1 and you.spikes[p - 1].y > 0 and you.spikes[p - 1].s ~= -200 and spike.ss == 2 and you.spikes[p-1].ss == 2
				then
		you.spikes[p].y = you.spikes[p - 1].y - 60 
		end
		
		
	spike.y = spikecheck(spike.x + (80 * spike.lr), spike.y - 8) - 60

	if spikecheck(spike.x + (80 * spike.lr), spike.y) ~= spikecheck(spike.x, spike.y)
		then spike.y = - 100
		end
		end



	for p, spike in ipairs(you.spikes) do

		

		if p > 1 and you.spikes[p - 1].y > 0 and you.spikes[p - 1].s ~= -200 and spike.ss == 1 and you.spikes[p-1].ss == 1
				then
		you.spikes[p].y = you.spikes[p - 1].y - 60 
		end
		
		
	spike.y = spikecheck(spike.x + (80 * spike.lr), spike.y - 8) - 60

	if spikecheck(spike.x + (80 * spike.lr), spike.y) ~= spikecheck(spike.x, spike.y)
		then spike.y = - 100
		end
		end









	else lg.draw(pmine, v.x - 5, v.y - 10)
		if v.explode < 1 then
		v.explode = v.explode + 1
		end
	end


	

	elseif v.s == 1 then 
		if v.explode == 2 then repplay(cyellow2) end
	if math.abs(me.mid-v.x) < 180 and v.explode == 5 and me.feet >= v.y - 200 and me.y < v.y
		then

		if me.mid - v.x > 0 then 
		me.v = 25
		else me.v = -25
		end
			me.g = false
			me.j = 42
			me.flinch = true
			me.ft = cyft
			me.health = me.health - cminedam

	end
	


	
	elseif v.s == -10 then 
		if math.abs(me.mid-v.x) < 100 and v.explode == 0 and me.feet >= v.y - 100 and me.y < v.y + 100
		then v.explode = 1
		end
		if v.explode == 2 then repplay(cyellow2) end
	if math.abs(me.mid-v.x) < 150 and v.explode == 5 and me.feet >= v.y - 150 and me.y < v.y + 150
		then

		if me.mid - v.x > 0 then 
		me.v = 25
		else me.v = -25
		end
		if me.y < v.y then 
			me.j = 30
		elseif me.y >= v.y then 
			me.j = -30
		end
			me.g = false
			me.flinch = true
			me.ft = cyft
			me.health = me.health - sminedam

	end

	elseif v.s == 0 then 
		if v.explode == 2 then repplay(yellow2) end
	if math.abs(me.mid-v.x) < 20 and v.explode == 0 and me.feet >= v.y and me.y < v.y
		then v.explode = v.explode + 1 
			if me.mid - v.x > 0 then 
		me.v = 17
		else me.v = -17
		end
			me.g = false
			me.j = 30
			me.flinch = true
			me.ft = yft
			me.health = me.health - minedam
	elseif math.abs(me.mid-v.x) < 100 and v.explode == 6 and me.feet >= v.y - 60 and me.y < v.y 
		then
		if me.mid-v.x > 0 then 
		me.v = 15
	else 
		me.v = -15
	end
		if not me.g then me.j = 10
		end
	end
	end




	if v.s == 1 then 
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 10 then 
		table.remove(yourmines,i)
		elseif v.explode > 8 then lg.draw(cmine6, v.x - 100, v.y - 200)
		
		elseif v.explode > 6 then lg.draw(cmine5, v.x - 100, v.y - 200)
		
		elseif v.explode >4 then lg.draw(cmine4, v.x - 100, v.y - 200)
		
		elseif v.explode > 2  then lg.draw(cmine3, v.x - 100, v.y - 200)
		
		elseif v.explode >= 1 then lg.draw(cmine2, v.x - 100, v.y - 200)
		
		elseif v.explode == 0 then lg.draw(mine, v.x - 5, v.y - 10)
		end

	elseif v.s == -10 then
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 12 then 
		table.remove(yourmines,i)

		elseif v.explode > 10 then lg.draw(bombdet6, v.x - 150, v.y - 150)

		elseif v.explode > 8 then lg.draw(bombdet5, v.x - 150, v.y - 150)
		
		elseif v.explode > 6 then lg.draw(bombdet4, v.x - 150, v.y - 150)
		
		elseif v.explode >4 then lg.draw(bombdet3, v.x - 150, v.y - 150)
		
		elseif v.explode > 2  then lg.draw(bombdet2, v.x - 150, v.y - 150)
		
		elseif v.explode >= 1 then lg.draw(bombdet1, v.x - 150, v.y - 150)
		repplay(cyellow2)
		elseif v.explode == 0 then lg.draw(airbomb, v.x - 15, v.y - 15)

	end

	elseif v.s == 0 then
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 10 then 
		table.remove(yourmines,i)
		elseif v.explode > 8 then lg.draw(mine6, v.x - 30, v.y - 60)
		
		elseif v.explode > 6 then lg.draw(mine5, v.x - 30, v.y - 60)
		
		elseif v.explode >4 then lg.draw(mine4, v.x - 30, v.y - 60)
		
		elseif v.explode > 2  then lg.draw(mine3, v.x - 30, v.y - 60)
		
		elseif v.explode >= 1 then lg.draw(mine2, v.x - 30, v.y - 60)
		
		elseif v.explode == 0 then lg.draw(mine, v.x - 5, v.y - 10)

	end
	end


end


end





function memines(x)

meatleastonemine = false
for i,v in ipairs(mymines)do
		if v.s == 0 then meatleastonemine = true end
	end


if me.flinch or me.ycancel then 
	
	meyct = 0 
	meyhold = 0
end



if meyhold < 0 then 
	meyhold = meyhold + 1
	me.stop = true
	me.jstop = true
	meyct = 0
	meyell = true
	if me.g then
	me.im = ycthrow
	else me.im = jycthrow
	end

elseif meyhold > 0 then 
	meyhold = meyhold - 1
	me.stop = true
	me.jstop = true
	meyct = 0
	meyell = true
	if me.g then 
	me.im = ythrow
else me.im = jythrow
	end

elseif meyct > ychargetime and not x and meatleastonemine then
	if me.g then
	me.im = ycthrow
	else me.im = jycthrow
	end
	meyhold = -15
	me.stop = true
	me.jstop = true
	for i,v in ipairs(mymines)do
		if v.s == 0 then v.s = 1 v.explode = 1 end
	end
	meyct = 0



elseif meyct > ychargetime and meatleastonemine then
	if me.g then
	me.im = ycready
	else me.im = jycready
	end
	me.stop = true
	me.jstop = true

elseif meyct > 0 and not x then
	if me.g then 
	me.im = ythrow
else me.im = jythrow
	end
	meyhold = 7
	me.stop = true
	me.jstop = true
	table.insert(mymines, {x = me.mid, y = me.y+30, s = 0,explode = 0})
	meyct = 0
elseif x 
	then 
	meyct = meyct + 1
	if me.g then 
	me.im = yready
else me.im = jyready
	end
	me.stop = true
	me.jstop = true
else
	meyell = false
end







end


function medrawmines()
for i,v in ipairs(mymines) do




	if table.getn(mymines) >= 6 then table.remove(mymines, i-5) end








	for n,spike in ipairs(you.spikes) do 
	if spike.t > 0 and math.abs((spike.x + 15) - v.x) < 30 and v.explode == 0 then
		v.explode = 1

	end
	end





if v.s == 1 or v.s == 0 or v.s == -1 then
	if v.y + minedropgrav < minecheck(v.x, v.y) 
		then v.y = v.y + minedropgrav
		-- if + minegrav * 2 then sound of it landing
	else v.y = minecheck(v.x,v.y)
	end
	end








	if v.s == 100 then 
		if v.j > - 6 then
		v.j = v.j - .15
		end


	
		if v.x + v.v >= enviro.rightwall-38 
			then v.x = enviro.rightwall-38 v.rotate = -1.57 v.v = 0 v.j = 0

		elseif v.x + v.v <= 60 
			then v.x = 60 v.rotate = 1.57 v.v = 0 v.j = 0


		elseif v.y - v.j < minecheck(v.x + v.v, v.y) 
			then v.y = v.y - v.j
			v.rotate = v.rotate + .2
		-- if + minegrav * 2 then sound of it landing
		else v.y = minecheck(v.x + v.v,v.y)
			v.j = 0
			v.v = 0
			v.rotate = 0
		end

		v.x = v.x + v.v
		v.fuse = v.fuse - 1

		if v.fuse < 0 then 
			repplay(grenade1)
			table.remove(mymines, i)
		table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 0, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 1, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -1, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 2, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -2, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = 3, s = 0, v = boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -3, s = 0, v = boltspeed * 1})

	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 0, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 1, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -1, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 2, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -2, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = 3, s = 0, v = -boltspeed * 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = -1, time = 0, upv = -3, s = 0, v = -boltspeed * 1})

	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = .000001})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 2})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -2})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = 3})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = boltspeed, s = 0, v = -3})

	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = .000001})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 2})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -1})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -2})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = 3})
	table.insert(me.bolts, {x = v.x   * 1 , y = v.y - 20, lr = 1, time = 0, upv = -boltspeed, s = 0, v = -3})

	


		end



	lg.draw(grenade, v.x - 10, v.y - 16,v.rotate)
	end






if v.s == -1 then
	if math.abs(you.mid-v.x) < 300 and you.feet >= v.y - 200 and you.y < v.y and v.explode >= 0
		then
		table.remove(mymines,i)
		
	table.insert(me.spikes, {x = v.x + (0 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = 0, s = 0, ss = 2})
	table.insert(me.spikes, {x = v.x + (-30 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -6, s = 0, ss = 2})
	table.insert(me.spikes, {x = v.x + (-65 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -12, s = 0, ss = 2})
	table.insert(me.spikes, {x = v.x + (-100 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -18, s = 0, ss = 2})
	table.insert(me.spikes, {x = v.x + (-135 - math.random(8)) , y = v.y - 10 - math.random(8), lr = -1, t = -24, s = 0, ss = 2})

table.insert(me.spikes, {x = v.x + (0 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = 0, s = 0, ss =1})
	table.insert(me.spikes, {x = v.x + (30 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -6, s = 0, ss =1})
	table.insert(me.spikes, {x = v.x + (65 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -12, s = 0, ss =1})
	table.insert(me.spikes, {x = v.x + (100 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -18, s = 0, ss =1})
	table.insert(me.spikes, {x = v.x + (135 + math.random(8)) * 1, y = v.y - 10 + math.random(8), lr = 1, t = -24, s = 0, ss =1})



	for p, spike in ipairs(me.spikes) do

		

		if p > 1 and me.spikes[p - 1].y > 0 and me.spikes[p - 1].s ~= -200 and spike.ss == 2 and me.spikes[p-1].ss == 2
				then
		me.spikes[p].y = me.spikes[p - 1].y - 60 
		end
		
		
	spike.y = spikecheck(spike.x + (80 * spike.lr), spike.y - 8) - 60

	if spikecheck(spike.x + (80 * spike.lr), spike.y) ~= spikecheck(spike.x, spike.y)
		then spike.y = - 100
		end
		end



	for p, spike in ipairs(me.spikes) do

		

		if p > 1 and me.spikes[p - 1].y > 0 and me.spikes[p - 1].s ~= -200 and spike.ss == 1 and me.spikes[p-1].ss == 1
				then
		me.spikes[p].y = me.spikes[p - 1].y - 60 
		end
		
		
	spike.y = spikecheck(spike.x + (80 * spike.lr), spike.y - 8) - 60

	if spikecheck(spike.x + (80 * spike.lr), spike.y) ~= spikecheck(spike.x, spike.y)
		then spike.y = - 100
		end
		end









	else lg.draw(pmine, v.x - 5, v.y - 10)
		if v.explode < 1 then
		v.explode = v.explode + 1
		end
	end




	elseif v.s == 1 then 
		if v.explode == 2 then repplay(cyellow1) end
	if math.abs(you.mid-v.x) < 180 and v.explode == 5 and you.feet >= v.y - 200 and you.y < v.y
			
		then
		if you.mid - v.x > 0 then 
		you.v = 25
		else you.v = -25
		end
			you.g = false
			you.j = 42
			you.flinch = true
			you.ft = cyft
			you.health = you.health - cminedam

	end




	elseif v.s == -10 then 
		if math.abs(you.mid-v.x) < 100 and v.explode == 0 and you.feet >= v.y - 100 and you.y < v.y + 100
		then v.explode = 1
		end
		if v.explode == 2 then repplay(cyellow1) end
	if math.abs(you.mid-v.x) < 150 and v.explode == 5 and you.feet >= v.y - 150 and you.y < v.y + 150
		then

		if you.mid - v.x > 0 then 
		you.v = 25
		else you.v = -25
		end
		if you.y < v.y then 
			you.j = 30
		elseif you.y >= v.y then 
			you.j = -30
		end
			you.g = false
			you.flinch = true
			you.ft = cyft
			you.health = you.health - sminedam

	end

	elseif v.s == 0 then 
		if v.explode == 2 then repplay(yellow1) end
		if math.abs(you.mid-v.x) < 20 and v.explode == 0 and you.feet >= v.y and you.y < v.y
		then v.explode = v.explode + 1 
			if you.mid - v.x > 0 then 
			you.v = 17
			else you.v = -17
			end
			you.g = false
			you.j = 30
			you.flinch = true
			you.ft = yft
			you.health = you.health - minedam
		elseif math.abs(you.mid-v.x) < 100 and v.explode == 6 and you.feet >= v.y - 60 and you.y < v.y 
		then
			if you.mid-v.x > 0 then 
			you.v = 15
			else 
			you.v = -15
			end
			if not you.g then you.j = 10
			end
		end

	end


	







	if v.s == 1 then 
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 10 then 
		table.remove(mymines,i)
		elseif v.explode > 8 then lg.draw(cmine6, v.x - 100, v.y - 200)
		
		elseif v.explode > 6 then lg.draw(cmine5, v.x - 100, v.y - 200)
		
		elseif v.explode >4 then lg.draw(cmine4, v.x - 100, v.y - 200)
		
		elseif v.explode > 2  then lg.draw(cmine3, v.x - 100, v.y - 200)
		
		elseif v.explode >= 1 then lg.draw(cmine2, v.x - 100, v.y - 200)
		
		elseif v.explode == 0 then lg.draw(mine, v.x - 5, v.y - 10)
		end

	elseif v.s == -10 then
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 12 then 
		table.remove(mymines,i)

		elseif v.explode > 10 then lg.draw(bombdet6, v.x - 150, v.y - 150)

		elseif v.explode > 8 then lg.draw(bombdet5, v.x - 150, v.y - 150)
		
		elseif v.explode > 6 then lg.draw(bombdet4, v.x - 150, v.y - 150)
		
		elseif v.explode >4 then lg.draw(bombdet3, v.x - 150, v.y - 150)
		
		elseif v.explode > 2  then lg.draw(bombdet2, v.x - 150, v.y - 150)
		
		elseif v.explode >= 1 then lg.draw(bombdet1, v.x - 150, v.y - 150)
		repplay(cyellow1)
		elseif v.explode == 0 then lg.draw(airbomb, v.x - 15, v.y - 15)

	end

	elseif v.s == 0 then
		if v.explode > 0 then v.explode = v.explode + 1 end
		if v.explode == 10 then 
		table.remove(mymines,i)
		elseif v.explode > 8 then lg.draw(mine6, v.x - 30, v.y - 60)
		
		elseif v.explode > 6 then lg.draw(mine5, v.x - 30, v.y - 60)
		
		elseif v.explode >4 then lg.draw(mine4, v.x - 30, v.y - 60)
		
		elseif v.explode > 2  then lg.draw(mine3, v.x - 30, v.y - 60)
		
		elseif v.explode >= 1 then lg.draw(mine2, v.x - 30, v.y - 60)
		
		elseif v.explode == 0 then lg.draw(mine, v.x - 5, v.y - 10)

	end
	end


end


end

