--is this causing trouble?  Search that phrase


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





function specialrandom(x)
	return math.ceil(math.random(x))

end

function myroulettespin()
mcolorlist = {"b","g","p","y","s"}
if math.random(17) < 1 then 
	mcolorlist[math.ceil(math.random(5))] = 0
end 
	ranm1 = specialrandom(5)
	if mcolorlist[ranm1] == "b" then mbb = 1
	elseif mcolorlist[ranm1] == "p" then mpp = 1
	elseif mcolorlist[ranm1] == "g" then mgg = 1
	elseif mcolorlist[ranm1] == "y" then myy = 1
	elseif mcolorlist[ranm1] == "s" then mss = 1
	end
	table.remove(mcolorlist,ranm1)
	ranm1 = specialrandom(4)
	if mcolorlist[ranm1] == "b" then mbb = 2
	elseif mcolorlist[ranm1] == "p" then mpp = 2
	elseif mcolorlist[ranm1] == "g" then mgg = 2
	elseif mcolorlist[ranm1] == "y" then myy = 2
	elseif mcolorlist[ranm1] == "s" then mss = 2
	end
	table.remove(mcolorlist,ranm1)
	ranm1 = specialrandom(3)
	if mcolorlist[ranm1] == "b" then mbb = 3
	elseif mcolorlist[ranm1] == "p" then mpp = 3
	elseif mcolorlist[ranm1] == "g" then mgg = 3
	elseif mcolorlist[ranm1] == "y" then myy = 3
	elseif mcolorlist[ranm1] == "s" then mss = 3
	end
	ranm1 = specialrandom(2)
	if mcolorlist[ranm1] == "b" then mbb = 4
	elseif mcolorlist[ranm1] == "p" then mpp = 4
	elseif mcolorlist[ranm1] == "g" then mgg = 4
	elseif mcolorlist[ranm1] == "y" then myy = 4
	elseif mcolorlist[ranm1] == "s" then mss = 4
	end
	table.remove(mcolorlist,ranm1)
end

function yourroulettespin()
ycolorlist = {"b","g","p","y","s"}
if math.random(17) < 1 then 
	ycolorlist[math.ceil(math.random(5))] = 0
end 
	ranm1 = specialrandom(5)
	if ycolorlist[ranm1] == "b" then ybb = 1
	elseif ycolorlist[ranm1] == "p" then ypp = 1
	elseif ycolorlist[ranm1] == "g" then ygg = 1
	elseif ycolorlist[ranm1] == "y" then yyy = 1
	elseif ycolorlist[ranm1] == "s" then yss = 1
	end
	table.remove(ycolorlist,ranm1)
	ranm1 = specialrandom(4)
	if ycolorlist[ranm1] == "b" then ybb = 2
	elseif ycolorlist[ranm1] == "p" then ypp = 2
	elseif ycolorlist[ranm1] == "g" then ygg = 2
	elseif ycolorlist[ranm1] == "y" then yyy = 2
	elseif ycolorlist[ranm1] == "s" then yss = 2
	end
	table.remove(ycolorlist,ranm1)
	ranm1 = specialrandom(3)
	if ycolorlist[ranm1] == "b" then ybb = 3
	elseif ycolorlist[ranm1] == "p" then ypp = 3
	elseif ycolorlist[ranm1] == "g" then ygg = 3
	elseif ycolorlist[ranm1] == "y" then yyy = 3
	elseif ycolorlist[ranm1] == "s" then yss = 3
	end
	ranm1 = specialrandom(2)
	if ycolorlist[ranm1] == "b" then ybb = 4
	elseif ycolorlist[ranm1] == "p" then ypp = 4
	elseif ycolorlist[ranm1] == "g" then ygg = 4
	elseif ycolorlist[ranm1] == "y" then yyy = 4
	elseif ycolorlist[ranm1] == "s" then yss = 4
	end
	table.remove(ycolorlist,ranm1)
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
	settriangles()
collide = false
end

