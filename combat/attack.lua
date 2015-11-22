--[[
attack_num
1 = punch
2 = special (also called kick)
3 = uppercut

4 = air punch
5 = air special
6 = air uppercut
]]

-----------------------------
--Table of all attack stats--
-----------------------------
at = {}

blockrelease = {im=lg.newImage("images/player/attack/blockrelease.png"), xoff = 3, yoff = -4}

throw = {im=lg.newImage("images/player/attack/throw.png"), xoff = 8, yoff = 5}
airthrow = {im=lg.newImage("images/player/attack/airthrow.png"), xoff = 9, yoff = 5}

throwft = 26
throwz = .1

function attackmanage(xx)


	animate(xx)
	blocknbusy(xx)
	combomanage(xx)
	updatemytrail(xx)
	changePlayerColor(xx)

	if xx.greenktimer > 0 then 
		xx.greenktimer = xx.greenktimer - 1*ramp(xx)
	else
		xx.greenktimer = 0
	end

	if not xx.landing then
		xx.purplanding = false
	end

	xx.greenkcondition = false
	if xx.flinch then 
		xx.purplanding = false
		xx.animcounter = 0
		xx.attack_num = 0
	end

	if xx.attack_num < 4 and not xx.g and not ((xx.attack_num==3 and xx.color.n==4) or (xx.attack_num==2 and xx.color.n==2) or (xx.attack_num==2 and xx.color.n==3)) then 
		xx.animcounter = 0
	elseif xx.attack_num >= 4 and xx.attack_num < 7 and xx.g then 
		xx.animcounter = 0
		if xx.attack_num == 5 and xx.purplanding then
			xx.purpgroundtimer = -at.p.ak.time
		end
	end


	dopurpakspikes(xx)

	if xx.attack_num == 7 and xx.color.n == 0 and xx.animcounter > 2 and xx.g then
		xx.animcounter = 0
	end

	grab(xx)

	if xx.landing then xx.a1, xx.a2, xx.a3, xx.a4 = false, false, false, false end

	nottoomanyuppercuts(xx)

	--  if xx.flinch then xx.animcounter = 0
	--  end
	if xx.animcounter == 0 and not xx.purplanding then

		xx.repcounter = 0
		xx.currentc = xx.color.n
	end

	combo(xx)

	

	if xx.currentc == 0 then
		breadandbutter(xx)
	elseif xx.currentc == 1 then
		pandp(xx)
	elseif xx.currentc == 2 then
		gandg(xx)
	elseif xx.currentc == 3 then
		orangeyouglad(xx)
	elseif xx.currentc == 4 then
		randr(xx)
	end



	--  if(math.abs(xx.j) > math.abs(xx.oldj)) then
	--    xx.j = xx.oldj + (xx.j-xx.oldj)*(ramp(xx))
	--  end

	--xx.oldj = xx.j
	iwanttobreakfree(xx)

	if xx.animcounter > 0 and xx.animcounter <=1 then
		if xx.left then
			xx.lr = -1
		elseif xx.right then 
			xx.lr = 1
		end
	end
	
end



function radialpush(xx, yy, vel)
	local angle = math.atan((yy.y-xx.y)/(yy.x-xx.x))
	if xx.x < yy.x then
		yy.v = yy.v + vel*math.cos(angle)
		yy.j = yy.j - vel*math.sin(angle)


	else
		yy.v = yy.v - vel*math.cos(angle)
		yy.j = yy.j + vel*math.sin(angle)
	end
end



me.grabtimer = 0
you.grabtimer = 0
--me.grabbingx = nil
--you.grabbingx = nil


throw_amount = 10

