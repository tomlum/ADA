


idle1im = love.graphics.newImage("me/idle/idle1.png")
idle1c = nil
idle2im = love.graphics.newImage("me/idle/idle2.png")
idle2c = love.graphics.newImage("me/idle/idle2c.png")
idle3im = love.graphics.newImage("me/idle/idle3.png")
idle3c = love.graphics.newImage("me/idle/idle3c.png")
idle4im = love.graphics.newImage("me/idle/idle4.png")
idle4c = love.graphics.newImage("me/idle/idle4c.png")
idle1 = {im = idle1im, c = idle1c}
idle2 = {im = idle2im, c = idle2c}
idle3 = {im = idle3im, c = idle3c}
idle4 = {im = idle4im, c = idle4c}

at = {}


me = {}
you = {}
me.shade=255
you.shade=180




me.id = 1
	me.health = maxhealth
	me.dead = false
	--boolean statuses
	me.g = true
	me.slide = false
	--the image
	me.im =idle1
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.yoffset = 0
	me.feet = me.y + 60
	--the face/crest image
	me.face = love.graphics.newImage("me/face/face1.png")
	me.facex = me.x + 12
	me.facedis = 2
	me.facey = me.feet - 54
	me.crest = love.graphics.newImage("me/crest/crest1.png")
	me.crestx = me.xanimate - 13
	me.crestdis = 1
	me.cresty = me.y + 27
	me.slowdown = false
	--horizontal velocity
	me.v = 0
	me.push = 0
	--vertical velocity (j.ump)
	me.j = 0
	me.next = me.feet - me.j
	me.jt = 0
	me.ht = 0
	me.firstjump = true

	me.feet = me.y + 60
	me.lr = 1
	me.landing = false
	me.landingcounter = 0
	me.onplat = false
	--on the ground?
	--attacking
	me.flinch = false
	me.ft = 0
	me.flinchtimer = 0
	me.busy = false
	me.attacknumber = 0
	me.stop = false
	me.airbusy = false
	me.airtimer = 0
	me.firstairattack = true
	me.attack = "none"
	me.prime = false
	me.block = false
	me.invince = false
	me.dodge = false
	me.dodgetype = 0
	me.jstop = false
	me.walking = false
	me.pause = false
	me.a = none
	me.att = none




you.id = 2
	you.health = maxhealth
	you.dead = false
	--boolean statuses
	you.g = true
	you.slide = false
	--the image
	you.im =idle1
	you.x = 6000 -- 4500
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.yoffset = 0
	you.feet = you.y + 60
	--the face/crest image
	you.face = love.graphics.newImage("me/face/face2.png")
	you.facex = you.x + 12
	you.facedis = 2
	you.facey = you.feet - 54
	you.crest = love.graphics.newImage("me/crest/crest2.png")
	you.crestx = you.xanimate - 13
	you.cresty = you.y + 27
	you.crestdis = 1
	you.slowdown = false
	--horizontal velocity
	you.v = 0
	you.push = 0
	--vertical velocity (j.ump) and jump time (jt) and hang time (ht)
	you.j = 0
	you.next = you.feet - you.j
	you.jt = 0
	you.ht = 0
	you.firstjump = true
	
	you.feet = you.y + 60
	you.lr = -1
	you.landing = false
	you.landingcounter = 0
	you.onplat = false
	--attacking
	you.flinch = false
	you.ft = 0
	you.flinchtimer = 0
	you.attacking = false
	you.stop = false
	you.block = false
	you.invince = false
	you.prime = false
	you.attack = "none"


	you.busy = false
	you.attacknumber = 0
	you.airbusy = false
	you.airtimer = 0
	you.firstairattack = true
	you.dodge = false
	you.dodgetype = 0
	you.jstop = false
	you.walking = false
	you.pause = false

	me.busyblue = false
	me.busypurple = false
	me.busygreen = false

function loadmeandyou2()
	me.push = 0
	you.push = 0
	waitforitplay = -1
	playfadeout = 0
backtowhite = false
song1:rewind()

me.im =idle1
you.im =idle1

me.yoffset = 0
you.yoffset = 0

	mereadytoplay = false
	mechooseface = false
	mechoosecolor = false

	youreadytoplay = false
	youchooseface = false
	youchoosecolor = false


	you.deathclock = 0
	me.deathclock = 0

