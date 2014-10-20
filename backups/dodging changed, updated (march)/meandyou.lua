me = {}
	me.health = 100
	--boolean statuses
	me.g = true
	me.slide = false
	--the image
	me.im = love.graphics.newImage("me/idle/idle1.png")
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
	me.dodge = false
	me.dodgetype = "none"
	me.jstop = false
	me.walking = false




you = {}
	you.health = 100
	--boolean statuses
	you.g = true
	you.slide = false
	--the image
	you.im = love.graphics.newImage("me/idle/idle1.png")
	you.x = 1070
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
	you.flinchtimer = 0
	you.attacking = false
	you.stop = false
	you.block = false
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

controller1 = {}
controller2 = {}

	
enviro = {}
	enviro.floor = love.graphics.newImage("enviro/astreet.png")
	enviro.paralax = love.graphics.newImage("enviro/paralax.png")
	enviro.sky = love.graphics.newImage("enviro/sky.png")
	enviro.leftwall = 0
	enviro.rightwall = 7000
	enviro.light = love.graphics.newImage("enviro/lightson.png")
	enviro.healthbar = love.graphics.newImage("enviro/healthbar.png")
	enviro.gray = love.graphics.newImage("enviro/gray.png")
	enviro.floorfloor = love.graphics.newImage("enviro/floor.png")