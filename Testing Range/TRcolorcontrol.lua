--is this causing trouble?  Search that phrase
menoattacks = true
younoattacks = true


mynumbers = {1,2,3,4}
yournumbers = {1,2,3,4}

function onlytwoattacks()


if not controller1.a1 and not controller1.a2 and not controller1.a3 and not controller1.a4
then mynumbers = {1,2,3,4}
end

if not controller2.a1 and not controller2.a2 and not controller2.a3 and not controller2.a4
then yournumbers = {1,2,3,4}
end

if controller1.a1 and table.getn(mynumbers) > 2 then
for i,v in ipairs(mynumbers) do 
	if v == 1 then table.remove(mynumbers, i)
	end
end
end

if controller1.a2 and table.getn(mynumbers) > 2 then
for i,v in ipairs(mynumbers) do 
	if v == 2 then table.remove(mynumbers, i)
	end
end
end

if controller1.a3 and table.getn(mynumbers) > 2 then
for i,v in ipairs(mynumbers) do 
	if v == 3 then table.remove(mynumbers, i)
	end
end
end

if controller1.a4 and table.getn(mynumbers) > 2 then
for i,v in ipairs(mynumbers) do 
	if v == 4 then table.remove(mynumbers, i)
	end
end
end

if controller2.a1 and table.getn(yournumbers) > 2 then
for i,v in ipairs(yournumbers) do 
	if v == 1 then table.remove(yournumbers, i)
	end
end
end

if controller2.a2 and table.getn(yournumbers) > 2 then
for i,v in ipairs(yournumbers) do 
	if v == 2 then table.remove(yournumbers, i)
	end
end
end

if controller2.a3 and table.getn(yournumbers) > 2 then
for i,v in ipairs(yournumbers) do 
	if v == 3 then table.remove(yournumbers, i)
	end
end
end

if controller2.a4 and table.getn(yournumbers) > 2 then
for i,v in ipairs(yournumbers) do 
	if v == 4 then table.remove(yournumbers, i)
	end
end
end


for i,v in ipairs(mynumbers) do 
	if table.getn(mynumbers) <= 2 then
	if v == 1 then controller1.a1 = false end
	if v == 2 then controller1.a2 = false end
	if v == 3 then controller1.a3 = false end
	if v == 4 then controller1.a4 = false end
end
end

for i,v in ipairs(yournumbers) do
	if table.getn(yournumbers) <= 2 then
	if v == 1 then controller2.a1 = false end
	if v == 2 then controller2.a2 = false end
	if v == 3 then controller2.a3 = false end
	if v == 4 then controller2.a4 = false end
end
end



end


colorassign = function()



if lset and rset and MENU == "choose" then 

selecsong:play()
if collide then
if collides:isStopped() then
			collides:play()
		else colides:rewind()
			collides:play()
		end
collide = false
end

if mereadytoplay and youreadytoplay and ((controller1.start and mns) or (controller2.start and yns)) then MENU = "postchoose"
selecsong:stop()
readysound:play()
end



if controller1.a1 then controller1.a2, controller1.a3 = false
		elseif controller1.a2 then controller1.a1, controller1.a3 = false
		elseif controller1.a3 then controller1.a2, controller1.a1 = false
			end

if not controller1.block and not controller1.left and not controller1.right and not controller1.a1 and not controller1.a2 and not controller1.a3 and not controller1.start then
	mns = true
	end

if mechooseface then




	if controller1.a1 or controller1.a2 or controller1.a3 then 


		if mefaceselector == 0 and mns then
			me.face = face1 
			mf1r, mf1g, mf1b = r1,g1,b1
		elseif me.face ~= face1 then
			mf1r,mf1g,mf1b = 255,255,255
		end


		if mefaceselector == 1 and mns then
			me.face = face2 
			mf2r, mf2g, mf2b = r1,g1,b1
					elseif me.face ~= face2 then
			mf2r,mf2g,mf2b = 255,255,255
		end

		if mefaceselector == 2 and mns then
			me.face = face3 
			mf3r, mf3g, mf3b = r1,g1,b1
					elseif me.face ~= face3 then
			mf3r,mf3g,mf3b = 255,255,255
		end


		if mefaceselector == 3 and mns then
			me.face = face4 
			mf4r, mf4g, mf4b = r1,g1,b1
					elseif me.face ~= face4 then
			mf4r,mf4g,mf4b = 255,255,255
		end

		if mefaceselector == 4 and mns then
			me.face = face5 
			mf5r, mf5g, mf5b = r1,g1,b1
					elseif me.face ~= face5 then
			mf5r,mf5g,mf5b = 255,255,255
		end

		if mefaceselector == 5 and mns then
			me.face = face6 
			mf6r, mf6g, mf6b = r1,g1,b1
					elseif me.face ~= face6 then
			mf6r,mf6g,mf6b = 255,255,255
		end
		if mns then
			if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
			end
		end

		mns = false

	
	end