you.lefty = true
me.righty = true

	gotimer = 0

	enviro.dolly = 0
	enviro.ds = 5
	streetfadestart = false
	streetfade = 255
	streetfadehold = 50 + math.random(50) 


	me.health = maxhealth
	me.dead = false
	--boolean statuses
	me.g = true
	me.slide = false
	--the image
	me.im =idle1
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.feet = me.y + 60
	--the face/crest image
	me.lefty = false
	me.face = love.graphics.newImage("me/face/face1.png")
	me.facex = me.x + 12
	me.facedis = 2
	me.facey = me.feet - 54
	me.crest = love.graphics.newImage("me/crest/crest1.png")
	me.crestx = me.xanimate - 13
	me.crestdis = 1
	me.cresty = me.y + 27
	me.slowdown = false
	--horizontal velocity
	me.v = 0
	--vertical velocity (j.ump)
	me.j = 0
	me.next = me.feet - me.j
	me.jt = 0
	me.ht = 0
	me.firstjump = true

	me.feet = me.y + 60
	me.lr = 1
	me.landing = false
	me.landingcounter = 0
	me.onplat = false
	--on the ground?
	--attacking
	me.flinch = false
	me.ft = 0
	me.flinchtimer = 0
	me.busy = false
	me.attacknumber = 0
	me.stop = false
	me.airbusy = false
	me.airtimer = 0
	me.firstairattack = true
	me.attack = "none"
	me.prime = false
	me.block = false
	me.invince = false
	me.dodge = false
	me.dodgetype = 0
	me.jstop = false
	me.walking = false
	me.pause = false
	me.a = none
	me.att = none
	me.push = 0



	you.health = maxhealth
	you.dead = false
	--boolean statuses
	you.g = true
	you.slide = false
	--the image
	you.im =idle1
	you.x = 2000 --6000
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.feet = you.y + 60
	--the face/crest image
	you.lefty = true
	you.face = love.graphics.newImage("me/face/face2.png")
	you.facex = you.x + 12
	you.facedis = 2
	you.facey = you.feet - 54
	you.crest = love.graphics.newImage("me/crest/crest2.png")
	you.crestx = you.xanimate - 13
	you.cresty = you.y + 27
	you.crestdis = 1
	you.slowdown = false
	--horizontal velocity
	you.v = 0
	--vertical velocity (j.ump) and jump time (jt) and hang time (ht)
	you.j = 0
	you.next = you.feet - you.j
	you.jt = 0
	you.ht = 0
	you.firstjump = true
	
	you.feet = you.y + 60
	you.lr = -1
	you.landing = false
	you.landingcounter = 0
	you.onplat = false
	--attacking
	you.flinch = false
	you.ft = 0
	you.flinchtimer = 0
	you.attacking = false
	you.stop = false
	you.block = false
	you.invince = false
	you.prime = false
	you.attack = "none"
	you.push = 0


	you.busy = false
	you.attacknumber = 0
	you.airbusy = false
	you.airtimer = 0
	you.firstairattack = true
	you.dodge = false
	you.dodgetype = 0
	you.jstop = false
	you.walking = false
	you.pause = false

	me.busyblue = false
	me.busypurple = false
	me.busygreen = false

	
	for i,v in ipairs(me.bolts) do table.remove(me.bolts,i) end
	for i,v in ipairs(you.bolts) do table.remove(you.bolts,i) end
	for i,v in ipairs(me.spikes) do table.remove(me.spikes,i) end
	for i,v in ipairs(you.spikes) do table.remove(you.spikes,i) end
	for i,v in ipairs(mymines) do table.remove(mymines,i) end
	for i,v in ipairs(yourmines) do table.remove(yourmines,i) end

if themap.name == "street" then 
	floor = 1900 - 3
	me.x = 1000
		you.x = 6000
		floor = 1900 - 3
elseif themap.name == "library" then 
	me.x = 700
		you.x = 2000
		me.y = 300
		you.y = 300

end
end

function loadmeandyou()
	me.push = 0
	you.push = 0
	collide = true
	waitforitplay = -1
	playfadeout = 0
	spines = {}
	n = 10
sosfirst = true
backtowhite = false
	song1:rewind()
	selecsong:rewind()
	selecsong:setPitch(1)

		mereadytoplay = false
	mechooseface = false
	mechoosecolor = false

	youreadytoplay = false
	youchooseface = false
	youchoosecolor = false

	
me.push = 0
you.push = 0