if mereadytoplay and youreadytoplay and ((controller1.start and mns) or (controller2.start and yns)) then MENU = "postchoose"
selecsong:stop()
readysound:play()
end



if controller1.a1 then controller1.a2, controller1.a3, controller1.a4 = false, false, false
		elseif controller1.a2 then controller1.a1, controller1.a3, controller1.a4 = false, false, false
		elseif controller1.a3 then controller1.a2, controller1.a1, controller1.a4 = false, false, false
		elseif controller1.a4 then controller1.a2, controller1.a1, controller1.a3 = false, false, false
			end

if not controller1.block and not controller1.left and not controller1.right and not controller1.a1 and not controller1.a2 and not controller1.a3 and not controller1.start and not controller1.a4 and not controller1.up and not controller1.down then
	mns = true
	end




if mns and mechoosecolor and controller1.start
	 then mechooseface = true 
	 	repplay(startb)

	 mechoosecolor = false
	mns = false
elseif mns and mechooseface and controller1.block then
	mechooseface = false
	mechoosecolor = true
	mns = false
	replaced:play()
elseif mns and mechooseface and controller1.start
	 then mechooseface = false 
	 repplay(startb)
	mns = false
	mereadytoplay = true
elseif mns and mereadytoplay and controller1.block then 
	mereadytoplay = false
	mechooseface = true
	mns = false
	mechoosecolor = false
	replaced:play()
end


if mechooseface then

if controller1.up and mns and mefaceselector > 0 
	then mefaceselector = mefaceselector - 1
	mns = false
	mov:play()
elseif controller1.down and mns and mefaceselector < 5 
	then mefaceselector = mefaceselector + 1
	mns = false
	mov:play()
end




		if mefaceselector == 0 and mns then
			me.face = face1 
			mf1r, mf1g, mf1b = a31r,a31g,a31b
		else 
			mf1r,mf1g,mf1b = 255,255,255
		end


		if mefaceselector == 1 then
			me.face = face2 
			mf2r, mf2g, mf2b = a31r,a31g,a31b
					else
			mf2r,mf2g,mf2b = 255,255,255
		end

		if mefaceselector == 2 then
			me.face = face3 
			mf3r, mf3g, mf3b = a31r,a31g,a31b
					else
			mf3r,mf3g,mf3b = 255,255,255
		end


		if mefaceselector == 3 then
			me.face = face4 
			mf4r, mf4g, mf4b = a31r,a31g,a31b
					else
			mf4r,mf4g,mf4b = 255,255,255
		end

		if mefaceselector == 4 then
			me.face = face5 
			mf5r, mf5g, mf5b = a31r,a31g,a31b
					else
			mf5r,mf5g,mf5b = 255,255,255
		end

		if mefaceselector == 5 then
			me.face = face6 
			mf6r, mf6g, mf6b = a31r,a31g,a31b
					else
			mf6r,mf6g,mf6b = 255,255,255
		end
    
		


end


if yns and youchoosecolor and controller2.start
	 then youchooseface = true 
	repplay(startb2)
	 youchoosecolor = false
	yns = false
elseif yns and youchooseface and controller2.block then
	youchooseface = false
	youchoosecolor = true
	yns = false
	replaced2:play()
elseif yns and youchooseface and controller2.start
	 then youchooseface = false
	repplay(startb2)
	yns = false
	youreadytoplay = true
elseif yns and youreadytoplay and controller2.block then 
	youreadytoplay = false
	youchooseface = true
	youchoosecolor = false
	yns = false
	replaced2:play()
end


if youchooseface then


if controller2.up and yns and youfaceselector > 0 
	then youfaceselector = youfaceselector - 1
	yns = false
	mov2:play()
elseif controller2.down and yns and youfaceselector < 5 
	then youfaceselector = youfaceselector + 1
	yns = false
	mov2:play()