function grab(xx)
	if xx.attack_num == 8 and xx.animcounter > 0 then 
		xx.busy = true 
		xx.stop = true
		xx.grabbing = true
	end

	if xx.using_keyboard and xx.blockb and (xx.a2b or xx.a3b) and xx.animcounter == 0 and not xx.dodge and not xx.flinch and xx.dodgetype == 0 then
		xx.animcounter = 1
		xx.attack_num = 8
		xx.grabbingx = nil
	elseif xx.animcounter > 0 and xx.attack_num == 8 then
		if xx.animcounter > 5 and xx.grabbingx ~= nil and xx.animcounter < 300 then
			xx.grabbingx.gothroughplats = xx.downb
			xx.grabbingx.x = xx.mid+25*xx.lr-15
			xx.grabbingx.y = xx.y
		end
		if xx.animcounter < 4 then
			if xx.g then 
				xx.im = punch1
			else
				xx.im = airgrab1
			end
		elseif xx.animcounter < 7 then
			if xx.g then 
				xx.im = punch2
			else
				xx.im = airgrab2
			end
			if xx.animcounter < 5 then
				hexHit(xx, xx.id, 
					{x=xx.mid, y = xx.y+24},
					{x=xx.mid+xx.v+(xx.lr*20), y = xx.y+26-xx.j},
					{x=xx.mid, y = xx.y+30},
					{x=xx.mid+xx.v+(xx.lr*20), y = xx.y+32-xx.j},
					function(z)
						xx.animcounter = 100
						xx.grabbingx = z
						z.y = xx.y
						z.j = xx.j
						z.v = xx.v
						z.gothroughplats = xx.gothroughplats
						repplay(grabsou)
						end)
			end
		elseif xx.animcounter < 20 then
			if xx.g then 
				xx.im = punch3
			else
				xx.im = airgrab3
			end
		elseif xx.animcounter < 100 then
			xx.animcounter = 0
		elseif xx.animcounter < 130 then
			if xx.g then 
				xx.im = punch2
			else
				xx.im = airgrab2
			end
			xx.grabbingx.ft = 10

			if not xx.holda and ((not xx.using_keyboard and (xx.a1 or xx.a2 or xx.a3 or xx.a4)) or (xx.using_keyboard and (xx.down or xx.up or xx.left or xx.right))) then 

				if xx.using_keyboard then
					if xx.up then
						xx.grabbingx.j =  throw_amount*2+xx.j
						xx.grabbingx.v =  (throw_amount*xx.lr)/5+xx.v
					elseif xx.left then
						xx.grabbingx.j =  throw_amount+xx.j
						xx.grabbingx.v =  (-throw_amount)+xx.v
					elseif xx.right then
						xx.grabbingx.j =  throw_amount+xx.j
						xx.grabbingx.v =  (throw_amount)+xx.v
					elseif xx.down then
						xx.grabbingx.j =  -throw_amount+xx.j
						xx.grabbingx.v =  (throw_amount*xx.lr)/5+xx.v

					end
				else

					xx.grabbingx.j =  throw_amount*-xx.jry+xx.j
					xx.grabbingx.v =  throw_amount*xx.jrx+xx.v
				end


				xx.animcounter = 300
				shakez(throwz)
				xx.grabbingx.ft = throwft


				if not xx.using_keyboard then
					if xx.jrx > 0 then
						xx.grabbingx.flinchway = -1
						xx.lr = 1
						if xx.grabbingx.x < xx.x then
							xx.grabbingx.x = xx.grabbingx.x + 15
							xx.x = xx.x - 15
						end
					else 
						xx.grabbingx.flinchway = 1
						if xx.grabbingx.x > xx.x then
							xx.grabbingx.x = xx.grabbingx.x - 15
							xx.x = xx.x + 15
						end
						xx.lr = -1
					end
				end


					xx.v = -xx.grabbingx.v*.8
					xx.j = -xx.grabbingx.j*.8

			end
		elseif xx.animcounter <260 then
			repplay(grabreleasesou)
			xx.animcounter = 0
			xx.v = -xx.lr*5
			xx.grabbingx.ft = 0
		elseif xx.animcounter < 310 then
			repplay(throwsou)
			if xx.g then
				xx.im = throw
			else
				xx.im = airthrow
			end
		elseif xx.animcounter < 400 then
			xx.animcounter = 0
		end

	end
