--Boy howdy is most of this stuff archaic, working on cleaning it but it will take a while

me = {}
you = {}

me.lives = 0
you.lives = 0

me.score = 0
you.score = 0

me.id = 1

me.yoffset = 0
me.slowdown = false
me.firstjump = true

me.lr = 1
me.landing = false
me.landing_counter = 0
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

me.a = none
me.att = none




you.id = 2
you.health = maxhealth
you.dead = false
--boolean statuses
you.g = true
--the image
you.im =idle1
you.x = 6000 -- 4500
you.xleft = you.x + 30
you.mid = you.x / 2 + you.xleft / 2
you.xanimate = you.xleft
you.y = 1500 - 3 - 60
you.yoffset = 0
you.feet = you.y + 60
you.slowdown = false
--horizontal velocity
you.v = 0
--vertical velocity (j.ump) and jump time (jt) and hang time (ht)
you.j = 0
you.jt = 0
you.ht = 0
you.firstjump = true

you.feet = you.y + 60
you.lr = -1
you.landing = false
you.landing_counter = 0
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


me.busyblue = false
me.busypurple = false
me.busygreen = false








numofcolors = 4

waitforitplay = -1

barheight = 50
paralaxoffset = 40
enviro = {}
enviro.wave = lg.newImage("enviro/wave2.png")
enviro.dolly = 0
enviro.ds = 5
streetfadestart = false
streetfade = 255
streetfadehold = 50 + math.random(50) 

enviro.retry = lg.newImage("enviro/retry.png")


ready = lg.newImage("enviro/READY.png")



if not fightclub then 

  enviro.v = lg.newImage("enviro/v.png")

  playfadeout = 0

  enviro.vert = lg.newImage("enviro/vert.png")
  enviro.horiz = lg.newImage("enviro/horiz.png")

  enviro.iv = lg.newImage("enviro/iv.png")
  enviro.iii = lg.newImage("enviro/iii.png")
  enviro.ii = lg.newImage("enviro/ii.png")
  enviro.i = lg.newImage("enviro/i.png")
  enviro.x = lg.newImage("enviro/x.png")

  slantbar = lg.newImage("enviro/slantbar.png")



  enviro.spine = lg.newImage("enviro/spine.png")


  enviro.v1 = lg.newImage("enviro/v1.png")
  enviro.v1 = lg.newImage("enviro/v1.png")
  enviro.v2 = lg.newImage("enviro/v2.png")
  enviro.v3 = lg.newImage("enviro/v3.png")

  facade = enviro.v1

  enviro.sunback = lg.newImage("enviro/sunback.png")
  enviro.ada = lg.newImage("enviro/Ada.png")
  enviro.go = lg.newImage("enviro/go.png")
  enviro.screenheight = screenheight - barheight
end
enviro.light = lg.newImage("enviro/lightson.png")
enviro.healthbar = lg.newImage("enviro/healthbar.png")
enviro.stagefloor = lg.newImage("enviro/floor.png")