end


		if youfaceselector == 0 then
			you.face = face1 
			yf1r, yf1g, yf1b = a22r,a22g,a22b
		else
			yf1r,yf1g,yf1b = 255,255,255
		end

		if youfaceselector == 1 then
			you.face = face2 
			yf2r, yf2g, yf2b = a22r,a22g,a22b
		else
			yf2r,yf2g,yf2b = 255,255,255
		end

		if youfaceselector == 2 then
			you.face = face3 
			yf3r, yf3g, yf3b = a22r,a22g,a22b
		else
			yf3r,yf3g,yf3b = 255,255,255
		end


		if youfaceselector == 3 then
			you.face = face4 
			yf4r, yf4g, yf4b = a22r,a22g,a22b
		else
			yf4r,yf4g,yf4b = 255,255,255
		end

		if youfaceselector == 4 then
			you.face = face5 
			yf5r, yf5g, yf5b = a22r,a22g,a22b
		elseif you.face ~= face5 then
			yf5r,yf5g,yf5b = 255,255,255
		end

		if youfaceselector == 5 then
			you.face = face6 
			yf6r, yf6g, yf6b = a22r,a22g,a22b
		else
			yf6r,yf6g,yf6b = 255,255,255
		end

	

		
	





end



if mechoosecolor then 
if meseleccurrent == 0 
	then 

	mecurrentframe = enviro.bframe


	if mns then
	if controller1.a1 
	then 
	mbselec = true
	mns = false
		mbb = 1
		repplay(selected)	elseif controller1.a2 
	then mbselec = true
	mns = false
		mbb = 2
		repplay(selected)	elseif controller1.a3
	then mbselec = true
	mns = false
		mbb = 3
		repplay(selected)	elseif controller1.a4
	then mbselec = true
	mns = false
		mbb = 4
		repplay(selected)	elseif controller1.block
	then mbselec = false
	mns = false
		mbb = 0	
		replaced:play()
	end

	if mgg == mbb then mgg = 0
			if mbb ~= 0 then replaced:play() end
	elseif mpp == mbb then mpp = 0
		if mbb ~= 0 then replaced:play() end
	elseif myy == mbb then myy = 0
		if mbb ~= 0 then replaced:play() end
	elseif mss == mbb then mss = 0
		if mbb ~= 0 then replaced:play() end
	end

	end



elseif meseleccurrent == 1 
	then 

	mecurrentframe = enviro.gframe




	if mns then
	if controller1.a1 
	then mgselec = true
	mns = false
		mgg = 1
		repplay(selected)	elseif controller1.a2 
	then mgselec = true
	mns = false
		mgg = 2
		repplay(selected)	elseif controller1.a3
	then mgselec = true
	mns = false
		mgg = 3
		repplay(selected)	elseif controller1.a4
	then mgselec = true
	mns = false
		mgg = 4
		repplay(selected)	elseif controller1.block
	then mgselec = false
	mns = false
		mgg = 0	
		replaced:play()
	end

	if mbb == mgg then mbb = 0
		if mgg ~= 0 then replaced:play() end
	elseif mpp == mgg then mpp = 0
		if mgg ~= 0 then replaced:play() end
	elseif myy == mgg then myy = 0
		if mgg ~= 0 then replaced:play() end
	elseif mss == mgg then mss = 0
		if mgg ~= 0 then replaced:play() end
	end


end

elseif meseleccurrent == 2 
	then 

mecurrentframe = enviro.pframe




	if mns then
	if controller1.a1 
	then mpselec = true
	mns = false
		mpp = 1
		repplay(selected)	elseif controller1.a2 
	then mpselec = true
	mns = false
		mpp = 2
		repplay(selected)	elseif controller1.a3
	then mpselec = true
	mns = false
		mpp = 3
		repplay(selected)	elseif controller1.a4
	then mpselec = true
	mns = false
		mpp = 4
		repplay(selected)	elseif controller1.block
	then mpselec = false
	mns = false
		mpp = 0	
		replaced:play()
	end
  
  	if mpp == mbb then mbb = 0
		if mpp ~= 0 then replaced:play() end
	elseif mpp == mgg then mgg = 0
		if mpp ~= 0 then replaced:play() end
	elseif myy == mpp then myy = 0
		if mpp ~= 0 then replaced:play() end
	elseif mss == myy then mss = 0
		if myy ~= 0 then replaced:play() end
	end
  