end




simpledodge = true


uppercutpause = 40
me.uppercuttimer = 0
you.uppercuttimer = 0
me.olda1 = false
you.olda1 = false

me.extratimer = 0
you.extratimer = 0
extrastayonthegroundtime = 8
me.uppercuthit = false
you.uppercuthit = false
me.cantreturntothis = 0
you.cantreturntothis = 0


me.cmbo = false
you.cmbo = false
me.hit_a_box = false
you.hit_a_box = false


function combo(xx)

	if xx.animcounter > 0 and xx.animcounter <= 2 then
		for i,v in ipairs(players) do
			v.hit = false
			v.hit_a_box = false
		end



	end

	local oldanimc = xx.animcounter

	if xx.color.n ~= xx.cchangeto.n and xx.cancombo
		then
		if func~= nil then func() end
		if combo_pause then
			xx.actionshot = true
		end
		xx.cancombo = false
	end

	if not xx.holda and (not combo_pause or xx.currentc == xx.color.n) and xx.combo<xx.maxcombo and xx.cmbo then
		if xx.a1 or xx.a2 or xx.a3 or xx.a4 then
			if xx.currentc~=xx.color.n and xx.combo<xx.maxcombo then
				xx.repcounter = 0
			end
			for i,v in ipairs(players) do
				v.hit = false
			end
		end

		if xx.g then 
			if xx.im==greenk1 then
				xx.attack_num = 2
				xx.animcounter = 1
				xx.combo = xx.combo + 1
			elseif xx.a2 or xx.a3 then
				if func~= nil then func() end
				if xx.color.n==0 then
					xx.attack_num = 1
					if xx.repcounter < at.bb.p.max then
						if xx.repcounter == 0 then xx.combo = xx.combo + 1 end
						xx.repcounter = xx.repcounter+1
						xx.animcounter = 1
					end
				elseif xx.color.n==1 and xx.repcounter < at.p.p.max then
					if xx.repcounter == 0 then xx.combo = xx.combo + 1 end
					xx.attack_num = 1
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==2 and xx.repcounter < at.g.p.max then
					if xx.repcounter == 0 then xx.combo = xx.combo + 1 end
					xx.repcounter = xx.repcounter+1
					xx.attack_num = 1
					xx.animcounter = 1
				elseif xx.color.n==3 and xx.repcounter < at.o.p.max then
					xx.attack_num = 1
					xx.animcounter = 1
					if xx.repcounter == 0 then xx.combo = xx.combo + 1 end
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==4 then
					xx.attack_num = 1
					xx.animcounter = 1
					if xx.repcounter == 0 then xx.combo = xx.combo + 1 end
					xx.repcounter = xx.repcounter + 1
				end

			elseif xx.a4 then

				if func~= nil then func() end
				if xx.color.n==0 and not (xx.currentc == 0 and xx.attack_num == 2) then
					xx.combo = xx.combo + 1
					xx.animcounter = 1
					xx.attack_num = 2
				elseif xx.color.n==1 and not xx.hitsomeonewithpurp then
					xx.attack_num = 2
					xx.animcounter = 17
					xx.repcounter = xx.repcounter + 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==2 then
					xx.attack_num = 2
					xx.animcounter = 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==3 and not (xx.currentc == 3 and xx.attack_num == 2) then
					xx.attack_num = 2
					xx.animcounter = 7
					xx.combo = xx.combo + 1
				elseif xx.color.n==4 then
					xx.attack_num = 2
					xx.animcounter = 1
					xx.combo = xx.combo + 1

				end
			elseif xx.a1 then

				if func~= nil then func() end
				if xx.color.n==0 then
					xx.attack_num = 3
					xx.animcounter = 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==1 then
					xx.attack_num = 3
					xx.animcounter = 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==2 then
					xx.attack_num = 3
					xx.animcounter = 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==3 then
					xx.attack_num = 3
					xx.animcounter = 1
					xx.combo = xx.combo + 1
				elseif xx.color.n==4 then
					xx.attack_num = 3
					xx.animcounter = 1
					xx.combo = xx.combo + 1
					xx.counteractivate = false
				end



			end
		else

			if xx.a2 or xx.a3 then
				if xx.color.n==4 then
					xx.attack_num = 4
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==1 then
					xx.attack_num = 4
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==2 then
					xx.attack_num = 4
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==3 then
					xx.attack_num = 4
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==0 then
					xx.attack_num = 4
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				end


			elseif xx.a1 then  
				if xx.color.n==4 then
					xx.attack_num = 6
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==1 then
					xx.attack_num = 6
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==2 then
					xx.attack_num = 6
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==3 then
					xx.attack_num = 6
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==0 then
					xx.attack_num = 6
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				end

			elseif xx.a4 then
				if xx.color.n==3 and xx.o5repcounter < at.o.ak.max then
					xx.animcounter = 1
					xx.attack_num = 5
					xx.combo = xx.combo + 1
					xx.o5repcounter = xx.o5repcounter + 1
					if xx.repcounter == 1 then xx.combo = xx.combo + 1 end
					xx.j = 2
				elseif xx.color.n==2 then
					xx.attack_num = 5
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==4 then
					xx.attack_num = 5
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==1 then
					xx.attack_num = 5
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1
				elseif xx.color.n==0 then
					xx.attack_num = 5
					xx.animcounter = 1
					xx.repcounter = xx.repcounter + 1

				end


			end


		end
	end
	if not xx.combo_pause 
		and xx.animcounter < oldanimc 
		and xx.animcounter > 0 
		and 
		xx.currentc ~= xx.color.n then
		xx.currentc = xx.color.n
		--xx.repcounter = 0
	end
	xx.cmbo = false

