--is this causing trouble?  Search that phrase

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




function colorcontrol(x,y,z,x2,y2,z2,a,a2)
me.blue = x
me.green = y
me.purple = z
me.yellow = a

you.blue = x2
you.green = y2
you.purple = z2
you.yellow = a2







if MENU == "play"
then

if mebur
 or mebre
 or megur 
 or mepell
 or mebell  
 -- or me.gree
 -- or meblu
 -- or mepurp
 -- or meyell
 then
me.blue = false
me.purple = false
me.green = false
me.yellow = false
end

if  you.bur 
 or yougur
 or youbre
or youpell
or youbell
 -- or you.gree
 -- or youblu
 -- or youpurp
 -- or youyell
  then
you.blue = false
you.purple = false
you.green = false
you.yellow = false
end



if you.blue and you.green and not you.gree and not youblu then 
	you.breen = true
	you.gcancel = true
	you.pcancel = true
	you.purple = false
	you.green = false
	you.blue = false 
	ybcancel = true
	you.yellow = false
	you.ycancel = true

	you.gurple = false
	you.burple = false
	you.bellow = false
	you.gellow = false
	you.pellow = false
elseif not you.green and not you.blue then you.breen = false
end


if me.blue and me.green and not me.gree and not meblu then 
	me.breen = true
	me.gcancel = true
	me.pcancel = true
	me.purple = false
	me.green = false
	me.blue = false 
	mbcancel = true
	me.yellow = false
	me.ycancel = true

	me.gurple = false
	me.burple = false
	me.bellow = false
	me.gellow = false
	me.pellow = false
elseif not me.green and not me.blue then me.breen = false
end

if me.blue and me.purple and not me.purp and not meblu then 
	me.burple = true
	me.gcancel = true
	me.pcancel = true
	me.purple = false
	me.green = false
	me.blue = false 
	mbcancel = true
	me.yellow = false
	me.ycancel = true

	me.gurple = false
	me.breen = false
	me.bellow = false
	me.gellow = false
	me.pellow = false
elseif not me.purple and not me.blue then me.burple = false
end


if you.blue and you.purple and not you.purp and not youblu then 
	you.burple = true
	you.gcancel = true
	you.pcancel = true
	you.purple = false
	you.green = false
	you.blue = false 
	ybcancel = true
	you.yellow = false
	you.ycancel = true

	you.breen = false
	you.gurple = false
	you.bellow = false
	you.gellow = false
	you.pellow = false


elseif not you.purple and not you.blue then you.burple = false
end




--add and not me.gree?is this causing trouble?
if me.green and me.purple and not me.purp then 
	me.gurple = true
	me.gcancel = true
	me.pcancel = true
	me.purple = false
	me.green = false
	me.blue = false 
	mbcancel = true
	me.yellow = false
	me.ycancel = true

	me.burple = false
	me.breen = false
	me.bellow = false
	me.gellow = false
	me.pellow = false
elseif not me.purple and not me.green then me.gurple = false
end

if you.green and you.purple and not you.purp then 
	you.gurple = true
	you.gcancel = true
	you.pcancel = true
	you.purple = false
	you.green = false
	you.blue = false 
	ybcancel = true
	you.yellow = false
	you.ycancel = true

	you.breen = false
	you.burple = false
	you.bellow = false
	you.gellow = false
	you.pellow = false
elseif not you.purple and not you.green then you.gurple = false
end




if you.yellow and you.blue and not youblu and not youyell then 
	you.bellow = true

	you.ycancel = true
	you.pcancel = true
	ybcancel = true
	you.gcancel = true

	you.purple = false
	you.green = false
	you.blue = false
	you.yellow = false 

	you.breen = false
	you.gurple = false
	you.burple = false
	you.gellow = false
	you.pellow = false
elseif not you.blue and not you.yellow then you.bellow = false
end


