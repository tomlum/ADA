
sandbolt = love.graphics.newImage("me/attack/sandbolt.png")

methrowcounter = 0


meboltcombocount = 0
methrowanimatecounter = 0


youthrowcounter = 0


youboltcombocount = 0
youthrowanimatecounter = 0



function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
    local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
    local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
    local det,x,y = a1*b2 - a2*b1
    if det==0 then return false end
    x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
    if seg1 or seg2 then
        local min,max = math.min, math.max
        if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
           seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
            return false
        end
    end
    return true
end





youbolts = {}

function youbolts.draw()
			for i,v in ipairs(youbolts) do
			
				if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, v.lr* math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, v.lr * math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -202 then love.graphics.draw(sandbolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
		


		

	end
end
end




function youbolts.update()
	for i, v in ipairs(youbolts) do

	


		local sangle = v.lr*math.atan(-v.upv/math.abs(v.v))
		local sboltwidth = (80*math.cos(sangle))

		local angle = v.lr*math.atan(-v.upv/math.abs(v.v))
		local boltwidth = (65*math.cos(sangle))
		local spoint = v.x + (sboltwidth *v.lr)
		local point = v.x + (boltwidth *v.lr)
		local ypoint = v.y + (65*math.sin(sangle))*v.lr
		local sypoint = v.y + (80*math.sin(sangle))*v.lr

		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(youbolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(youbolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
		end


		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 and not v.stuckinwall
		then
		v.upv = v.upv - 1
		
		end


	if v.s == -1 and spoint * v.lr < (me.mid) * v.lr and (spoint + v.v) * v.lr  +1 > (me.mid + me.v) * v.lr
	and not me.dodge and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then 
			me.v = me.v + v.lr * 32
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - pboltdam
				
				end	

	elseif v.s == -202 and v.v ~= 0 and not me.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v,me.y-me.j,me.x+30,me.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v+30,me.y-me.j,me.x,me.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v,me.y-me.j+60,me.x+30,me.y,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v+30,me.y-me.j+60,me.x,me.y,true,true))
			then 
			table.remove(youbolts, i)
			me.v = me.v + v.v/3
			me.g = false
			me.j = me.j + sandboltknockup
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - sandboltdam
				me.ft = gsft
				end	


	elseif v.s == -201 and spoint * v.lr < (me.mid) * v.lr and (spoint + v.v) * v.lr +1> (me.mid + me.v) * v.lr
	and not me.dodge
	and v.y - v.upv + 7 > me.y and v.y - v.upv + 7 < me.feet
			then table.remove(youbolts, i)
			ybgcatch = true
			me.v = -thev(math.abs(you.x - me.x)) * you.lr
			if not (me.block and v.lr~=me.lr) then
			me.ft = thev(math.abs(you.x - me.x))
			me.flinch = true
			end
				


	elseif v.s >= 0 and v.v ~= 0  and not me.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v,me.y-me.j,me.x+30,me.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v+30,me.y-me.j,me.x,me.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v,me.y-me.j+60,me.x+30,me.y,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,me.x+me.v+30,me.y-me.j+60,me.x,me.y,true,true))
			then table.remove(youbolts, i)
			me.v = me.v + v.v/3
			me.j = me.j + v.upv/3
				if not (me.block and v.lr~=me.lr)
				then
				me.health = me.health - boltdamage
				
				end	

	end



		if v.time > boltdespawntime
		then table.remove(youbolts, i)

				elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)
		table.remove(youbolts, i)





	elseif v.s == -1 and platformcheck((v.x + (v.lr*sboltwidth)), v.y - v.upv - 7)
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
	