end







function nottoomanyuppercuts(xx)

	if (xx.attack_num == 3 or xx.attack_num == 6) and xx.cancombo then xx.uppercuthit = true end

	--if not xx.g then xx.uppercuttimer = 0 end

	if xx.uppercuttimer > 0 then
		if xx.color.n ~= xx.cchangeto.n and xx.uppercuthit and xx.uppercuttimer > 30
			then
			if combo_pause then
				xx.actionshot = true
			end
			xx.cancombo = false
			xx.uppercuttimer = 0
		end
		xx.uppercuttimer = xx.uppercuttimer-1*ramp(xx)
		xx.a1 = false
	else 
		xx.uppercuthit = false
	end



	if xx.attack_num==3 then xx.uppercuttimer = uppercutpause 
	elseif xx.attack_num==6 then xx.uppercuttimer = uppercutpause/2 
	end

end


me.currentc = 0
you.currentc = 0
me.oldj = 0
you.oldj = 0

me.oldft = 0
you.oldft = 0


function postattackmanage(xx)
	--[[
	if(math.abs(xx.v) ~= math.abs(xx.oldv)) then
		xx.v = xx.oldv + ((xx.v-xx.oldv)/xx.color.s.weight)*rampspeed/2
	end
	if(math.abs(xx.j) ~= math.abs(xx.oldj)) then
		xx.j = xx.oldj + ((xx.j-xx.oldj)/xx.color.s.weight)*rampspeed/2
	end
	if(math.abs(xx.ft) > math.abs(xx.oldft)) then
		rumbleme(xx,(math.log(xx.ft-xx.oldft)+.5)/5)
		xx.ft = xx.oldft + (xx.ft-xx.oldft)*(1)*xx.color.s.brittle
	end
	]]

	if math.abs(xx.v) > speedlimit+3*xx.color.s.speed and xx.animcounter > 0 then
		xx.v = xx.v - signOf(xx.v)
	end

	xx.oldcolor = xx.color.n
	xx.oldft = xx.ft

end


me.shake = false
you.shake = false

me.nododge = false
you.nododge = false



dying ={im = lg.newImage("images/player/attack/dying.png")}
airdying = {im = lg.newImage("images/player/attack/airdying.png")}