if controller1.left and mns and mefaceselector > 0 
	then mefaceselector = mefaceselector - 1
	mns = false
	mov:play()
elseif controller1.right and mns and mefaceselector < 5 
	then mefaceselector = mefaceselector + 1
	mns = false
	mov:play()
end

end


if mns and mechoosecolor and controller1.start
	 then mechooseface = true 
	 	startbplay()

	 mechoosecolor = false
	mns = false
elseif mns and mechooseface and controller1.block then
	mechooseface = false
	mechoosecolor = true
	mns = false
	replaced:play()
elseif mns and mechooseface and controller1.start
	 then mechooseface = false 
	 startbplay()
	mns = false
	mereadytoplay = true
elseif mns and mereadytoplay and controller1.block then 
	mereadytoplay = false
	mechooseface = true
	mns = false
	mechoosecolor = false
	replaced:play()
end

if yns and youchoosecolor and controller2.start
	 then youchooseface = true 
	 startb2play()
	 youchoosecolor = false
	yns = false
elseif yns and youchooseface and controller2.block then
	youchooseface = false
	youchoosecolor = true
	yns = false
	replaced2:play()
elseif yns and youchooseface and controller2.start
	 then youchooseface = false
	 startb2play()
	yns = false
	youreadytoplay = true
elseif yns and youreadytoplay and controller2.block then 
	youreadytoplay = false
	youchooseface = true
	youchoosecolor = false
	yns = false
	replaced2:play()
end



if mechoosecolor then 
if meseleccurrent == 0 
	then 

	mecurrentframe = enviro.bframe

	if mgg == mbb then mgg = 0
			if mbb ~= 0 then replaced:play() end
	elseif mpp == mbb then mpp = 0
		if mbb ~= 0 then replaced:play() end
	elseif myy == mbb then myy = 0
		if mbb ~= 0 then replaced:play() end
	end

	if mns then
	if controller1.a1 
	then 
	mbselec = true
	mns = false
		mbb = 1
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a2 
	then mbselec = true
	mns = false
		mbb = 2
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a3
	then mbselec = true
	mns = false
		mbb = 3
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.block
	then mbselec = false
	mns = false
		mbb = 0	
		replaced:play()
	end



	end



elseif meseleccurrent == 1 
	then 

	mecurrentframe = enviro.gframe

	if mbb == mgg then mbb = 0
		if mgg ~= 0 then replaced:play() end
	elseif mpp == mgg then mpp = 0
		if mgg ~= 0 then replaced:play() end
	elseif myy == mgg then myy = 0
		if mgg ~= 0 then replaced:play() end
	end





	if mns then
	if controller1.a1 
	then mgselec = true
	mns = false
		mgg = 1
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a2 
	then mgselec = true
	mns = false
		mgg = 2
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a3
	then mgselec = true
	mns = false
		mgg = 3
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
		elseif controller1.block
	then mgselec = false
	mns = false
		mgg = 0	
		replaced:play()
	end

end

elseif meseleccurrent == 2 
	then 

mecurrentframe = enviro.pframe

	if mpp == mbb then mbb = 0
		if mpp ~= 0 then replaced:play() end
	elseif mpp == mgg then mgg = 0
		if mpp ~= 0 then replaced:play() end
	elseif myy == mpp then myy = 0
		if mpp ~= 0 then replaced:play() end
	end


	if mns then
	if controller1.a1 
	then mpselec = true
	mns = false
		mpp = 1
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a2 
	then mpselec = true
	mns = false
		mpp = 2
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a3
	then mpselec = true
	mns = false
		mpp = 3
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.block
	then mpselec = false
	mns = false
		mpp = 0	
		replaced:play()
	end
