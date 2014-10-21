MENU = "title"
themap = "none"
placespeople = true



mefacerot = 0
  youfacerot = 0

backtostage = function()
collide = true
ln = 1
rn = 1
lcx = -screenwidth 
rcx = screenwidth*1.5
lset = false
rset = false
MENU = "stage"
sfade = 15
startsfade = false
juststartedpost = true
end




maxhealth = 380

mexoffset = 0
youxoffset = 0

me = {}
	me.health = maxhealth
	me.dead = false
	--boolean statuses
	me.g = true
	me.slide = false
	--the image
	me.im = idle
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.yoffset = 0
	me.feet = me.y + 60
	--the face/crest image
	me.leftface = false
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
	me.ft = 30
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
	me.dodgetype = "none"
	me.jstop = false
	me.walking = false
	me.pause = false
	me.a = none
	me.att = none




you = {}
	you.health = maxhealth
	you.dead = false
	--boolean statuses
	you.g = true
	you.slide = false
	--the image
	you.im = idle1
	you.x = 6000 -- 4500
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.yoffset = 0
	you.feet = you.y + 60
	--the face/crest image
	you.leftface = true
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
	you.ft = 30
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
	you.dodgetype = "none"
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

me.im = idle
you.im = idle

me.yoffset = 0
you.yoffset = 0

	mereadytoplay = false
	mechooseface = false
	mechoosecolor = false

	youreadytoplay = false
	youchooseface = false
	youchoosecolor = false


	youdeathclock = 0
	medeathclock = 0

lefty = true
rightme = true

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
	me.im = idle
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.feet = me.y + 60
	--the face/crest image
	me.leftface = false
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
	me.ft = 30
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
	me.dodgetype = "none"
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
	you.im = idle1
	you.x = 2000 --6000
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.feet = you.y + 60
	--the face/crest image
	you.leftface = true
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
	you.ft = 30
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
	you.dodgetype = "none"
	you.jstop = false
	you.walking = false
	you.pause = false

	me.busyblue = false
	me.busypurple = false
	me.busygreen = false

	
	for i,v in ipairs(bolts) do table.remove(bolts,i) end
	for i,v in ipairs(youbolts) do table.remove(youbolts,i) end
	for i,v in ipairs(spikes) do table.remove(spikes,i) end
	for i,v in ipairs(youspikes) do table.remove(youspikes,i) end
	for i,v in ipairs(mymines) do table.remove(mymines,i) end
	for i,v in ipairs(yourmines) do table.remove(yourmines,i) end

if themap == "street" then 
	floor = 1900 - 3
	me.x = 1000
		you.x = 6000
		floor = 1900 - 3
		me.y = floor - 60
		you.y = floor - 60
elseif themap == "library" then 
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


	youdeathclock = 0
	medeathclock = 0

	lefty = true
rightme = true

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
	me.im = idle
	me.x = 1000
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 1500 - 3 - 60
	me.feet = me.y + 60
	--the face/crest image
	me.leftface = false
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
	me.ft = 30
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
	me.dodgetype = "none"
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
	you.im = idle1
	you.x = 6000
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 1500 - 3 - 60
	you.feet = you.y + 60
	--the face/crest image
	you.leftface = true
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
	you.ft = 30
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
	you.dodgetype = "none"
	you.jstop = false
	you.walking = false
	you.pause = false

	me.busyblue = false
	me.busypurple = false
	me.busygreen = false

end