climb = {im=lg.newImage("images/player/attack/climb.png")}
climb2 = {im=lg.newImage("images/player/attack/climb2.png")}
climb3 = {im=lg.newImage("images/player/attack/climb3.png")}

flinch = {im = lg.newImage("images/player/attack/flinch.png")}


fallback = {im=lg.newImage("images/player/attack/fallback.png"),xoff = 12, dodge_height = 32, dodge_width = 26, yoff = -40}
fallbackbounce = {im=lg.newImage("images/player/attack/fallbackbounce.png"),xoff = 12, yoff = -40, dodge_height = 32, dodge_width = 26}
fallbackbouncedown = {im=lg.newImage("images/player/attack/fallbackbouncedown.png"),xoff = 12, yoff = -39, dodge_height = 32, dodge_width = 26}
fallforward = {im=lg.newImage("images/player/attack/fallforward.png"), yoff = -32}
fallback1 = {im=lg.newImage("images/player/attack/fallback1.png")}
fallforward1 = {im=lg.newImage("images/player/attack/fallforward1.png"), xoff = -1, yoff = -2}
gettingup1 = {im=lg.newImage("images/player/attack/gettingup1.png"), yoff = -9}
gettingup2 = {im=lg.newImage("images/player/attack/gettingup2.png"),yoff = -7}
gettingup11 = {im=lg.newImage("images/player/attack/gettingup11.png"),xoff = -4, yoff = -23}

flinchback = {im=lg.newImage("images/player/attack/flinchback.png"),yoff = -3}
block = {im = lg.newImage("images/player/attack/block.png")}
dodgeback = {im = lg.newImage("images/player/attack/dodgeback.png"), xoff = 3}
dodgeback2 = {im = lg.newImage("images/player/attack/dodgeback2.png"), xoff = 4, yoff = -3}


dodge = {im=lg.newImage("images/player/attack/dodge.png"), dodge_height = 32, dodge_width = 10, yoff = -24}
dodge2 = {im=lg.newImage("images/player/attack/dodge2.png"),xoff = 10, yoff = -17}
dodge21 = {im=lg.newImage("images/player/attack/dodge21.png"), xoff = 10, yoff = -21}

invis = {im=lg.newImage("images/player/attack/invis.png"),c=lg.newImage("images/player/attack/invis.png")}



you.old_health = 0
me.old_health = 0



function camshakeflinch()
	yhdif = you.old_health-you.health
	mhdif = me.old_health-me.health
	if not (me.health == 0 or you.health == 0) and not (me.actionshot or you.actionshot) and not noshake then

		if ((you.shake) and you.x >= me.x)  or shakeboth then 
			camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + yhdif/2)
			camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + yhdif/2)
			if #joysticks>1 then
				you.joystick:setVibration(1,1)
			end
		elseif ((you.shake) and you.x < me.x) then 
			camera.x = camera.x + math.ceil(math.random()) * (shakedis + yhdif/2)
			camera.y = camera.y + math.ceil(math.random()) * (shakedis + yhdif/2)
			if #joysticks>1 then
				you.joystick:setVibration(1,1)
			end
		end

		if ((me.shake) and me.x < you.x) or shakeboth then 
			camera.x = camera.x + math.ceil(math.random()) * (shakedis + mhdif/2)
			camera.y = camera.y + math.ceil(math.random()) * (shakedis + mhdif/2)
			if #joysticks>0 then
				me.joystick:setVibration(1,1)
			end
		elseif ((me.shake) and me.x >= me.x) then 
			camera2.x = camera2.x + math.ceil(math.random()) * (shakedis + mhdif/2)
			camera2.y = camera2.y + math.ceil(math.random()) * (shakedis + mhdif/2)
			if #joysticks>0 then
				me.joystick:setVibration(1,1)
			end
		end
	end

	if me.shake or shakeboth or you.shake then
		paralaxshake = true
	end

	me.shake = false
	you.shake = false
	shakeboth = false

end








me.dodgeanimatetimer = 0