end

elseif meseleccurrent == 3 
	then 

	mecurrentframe = enviro.yframe


	if mns then
	if controller1.a1 
	then
	mns = false
		myy = 1
		repplay(selected)	elseif controller1.a2 
	then 
	mns = false
		myy = 2
		repplay(selected)	elseif controller1.a3
	then 
	mns = false
		myy = 3
		repplay(selected)	elseif controller1.a4
	then 
	mns = false
		myy = 4
		repplay(selected)	elseif controller1.block
	then
	mns = false
		myy = 0	
		replaced2:play()
	end
  
  	if myy == mgg then mgg = 0
		if myy ~= 0 then replaced2:play() end
	elseif myy == mpp then mpp = 0
		if myy ~= 0 then replaced2:play() end
	elseif myy == mbb then mbb = 0
		if myy ~= 0 then replaced2:play() end
	elseif mss == myy then mss = 0
		if myy ~= 0 then replaced:play() end
	end


  
end

elseif meseleccurrent == 4 
	then 

mecurrentframe = enviro.sframe

	

	if mns then
	if controller1.a1 
	then 
	mns = false
		mss = 1
		repplay(selected)	
	elseif controller1.a2 
	then 
	mns = false
		mss = 2
		repplay(selected)	
	elseif controller1.a3
	then 
	mns = false
		mss = 3
		repplay(selected)	
	elseif controller1.a4
	then 
	mns = false
		mss = 4
		repplay(selected)	
	elseif controller1.block
	then mpselec = false
	mns = false
		mss = 0	
		replaced:play()
	end
  
  if mss == mbb then mbb = 0
		if mss ~= 0 then replaced:play() end
	elseif mss == mgg then mgg = 0
		if mss ~= 0 then replaced:play() end
	elseif mss == myy then myy = 0
		if mss ~= 0 then replaced:play() end
	elseif mss == mpp then mpp = 0
		if mss ~= 0 then replaced:play() end
	end

  
end













end
end



if controller2.a1 then controller2.a2, controller2.a3, controller2.a4 = false, false, false
		elseif controller2.a2 then controller2.a1, controller2.a3, controller2.a4 = false, false, false
		elseif controller2.a3 then controller2.a2, controller2.a1, controller2.a4 = false, false, false
			elseif controller2.a4 then controller2.a2, controller2.a1, controller2.a3 = false, false, false
			end



if not controller2.block and not controller2.left and not controller2.right and  not controller2.a1 and not controller2.start and not controller2.a2 and not controller2.a3 and not controller2.a4 and not controller2.up and not controller2.down then
	yns = true
	end





if youchoosecolor then

if youseleccurrent == 0 
	then 

	youcurrentframe = enviro.bframe

	

	if yns then
	if controller2.a1 
	then 
	ybselec = true
	yns = false
		ybb = 1
		repplay(selected2)	elseif controller2.a2 
	then ybselec = true
	yns = false
		ybb = 2
		repplay(selected2)	elseif controller2.a3
	then ybselec = true
	yns = false
		ybb = 3
		repplay(selected2)	elseif controller2.a4
	then ybselec = true
	yns = false
		ybb = 4
		repplay(selected2)		elseif controller2.block
	then ybselec = false
	yns = false
		ybb = 0	
		replaced2:play()

end

if ygg == ybb then ygg = 0
			if ybb ~= 0 then replaced2:play() end
	elseif ypp == ybb then ypp = 0
		if ybb ~= 0 then replaced2:play() end
	elseif yyy == ybb then yyy = 0
		if ybb ~= 0 then replaced2:play() end
	elseif yss == ybb then yss = 0
		if ybb ~= 0 then replaced2:play() end
	end

	end



