
sandchargetime = 90
tornadowidth = 20





me.sct = 0
me.shold = 0
me.swait = 0

mebsct = false
mebshold = 0
mebspause = 0

me.tornado = {}


you.sct = 0
you.shold = 0
you.swait = 0

youbsct = false
youbshold = 0
youbspause = 0

you.tornado = {}

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


function you.sandmines(x)
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


function me.sandmines(x)
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
	you.xoffset = 166
	elseif ypshhold > 41 then
	you.im = wingswing2
	you.yoffset = 40
	you.xoffset = 166
	elseif ypshhold > 0 then
	you.im = wingswing3
	you.yoffset = 40
	you.xoffset = 166

	if ypshhold == 40 then
		you.shake = true
		repplay(pwss2)
	if me.mid * you.lr < you.mid * you.lr and me.mid * you.lr > (you.mid) * you.lr - 110
		and me.y < you.feet and me.feet > you.y then 
		me.v = -you.lr*30
		me.g = false
		me.j = 25
		me.flinch = true
		me.ft = psft
		me.health = me.health - psdam * 3
	elseif checkalong(me.mid,me.feet,you.mid,you.feet) then
	me.g = false
	me.j = 35
	me.flinch = true
	me.ft = psft
	me.health = me.health - psdam
	end
	
	end
	
	end

elseif ypsrr and not x then

	you.im = purpwings
	you.yoffset = 40
	you.xoffset = 26
	ypshhold = 43
	you.stop = true
	you.jstop = true
	ypsrr = false




elseif x and ypswwait == 0 and you.g then 

	you.im = purpwings
	you.yoffset = 40
	you.xoffset = 26


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
	me.xoffset = 166
	elseif mpshhold > 41 then
	me.im = wingswing2
	me.yoffset = 40
	me.xoffset = 166
	elseif mpshhold > 0 then
	me.im = wingswing3
	me.yoffset = 40
	me.xoffset = 166

	if mpshhold == 40 then
		me.shake = true
	repplay(pwss)
	if you.mid * me.lr < me.mid * me.lr and you.mid * me.lr > (me.mid) * me.lr - 110
		and you.y < me.feet and you.feet > me.y then 
		you.v = -me.lr*30
		you.g = false
		you.j = 25
		you.flinch = true
		you.ft = psft
		you.health = you.health - psdam * 3
	elseif checkalong(you.mid,you.feet,me.mid,me.feet) then
	you.g = false
	you.j = 35
	you.flinch = true
	you.ft = psft
	you.health = you.health - psdam
	end
	
	end
	
	end

elseif mpsrr and not x then

	me.im = purpwings
	me.yoffset = 40
	me.xoffset = 26
	mpshhold = 43
	me.stop = true
	me.jstop = true
	mpsrr = false




elseif x and mpswwait == 0 and me.g then 

	me.im = purpwings
	me.yoffset = 40
	me.xoffset = 26


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

function you.greensand(x)


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

	if yupgs == 1 then
		you.im = jsflap
		you.xoffset = 29
		you.yoffset = 14
	elseif yupgs == 2 then
		you.im = upflap
		you.yoffset = 30
		you.xoffset = 26
	elseif yupgs == 0 then
	you.im = sbackflap
	

	end
	ygswwait = 70
	ygshhold = ygshhold - 1
	yougran = true
	you.stop = true
	you.jstop = true

elseif ygsrr and not x then
	repplay(you.flapsnd)

	ygshhold = 45

  if you.g then yupgs = 0
   elseif you.j > 0 then
	yupgs = 1
elseif you.j < 0 then 
  yupgs = 2
  else yupgs = 0
  end

		you.im = sbackflap
		you.j = -yougupv*.8
    you.v = -yougv*.8
		yupgs = true
    	table.insert(you.bolts, {x = you.mid -23 * you.lr , y = you.y + 40, lr = you.lr, time = 0, v = yougv, s = -202, upv = yougupv})	
	table.insert(you.bolts, {x = you.mid, y = you.y + 40, lr = you.lr, time = 0, v = yougv, s = -202, upv = yougupv})	
	table.insert(you.bolts, {x = you.mid + 23 * you.lr , y = you.y + 40 , lr = you.lr, time = 0, v = yougv, s = -202, upv = yougupv})	




	if youarmsreach(100) and math.abs(you.y - me.y) <= 150 then
		if me.x > you.x then me.v = me.v + 20
			else me.v = me.v - 20
		end
	end


	you.jstop = true
	ygsrr = false