you.dodgedelaycounter = 0
you.dodgecounter = 0
me.dodgedelaycounter = 0
me.dodgecounter = 0
backdodgetime = 20
dodgetime = 23
backdodgetime = 15
turnaroundtime = 20
turndodgedelay = 10
dodgedelay = 20
dodgespeed = speedlimit*1.25
backdodgespeed = speedlimit*1

me.qualifyfordodge = false
you.qualifyfordodge = false


you.dodgeanimatetimer = 0

you.currentdodgev = 0
me.currentdodgev = 0

me.dodgelr = me.lr


--if hold dodge after a point just slide on the ground
dodgerefreshtime = 38
me.dodgerefreshtimer = 0
you.dodgerefreshtimer = 0

function dodging(xx)

	if not xx.dodge then xx.dodgelr = xx.lr
		xx.makeslidesound = true 
	end

	if xx.dodgerefreshtimer > 0 then xx.dodgerefreshtimer = xx.dodgerefreshtimer - 1
	end

	if xx.flinch or xx.falling
		then xx.dodgecounter = 0
		xx.dodge = false
		xx.dodgetype = 0
		xx.dodgedelaycounter = 0
		xx.stop = true
		xx.purpgroundtimer = 0
		xx.landing_counter = 0
	end

	if xx.dodgedelaycounter > 0 then 
		xx.dodgedelaycounter = xx.dodgedelaycounter - 1*ramp(xx)
		xx.stop = true
		xx.dodge = false
		xx.dodgetype = 0
	end

	if xx.dodgecounter > 1 then 
		xx.dodgecounter = xx.dodgecounter-1*ramp(xx)
		if xx.dodgecounter-1*ramp(xx)<1 then
			xx.dodgecounter = 1
		end

	elseif xx.dodgecounter == 1 then
		xx.dodgecounter = 0
		if xx.dodgetype == 1 or xx.dodgetype == -1 then 
			xx.dodgedelaycounter = dodgedelay
			xx.dodgerefreshtimer = dodgerefreshtime
		elseif xx.dodgetype == 2 then
			xx.dodgedelaycounter = 2
			xx.dodgerefreshtimer = dodgerefreshtime

		elseif xx.dodgetype == -2 then
			xx.dodgetype = 0
			xx.dodge = false
			xx.dodgerefreshtimer = dodgerefreshtime*1.5
		end
	end


	if xx.dodgetype == -2 then
		xx.im = dodgeback
		xx.v = backdodgespeed * -xx.lr
		xx.dodge = true

	elseif xx.dodgetype == -1 then  
		xx.dodge = true
		xx.im = dodgeback2
		xx.v = backdodgespeed*-xx.lr
		if xx.dodgecounter < 7 and ((xx.left and xx.lr > 0) or (xx.right and xx.lr < 0)) then 
			xx.im = dodgeback
			xx.dodgetype = -2

		end

	elseif xx.dodgetype == 2 then 
		xx.v = xx.v/1.2

		if xx.dodgecounter > turnaroundtime-7 then 
			xx.im = dodge21
			xx.v = xx.v - xx.lr*1
		else 
			xx.im=dodge2
		end
		
	elseif xx.dodgetype == 1 then
		xx.dodge = true
		xx.im = dodge
		xx.v = xx.v/1.005
		if (xx.dodgelr > 0 and xx.left) or (xx.dodgelr < 0 and xx.right) then
			xx.v = xx.currentdodgev/3-(dodgespeed*xx.lr)/2
			xx.dodgetype = 2
			xx.dodgecounter = turnaroundtime
			xx.makeslidesound = true
			xx.im = dodge21
		end
	elseif xx.dodgetype == 0 and xx.dodgerefreshtimer == 0 then
		if xx.g and xx.runtap and ((xx.lr > 0 and xx.runb and xx.rightb) or (xx.lr < 0 and xx.leftb and xx.runb)) and xx.animcounter ==0  then
			xx.dodgetype = 1
			xx.dodgecounter = dodgetime
			xx.v = dodgespeed*xx.lr
		elseif xx.g and xx.runtap and ((xx.lr < 0 and xx.runb and xx.rightb) or (xx.lr > 0 and xx.leftb and xx.runb)) and not xx.running  then
			xx.dodgetype = -1
			xx.dodgecounter = backdodgetime
		end
	end


	if xx.dodgetype >= 1 and xx.makeslidesound then 
		repplay(xx.slidedodge)
		xx.makeslidesound = false
	elseif xx.dodgetype <= -1 and xx.makeslidesound then
		repplay(xx.backdodge)
		xx.makeslidesound = false

	end

	if xx.dodgetype~=0 then
		if(math.abs(xx.v) > math.abs(xx.oldv)) then
			--xx.v = xx.oldv + (xx.v-xx.oldv)*(ramp(xx))
		end
	end

	if not simpledodge then
		xx.qualifyfordodge = xx.down and not (xx.rightb or xx.leftb)
	else
		xx.qualifyfordodge = xx.down
	end