elseif youseleccurrent == 1 
	then 

	youcurrentframe = enviro.gframe

	



	if yns then
	if controller2.a1 
	then ygselec = true
	yns = false
		ygg = 1
		repplay(selected2)	elseif controller2.a2 
	then ygselec = true
	yns = false
		ygg = 2
		repplay(selected2)	elseif controller2.a3
	then ygselec = true
	yns = false
		ygg = 3
		repplay(selected2)	elseif controller2.a4
	then ygselec = true
	yns = false
		ygg = 4
		repplay(selected2)	elseif controller2.block
	then ygselec = false
	yns = false
		ygg = 0	
		replaced2:play()
	end
  
  if ybb == ygg then ybb = 0
		if ygg ~= 0 then replaced2:play() end
	elseif ypp == ygg then ypp = 0
		if ygg ~= 0 then replaced2:play() end
	elseif yyy == ygg then yyy = 0
		if ygg ~= 0 then replaced2:play() end
	elseif yss == ygg then yss = 0
		if ygg ~= 0 then replaced2:play() end
	end


  
end

elseif youseleccurrent == 2 
	then 

	youcurrentframe = enviro.pframe

	

	if yns then
	if controller2.a1 
	then ypselec = true
	yns = false
		ypp = 1
		repplay(selected2)	elseif controller2.a2 
	then ypselec = true
	yns = false
		ypp = 2
		repplay(selected2)	elseif controller2.a3
	then ypselec = true
	yns = false
		ypp = 3
		repplay(selected2)	elseif controller2.a4
	then ypselec = true
	yns = false
		ypp = 4
		repplay(selected2)	elseif controller2.block
	then ypselec = false
	yns = false
		ypp = 0	
		replaced2:play()
	end
  
  if ypp == ybb then ybb = 0
		if ypp ~= 0 then replaced2:play() end
	elseif ypp == ygg then ygg = 0
		if ypp ~= 0 then replaced2:play() end
	elseif yyy == ypp then yyy = 0
		if ypp ~= 0 then replaced2:play() end
	elseif yss == ypp then yss = 0
		if ypp ~= 0 then replaced2:play() end
	end

  
end


elseif youseleccurrent == 3 
	then 

	youcurrentframe = enviro.yframe



	if yns then
	if controller2.a1 
	then
	yns = false
		yyy = 1
		repplay(selected2)	elseif controller2.a2 
	then 
	yns = false
		yyy = 2
		repplay(selected2)	elseif controller2.a3
	then 
	yns = false
		yyy = 3
		repplay(selected2)	elseif controller2.a4
	then 
	yns = false
		yyy = 4
		repplay(selected2)	elseif controller2.block
	then
	yns = false
		yyy = 0	
		replaced2:play()
	end
  
  
	if yyy == ygg then ygg = 0
		if yyy ~= 0 then replaced2:play() end
	elseif yyy == ypp then ypp = 0
		if yyy ~= 0 then replaced2:play() end
	elseif yyy == ybb then ybb = 0
		if yyy ~= 0 then replaced2:play() end
	elseif yss == yyy then yss = 0
		if yyy ~= 0 then replaced2:play() end
	end
  
end


elseif youseleccurrent == 4 
	then 

	youcurrentframe = enviro.sframe

	if yns then
	if controller2.a1 
	then
	yns = false
		yss = 1
		repplay(selected2)	elseif controller2.a2 
	then 
	yns = false
		yss = 2
		repplay(selected2)	elseif controller2.a3
	then 
	yns = false
		yss = 3
		repplay(selected2)	elseif controller2.a4
	then 
	yns = false
		yss = 4
		repplay(selected2)	elseif controller2.block
	then
	yns = false
		yss = 0	
		replaced2:play()
	end
  
  
	if yss == ygg then ygg = 0
		if yss ~= 0 then replaced2:play() end
	elseif yss == ypp then ypp = 0
		if yss ~= 0 then replaced2:play() end
	elseif yss == ybb then ybb = 0
		if yss ~= 0 then replaced2:play() end
	elseif yss == yyy then yyy = 0
		if yss ~= 0 then replaced2:play() end
	end