elseif x and ygswwait == 0 then 

	you.yoffset = 20
	you.xoffset = 26

	you.im = sandboltready


	ygsrr = true
	you.stop = true
	you.jstop = true
else
	yougran = false
end

end





function me.greensand(x)


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

if me.g then mupgs = 0
	elseif mupgs == 1 then
		me.im = jsflap
		me.xoffset = 29
		me.yoffset = 14
	elseif mupgs == 2 then
		me.im = upflap
		me.yoffset = 30
		me.xoffset = 26
	elseif mupgs == 0 then
	me.im = sbackflap
	
	end
	gswwait = 70
	gshhold = gshhold - 1
	megran = true
	me.stop = true
	me.jstop = true

elseif gsrr and not x then
	repplay(me.flapsnd)

	gshhold = 45

	me.im = sbackflap
	me.j = -megupv*.8
  me.v = -megv*.8
  if me.j > 0 then
	mupgs = 1
elseif me.j < 0 then 
  mupgs = 2
  else mupgs = 0
  end
  
  
	table.insert(me.bolts, {x = me.mid -23 * me.lr , y = me.y + 40, lr = me.lr, time = 0, v = megv, s = -202, upv = megupv})	
	table.insert(me.bolts, {x = me.mid, y = me.y + 40, lr = me.lr, time = 0, v = megv, s = -202, upv = megupv})	
	table.insert(me.bolts, {x = me.mid + 23 * me.lr , y = me.y + 40 , lr = me.lr, time = 0, v = megv, s = -202, upv = megupv})	



	if mearmsreach(100) and math.abs(me.y - you.y) <= 150 then
		if you.x > me.x then you.v = you.v + 20
			else you.v = you.v - 20
		end
	end


	me.jstop = true
	gsrr = false



elseif x and gswwait == 0 then 

	me.yoffset = 20
	me.xoffset = 26

	me.im = sandboltready


	gsrr = true
	me.stop = true
	me.jstop = true
else
	megran = false
end

end
















bsindtimer = 0

youbsind = 0
mebsind = 0
mbsxend = 0
ybsxend = 0
mbslr = 0
ybslr = 0

function you.bluesand(x)
if you.flinch or ybscancel then 
	youbsct = false
	youbshold = 0
	youbspause = 0
	you.jstop = false
end

if youbsind > 30 then
  youbsind = 0
    repplay(you.flapblues)
  if me.mid*ybslr < ybsxend*you.lr and ybslr*me.mid > ybslr*(ybssx) and me.feet >= youbslevel and me.y <= youbslevel + 60 then
		me.v = you.lr * 15
		if not (me.block and you.lr ~= me.lr) then
		me.j = 30
		me.g = false
		me.health = me.health - blanddam 
		me.flinch = true
		me.ft = bsft
  end
  end
elseif youbsind > 0 then
  youbsind = youbsind + 1
  
end


if youbshold < 0 then 
	you.xoffset = 26
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



	you.xoffset = 26
	you.yoffset = 20

	youbshold = youbshold - 1
	you.stop = true
	you.jstop = true
	youbsct = false
	youblan = true
	you.im = bsend
	you.v = 0
  ybsxend = you.mid
  
	
	if youbshold >= 38 then you.v = 100 *you.lr
    ybsxend = you.mid
	
		
	end


elseif youbsct and not x then
	repplay(blueflap2)
	you.xoffset = 26
	you.yoffset = 20

	youbslevel = you.y

	you.im = bsend
	if (you.g and not you.up) or you.right or you.left then
    ybsxend = you.mid
	ybssx = you.mid
  ybslr = you.lr
	youbshold = 45
	you.jstop = true
	youbsct = false
	you.v = 100 *you.lr
  youbsind = 1
	elseif you.up or (you.j >= 0 and not you.down) then
	repplay(flapblues2)
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
	elseif (not you.g and you.down) or you.j < 0 then
	repplay(flapblues2)
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
	you.xoffset = 26

	you.im = bsstart
	youbsct = true
	you.stop = true
	you.jstop = true
else
	youblan = false
end
end