for i, v in ipairs(youspikes) do

		


		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

	if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
		end
		end



	elseif themap == "library" and v.y - v.upv + 4 >= floor -50	and point + v.v > 1407 and v.lr > 0 then
		v.y = v.y
		v.x = 1407 - 20
		
		v.s = 0
		v.time = v.time + 1
	elseif point + v.v > enviro.rightwall-50 then
		if v.s == -1 then v.stuckinwall = true end
		v.y = v.y
		v.x = enviro.rightwall - 80
		
		if v.s == 1 or v.s == 2 then v.s = 0 end
		v.time = v.time + 1
	elseif point + v.v < 50 then
		if v.s == -1 then v.stuckinwall = true end
		 v.y = v.y
		v.x = 80
		
		if v.s == 1 or v.s == 2 then v.s = 0 end
		v.time = v.time + 1


	elseif v.y - v.upv + 4 >= floor
		then v.y = floor + (v.upv*.7) 
		
		
		v.time = v.time + 1
		if v.s == 1 or v.s == 2 then v.s = 0 end


	elseif v.y - v.upv + 4 >= floor - 60 and point > 1407 and themap == "library"
		then v.y = floor - 60 + (v.upv*.7) 
		if v.s == -1 then v.stuckinwall = true end
		
		
		v.time = v.time + 1
		v.s = 0
 	



			

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

	elseif (you.attack == "chargebolt" or youboltchargecounter == greenchargetime) and not x 
		then
		you.stop = true
		you.attack = null
		youboltchargecounter = 0
		if cg2:isStopped() then
			cg2:play()
		else cg2:rewind()
			cg2:play()
		end
		table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23 * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -3, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -6, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 12, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = -18, s = 1, v = boltspeed * you.lr + you.v})
		table.insert(youbolts, {x = you.mid -23  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 18, s = 1, v = boltspeed * you.lr + you.v})
		
				
	
		you.im = boltrelease
		you.prime = false
		youboltchargehold = 0
		you.busy = true
	elseif youboltchargecounter == greenchargetime and you.g and x
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
		table.insert(youbolts, {x = you.mid -10  * you.lr , y = you.y + 24, lr = you.lr, time = 0, upv = 0, s = 0, v = boltspeed * you.lr + you.v})
		
		if gr2:isStopped() then
			gr2:play()
		else gr2:rewind()
			gr2:play()
		end

		if not you.g then
		table.insert(youbolts, {x = you.mid -10  * you.lr , y = you.y + 38, lr = you.lr, time = 0, upv = 0, s = 0, v = boltspeed * you.lr + you.v})
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
			
			if v.s == -1 then love.graphics.draw(purpbolt, v.x, v.y, v.lr* math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s >= 0 then love.graphics.draw(bolt, v.x, v.y, v.lr * math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -200 then love.graphics.draw(bolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -201 then love.graphics.draw(hookhead, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
			elseif v.s == -202 then love.graphics.draw(sandbolt, v.x, v.y, v.lr*math.atan(-v.upv/math.abs(v.v)), v.lr, 1)
		


	end

	
end
end





--table.insert(spikes, {x = v.x + (0 + math.random(8)) * v.lr, y = onplat(v.y) + math.random(8), lr = v.lr, t = 0, s = 0}))
	




function bolts.update()
	for i, v in ipairs(bolts) do



		local sangle = v.lr*math.atan(-v.upv/math.abs(v.v))
		local sboltwidth = (80*math.cos(sangle))

		local angle = v.lr*math.atan(-v.upv/math.abs(v.v))
		local boltwidth = (65*math.cos(sangle))
		local spoint = v.x + (sboltwidth *v.lr)
		local point = v.x + (boltwidth *v.lr)
		local ypoint = v.y + (65*math.sin(sangle))*v.lr
		local sypoint = v.y + (80*math.sin(sangle))*v.lr


		if v.s == 1 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.3, upv = -v.upv, s = 2, v = v.v})
		end
		if v.s == 2 and v.upv~=0 and v.y - v.upv < floor and (v.time%chboltmultrate) == chboltmultrate-1 then table.insert(bolts, {x = v.x , y = v.y, lr = v.lr, time = v.time + chboltmultrate*.6, upv = -v.upv, s = 1, v = v.v})
		end



		if v.s == -1 and v.time > timetodrop and v.y - v.upv < floor and v.upv < 80 and not v.stuckinwall
		then
		v.upv = v.upv - 1
		
		end


	if v.s == -201 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr +1 > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet
			then table.remove(bolts, i)
			bgcatch = true
			you.v = -thev(math.abs(you.x - me.x)) * me.lr
			if not (you.block and v.lr~=you.lr) then
			you.ft = thev(math.abs(you.x - me.x))
			you.flinch = true
			end


	elseif v.s == -202 and v.v ~= 0 and not you.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j,you.x+30,you.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j,you.x,you.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j+60,you.x+30,you.y,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j+60,you.x,you.y,true,true))
			then
		 	table.remove(bolts, i)

			you.v = you.v + v.v/3
			you.g = false
			you.j = you.j + sandboltknockup

				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - sandboltdam
				you.ft = gsft
				end	


	elseif v.s == -1 and spoint * v.lr < (you.mid) * v.lr and (spoint + v.v) * v.lr  +1 > (you.mid + you.v) * v.lr
	and not you.dodge
	and v.y - v.upv + 7 > you.y and v.y - v.upv + 7 < you.feet then
			you.v = you.v + v.lr * 32
				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - pboltdam
				
				end	


	elseif v.s >= 0 and v.v ~= 0 and not you.dodge and (findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j,you.x+30,you.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j,you.x,you.y+60,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v,you.y-you.j+60,you.x+30,you.y,true,true)
										or findIntersect(point,ypoint,point+v.v,ypoint-v.upv,you.x+you.v+30,you.y-you.j+60,you.x,you.y,true,true))
			then table.remove(bolts, i)
			you.v = you.v + v.v/3
			you.j = you.j + v.upv/3
				if not (you.block and v.lr~=you.lr)
				then
				you.health = you.health - boltdamage
				
				end	
		end





		if v.time > boltdespawntime
		then table.remove(bolts, i)

		elseif v.x < -100 or v.x > enviro.rightwall + 100
		then table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)
		table.remove(bolts, i)





	elseif v.s == -1 and platformcheck((v.x + (v.lr*sboltwidth)), v.y - v.upv - 7)
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


	for i, v in ipairs(spikes) do

		

		
		
	v.y = spikecheck(v.x + (80 * v.lr), v.y - 8) - 60

	if spikecheck(v.x + (80 * v.lr), v.y) ~= spikecheck(v.x, v.y)
		then v.y = - 100
		end
		end

	

