end

elseif meseleccurrent == 3 
	then 

	mecurrentframe = enviro.yframe

	if myy == mgg then mgg = 0
		if myy ~= 0 then replaced2:play() end
	elseif myy == mpp then mpp = 0
		if myy ~= 0 then replaced2:play() end
	elseif myy == mbb then mbb = 0
		if myy ~= 0 then replaced2:play() end
	end


	if mns then
	if controller1.a1 
	then
	mns = false
		myy = 1
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a2 
	then 
	mns = false
		myy = 2
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
	elseif controller1.a3
	then 
	mns = false
		myy = 3
		if selected:isStopped() then
			selected:play()
		else selected:rewind()
			selected:play()
		end
		elseif controller1.block
	then
	mns = false
		myy = 0	
		replaced2:play()
	end
end




end
end



if controller2.a1 then controller2.a2, controller2.a3 = false
		elseif controller2.a2 then controller2.a1, controller2.a3 = false
		elseif controller2.a3 then controller2.a2, controller2.a1 = false
			end



if not controller2.block and not controller2.left and not controller2.right and  not controller2.a1 and not controller2.start and not controller2.a2 and not controller2.a3 then
	yns = true
	end

if youchooseface then


if controller2.a1 or controller2.a2 or controller2.a3 then 
		if youfaceselector == 0 and yns then
			you.face = face1 
			yf1r, yf1g, yf1b = r2,g2,b2
		elseif you.face ~= face1 then
			yf1r,yf1g,yf1b = 255,255,255
		end

		if youfaceselector == 1 and yns then
			you.face = face2 
			yf2r, yf2g, yf2b = r2,g2,b2
		elseif you.face ~= face2 then
			yf2r,yf2g,yf2b = 255,255,255
		end

		if youfaceselector == 2 and yns then
			you.face = face3 
			yf3r, yf3g, yf3b = r2,g2,b2
		elseif you.face ~= face3 then
			yf3r,yf3g,yf3b = 255,255,255
		end


		if youfaceselector == 3 and yns then
			you.face = face4 
			yf4r, yf4g, yf4b = r2,g2,b2
		elseif you.face ~= face4 then
			yf4r,yf4g,yf4b = 255,255,255
		end

		if youfaceselector == 4 and yns then
			you.face = face5 
			yf5r, yf5g, yf5b = r2,g2,b2
		elseif you.face ~= face5 then
			yf5r,yf5g,yf5b = 255,255,255
		end

		if youfaceselector == 5 and yns then
			you.face = face6 
			yf6r, yf6g, yf6b = r2,g2,b2
		elseif you.face ~= face6 then
			yf6r,yf6g,yf6b = 255,255,255
		end

		if yns then
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
		end

		yns = false

		
	end




if controller2.left and yns and youfaceselector > 0 
	then youfaceselector = youfaceselector - 1
	yns = false
	mov2:play()
elseif controller2.right and yns and youfaceselector < 5 
	then youfaceselector = youfaceselector + 1
	yns = false
	mov2:play()
end

end




if youchoosecolor then

if youseleccurrent == 0 
	then 

	youcurrentframe = enviro.bframe

	if ygg == ybb then ygg = 0
			if ybb ~= 0 then replaced2:play() end
	elseif ypp == ybb then ypp = 0
		if ybb ~= 0 then replaced2:play() end
	elseif yyy == ybb then yyy = 0
		if ybb ~= 0 then replaced2:play() end
	end

	if yns then
	if controller2.a1 
	then 
	ybselec = true
	yns = false
		ybb = 1
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a2 
	then ybselec = true
	yns = false
		ybb = 2
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a3
	then ybselec = true
	yns = false
		ybb = 3
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
		elseif controller2.block
	then ybselec = false
	yns = false
		ybb = 0	
		replaced2:play()

	end
	end