me.yoffset = 0
you.yoffset = 0


	you.deathclock = 0
	me.deathclock = 0

	you.lefty = true
me.righty = true

	gotimer = 0

	enviro.dolly = 0
	enviro.ds = 5
	streetfadestart = false
	streetfade = 255
	streetfadehold = 50 + math.random(50) 

mechooseface = false
youchooseface = false
mechoosecolor = true
youchoosecolor = true

mefaceselector = 0
youfaceselector = 0
juststartedpost = true
ln = 0
rn = 0



retryfade = 0
fadeupretry = 0

cflicker = 0
cfhold = 0
cfup = true

mbb,mgg,mpp,ybb,ygg,ypp,myy,yyy = 0,0,0,0,0,0,0,0
mb,mg,mp,yb,yg,yp,my, yy = false,false,false,false,false,false,false,false
r1,r2,g1,g2,b1,b2 = 0,0,0,0,0,0

mf1r,mf1g,mf1b = 255,255,255
mf2r,mf2g,mf2b = 255,255,255
mf3r,mf3g,mf3b = 255,255,255
mf4r,mf4g,mf4b = 255,255,255
mf5r,mf5g,mf5b = 255,255,255
mf6r,mf6g,mf6b = 255,255,255

yf1r,yf1g,yf1b = 255,255,255
yf2r,yf2g,yf2b = 255,255,255
yf3r,yf3g,yf3b = 255,255,255
yf4r,yf4g,yf4b = 255,255,255
yf5r,yf5g,yf5b = 255,255,255
yf6r,yf6g,yf6b = 255,255,255



sfade = 5
startsfade = false

	lcx = -screenwidth 
	rcx = screenwidth*1.5
	lset = false
	rset = false
	msy = 0
	ysy = 0
	mr2c = true
	yr2c = true



	meseleccurrent = 0
	youseleccurrent = 0

	mecurrentframe = enviro.bframe
	youcurrentframe = enviro.bframe





	me.health = maxhealth
	me.dead = false
	--boolean statuses
	me.g = true
	me.slide = false
	--the image
	me.im =idle1
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.feet = me.y + 60
	--the face/crest image
	me.lefty = false
	me.face = love.graphics.newImage("me/face/face1.png")
	me.facex = me.x + 12
	me.facedis = 2
	me.facey = me.feet - 54
	me.crest = love.graphics.newImage("me/crest/crest1.png")
	me.crestx = me.xanimate - 13
	me.crestdis = 1
	me.cresty = me.y + 27
	me.slowdown = false
	--horizontal velocity
	me.v = 0
	--vertical velocity (j.ump)
	me.j = 0
	me.next = me.feet - me.j
	me.jt = 0
	me.ht = 0
	me.firstjump = true

	me.feet = me.y + 60
	me.lr = 1
	me.landing = false
	me.landingcounter = 0
	me.onplat = false
	--on the ground?
	--attacking
	me.flinch = false
	me.ft = 0
	me.flinchtimer = 0
	me.busy = false
	me.attacknumber = 0
	me.stop = false
	me.airbusy = false
	me.airtimer = 0
	me.firstairattack = true
	me.attack = "none"
	me.prime = false
	me.block = false
	me.invince = false
	me.dodge = false
	me.dodgetype = 0
	me.jstop = false
	me.walking = false
	me.pause = false
	me.a = none
	me.att = none





	you.health = maxhealth
	you.dead = false
	--boolean statuses
	you.g = true
	you.slide = false
	--the image
	you.im =idle1
	you.x = 6000
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.feet = you.y + 60
	--the face/crest image
	you.lefty = true
	you.face = love.graphics.newImage("me/face/face2.png")
	you.facex = you.x + 12
	you.facedis = 2
	you.facey = you.feet - 54
	you.crest = love.graphics.newImage("me/crest/crest2.png")
	you.crestx = you.xanimate - 13
	you.cresty = you.y + 27
	you.crestdis = 1
	you.slowdown = false
	--horizontal velocity
	you.v = 0
	--vertical velocity (j.ump) and jump time (jt) and hang time (ht)
	you.j = 0
	you.next = you.feet - you.j
	you.jt = 0
	you.ht = 0
	you.firstjump = true
	
	you.feet = you.y + 60
	you.lr = -1
	you.landing = false
	you.landingcounter = 0
	you.onplat = false
	--attacking
	you.flinch = false
	you.ft = 0
	you.flinchtimer = 0
	you.attacking = false
	you.stop = false
	you.block = false
	you.invince = false
	you.prime = false
	you.attack = "none"


	you.busy = false
	you.attacknumber = 0
	you.airbusy = false
	you.airtimer = 0
	you.firstairattack = true
	you.dodge = false
	you.dodgetype = 0
	you.jstop = false
	you.walking = false
	you.pause = false

	me.busyblue = false
	me.busypurple = false
	me.busygreen = false