if me.yellow and me.blue and not meblu and not meyell then 
	me.bellow = true

	me.ycancel = true
	me.pcancel = true
	mbcancel = true
	me.gcancel = true

	me.purple = false
	me.green = false
	me.blue = false
	me.yellow = false 

	me.burple = false
	me.gurple = false
	me.breen = false
	me.gellow = false
	me.pellow = false
elseif not me.blue and not me.yellow then me.bellow = false
end




if you.yellow and you.purple and not you.purp then 
	you.pellow = true
	you.ycancel = true
	you.pcancel = true
	you.purple = false
	you.green = false
	you.blue = false
	you.yellow = false 
	ybcancel = true
	you.yellow = false
	you.gcancel = true

	you.breen = false
	you.gurple = false
	you.burple = false
	you.bellow = false
	you.gellow = false
elseif not you.purple and not you.yellow then you.pellow = false
end


if me.yellow and me.purple and not me.purp then 
	me.pellow = true
	me.ycancel = true
	me.pcancel = true
	me.purple = false
	me.green = false
	me.blue = false
	me.yellow = false 
	mbcancel = true
	me.yellow = false
	me.gcancel = true

	me.burple = false
	me.gurple = false
	me.breen = false
	me.bellow = false
	me.gellow = false
elseif not me.purple and not me.yellow then me.pellow = false
end

if me.yellow and me.green then 
	me.gellow = true

	me.ycancel = true
	me.pcancel = true
	mbcancel = true
	me.gcancel = true
	me.purple = false
	me.green = false
	me.blue = false
	me.yellow = false 

	me.burple = false
	me.gurple = false
	me.breen = false
	me.bellow = false
	me.pellow = false
elseif not me.green and not me.yellow then me.gellow = false
end


if you.yellow and you.green and not you.gree and not youyell then 
	you.gellow = true

	you.ycancel = true
	you.pcancel = true
	ybcancel = true
	you.gcancel = true

	you.purple = false
	you.green = false
	you.blue = false
	you.yellow = false 

	you.breen = false
	you.gurple = false
	you.burple = false
	you.bellow = false
	you.pellow = false
elseif not you.green and not you.yellow then you.gellow = false
end




if meyell or me.yellow then
	--add you bree = false?
me.blue = false
me.green = false
me.purple = false
me.ycancel = false
end

if youyell or you.yellow then
	--add you bree = false?
you.blue = false
you.green = false
you.purple = false
you.ycancel = false
end



if me.purp or me.purple then
	--add you bree = false?
me.blue = false
me.green = false
me.yellow = false
me.pcancel = false
end

if meblu or me.blue then
	me.purple = false
	me.green = false
	mbcancel = false

	--optional
	me.gurple = false
	me.pellow = false
	me.gellow = false

	me.yellow = false
end

if me.gree or me.green then
	me.purple = false
	me.blue = false
	me.yellow = false
	me.gcancel = false
end


if you.purp or you.purple then
you.blue = false
you.green = false
you.pcancel = false
you.yellow = false
end

if youblu or you.blue then
	you.purple = false
	you.green = false
	ybcancel = false
	you.yellow = false
end

if you.gree or you.green then
	you.purple = false
	you.blue = false
	you.gcancel = false
	you.yellow = false
end




if me.burple or mebur
or me.breen or mebre
or me.gurple or megur 
or me.pellow or mepell
or me.bellow or mebell
or me.gellow or megell  then
me.blue = false
me.purple = false
me.green = false
me.yellow = false
me.ycancel = true
me.gcancel = true
me.pcancel = true
mbcancel = true
end

if you.burple or you.bur 
or you.gurple or yougur
or you.breen or youbre
or you.pellow or youpell
or you.bellow or youbell
or you.gellow or yougell then
you.blue = false
you.purple = false
you.green = false
you.yellow = false
you.ycancel = true
you.gcancel = true
you.pcancel = true
ybcancel = true
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