elseif youseleccurrent == 1 
	then 

	youcurrentframe = enviro.gframe

	if ybb == ygg then ybb = 0
		if ygg ~= 0 then replaced2:play() end
	elseif ypp == ygg then ypp = 0
		if ygg ~= 0 then replaced2:play() end
	elseif yyy == ygg then yyy = 0
		if ygg ~= 0 then replaced2:play() end
	end





	if yns then
	if controller2.a1 
	then ygselec = true
	yns = false
		ygg = 1
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a2 
	then ygselec = true
	yns = false
		ygg = 2
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a3
	then ygselec = true
	yns = false
		ygg = 3
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
		elseif controller2.block
	then ygselec = false
	yns = false
		ygg = 0	
		replaced2:play()
	end
end

elseif youseleccurrent == 2 
	then 

	youcurrentframe = enviro.pframe

	if ypp == ybb then ybb = 0
		if ypp ~= 0 then replaced2:play() end
	elseif ypp == ygg then ygg = 0
		if ypp ~= 0 then replaced2:play() end
	elseif yyy == ypp then yyy = 0
		if ypp ~= 0 then replaced2:play() end
	end


	if yns then
	if controller2.a1 
	then ypselec = true
	yns = false
		ypp = 1
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a2 
	then ypselec = true
	yns = false
		ypp = 2
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a3
	then ypselec = true
	yns = false
		ypp = 3
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
		elseif controller2.block
	then ypselec = false
	yns = false
		ypp = 0	
		replaced2:play()
	end
end


elseif youseleccurrent == 3 
	then 

	youcurrentframe = enviro.yframe

	if yyy == ygg then ygg = 0
		if yyy ~= 0 then replaced2:play() end
	elseif yyy == ypp then ypp = 0
		if yyy ~= 0 then replaced2:play() end
	elseif yyy == ybb then ybb = 0
		if yyy ~= 0 then replaced2:play() end
	end


	if yns then
	if controller2.a1 
	then
	yns = false
		yyy = 1
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a2 
	then 
	yns = false
		yyy = 2
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
	elseif controller2.a3
	then 
	yns = false
		yyy = 3
		if selected2:isStopped() then
			selected2:play()
		else selected2:rewind()
			selected2:play()
		end
		elseif controller2.block
	then
	yns = false
		yyy = 0	
		replaced2:play()
	end
end




end










end


end

if mbb == 1 then mb = controller1.a1 r1,g1,b1 = br,bg,bb
elseif mgg == 1 then mg = controller1.a1 r1,g1,b1 = gr,gg,gb
elseif mpp == 1 then mp = controller1.a1 r1,g1,b1 = pr,pg,pb
elseif myy == 1 then my = controller1.a1 r1,g1,b1 = yer,yeg,yeb
else r1,g1,b1 = 0,0,0
end

if mbb == 2 then mb = controller1.a2 a21r,a21g,a21b = br,bg,bb
elseif mgg == 2 then mg = controller1.a2 a21r,a21g,a21b = gr,gg,gb
elseif mpp == 2 then mp = controller1.a2 a21r,a21g,a21b = pr,pg,pb
elseif myy == 2 then my = controller1.a2 a21r,a21g,a21b = yer,yeg,yeb
else a21r,a21g,a21b = 0,0,0
end

if mbb == 3 then mb = controller1.a3 a31r,a31g,a31b = br,bg,bb
elseif mgg == 3 then mg = controller1.a3 a31r,a31g,a31b = gr,gg,gb
elseif mpp == 3 then mp = controller1.a3 a31r,a31g,a31b = pr,pg,pb
elseif myy == 3 then my = controller1.a3 a31r,a31g,a31b = yer,yeg,yeb
else a31r,a31g,a31b = 0,0,0
end


if ybb == 1 then yb = controller2.a1 r2,g2,b2 = br,bg,bb
elseif ygg == 1 then yg = controller2.a1 r2,g2,b2 = gr,gg,gb
elseif ypp == 1 then yp = controller2.a1 r2,g2,b2 = pr,pg,pb
elseif yyy == 1 then yy = controller2.a1 r2,g2,b2 = yer,yeg,yeb
else r2,g2,b2 = 0,0,0
end


if ybb == 2 then yb = controller2.a2 a22r,a22g,a22b = br,bg,bb
elseif ygg == 2 then yg = controller2.a2 a22r,a22g,a22b = gr,gg,gb
elseif ypp == 2 then yp = controller2.a2 a22r,a22g,a22b = pr,pg,pb
elseif yyy == 2 then yy = controller2.a2 a22r,a22g,a22b = yer,yeg,yeb
else a22r,a22g,a22b = 0,0,0
end