controller1 = {}
controller2 = {}


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

	faceselector = love.graphics.newImage("enviro/faceselector.png")
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


	
	enviro.v = love.graphics.newImage("enviro/v.png")

	playfadeout = 0

	enviro.bwstage1 = love.graphics.newImage("enviro/bwministreet.png")
	enviro.bwstage2 = love.graphics.newImage("enviro/bwminilibrary.png")
	enviro.stage1 = love.graphics.newImage("enviro/ministreet2.png")
	enviro.stage2 = love.graphics.newImage("enviro/minilibrary2.png")
	enviro.bwstage3 = love.graphics.newImage("enviro/bwminifloors.png")
	enviro.stage3 = love.graphics.newImage("enviro/minifloors.png")
	

	enviro.a4 = love.graphics.newImage("enviro/a4.png")
	enviro.a3 = love.graphics.newImage("enviro/a3.png")
	enviro.a2 = love.graphics.newImage("enviro/a2.png")
	enviro.a1 = love.graphics.newImage("enviro/a1.png")
	enviro.ma4 = love.graphics.newImage("enviro/ma4.png")
	enviro.ma3 = love.graphics.newImage("enviro/ma3.png")
	enviro.ma2 = love.graphics.newImage("enviro/ma2.png")
	enviro.ma1 = love.graphics.newImage("enviro/ma1.png")
	enviro.vert = love.graphics.newImage("enviro/vert.png")
	enviro.horiz = love.graphics.newImage("enviro/horiz.png")

	enviro.iv = love.graphics.newImage("enviro/iv.png")
	enviro.iii = love.graphics.newImage("enviro/iii.png")
	enviro.ii = love.graphics.newImage("enviro/ii.png")
	enviro.i = love.graphics.newImage("enviro/i.png")
	enviro.x = love.graphics.newImage("enviro/x.png")

  
	enviro.rselecter = love.graphics.newImage("enviro/rselect.png")

	enviro.lselect = love.graphics.newImage("enviro/select.png")
	enviro.lselect:setFilter("nearest")
	enviro.rselect = love.graphics.newImage("enviro/selectr.png")
	enviro.rselect:setFilter("nearest")
	enviro.selector = love.graphics.newImage("enviro/selector.png")
	enviro.selector:setFilter("nearest")
  slantbar = love.graphics.newImage("enviro/slantbar.png")
	enviro.ptile = love.graphics.newImage("enviro/rp.png")
	enviro.ptile:setFilter("nearest")
	enviro.btile = love.graphics.newImage("enviro/rb.png")
	enviro.btile:setFilter("nearest")
	enviro.stile = love.graphics.newImage("enviro/rs.png")
	enviro.stile:setFilter("nearest")
	enviro.gtile = love.graphics.newImage("enviro/rg.png")
	enviro.gtile:setFilter("nearest")
	enviro.ytile = love.graphics.newImage("enviro/ry.png")
	enviro.ytile:setFilter("nearest")

	enviro.sptile = love.graphics.newImage("enviro/sptile.png")
	enviro.sptile:setFilter("nearest")
	enviro.sbtile = love.graphics.newImage("enviro/sbtile.png")
	enviro.sbtile:setFilter("nearest")
	enviro.sstile = love.graphics.newImage("enviro/sstile.png")
	enviro.sstile:setFilter("nearest")
	enviro.sgtile = love.graphics.newImage("enviro/sgtile.png")
	enviro.sgtile:setFilter("nearest")
	enviro.sytile = love.graphics.newImage("enviro/sytile.png")
	enviro.sytile:setFilter("nearest")

	enviro.pframe = love.graphics.newImage("enviro/pframe.png")
	enviro.pframe:setFilter("nearest")
	enviro.bframe = love.graphics.newImage("enviro/bframe.png")
	enviro.bframe:setFilter("nearest")
	enviro.gframe = love.graphics.newImage("enviro/gframe.png")
	enviro.gframe:setFilter("nearest")
	enviro.yframe = love.graphics.newImage("enviro/yframe.png")
	enviro.yframe:setFilter("nearest")
	enviro.sframe = love.graphics.newImage("enviro/sframe.png")
	enviro.sframe:setFilter("nearest")
	enviro.spine = love.graphics.newImage("enviro/spine.png")
	enviro.spine:setFilter("nearest")


	mode1 = love.graphics.newImage("enviro/mode1.png")
	mode2 = love.graphics.newImage("enviro/mode2.png")
	
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
	enviro.white = love.graphics.newImage("enviro/white.png")
	enviro.screenheight = screenheight - barheight
	--enviro.floor = love.graphics.newImage("enviro/astreet.png")
	-- enviro.floor = love.graphics.newImage("enviro/library2.png")
	--enviro.paralax = love.graphics.newImage("enviro/paralax.png")
	-- enviro.paralax = love.graphics.newImage("enviro/libraryparalax.png")
	enviro.leftwall = 0
	enviro.rightwall = 3700  --6600-20
	enviro.wall = love.graphics.newImage("enviro/wall.png")
	enviro.beige = love.graphics.newImage("enviro/beige.png")
	enviro.beige:setFilter("nearest")
	enviro.light = love.graphics.newImage("enviro/lightson.png")
	enviro.healthbar = love.graphics.newImage("enviro/healthbar.png")
	enviro.gray = love.graphics.newImage("enviro/gray.png")
	enviro.floorfloor = love.graphics.newImage("enviro/floor.png")