elseif themap == "library" and v.y - v.upv + 4 >= floor -50	and point + v.v > 1407 and v.lr > 0 then

		v.y = v.y
		v.x = 1407 - 20
		
		v.s = 0
		v.time = v.time + 1
	elseif point + v.v > enviro.rightwall-50 then
		if v.s == -1 then v.stuckinwall = true end
		v.y = v.y
		v.x = enviro.rightwall - 80
		
		if v.s == 1 or v.s == 2 then v.s = 0 end
		v.time = v.time + 1
	elseif point + v.v < 50 then
		if v.s == -1 then v.stuckinwall = true end
		 v.y = v.y
		v.x = 80
		
		if v.s == 1 or v.s == 2 then v.s = 0 end
		v.time = v.time + 1
		

	elseif v.y - v.upv + 4 >= floor
		then v.y = floor + (v.upv*.7) 
		
		
		v.time = v.time + 1
		if v.s == 1 or v.s == 2 then v.s = 0 end

	elseif v.y - v.upv + 4 >= floor - 60 and point > 1407 and themap == "library"
		then v.y = floor - 60 + (v.upv*.7) 
		if v.s == -1 then v.stuckinwall = true end
		
		
		v.time = v.time + 1
		v.s = 0
 	



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

	elseif (me.attack == "chargebolt" or meboltchargecounter == greenchargetime) and not x
		then
		me.stop = true
		me.attack = null
		meboltchargecounter = 0
		if cg1:isStopped() then
			cg1:play()
		else cg1:rewind()
			cg1:play()
		end
		table.insert(bolts, {x = me.mid -23 * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 0, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -3, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -6, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 12, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = -18, s = 1, v = boltspeed * me.lr})
		table.insert(bolts, {x = me.mid -23  * me.lr , y = me.y + 24, lr = me.lr, time = 0, upv = 18, s = 1, v = boltspeed * me.lr})
		me.im = boltrelease
		me.prime = false
		meboltchargehold = 0
		me.busy = true
	elseif meboltchargecounter == greenchargetime and me.g and x
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
table.insert(bolts, {x = me.mid -10 * me.lr , y = me.y +24, lr = me.lr, time = 0, upv = 0, s = 0, v = boltspeed * me.lr + me.v})
	

		if gr1:isStopped() then
			gr1:play()
		else gr1:rewind()
			gr1:play()
		end
	



		if not me.g then
		table.insert(bolts, {x = me.mid -10 * me.lr , y = me.y + 38, lr = me.lr, time = 0, upv = 0, s = 0, v = boltspeed * me.lr + me.v})		mefired = true
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