end


end










end


end



if mbb == 1 then mb = controller1.a1 r1,g1,b1 = br,bg,bb
elseif mgg == 1 then mg = controller1.a1 r1,g1,b1 = gr,gg,gb
elseif mpp == 1 then mp = controller1.a1 r1,g1,b1 = pr,pg,pb
elseif myy == 1 then my = controller1.a1 r1,g1,b1 = yer,yeg,yeb
elseif mss == 1 then ms = controller1.a1 r1,g1,b1 = sr,sg,sb
else r1,g1,b1 = 255,255,255
end

if mbb == 2 then mb = controller1.a2 a21r,a21g,a21b = br,bg,bb
elseif mgg == 2 then mg = controller1.a2 a21r,a21g,a21b = gr,gg,gb
elseif mpp == 2 then mp = controller1.a2 a21r,a21g,a21b = pr,pg,pb
elseif myy == 2 then my = controller1.a2 a21r,a21g,a21b = yer,yeg,yeb
elseif mss == 2 then ms = controller1.a2 a21r,a21g,a21b = sr,sg,sb
else a21r,a21g,a21b = 255,255,255
end

if mbb == 3 then mb = controller1.a3 a31r,a31g,a31b = br,bg,bb
elseif mgg == 3 then mg = controller1.a3 a31r,a31g,a31b = gr,gg,gb
elseif mpp == 3 then mp = controller1.a3 a31r,a31g,a31b = pr,pg,pb
elseif myy == 3 then my = controller1.a3 a31r,a31g,a31b = yer,yeg,yeb
elseif mss == 3 then ms = controller1.a3 a31r,a31g,a31b = sr,sg,sb
else a31r,a31g,a31b = 255,255,255
end

if mbb == 4 then mb = controller1.a4 a41r,a41g,a41b = br,bg,bb
elseif mgg == 4 then mg = controller1.a4 a41r,a41g,a41b = gr,gg,gb
elseif mpp == 4 then mp = controller1.a4 a41r,a41g,a41b = pr,pg,pb
elseif myy == 4 then my = controller1.a4 a41r,a41g,a41b = yer,yeg,yeb
elseif mss == 4 then ms = controller1.a4 a41r,a41g,a41b = sr,sg,sb
else a41r,a41g,a41b = 255,255,255
end


if ybb == 1 then yb = controller2.a1 r2,g2,b2 = br,bg,bb
elseif ygg == 1 then yg = controller2.a1 r2,g2,b2 = gr,gg,gb
elseif ypp == 1 then yp = controller2.a1 r2,g2,b2 = pr,pg,pb
elseif yyy == 1 then yy = controller2.a1 r2,g2,b2 = yer,yeg,yeb
elseif yss == 1 then ys = controller2.a1 r2,g2,b2 = sr,sg,sb
else r2,g2,b2 = 255,255,255
end


if ybb == 2 then yb = controller2.a2 a22r,a22g,a22b = br,bg,bb
elseif ygg == 2 then yg = controller2.a2 a22r,a22g,a22b = gr,gg,gb
elseif ypp == 2 then yp = controller2.a2 a22r,a22g,a22b = pr,pg,pb
elseif yyy == 2 then yy = controller2.a2 a22r,a22g,a22b = yer,yeg,yeb
elseif yss == 2 then ys = controller2.a2 a22r,a22g,a22b = sr,sg,sb
else a22r,a22g,a22b = 255,255,255
end

if ybb == 3 then yb = controller2.a3 a32r,a32g,a32b = br,bg,bb
elseif ygg == 3 then yg = controller2.a3 a32r,a32g,a32b = gr,gg,gb
elseif ypp == 3 then yp = controller2.a3 a32r,a32g,a32b = pr,pg,pb
elseif yyy == 3 then yy = controller2.a3 a32r,a32g,a32b = yer,yeg,yeb
elseif yss == 3 then ys = controller2.a3 a32r,a32g,a32b = sr,sg,sb
else a32r,a32g,a32b = 255,255,255
end

