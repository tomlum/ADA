
themap = "none"
placespeople = true



backtostage = function()
collide = true
ln = 1
rn = 1
lcx = -screenwidth 
rcx = screenwidth*1.5
lset = false
rset = false
MENU = "stage"
sfade = 5
startsfade = false
juststartedpost = false
end




maxhealth = 450


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
	me.y = 2000
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
	you.x = 1000 -- 4500
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 2000
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
	gosound:rewind()
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

function loadmeandyou()
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




you = {}
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
		enviro.dolly = 0
	enviro.ds = 5
	streetfadestart = false
	streetfade = 255
	streetfadehold = 50 + math.random(50) 

	enviro.retry = love.graphics.newImage("enviro/retry.png")
	enviro.retry:setFilter("nearest")

	ready = love.graphics.newImage("enviro/READY.png")
	ready:setFilter("nearest")

	
	enviro.v = love.graphics.newImage("enviro/v.png")

	playfadeout = 0

	--enviro.sunset = love.graphics.newImage("enviro/sunset.png")
	--enviro.sunset:setFilter("nearest")
	enviro.screenheight = screenheight - barheight
	--enviro.floor = love.graphics.newImage("enviro/astreet.png")
	-- enviro.floor = love.graphics.newImage("enviro/library2.png")
	--enviro.paralax = love.graphics.newImage("enviro/paralax.png")
	-- enviro.paralax = love.graphics.newImage("enviro/libraryparalax.png")
	enviro.leftwall = 0
	enviro.rightwall = 5000  --6600-20
	enviro.wall = love.graphics.newImage("enviro/wall.png")
	enviro.beige = love.graphics.newImage("enviro/beige.png")
	enviro.beige:setFilter("nearest")
	enviro.healthbar = love.graphics.newImage("enviro/healthbar.png")
	enviro.gray = love.graphics.newImage("enviro/gray.png")