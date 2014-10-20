--PURP SAND CHECK, DO A LOOP FOR ALL THE SPACES BETWEEN ME.X AND YOU.X TO SEE IF PLATCHECK IS THE SAME
--modular attacks, have me.v,me.x,me.y = function() and just return the values?

sready = love.graphics.newImage("me/attack/s.png")
sflap = love.graphics.newImage("me/attack/sflap.png")
jsready = love.graphics.newImage("me/attack/js.png")
jsflap = love.graphics.newImage("me/attack/jsflap.png")
sbackflap = love.graphics.newImage("me/attack/sbackflap.png")
bigflap = love.graphics.newImage("me/attack/bigflap.png")
bigwings = love.graphics.newImage("me/attack/bigwings.png")
tor = love.graphics.newImage("me/attack/tor.png")
bsend = love.graphics.newImage("me/attack/bsend.png")
bsstart = love.graphics.newImage("me/attack/bsstart.png")
sandbolt = love.graphics.newImage("me/attack/sandbolt.png")
sandboltready = love.graphics.newImage("me/attack/sandboltready.png")

purpwings = love.graphics.newImage("me/attack/purpwings.png")
wingswing1 = love.graphics.newImage("me/attack/wingswing1.png")
wingswing2 = love.graphics.newImage("me/attack/wingswing2.png")
wingswing3 = love.graphics.newImage("me/attack/wingswing3.png")
upflap = love.graphics.newImage("me/attack/upflap.png")

syready = love.graphics.newImage("me/attack/syready.png")
jsyready = love.graphics.newImage("me/attack/jsyready.png")

sandchargetime = 50
tornadowidth = 20
tornadodur = 800




mesct = 0
meshold = 0
mswait = 0

mebsct = false
mebshold = 0
mebspause = 0

mytornado = {}


yousct = 0
youshold = 0
yswait = 0

youbsct = false
youbshold = 0
youbspause = 0

yourtornado = {}

ypsrr = false
ypswwait = 0
ypshhold = 0

mpsrr = false
mpswwait = 0
mpshhold = 0



mesyct = false 
mesyhold = 0
mesywait = 0

yousyct = false 
yousywait = 0
yousyhold = 0


function yousandmines(x)
if you.flinch or msycancel then 
	
	yousyct = false 
	yousyhold = 0
	yousywait = 0
	you.jstop = false
end



if yousywait > 0 and yousyhold == 0 then
	yousywait = yousywait - 1
	youyen = false

elseif yousyhold > 0 then 
	yousywait = 120
	yousyhold = yousyhold - 1
	you.stop = true
	you.jstop = true
	yousyct = false
	youyen = true
	if you.g then 
	you.im = ythrow
else you.im = jythrow
	end


elseif yousyct and not x then
	youyen = true
	if you.g then 
	you.im = ythrow
	else you.im = jythrow
	end
	yousyhold = 10
	you.stop = true
	you.jstop = true
	for i,v in ipairs(yourmines) do
		if v.s == -10 then table.remove(yourmines, i)
	end
	end
	table.insert(yourmines, {x = you.mid, y = you.y+30, s = -10,explode = 0})
	yousyct = false
elseif x 
	then 
	yousyct = true
	if you.g then 
	you.im = syready
	else you.im = jsyready
	end
	you.stop = true
	you.jstop = true
else
	youyen = false
end







end


function mesandmines(x)
if me.flinch or msycancel then 
	
	mesyct = false 
	mesyhold = 0
	me.jstop = false
	mesywait = 0
end



if mesywait > 0 and mesyhold == 0 then
	mesywait = mesywait - 1
	meyen = false

elseif mesyhold > 0 then 
	mesywait = 120
	mesyhold = mesyhold - 1
	me.stop = true
	me.jstop = true
	mesyct = false
	meyen = true
	if me.g then 
	me.im = ythrow
else me.im = jythrow
	end


elseif mesyct and not x then
	meyen = true
	if me.g then 
	me.im = ythrow
	else me.im = jythrow
	end
	mesyhold = 10
	me.stop = true
	me.jstop = true
	for i,v in ipairs(mymines) do
		if v.s == -10 then table.remove(mymines, i)
	end
	end
	table.insert(mymines, {x = me.mid, y = me.y+30, s = -10,explode = 0})
	mesyct = false
elseif x 
	then 
	mesyct = true
	if me.g then 
	me.im = syready
	else me.im = jsyready
	end
	me.stop = true
	me.jstop = true