end













me.releaseblock = false
you.releaseblock = false
function blocknbusy(xx)

	if xx.currentc == 4 and xx.attack_num ~= 2 then 
		if xx.releaseblock then
			xx.rlvl = xx.rlvl + 1
		end
		xx.releaseblock = false 
	end

	if xx.releaseblock then
		xx.stop = true
		xx.im = blockrelease
	end

	if not xx.blockb then xx.releaseblock = false 
	end


	if xx.g and xx.blockb and xx.dodgedelaycounter <= 0 and not xx.a1 and not xx.a2 and not xx.a3 and not xx.a4 and xx.g and not xx.dodge and not xx.landing and not xx.releaseblock
		then 
		if xx.currentc == 4 then
			xx.im = redblock
		else
			xx.im = block
		end
		xx.block = true
		xx.stop = true

		if not xx.oldblock then repplay(xx.blocksound) end


	else 
		xx.block = false 
	end


	if xx.landing or xx.flinch 
		then xx.busy = true
	else 
		xx.busy = false
	end

	xx.oldblock = xx.block

	if xx.releaseblock and not xx.oldreleaseblock then
		hitpause = true
	end


	xx.oldreleaseblock = xx.releaseblock
end




















you.oldft = 0
you.oldg = 0
me.oldft = 0
me.oldg = 0
me.falltimer = 0
you.falltimer = 0
you.flinchway = 1
me.flinchway = 1
you.gflinchleft = 1
me.gflinchleft = -1

me.hittheground = false
you.hittheground = false

me.falling = false
you.falling = false

fttofall = 25
fallframes = 4
me.oldflinch = false
you.oldflinch = false
me.bouncej = 0
you.bouncej = 0


getuptime = 8
forgetuptime = 3
me.old_health = me.health
you.old_health = you.health

jforfallbackbounce = 5