if ybb == 3 then yb = controller2.a3 a32r,a32g,a32b = br,bg,bb
elseif ygg == 3 then yg = controller2.a3 a32r,a32g,a32b = gr,gg,gb
elseif ypp == 3 then yp = controller2.a3 a32r,a32g,a32b = pr,pg,pb
elseif yyy == 3 then yy = controller2.a3 a32r,a32g,a32b = yer,yeg,yeb
else a32r,a32g,a32b = 0,0,0
end



end
controller1.a4 = false
controller2.a4 = false
--TRANSFER MOTHER FUCKER


--transfer
function mclearprimarys(x)

if x ~= meblue then meblue = false end
if x ~= megreen then megreen = false end
if x ~= meyellow then meyellow = false end
if x ~= mepurple then mepurple = false end
if x ~= mesand then mesand = false end
end


function yclearprimarys(x)
if x ~= youblue then youblue = false end
if x ~= yougreen then yougreen = false end
if x ~= youyellow then youyellow = false end
if x ~= youpurple then youpurple = false end
if x ~= yousand then yousand = false end
end

function anyofmycombos()
	if megurple or
	meburple or
	mebellow or
	megellow or
	mepellow or
	mebreen or
	mebland or
	megrand or
	meyend or
	mepund
	then return
	true
	else return false
	end
end

function anyofyourcombos()
	if yougurple or
	youburple or
	youbellow or
	yougellow or
	youpellow or
	youbreen or
	youbland or
	yougrand or
	youyend or
	youpund
	then return
	true
	else return false
	end
end

--transfer
function ycombofalsify()
	ygcancel = true
	ypcancel = true
	ybcancel = true
	yycancel = true
	yscancel = true

	youpurple = false
	yougreen = false
	youblue = false 
	youyellow = false
	yousand = false

	yougurple = false
	youburple = false
	youbellow = false
	yougellow = false
	youpellow = false
	youbreen = false
	youbland = false
	yougrand = false
	youyend = false
	youpund = false

end

function mcombofalsify()
	mgcancel = true
	mpcancel = true
	mbcancel = true
	mycancel = true
	mscancel = true

	mepurple = false
	megreen = false
	meblue = false 
	meyellow = false
	mesand = false

	megurple = false
	meburple = false
	mebellow = false
	megellow = false
	mepellow = false
	mebreen = false
	mebland = false
	mebreen = false
	mebland = false
	megrand = false
	meyend = false
	mepund = false


end



--transfer
function colorcontrol(x,y,z,x2,y2,z2,a,a2,b,b2)
	if me.dodgetype == "none" then
meblue = x
megreen = y
mepurple = z
meyellow = a
mesand = b
end
if you.dodgetype == "none" then

youblue = x2
yougreen = y2
youpurple = z2
youyellow = a2
yousand = b2
end



if MENU == "play"
then

if mebur
 or mebre
 or megur 
 or mepell
 or mebell  
 or megell
 or meblan
 or megran
 or mepun
 or meyen



 -- or megree
 -- or meblu
 -- or mepurp
 -- or meyell
 then
meblue = false
mepurple = false
megreen = false
meyellow = false
mesand = false
nomedodge = true
else
nomedodge = false
end

if  youbur 
 or yougur
 or youbre
or youpell
or youbell
or yougell
or youpun
or youblan
or yougran 
or youyen

 -- or yougree
 -- or youblu
 -- or youpurp
 -- or youyell
  then
youblue = false
youpurple = false
yougreen = false
youyellow = false
yousand = false
noyoudodge = true
else 
noyoudodge = false
end



--transfer
if meblue and mesand and not mesan and not meblu then 
	mcombofalsify()
	mebland = true
elseif not mesand and not meblue then mebland = false
end

if youblue and yousand and not yousan and not youblu then 
	ycombofalsify()
	youbland = true
elseif not yousand and not youblue then youbland = false
end


if megreen and mesand and not mesan and not megree then 
	mcombofalsify()
	megrand = true
elseif not mesand and not megreen then megrand = false
end


if meyellow and mesand and not mesan and not meyell then 
	mcombofalsify()
	meyend = true
elseif not mesand and not meyellow then meyend = false
end