else
	meyen = false
end







end








function checkalong(mx,my,yx,yy)
local mxx = mx
local myy = my
local yxx = yx
local yyy = yy

if my ~= yy then return false end

if mxx > yxx then

repeat 
if platformy(mxx,myy) ~= platformy(yxx,yyy) then
	return false
end
mxx = mxx - 5
until 
mxx < yxx	

else

repeat 
if platformy(mxx,myy) ~= platformy(yxx,yyy) then
	return false
end
mxx = mxx + 5
until 
mxx > yxx	
end	

return true

end

function youpurpsand(x)


if you.flinch or ypscancel then 
	ypsrr = false
	ypshhold = 0
	ypswwait = 0
	you.jstop = false
end



if ypswwait > 0 and ypshhold == 0 then 
	ypswwait = ypswwait - 1



elseif ypshhold > 0 then 
	you.stop = true
	you.jstop = true

	ypswwait = 140

	ypshhold = ypshhold - 1
	
	if ypshhold > 42 then
	you.im = wingswing1
	you.yoffset = 40
	youxoffset = 166
	elseif ypshhold > 41 then
	you.im = wingswing2
	you.yoffset = 40
	youxoffset = 166
	elseif ypshhold > 0 then
	you.im = wingswing3
	you.yoffset = 40
	youxoffset = 166

	if ypshhold == 40 then
	if me.mid * you.lr < you.mid * you.lr and me.mid * you.lr > (you.mid) * you.lr - 110
		and me.y < you.feet and me.feet > you.y then 
		me.v = -you.lr*30
		me.g = false
		me.j = 30
		me.flinch = true
		me.ft = psft
		me.health = me.health - psdam * 3
	elseif checkalong(me.mid,me.feet,you.mid,you.feet) then
	me.g = false
	me.j = 40
	me.flinch = true
	me.ft = psft
	me.health = me.health - psdam
	end
	
	end
	
	end

elseif ypsrr and not x then

	you.im = purpwings
	you.yoffset = 40
	youxoffset = 26
	ypshhold = 43
	you.stop = true
	you.jstop = true
	ypsrr = false




elseif x and ypswwait == 0 and you.g then 

	you.im = purpwings
	you.yoffset = 40
	youxoffset = 26


	ypsrr = true
	you.stop = true
	you.jstop = true
else
	youpun = false
end

end



function mepurpsand(x)


if me.flinch or mpscancel then 
	mpsrr = false
	mpshhold = 0
	mpswwait = 0
	me.jstop = false
end



if mpswwait > 0 and mpshhold == 0 then 
	mpswwait = mpswwait - 1



elseif mpshhold > 0 then 
	me.stop = true
	me.jstop = true

	mpswwait = 140

	mpshhold = mpshhold - 1
	
	if mpshhold > 42 then
	me.im = wingswing1
	me.yoffset = 40
	mexoffset = 166
	elseif mpshhold > 41 then
	me.im = wingswing2
	me.yoffset = 40
	mexoffset = 166
	elseif mpshhold > 0 then
	me.im = wingswing3
	me.yoffset = 40
	mexoffset = 166

	if mpshhold == 40 then
	if you.mid * me.lr < me.mid * me.lr and you.mid * me.lr > (me.mid) * me.lr - 110
		and you.y < me.feet and you.feet > me.y then 
		you.v = -me.lr*30
		you.g = false
		you.j = 30
		you.flinch = true
		you.ft = psft
		you.health = you.health - psdam * 3
	elseif checkalong(you.mid,you.feet,me.mid,me.feet) then
	you.g = false
	you.j = 40
	you.flinch = true
	you.ft = psft
	you.health = you.health - psdam
	end
	
	end
	
	end

elseif mpsrr and not x then

	me.im = purpwings
	me.yoffset = 40
	mexoffset = 26
	mpshhold = 43
	me.stop = true
	me.jstop = true
	mpsrr = false




elseif x and mpswwait == 0 and me.g then 

	me.im = purpwings
	me.yoffset = 40
	mexoffset = 26


	mpsrr = true
	me.stop = true
	me.jstop = true
else
	mepun = false
end

end







mebslevel = 0
youbslevel = 0

gsrr = false
gswwait = 0
gshhold = 0
ygsrr = false
ygswwait = 0
ygshhold = 0

function yougreensand(x)