if ybb == 4 then yb = controller2.a4 a42r,a42g,a42b = br,bg,bb
elseif ygg == 4 then yg = controller2.a4 a42r,a42g,a42b = gr,gg,gb
elseif ypp == 4 then yp = controller2.a4 a42r,a42g,a42b = pr,pg,pb
elseif yyy == 4 then yy = controller2.a4 a42r,a42g,a42b = yer,yeg,yeb
elseif yss == 4 then ys = controller2.a4 a42r,a42g,a42b = sr,sg,sb
else a42r,a42g,a42b = 255,255,255
end



end




function mclearprimarys(x)

if x ~= me.blue then me.blue = false end
if x ~= me.green then me.green = false end
if x ~= me.yellow then me.yellow = false end
if x ~= me.purple then me.purple = false end
if x ~= me.sand then me.sand = false end
end


function yclearprimarys(x)
if x ~= you.blue then you.blue = false end
if x ~= you.green then you.green = false end
if x ~= you.yellow then you.yellow = false end
if x ~= you.purple then you.purple = false end
if x ~= you.sand then you.sand = false end
end

function anyofmyprimes()
if me.blue or meblu
or me.yellow or meyell
or me.green or megree
or me.purple or me.purp
or me.sand or mesan
then return true
  else return false
end
end

function anyofyourprimes()
if you.blue or youblu
or you.yellow or youyell
or you.green or yougree
or you.purple or youpurp
or you.sand or yousan
then return true
  else return false
end
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
	you.scancel = true

	you.purple = false
	you.green = false
	you.blue = false 
	you.yellow = false
	you.sand = false

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
	me.scancel = true

	me.purple = false
	me.green = false
	me.blue = false 
	me.yellow = false
	me.sand = false

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
me.blue = x
me.green = y
me.purple = z
me.yellow = a
me.sand = b
end
if you.dodgetype == "none" then

you.blue = x2
you.green = y2
you.purple = z2
you.yellow = a2
you.sand = b2
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
 or me.running



 -- or megree
 -- or meblu
 -- or mepurp
 -- or meyell
 then
me.blue = false
me.purple = false
me.green = false
me.yellow = false
me.sand = false
nomedodge = true
else
nomedodge = false
end

if  you.bur 
 or yougur
 or youbre
or youpell
or youbell
or yougell
or youpun
or youblan
or yougran 
or youyen
or you.running

 -- or yougree
 -- or youblu
 -- or youpurp
 -- or youyell
  then
you.blue = false
you.purple = false
you.green = false
you.yellow = false
you.sand = false
noyoudodge = true
else 
noyoudodge = false
end



if me.blue and me.sand and not me.san and not meblu then 
	mcombofalsify()
	mebland = true
elseif not me.sand and not me.blue then mebland = false
end

if you.blue and you.sand and not you.san and not youblu then 
	ycombofalsify()
	youbland = true
elseif not you.sand and not you.blue then youbland = false
end


if me.green and me.sand and not me.san and not megree then 
	mcombofalsify()
	megrand = true
elseif not me.sand and not me.green then megrand = false
end


if me.yellow and me.sand and not me.san and not meyell then 
	mcombofalsify()
	meyend = true
elseif not me.sand and not me.yellow then meyend = false
end


if me.purple and me.sand and not me.san and not me.purp then 
	mcombofalsify()
	mepund = true
elseif not me.sand and not me.purple then mepund = false
end





if you.green and you.sand and not you.san and not yougree then 
	ycombofalsify()
	yougrand = true
elseif not you.sand and not you.green then yougrand = false
end


if you.yellow and you.sand and not you.san and not youyell then 
	ycombofalsify()
	youyend = true
elseif not you.sand and not you.yellow then youyend = false
end