function me.bluesand(x)
if me.flinch or mbscancel then 
	mebsct = false
	mebshold = 0
	mebspause = 0
	me.jstop = false
end

if mebsind > 30 then
  mebsind = 0
    repplay(me.flapblues)
  if you.mid*mbslr < mbsxend*mbslr and mbslr*you.mid > mbslr*(mbssx) and you.feet >= mebslevel and you.y <= mebslevel + 60 then
		you.v = me.lr * 15
		if not (you.block and you.lr ~= me.lr) then
		you.j = 30
		you.g = false
		you.health = you.health - blanddam 
		you.flinch = true
		you.ft = bsft
		end
  end
elseif mebsind > 0 then
  mebsind = mebsind + 1
  
end

if mebshold < 0 then 
	me.xoffset = 26
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
	



	me.xoffset = 26
	me.yoffset = 20

	mebshold = mebshold - 1
	me.stop = true
	me.jstop = true
	mebsct = false
	meblan = true
	me.im = bsend
	me.v = 0
  mbsxend = me.mid
	
	if mebshold >= 38 then me.v = 100 *me.lr
    mbsxend = me.mid
	
	end


elseif mebsct and not x then
	repplay(blueflap)

	me.xoffset = 26
	me.yoffset = 20

	mebslevel = me.y

	me.im = bsend
	if (me.g and not me.up) or me.right or me.left then
    mebsind = 1
    mbsxend = me.mid
    mbslr = me.lr
	mbssx = me.mid 
	mebshold = 45
	me.jstop = true
	mebsct = false
	me.v = 100 *me.lr
	elseif me.up or (me.j >= 0 and not me.down) then
	repplay(flapblues2)
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
	elseif (not me.g and me.down) or me.j < 0 then
	repplay(flapblues2)
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
	me.xoffset = 26

	me.im = bsstart
	mebsct = true
	me.stop = true
	me.jstop = true
else
	meblan = false
end
end







function wings(x,xx,y,z)
if xx.tt < 0 then xx.tt = xx.tt + 1 end
	if xx.flinch or xx.scancel then 
	xx.sct = 0 
	xx.shold = 0
	xx.swait = 0
end

if xx.shold > 0 then xx.san = true else xx.san = false  end

if xx.shold == 0 and xx.swait > 0 then 
	xx.swait = xx.swait - 1
elseif xx.shold > 0 then 
	xx.jstop = true
	xx.swait = swaittime
	xx.shold = xx.shold - 1
	xx.sct = 0
	xxlimitbreak=true
	if xx.g then 
		if (xx.v > 0 and xx.lr > 0) or (xx.v < 0 and xx.lr < 0) then
		xx.im = sflap
		xx.yoffset = 20
		xx.xoffset = 26
		else
		xx.im = sbackflap
		end
	else xx.im = jsflap
		xx.xoffset = 29
		xx.yoffset = 14
	end

elseif xx.sct > sandchargetime and not x and xx.tt == 0 then
	xx.shold = 20
	xx.stop = true
	xx.v = xx.v - (xx.lr*33)
	xx.thecenter = xx.x + 40 * xx.lr
	table.insert(xx.tornado, {x = xx.thecenter - 1, y = floor, t = 0,s = 1,v = 1})
	if xx.g then
	xx.im = bigflap
	end

elseif xx.sct > sandchargetime and x and xx.tt == 0 then
	xx.stop = true
	xx.jstop = true
	if xx.g then
	xx.im = bigwings
	xx.yoffset = 40
	xx.xoffset = 26
	end

elseif xx.sct > 0 and not x then
	repplay(xx.flapsnd)
	xx.shold = 20
	xx.jstop = true
	if xx.g then 
		xxlimitbreak=true
	xx.im = sflap
	if (z.right and xx.lr > 0) or (z.left and xx.lr < 0) then 
	xx.v = xx.v + (xx.lr*19)
	xx.xoffset = 26
	xx.yoffset = 20
	xx.g = false
	xx.j = 18
	else 
	xx.g = false
	xx.j = 18
	xx.im = sbackflap
	xx.v = xx.v - (xx.lr*19)	
	if xx.armsreach(100) and math.abs(y.y - xx.y) <= 150 then
		 y.v = y.v + 20*xx.lr
	end
	end
	
	else xx.im = jsflap
		xx.xoffset = 29
		xx.yoffset = 14
		if y.y - xx.y < 200 and math.abs(y.x - xx.x) <= 100 then y.j = y.j - 10
		end
		if z.right or z.left then
		xx.v = xx.v + xx.lr * 10
		xx.j = 18
    xx.jt = 7
		else
		xx.j = 23
    xx.jt = 7
		end
	end
	