end


me.xoffset = 0
you.xoffset = 0





	numofcolors = 4

	waitforitplay = -1

	screenwidth = love.graphics.getWidth()
	screenheight = love.graphics.getHeight()
	head2ceiling = 30
	feet2bottom = 30
	barheight = 50
	paralaxoffset = 10
	enviro = {}
	enviro.wave = love.graphics.newImage("enviro/wave2.png")
	enviro.dolly = 0
	enviro.ds = 5
	streetfadestart = false
	streetfade = 255
	streetfadehold = 50 + math.random(50) 

	enviro.retry = love.graphics.newImage("enviro/retry.png")
	enviro.retry:setFilter("nearest")

	ready = love.graphics.newImage("enviro/READY.png")
	ready:setFilter("nearest")

	face1 = love.graphics.newImage("me/face/face1.png")
	face2 = love.graphics.newImage("me/face/face2.png")
	face3 = love.graphics.newImage("me/face/face3.png")
	face4 = love.graphics.newImage("me/face/face4.png")
	face5 = love.graphics.newImage("me/face/face5.png")
	face6 = love.graphics.newImage("me/face/face6.png")
	face1:setFilter("nearest")
	face2:setFilter("nearest")
	face3:setFilter("nearest")
	face4:setFilter("nearest")
	face5:setFilter("nearest")
	face6:setFilter("nearest")

if not fightclub then 
	
	enviro.v = love.graphics.newImage("enviro/v.png")

	playfadeout = 0


	
	enviro.vert = love.graphics.newImage("enviro/vert.png")
	enviro.horiz = love.graphics.newImage("enviro/horiz.png")

	enviro.iv = love.graphics.newImage("enviro/iv.png")
	enviro.iii = love.graphics.newImage("enviro/iii.png")
	enviro.ii = love.graphics.newImage("enviro/ii.png")
	enviro.i = love.graphics.newImage("enviro/i.png")
	enviro.x = love.graphics.newImage("enviro/x.png")

  slantbar = love.graphics.newImage("enviro/slantbar.png")



	enviro.spine = love.graphics.newImage("enviro/spine.png")
	enviro.spine:setFilter("nearest")


	
	enviro.v1 = love.graphics.newImage("enviro/v1.png")
	enviro.v1 = love.graphics.newImage("enviro/v1.png")
	enviro.v2 = love.graphics.newImage("enviro/v2.png")
	enviro.v3 = love.graphics.newImage("enviro/v3.png")

	facade = enviro.v1

	enviro.sunback = love.graphics.newImage("enviro/sunback.png")
	enviro.v1:setFilter("nearest")
	enviro.v2:setFilter("nearest")
	enviro.v3:setFilter("nearest")
	enviro.sunback:setFilter("nearest")
	--enviro.sunset = love.graphics.newImage("enviro/sunset.png")
	--enviro.sunset:setFilter("nearest")
	enviro.ada = love.graphics.newImage("enviro/Ada.png")
	enviro.ada:setFilter("nearest")
	enviro.go = love.graphics.newImage("enviro/go.png")
	enviro.go:setFilter("nearest")
	enviro.screenheight = screenheight - barheight
	--enviro.stage = love.graphics.newImage("enviro/astreet.png")
	-- enviro.stage = love.graphics.newImage("enviro/library2.png")
	--enviro.paralax = love.graphics.newImage("enviro/paralax.png")
	-- enviro.paralax = love.graphics.newImage("enviro/libraryparalax.png")
	enviro.leftwall = 0
	enviro.rightwall = 3700  --6600-20
  end
	enviro.wall = love.graphics.newImage("enviro/wall.png")
	enviro.beige = love.graphics.newImage("enviro/beige.png")
	enviro.beige:setFilter("nearest")
	enviro.light = love.graphics.newImage("enviro/lightson.png")
	enviro.healthbar = love.graphics.newImage("enviro/healthbar.png")
	enviro.stagefloor = love.graphics.newImage("enviro/floor.png")