if mepurple and mesand and not mesan and not mepurp then 
	mcombofalsify()
	mepund = true
elseif not mesand and not mepurple then mepund = false
end





if yougreen and yousand and not yousan and not yougree then 
	ycombofalsify()
	yougrand = true
elseif not yousand and not yougreen then yougrand = false
end


if youyellow and yousand and not yousan and not youyell then 
	ycombofalsify()
	youyend = true
elseif not yousand and not youyellow then youyend = false
end


if youpurple and yousand and not yousan and not youpurp then 
	ycombofalsify()
	youpund = true
elseif not yousand and not youpurple then youpund = false
end









if youblue and yougreen and not yougree and not youblu then 
	ycombofalsify()
	youbreen = true
elseif not yougreen and not youblue then youbreen = false
end


if meblue and megreen and not megree and not meblu then 
	mcombofalsify()
	mebreen = true
elseif not megreen and not meblue then mebreen = false
end

if meblue and mepurple and not mepurp and not meblu then 
	mcombofalsify()
	meburple = true
elseif not mepurple and not meblue then meburple = false
end


if youblue and youpurple and not youpurp and not youblu then 
	ycombofalsify()
	youburple = true
	

elseif not youpurple and not youblue then youburple = false
end




--add and not megree?is this causing trouble?
if megreen and mepurple and not mepurp then 
	mcombofalsify()
	megurple = true
	
elseif not mepurple and not megreen then megurple = false
end

if yougreen and youpurple and not youpurp then 
	ycombofalsify()
	yougurple = true
	
elseif not youpurple and not yougreen then yougurple = false
end




if youyellow and youblue and not youblu and not youyell then 
	ycombofalsify()
	youbellow = true

elseif not youblue and not youyellow then youbellow = false
end


if meyellow and meblue and not meblu and not meyell then 
	mcombofalsify()
	mebellow = true

elseif not meblue and not meyellow then mebellow = false
end




if youyellow and youpurple and not youpurp then 
	ycombofalsify()
	youpellow = true
	
elseif not youpurple and not youyellow then youpellow = false
end


if meyellow and mepurple and not mepurp then 
	mcombofalsify()
	mepellow = true
	
elseif not mepurple and not meyellow then mepellow = false
end

if meyellow and megreen then 
	mcombofalsify()
	megellow = true

elseif not megreen and not meyellow then megellow = false
end


if youyellow and yougreen and not yougree and not youyell then 
	ycombofalsify()
	yougellow = true

elseif not yougreen and not youyellow then yougellow = false
end







if meyell or meyellow then
	--add you bree = false?
mclearprimarys(meyellow)
mycancel = false
end

if youyell or youyellow then
	--add you bree = false?
yclearprimarys(youyellow)
yycancel = false
end

if mesan or mesand then
	--add you bree = false?
mclearprimarys(mesand)
mscancel = false
end

if yousan or yousand then
	--add you bree = false?
yclearprimarys(yousand)
yscancel = false
end





if mepurp or mepurple then
	--add you bree = false?
mclearprimarys(mepurple)
mpcancel = false
end

if meblu or meblue then
	mclearprimarys(meblue)
	mbcancel = false
end

if megree or megreen then
	mclearprimarys(megreen)
	mgcancel = false
end


if youpurp or youpurple then
yclearprimarys(youpurple)
ypcancel = false
end

if youblu or youblue then
	yclearprimarys(youblue)
	ybcancel = false
end

if yougree or yougreen then
	yclearprimarys(yougreen)
	ygcancel = false
end



--TRANSFER
--this is for when you activate a combo but then let go of one
if nomedodge or anyofmycombos() then
meblue = false
mepurple = false
megreen = false
meyellow = false
mesand = false
mycancel = true
mgcancel = true
mpcancel = true
mbcancel = true
mscancel = true
end

if noyoudodge or anyofyourcombos() then
youblue = false
youpurple = false
yougreen = false
youyellow = false
yousand = false
yycancel = true
ygcancel = true
ypcancel = true
ybcancel = true
yscancel = true
end




end
end

yer = 255
yeg = 246 
yeb = 0

pr = 158
pg = 0 
pb = 203

gr = 60
gg = 255
gb = 88

br = 0
bg = 174
bb = 255


