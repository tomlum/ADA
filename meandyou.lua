--Boy howdy is most of this stuff archaic, working on cleaning it but it will take a while

me = {}
you = {}

me.id = 1
you.id = 2

waitforitplay = -1

barheight = 50
paralaxoffset = 40
enviro = {}



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