if you.purple and you.sand and not you.san and not you.purp then 
	ycombofalsify()
	youpund = true
elseif not you.sand and not you.purple then youpund = false
end









if you.blue and you.green and not yougree and not youblu then 
	ycombofalsify()
	youbreen = true
elseif not you.green and not you.blue then youbreen = false
end


if me.blue and me.green and not megree and not meblu then 
	mcombofalsify()
	mebreen = true
elseif not me.green and not me.blue then mebreen = false
end

if me.blue and me.purple and not me.purp and not meblu then 
	mcombofalsify()
	meburple = true
elseif not me.purple and not me.blue then meburple = false
end


if you.blue and you.purple and not you.purp and not youblu then 
	ycombofalsify()
	youburple = true
	

elseif not you.purple and not you.blue then youburple = false
end




--add and not megree?is this causing trouble?
if me.green and me.purple and not me.purp then 
	mcombofalsify()
	megurple = true
	
elseif not me.purple and not me.green then megurple = false
end

if you.green and you.purple and not you.purp then 
	ycombofalsify()
	yougurple = true
	
elseif not you.purple and not you.green then yougurple = false
end




if you.yellow and you.blue and not youblu and not youyell then 
	ycombofalsify()
	youbellow = true

elseif not you.blue and not you.yellow then youbellow = false
end


if me.yellow and me.blue and not meblu and not meyell then 
	mcombofalsify()
	mebellow = true

elseif not me.blue and not me.yellow then mebellow = false
end




if you.yellow and you.purple and not you.purp then 
	ycombofalsify()
	youpellow = true
	
elseif not you.purple and not you.yellow then youpellow = false
end


if me.yellow and me.purple and not me.purp then 
	mcombofalsify()
	mepellow = true
	
elseif not me.purple and not me.yellow then mepellow = false
end

if me.yellow and me.green then 
	mcombofalsify()
	megellow = true

elseif not me.green and not me.yellow then megellow = false
end


if you.yellow and you.green and not yougree and not youyell then 
	ycombofalsify()
	yougellow = true

elseif not you.green and not you.yellow then yougellow = false
end







if meyell or me.yellow then
	--add you bree = false?
mclearprimarys(me.yellow)
mycancel = false
end

if youyell or you.yellow then
	--add you bree = false?
yclearprimarys(you.yellow)
yycancel = false
end

if me.san or me.sand then
	--add you bree = false?
mclearprimarys(me.sand)
me.scancel = false
end

if you.san or you.sand then
	--add you bree = false?
yclearprimarys(you.sand)
you.scancel = false
end





if me.purp or me.purple then
	--add you bree = false?
mclearprimarys(me.purple)
mpcancel = false
end

if meblu or me.blue then
	mclearprimarys(me.blue)
	mbcancel = false
end

if megree or me.green then
	mclearprimarys(me.green)
	mgcancel = false
end


if you.purp or you.purple then
yclearprimarys(you.purple)
ypcancel = false
end

if youblu or you.blue then
	yclearprimarys(you.blue)
	ybcancel = false
end

if yougree or you.green then
	yclearprimarys(you.green)
	ygcancel = false
end



--TRANSFER
--this is for when you activate a combo but then let go of one
if nomedodge or anyofmycombos() then
me.blue = false
me.purple = false
me.green = false
me.yellow = false
me.sand = false
mycancel = true
mgcancel = true
mpcancel = true
mbcancel = true
me.scancel = true
end

if noyoudodge or anyofyourcombos() then
you.blue = false
you.purple = false
you.green = false
you.yellow = false
you.sand = false
yycancel = true
ygcancel = true
ypcancel = true
ybcancel = true
you.scancel = true
end




end

if me.landing then
 me.blue = false
me.purple = false
me.green = false
me.yellow = false
me.sand = false
end
if you.landing then
  you.blue = false
you.purple = false
you.green = false
you.yellow = false
you.sand = false
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

sr = 209
sg = 178
sb = 102