elseif x and xx.swait == 0
	then 
	xx.stop = true
	if xx.g then xx.im = sready
	xx.yoffset = 20
	xx.xoffset = 26
	else xx.im = jsready
		xx.yoffset = 22
		xx.xoffset = 29
	end
	xx.sct = xx.sct + 1
else xx.san = false
end
end











me.tt = 0
torfado = 255

you.tt = 0
ytorfado = 255



youdrawtornado = function()







if you.tt > 10 then 
if me.mid > you.thecenter + 30 then me.push = -windpush
elseif me.mid < you.thecenter - 30 then  me.push = windpush
end
if math.abs(you.thecenter - me.mid) < 50 and me.j < 4 then me.j = me.j + 10 me.g = false
end



end


if table.getn(you.tornado) > 0 and you.tt < tornadodur then
you.tt = you.tt + 1 
	ynnn = table.getn(you.tornado)
  if #you.tornado<450 then
	table.insert(you.tornado, {x = you.thecenter - ynnn, y = floor - (ynnn*15), v = ynnn})
  end
	if you.tt >= tornadodur - 50 then 
	ytorfado = ytorfado - 5
	end
elseif you.tt >= tornadodur then 
	you.tornado = {}
you.tt = -100
ytorfado = 255

end

for i,v in ipairs(you.tornado) do
if ytorfado == 255 and math.abs(me.mid - v.x)<10 and v.y + 10 < me.feet and v.y > me.y 
	then me.flinch = true
    me.v = me.v/2
	me.ft = windft
	me.health = me.health - .1
end


if v.x < you.thecenter + v.v*(v.v/(tornadowidth*2)) then
v.x = v.x + v.v/tornadowidth
else v.x = you.thecenter - v.v*(v.v/(tornadowidth*2))
	end
	lg.setColor(255,255,255,ytorfado)
  
lg.draw(tor,you.thecenter + (you.thecenter-v.x)+20,v.y,0,-1,1)
lg.draw(tor,v.x,v.y,0,1.5,1.5)



end

if #you.tornado>3 then
if you.tt%10 == 2 then repplay(tornadosound2) end
tornadosound2:setPitch(ytorfado/230)
end

end



drawtornado = function()







if me.tt > 10 then 
if you.mid > me.thecenter + 30 then you.push = -windpush
elseif you.mid < me.thecenter - 30 then you.push = windpush
end
if math.abs(me.thecenter - you.mid) < 50 and you.j < 4 then you.j = you.j + 10 you.g = false
end



end


if table.getn(me.tornado) > 0 and me.tt < tornadodur then
me.tt = me.tt + 1 
	nnn = table.getn(me.tornado)
  if #me.tornado<450 then
	table.insert(me.tornado, {x = me.thecenter - nnn, y = floor - (nnn*15), v = nnn})
  end
	if me.tt >= tornadodur - 50 then 
	torfado = torfado - 5
	end
elseif me.tt >= tornadodur then 
	me.tornado = {}
me.tt = -100
torfado = 255

end

for i,v in ipairs(me.tornado) do
if torfado == 255 and math.abs(you.mid - v.x)<10 and v.y + 15 < you.feet and v.y > you.y 
	then you.flinch = true
    you.v = you.v/2
	you.ft = windft
	you.health = you.health - .1
end


if v.x < me.thecenter + v.v*(v.v/(tornadowidth*2))  then
v.x = v.x + v.v/tornadowidth
else v.x = me.thecenter - v.v*(v.v/(tornadowidth*2))
end

  
	lg.setColor(255,255,255,torfado)
lg.draw(tor,me.thecenter + (me.thecenter-v.x)+20,v.y,0,-1,1)
lg.draw(tor,v.x,v.y,0,1.5,1.5)




end
if #me.tornado>3 then
if me.tt%10 == 2 then repplay(tornadosound1) end
tornadosound1:setPitch(torfado/230)
end
end
