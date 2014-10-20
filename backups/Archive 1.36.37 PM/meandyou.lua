me = {}
	--the image
	me.im = love.graphics.newImage("me/walk1.png")
	me.x = 200
	me.xleft = me.x + 30
	me.xanimate = me.x
	me.mid = me.x / 2 + me.xleft / 2
	me.y = 200
	--horizontal velocity
	me.v = 0
	--vertical velocity (j.ump)
	me.j = 0
	--on the ground?
	me.g = true
	me.lr = 1




you = {}
	--the image
	you.im = love.graphics.newImage("me/idle1.png")
	you.x = 710
	you.xleft = you.x + 30
	you.mid = you.x / 2 + you.xleft / 2
	you.xanimate = you.xleft
	you.y = 200
	--horizontal velocity
	you.v = 0
	--vertical velocity (j.ump) and jump time (jt) and hang time (ht)
	you.j = 0
	you.jt = 0
	you.ht = 0
	--on the ground?
	you.g = true
	you.feet = you.y - 60
	you.lr = -1
	you.landing = false
	you.landingcounter = 8

enviro = {}

	enviro.back = love.graphics.newImage("background.png")