function flinchingx(xx,yy)


	if xx.old_health > xx.health then 
		if xx.v/(math.abs(xx.v)) < 0 then
			if xx.lr > 0 then
				xx.flinchway = -1
			else
				xx.flinchway = 11
			end
		else
			if xx.lr > 0 then
				xx.flinchway = 11
			else
				xx.flinchway = -1
			end
		end
		if xx.flinch then 
			--if xx.g then xx.gflinchleft = xx.ft end
			repplay(xx.flinch1)
			repplay(xx.flinch2)
			--else 
			-- repplay(xx.minch)
		end
	end


	if xx.health < xx.old_health then
		xx.health = xx.old_health + (xx.health-xx.old_health)*(ramp(xx))/xx.color.s.def
		local dif = xx.old_health - xx.health
		makensparks(xx.v+xx.mid,xx.y+30,sparkspeed, 7, xx.color.c.r,xx.color.c.g,xx.color.c.b,math.floor(dif/ramp(xx) * 2/3)*15)
		blossom(xx,yy, 1, blossom_sides, .2)
		hitpause = true
	end

	if xx.ft > fttofall then
		xx.falling = true
	end

	if (not xx.oldflinch and xx.flinch) or (xx.flinchway > 0 and not xx.g) then
		xx.falltimer = fallframes
	end

	if xx.ft < fttofall and xx.falling and not xx.g and not xx.hittheground then xx.falling = false
	end

	if xx.ft == 0 and not xx.falling and xx.falltimer == 0 then 

		xx.hittheground = false 
	end

	if (xx.ft <= 0 and xx.ft + 1*ramp(xx) >0) or (xx.ft >= 0 and xx.ft - 1*ramp(xx) <0)  then 
		xx.ft = 0
	elseif xx.ft < 0 then xx.ft = xx.ft + 1*ramp(xx)
	elseif xx.ft > 0 then xx.ft = xx.ft - 1*ramp(xx)
	end
	--camshakeflinch()



	if xx.falltimer < 0 then
		if xx.falltimer + 1*ramp(xx) > 0 then
			xx.falltimer = 0
		else
			xx.falltimer = xx.falltimer + 1*ramp(xx)
		end
		xx.flinch = true
		xx.stop = true
		if xx.flinchway > 0 then 
			xx.im = gettingup2
		else
			if xx.falltimer < -4 then 
				xx.im = gettingup11
			else 
				xx.im = gettingup1
			end
		end

	elseif not xx.falling and xx.flinch then 
		if xx.flinchway < 0 then xx.im = flinch
		else 
			xx.im = flinchback
		end

	elseif xx.falling then


		if xx.ft == 0 and xx.falltimer == 0 then
			if xx.flinchway > 0 then
				xx.im = fallforward
			else
				xx.im = fallback
			end
			if xx.extratimer == 1 then
				xx.falling = false
				xx.extratimer = 0
				xx.flinch = true
				xx.stop = true
				if xx.flinchway > 0 then 
					xx.falltimer = -forgetuptime
				elseif xx.j==0 then
					xx.falltimer = -getuptime
				end
			elseif xx.extratimer == 0 and xx.j==0
				--and xx.v ==0
				then xx.extratimer = extrastayonthegroundtime
				xx.flinch = true
			elseif xx.extratimer > 0 then

				xx.flinch = true
				xx.stop = true
				if xx.extratimer - 1*ramp(xx) < 1 then
					xx.extratimer = 1
				else
					xx.extratimer = xx.extratimer - 1*ramp(xx)
				end
			end

		end

		if xx.falltimer > 0  then 
			if xx.falltimer - 1*ramp(xx) > 0 then
				xx.falltimer = xx.falltimer - 1*ramp(xx)
			else
				xx.falltimer = 0
			end
		else 
			xx.hittheground = true
		end

		if not xx.g then 

			if xx.j < -jforfallbackbounce then xx.bouncej = xx.j
			else 
				xx.bouncej = 0 
			end

			xx.falltimer = fallframes
			if not xx.hittheground then
				if xx.flinchway > 0 then xx.im = fallforward1
				else 
					xx.im = fallback1
				end
			else
				if xx.flinchway > 0 then 
					xx.im = fallforward1
				else 
					if xx.j >=0 then xx.im = fallbackbounce
					else 
						xx.im = fallbackbouncedown
					end
				end
			end

		else 


			if xx.flinchway > 0 
				--and not (xx.flinchway < 0 and xx.hittheground) 
				then
				if xx.falltimer > 0 then
					xx.im = fallforward1
				else
					xx.im = fallforward
				end
			else
				if xx.falltimer > 0 and not xx.hittheground then
					xx.im = fallback1
				else
					if xx.bouncej < 0 then
						xx.j = -xx.bouncej*.2
					end
					xx.im = fallback
				end
			end
		end



	end

	if xx.ft ~= 0 or xx.extratimer ~= 0 or xx.falltimer < 0 then xx.flinch = true 
	else 
		xx.flinch = false
	end

	xx.old_health = xx.health
	xx.oldflinch = xx.flinch
	xx.oldft = xx.ft
	xx.oldg = xx.g

end