if you.flinch or mygscancel then 
	ygsrr = false
	ygshhold = 0
	ygswwait = 0
	you.jstop = false
end



if ygswwait > 0 and ygshhold == 0 then 
	ygswwait = ygswwait - 1
	yougran = false

elseif ygshhold > 0 then 

	if not yupgs and not you.g then
		you.im = jsflap
		youxoffset = 29
		you.yoffset = 14
	elseif yupgs then
		you.im = upflap
		you.yoffset = 30
		youxoffset = 26
	elseif you.g then
	you.im = sbackflap
	

	end
	ygswwait = 70
	ygshhold = ygshhold - 1
	yougran = true
	you.stop = true
	you.jstop = true

elseif ygsrr and not x then

	ygshhold = 45

	if controller2.up then
		you.im = upflap
		you.yoffset = 30
		youxoffset = 26
		you.j = -20	
		yupgs = true
	table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 40, lr = you.lr, time = 0, v = .000001, s = -202, upv = boltspeed})	
	table.insert(youbolts, {x = you.mid, y = you.y + 40, lr = you.lr, time = 0, v = .000001, s = -202, upv = boltspeed})	
	table.insert(youbolts, {x = you.mid + 23 * you.lr , y = you.y + 40 , lr = you.lr, time = 0, v = .000001, s = -202, upv = boltspeed})	



	elseif you.g then
	yupgs = false
	you.im = sbackflap
	you.v = you.v - (you.lr*20)

	table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y , lr = you.lr, time = 0, upv = 0, s = -202, v = (boltspeed * you.lr)})	
	table.insert(youbolts, {x = you.mid , y = you.y + 20, lr = you.lr, time = 0, upv = 0, s = -202, v = (boltspeed * you.lr)})	
	table.insert(youbolts, {x = you.mid + 23 * you.lr , y = you.y + 40 , lr = you.lr, time = 0, upv = 0, s = -202, v = (boltspeed * you.lr)})	
	
	elseif controller2.down then
		yupgs = false
		you.im = jsflap
		youxoffset = 29
		you.yoffset = 14
		you.j = 25	
	table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 40, lr = you.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	
	table.insert(youbolts, {x = you.mid, y = you.y + 40, lr = you.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	
	table.insert(youbolts, {x = you.mid + 23 * you.lr , y = you.y + 40 , lr = you.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	

	
	else
		yupgs = false
		you.im = jsflap
		youxoffset = 29
		you.yoffset = 14
		you.j = 20
		you.v = you.v - (you.lr*10)	
	table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 40, lr = you.lr, time = 0, v = you.lr * boltspeed, s = -202, upv = -boltspeed})	
	table.insert(youbolts, {x = you.mid, y = you.y + 40, lr = you.lr, time = 0, v = you.lr *  boltspeed, s = -202, upv = -boltspeed})	
	table.insert(youbolts, {x = you.mid + 23 * you.lr , y = you.y + 40 , lr = you.lr, time = 0, v = you.lr * boltspeed, s = -202, upv = -boltspeed})	


	end


	if youarmsreach(100) and math.abs(you.y - me.y) <= 150 then
		if me.x > you.x then me.v = me.v + 20
			else me.v = me.v - 20
		end
	end


	you.jstop = true
	ygsrr = false



elseif x and ygswwait == 0 then 

	you.yoffset = 20
	youxoffset = 26

	you.im = sandboltready


	ygsrr = true
	you.stop = true
	you.jstop = true
else
	yougran = false
end

end





function megreensand(x)


if me.flinch or mgscancel then 
	gsrr = false
	gshhold = 0
	gswwait = 0
	me.jstop = false
end



if gswwait > 0 and gshhold == 0 then 
	gswwait = gswwait - 1
	megran = false

elseif gshhold > 0 then 


	if not mupgs and not me.g then
		me.im = jsflap
		mexoffset = 29
		me.yoffset = 14
	elseif mupgs then
		me.im = upflap
		me.yoffset = 30
		mexoffset = 26
	elseif me.g then
	me.im = sbackflap
	
	end
	gswwait = 70
	gshhold = gshhold - 1
	megran = true
	me.stop = true
	me.jstop = true

elseif gsrr and not x then

	gshhold = 45

	if controller1.up then
	me.im = upflap
	me.yoffset = 30
	mexoffset = 26
	me.j = -100
	mupgs = true

	table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y , lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	table.insert(bolts, {x = me.mid , y = me.y + 20, lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	table.insert(bolts, {x = me.mid + 23 * me.lr , y = me.y + 40 , lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	

	elseif me.g then
	mupgs = false
	me.im = sbackflap
	me.v = me.v - (me.lr*20)

	table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y , lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	table.insert(bolts, {x = me.mid , y = me.y + 20, lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	table.insert(bolts, {x = me.mid + 23 * me.lr , y = me.y + 40 , lr = me.lr, time = 0, upv = 0, s = -202, v = (boltspeed * me.lr)})	
	
	elseif controller1.down then
		mupgs = false
		me.im = jsflap
		mexoffset = 29
		me.yoffset = 14
		me.j = 25	
	table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y + 40, lr = me.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	
	table.insert(bolts, {x = me.mid, y = me.y + 40, lr = me.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	
	table.insert(bolts, {x = me.mid + 23 * me.lr , y = me.y + 40 , lr = me.lr, time = 0, v = .000001, s = -202, upv = -boltspeed})	

else 
	mupgs = false
		me.im = jsflap
		mexoffset = 29
		me.yoffset = 14
		me.j = 15
		me.v = me.v - (me.lr*10)	
	table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y + 40, lr = me.lr, time = 0, v = me.lr*boltspeed, s = -202, upv = -boltspeed})	
	table.insert(bolts, {x = me.mid, y = me.y + 40, lr = me.lr, time = 0, v = me.lr*boltspeed, s = -202, upv = -boltspeed})	
	table.insert(bolts, {x = me.mid + 23 * me.lr , y = me.y + 40 , lr = me.lr, time = 0, v = me.lr*boltspeed, s = -202, upv = -boltspeed})	


	end


	if mearmsreach(100) and math.abs(me.y - you.y) <= 150 then
		if you.x > me.x then you.v = you.v + 20
			else you.v = you.v - 20
		end
	end


	me.jstop = true
	gsrr = false



elseif x and gswwait == 0 then 

	me.yoffset = 20
	mexoffset = 26

	me.im = sandboltready


	gsrr = true
	me.stop = true
	me.jstop = true
else
	megran = false
end

end

















function youbluesand(x)
if you.flinch or ybscancel then 
	youbsct = false
	youbshold = 0
	youbspause = 0
	you.jstop = false
end



if youbshold < 0 then 
	youxoffset = 26
	you.yoffset = 20

	youbshold = youbshold + 1
	you.stop = true
	you.jstop = true
	youbsct = false
	youblan = true
	you.im = bsend
	if youbshold == -38 then
		you.j = 0
	elseif youbshold <= -39 then
	if you.j >= 0 then 
		if math.abs(me.mid - you.mid) < 100 and me.y >= you.y - 100 and me.y <= you.y then
			me.j = 20
			if not (me.block and me.lr ~= you.lr) then
			me.v = you.lr * 20
			me.g = false
			me.health = me.health - blanddam 
			me.flinch = true
			me.ft = bsft
			end
		end
	you.j = 100
	elseif you.j < 0 then 
		you.onplat = false
		if math.abs(me.mid - you.mid) < 100 and me.y <= you.y + 100 and me.y >= you.y then
			me.j = -20
			if not (me.block and me.lr ~= you.lr) then
			me.v = you.lr * 20
			me.g = false
			me.health = me.health - blanddam 
			me.flinch = true
			me.ft = bsft
			end
		end
	you.j = -100


	end	
	end
elseif youbshold > 0 then 



	youxoffset = 26
	you.yoffset = 20

	youbshold = youbshold - 1
	you.stop = true
	you.jstop = true
	youbsct = false
	youblan = true
	you.im = bsend
	you.v = 0
	if youbshold >= 38 then you.v = 100 *you.lr
	elseif youbshold == 20 and me.mid*you.lr < you.mid*you.lr and you.lr*me.mid > you.lr*(ybssx) and me.feet >= youbslevel and me.y <= youbslevel + 60 then
		me.v = you.lr * 15
		if not (me.block and you.lr ~= me.lr) then
		me.j = 30
		me.g = false
		me.health = me.health - blanddam 
		me.flinch = true
		me.ft = bsft
		end
	end


elseif youbsct and not x then

	youxoffset = 26
	you.yoffset = 20

	youbslevel = you.y

	you.im = bsend
	if you.g and not controller2.up then
	ybssx = you.mid
	youbshold = 45
	you.jstop = true
	youbsct = false
	you.v = 100 *you.lr
	elseif controller2.up or (you.j >= 0 and not controller2.down) then
	youbshold = -45
	you.g = false
	youbsct = false
	you.j = 100
	you.v = 0
	you.stop = true
	if math.abs(me.mid - you.mid) < 100 and me.y >= you.y - 100 and me.y <= you.y then
			me.j = 20
			if not (me.block and me.lr ~= you.lr) then
			me.v = me.lr * 20
			me.g = false
			me.health = me.health - blanddam 
			me.flinch = true
			me.ft = bsft
			end
		end
	elseif (not you.g and controller2.down) or you.j < 0 then
	youbshold = -45
	you.g = false
	youbsct = false
	you.j = -100
	you.v = 0
	you.stop = true
	if math.abs(me.mid - you.mid) < 100 and me.y <= you.y + 100 and me.y >= you.y then
			me.j = -20
			if not (me.block and me.lr ~= you.lr) then
			me.v = you.lr * 20
			me.g = false
			me.health = me.health - blanddam 
			me.flinch = true
			me.ft = bsft
			end
		end

	end

elseif x and youbshold == 0 then 

	you.yoffset = 20
	youxoffset = 26

	you.im = bsstart
	youbsct = true
	you.stop = true
	you.jstop = true
else
	youblan = false
end
end


function mebluesand(x)
if me.flinch or mbscancel then 
	mebsct = false
	mebshold = 0
	mebspause = 0
	me.jstop = false
end



if mebshold < 0 then 
	mexoffset = 26
	me.yoffset = 20

	mebshold = mebshold + 1
	me.stop = true
	me.jstop = true
	mebsct = false
	meblan = true
	me.im = bsend
	if mebshold == -38 then
		me.j = 0
	elseif mebshold <= -39 then
	if me.j >= 0 then 
		if math.abs(me.mid - you.mid) < 100 and you.y >= me.y - 100 and you.y <= me.y then
			you.j = 20
			if not (you.block and you.lr ~= me.lr) then
			you.v = me.lr * 20
			you.g = false
			you.health = you.health - blanddam 
			you.flinch = true
			you.ft = bsft
			end
		end
	me.j = 100
	elseif me.j < 0 then 
		me.onplat = false
		if math.abs(me.mid - you.mid) < 100 and you.y <= me.y + 100 and you.y >= me.y then
			you.j = -20
			if not (you.block and you.lr ~= me.lr) then
			you.v = me.lr * 20
			you.g = false
			you.health = you.health - blanddam 
			you.flinch = true
			you.ft = bsft
			end
		end
	me.j = -100


	end	
	end
elseif mebshold > 0 then 



	mexoffset = 26
	me.yoffset = 20

	mebshold = mebshold - 1
	me.stop = true
	me.jstop = true
	mebsct = false
	meblan = true
	me.im = bsend
	me.v = 0
	if mebshold >= 38 then me.v = 100 *me.lr
	elseif mebshold == 20 and you.mid*me.lr < me.mid*me.lr and me.lr*you.mid > me.lr*(mbssx) and you.feet >= mebslevel and you.y <= mebslevel + 60 then
		you.v = me.lr * 15
		if not (you.block and you.lr ~= me.lr) then
		you.j = 30
		you.g = false
		you.health = you.health - blanddam 
		you.flinch = true
		you.ft = bsft
		end
	end


elseif mebsct and not x then


	mexoffset = 26
	me.yoffset = 20

	mebslevel = me.y

	me.im = bsend
	if me.g and not controller1.up then
	mbssx = me.mid 
	mebshold = 45
	me.jstop = true
	mebsct = false
	me.v = 100 *me.lr
	elseif controller1.up or (me.j >= 0 and not controller1.down) then
	mebshold = -45
	me.g = false
	mebsct = false
	me.j = 100
	me.v = 0
	me.stop = true
	if math.abs(me.mid - you.mid) < 100 and you.y >= me.y - 100 and you.y <= me.y then
			you.j = 20
			if not (you.block and you.lr ~= me.lr) then
			you.v = me.lr * 20
			you.g = false
			you.health = you.health - blanddam 
			you.flinch = true
			you.ft = bsft
			end
		end
	elseif (not me.g and controller1.down) or me.j < 0 then
	mebshold = -45
	me.g = false
	mebsct = false
	me.j = -100
	me.v = 0
	me.stop = true
	if math.abs(me.mid - you.mid) < 100 and you.y <= me.y + 100 and you.y >= me.y then
			you.j = -20
			if not (you.block and you.lr ~= me.lr) then
			you.v = me.lr * 20
			you.g = false
			you.health = you.health - blanddam 
			you.flinch = true
			you.ft = bsft
			end
		end

	end
elseif x and mebshold == 0 then 

	me.yoffset = 20
	mexoffset = 26

	me.im = bsstart
	mebsct = true
	me.stop = true
	me.jstop = true
else
	meblan = false
end
end





function youwings(x) 

	if ytt < 0 then ytt = ytt + 1 end

	if you.flinch or yscancel then 
	yousct = 0 
	youshold = 0
	yswait = 0
end


if youshold > 0 then yousan = true else yousan = false  end


if youshold == 0 and yswait > 0 then 
	yswait = yswait - 1

elseif youshold > 0 then 
	you.jstop = true
	yswait = swaittime
	youshold = youshold - 1
	yousct = 0
	youlimitbreak=true
	if you.g then 
		if (you.v > 0 and you.lr > 0) or (you.v < 0 and you.lr < 0) then
		you.im = sflap
		you.yoffset = 20
		youxoffset = 26
		else
		you.im = sbackflap

		end
	else you.im = jsflap
		youxoffset = 29
		you.yoffset = 14
	end


elseif yousct > sandchargetime and not x and ytt == 0 then
	youshold = 20
	you.stop = true
	you.v = you.v - (you.lr*33)
	youthecenter = you.x + 40 * you.lr
	table.insert(yourtornado, {x = youthecenter - 1, y = floor, t = 0,s = 1,v = 1})
	
	if you.g then
	you.im = bigflap
	end


elseif yousct > sandchargetime and x and ytt == 0 then
	you.stop = true
	you.jstop = true
	if you.g then
	you.im = bigwings
	you.yoffset = 40
	youxoffset = 26
	end



elseif yousct > 0 and not x then
	youshold = 20
	msready = false
	you.jstop = true
	if you.g then 

		youlimitbreak=true
	you.im = sflap
	if (controller2.right and you.lr > 0) or (controller2.left and you.lr < 0) then 
	you.v = you.v + (you.lr*23)
	youxoffset = 26
	you.yoffset = 20
	you.g = false
	you.j = 20
	else 
	you.g = false
	you.j = 20
	you.im = sbackflap
	you.v = you.v - (you.lr*23)	
	if youarmsreach(100) and math.abs(me.y - you.y) <= 150 then
		if you.v > you.v then you.v = you.v + 20
			else you.v = you.v - 20
		end
	end
	end
	
	else you.im = jsflap
		youxoffset = 29
		you.yoffset = 14
		if me.y - you.y < 200 and math.abs(me.x - you.x) <= 100 then me.j = me.j - 10
		end
		if controller2.right or controller2.left then
		you.v = you.v + you.lr * 10
		you.j = 25	
		else
		you.j = 35
		end

	end
	

elseif x and yswait == 0
	then 
	you.stop = true
	if you.g then you.im = sready
	you.yoffset = 20
	youxoffset = 26
	else you.im = jsready
		you.yoffset = 22
		youxoffset = 29
	end
	yousct = yousct + 1

else yousan = false

end
end





function mewings(x) 

	if mtt < 0 then mtt = mtt + 1 end

	if me.flinch or mscancel then 
	mesct = 0 
	meshold = 0
	mswait = 0
end


if meshold > 10 then mesan = true else mesan = false end



if meshold == 0 and mswait > 0 then 
	mswait = mswait - 1

elseif meshold > 0 then 
	me.jstop = true
	mswait = swaittime
	meshold = meshold - 1
	mesct = 0
	melimitbreak=true
	if me.g then 
		if (me.v > 0 and me.lr > 0) or (me.v < 0 and me.lr < 0) then
		me.im = sflap
		me.yoffset = 20
		mexoffset = 26
		else
		me.im = sbackflap

		end
	else me.im = jsflap
		mexoffset = 29
		me.yoffset = 14
	end


elseif mesct > sandchargetime and not x and mtt == 0 then
	meshold = 20
	me.stop = true
	me.v = me.v - (me.lr*33)
	methecenter = me.x + 40 * me.lr
	table.insert(mytornado, {x = methecenter - 1, y = floor, t = 0,s = 1,v = 1})
	
	if me.g then
	me.im = bigflap
	end


elseif mesct > sandchargetime and x and mtt == 0 then
	me.stop = true
	me.jstop = true
	if me.g then
	me.im = bigwings
	me.yoffset = 40
	mexoffset = 26
	end



elseif mesct > 0 and not x then
	meshold = 20
	msready = false
	me.jstop = true
	if me.g then 

		melimitbreak=true
	me.im = sflap
	if (controller1.right and me.lr > 0) or (controller1.left and me.lr < 0) then 
	me.v = me.v + (me.lr*23)
	mexoffset = 26
	me.yoffset = 20
	me.g = false
	me.j = 20

	else 
	me.im = sbackflap
	me.v = me.v - (me.lr*23)
	me.g = false
	me.j = 20	
	if mearmsreach(100) and math.abs(me.y - you.y) <= 150 then
		if you.v > me.v then you.v = you.v + 20
			else you.v = you.v - 20

		end
	end
	end
	
	else me.im = jsflap
		mexoffset = 29
		me.yoffset = 14
		if you.y - me.y < 200 and math.abs(me.x - you.x) <= 100 then you.j = you.j - 10
		end

		if controller1.right or controller1.left then
		me.v = me.v + me.lr * 10
		me.j = 25	
		else
		me.j = 35
		end

	end
	

elseif x and mswait == 0
	then 
	me.stop = true
	if me.g then me.im = sready
	me.yoffset = 20
	mexoffset = 26
	else me.im = jsready
		me.yoffset = 22
		mexoffset = 29
	end
	mesct = mesct + 1

else mesan = false

end
end








mtt = 0
torfado = 255

ytt = 0
ytorfado = 255



youdrawtornado = function()







if ytt > 10 then 
if me.mid > youthecenter then me.push = -7
else me.push = 7
end
if math.abs(youthecenter - me.mid) < 50 and me.j < 4 then me.j = me.j + 5 me.g = false
end



end


if table.getn(yourtornado) > 0 and table.getn(yourtornado) < tornadodur then
ytt = ytt + 1 
	ynnn = table.getn(yourtornado)
	table.insert(yourtornado, {x = youthecenter - ynnn, y = floor - (ynnn*10), v = ynnn})
	if table.getn(yourtornado) >= tornadodur - 50 then 
	ytorfado = ytorfado - 5
	end
elseif table.getn(yourtornado) >= tornadodur then 
	yourtornado = {}
ytt = -100
ytorfado = 255

end

for i,v in ipairs(yourtornado) do
if ytorfado == 255 and math.abs(me.mid - v.x)<10 and v.y + 5 < me.feet and v.y > me.y 
	then me.flinch = true
	me.ft = windft
	me.health = me.health - .1
end


if ytt%(v.v/tornadowidth) > 0 then
v.x = v.x + v.v/tornadowidth
else v.x = youthecenter - v.v*(v.v/(tornadowidth*2))
	end
	love.graphics.setColor(255,255,255,ytorfado)
love.graphics.draw(tor,v.x,v.y)



end

end



drawtornado = function()







if mtt > 10 then 
if you.mid > methecenter then you.push = -7
else you.push = 7
end
if math.abs(methecenter - you.mid) < 50 and you.j < 4 then you.j = you.j + 5 you.g = false
end



end


if table.getn(mytornado) > 0 and table.getn(mytornado) < tornadodur then
mtt = mtt + 1 
	nnn = table.getn(mytornado)
	table.insert(mytornado, {x = methecenter - nnn, y = floor - (nnn*10), v = nnn})
	if table.getn(mytornado) >= tornadodur - 50 then 
	torfado = torfado - 5
	end
elseif table.getn(mytornado) >= tornadodur then 
	mytornado = {}
mtt = -100
torfado = 255

end

for i,v in ipairs(mytornado) do
if torfado == 255 and math.abs(you.mid - v.x)<10 and v.y + 5 < you.feet and v.y > you.y 
	then you.flinch = true
	you.ft = windft
	you.health = you.health - .1
end


if mtt%(v.v/tornadowidth) > 0 then
v.x = v.x + v.v/tornadowidth
else v.x = methecenter - v.v*(v.v/(tornadowidth*2))
	end
	love.graphics.setColor(255,255,255,torfado)
love.graphics.draw(tor,v.x,v.y)



end

end
