the_maps = {}


the_maps[1]= {name = "street", 
plats = {}, walls = {},
floor = 1896,
lightx = 707+2.5,
lighty = 142+2.5,
lightcolor = {r = 40, g = 255, b = 0},
rightwall = 7000,
paralaxscale = 4/7,
paralaxscale2 = .4,
gravity = 1
}

the_maps[2]= {name = "library", 
plats = {}, walls = {}, boxes = {},
floor = 1027,
lightx = 293.5,
lighty = 229.5,
lightcolor = {r = 87, g = 0, b = 158},
rightwall = 3829,
paralaxscale = .65,
paralaxscale2 = .523,
gravity = 1
}
--paralax has 500 vert and horizontal buffer
the_maps[3]= {name = "floors", 
plats = {}, walls = {}, boxes = {},
floor = 5898,
lightx = 442+2.5,
lighty = 311+2.5,
lightcolor = {r = 255, g = 99, b = 0},
rightwall = 5000,
paralaxscale = .49,
paralaxscale2 = .23,
gravity = .9
}



the_maps[100]= {name = "fightclub", 
plats = {}, walls = {},
floor = 896,
paralaxscale = 1,
rightwall = 2000,
gravity = .9
}


function loadStage()

  placespeople = false


  hitpausecounter = 0
  hitpause = false

  initPlayer(me)
  initPlayer(you)

  finished_loading = false
  playfade = 0
  me.deathclock = 0
  you.deathclock = 0
  me.animcounter = 0
  you.animcounter = 0
  me.v = 0
  you.v = 0
  me.lr = 1
  you.lr = -1
  me.j = 0
  you.j = 0
  me.flinch = false
  you.flinch = false
  me.ft = 0
  you.ft = 0
  minzoom = defaultminzoom
  maxzoom = defaultmaxzoom
  me.im = idle1
  you.im = idle1


  if game_mode == "fractal" then 
    you.lives = fractal_lives
    me.lives = fractal_lives
    maxhealth = fractal_max_health
  elseif game_mode == "duel" then 
    maxhealth = 85
  elseif game_mode == "koth" then 
    maxhealth = 50
  end
  me.score = 0
  you.score = 0
  me.health = maxhealth
  you.health = maxhealth
  me.old_health = me.health
  you.old_health = you.health

  the_map = the_maps[map_num]
  floor = the_maps[map_num].floor


  if map_num == 100 then
    enviro.paralaxoffset = 0
    if not same_stage then

      loader.start(function()
        finished_loading = true
        end)

      enviro.rightwall = 2000
      loader.newImage(enviro,'paralax', "images/maps/fightclub/fightclubparalax.png")
      loader.newImage(enviro,'stage', "images/maps/fightclub/fightclub.png")
      loader.newImage(enviro,"sky","images/enviro/ready.png")
    end
    me.x = putmehere
    you.x = putyouhere
    me.y = the_maps[100].floor - 60
    you.y = the_maps[100].floor - 60
    floor = the_maps[100].floor
    dollyv = 4.5

  elseif map_num == 1 then
    me.y = the_maps[1].floor - 200
    you.y = the_maps[1].floor - 200
    enviro.paralaxoffset = 0
    if not same_stage then
      if loadImagesNow then
        enviro.stage=lg.newImage("images/maps/street/astreet.png")
        enviro.paralax=lg.newImage("images/maps/street/paralax.png")
        enviro.paralax2=lg.newImage("images/maps/street/paralax2.png")
        enviro.sky=lg.newImage("images/maps/street/sky.png")
        enviro.lightson=lg.newImage("images/maps/street/lightson.png")
        enviro.lightsoff=lg.newImage( "images/maps/street/lightsoff.png")
        enviro.rafters=lg.newImage("images/maps/street/rafters.png")

      else
        loader.start(function()
          finished_loading = true
          end)
        loader.newImage(enviro,'stage', "images/maps/street/astreet.png")

        loader.newImage(enviro,"paralax","images/maps/street/paralax.png")
        loader.newImage(enviro,"paralax2","images/maps/street/paralax2.png")
        loader.newImage(enviro,"sky","images/maps/street/sky.png")
        loader.newImage(enviro,'lightson',"images/maps/street/lightson.png")
        loader.newImage(enviro,'lightsoff', "images/maps/street/lightsoff.png")
        loader.newImage(enviro,'rafters',"images/maps/street/rafters.png")
      end
    end
    lighttimer = 0
    me.x = 1000
    you.x = 6000
    enviro.rightwall = 6600-20
    enviro.ds = 5
    thesong = song2
    dollyv = 4.5
    enviro.paralaxoffset = 0


  elseif map_num == 2 then

    if not same_stage then
      if loadImagesNow then 

        enviro.paralax = lg.newImage("images/maps/library/libraryparalax.png")
        enviro.paralax2 = lg.newImage("images/maps/library/libraryparalax2.png")
        enviro.stage = lg.newImage("images/maps/library/library.png")
        enviro.sky = lg.newImage("images/maps/library/librarysky.png")

        enviro.plibrary = lg.newImage("images/maps/library/libraryplayer.png")
        enviro.thelibraryveneer = lg.newImage("images/maps/library/libraryveneer.png")


      else
        loader.start(function()
          finished_loading = true
          end)
        loader.newImage(enviro,'paralax',"images/maps/library/libraryparalax.png")
        loader.newImage(enviro,'paralax2', "images/maps/library/libraryparalax2.png")
        loader.newImage(enviro,'stage', "images/maps/library/library.png")
        loader.newImage(enviro,'sky',"images/maps/library/librarysky.png")
        loader.newImage(enviro,'plibrary', "images/maps/library/libraryplayer.png")
        loader.newImage(enviro, 'thelibraryveneer',"images/maps/library/libraryveneer.png")
      end
    end

    me.x = 20--700
    you.x = 2000
    me.y = 300
    you.y = 300
    enviro.rightwall = 3700 
    enviro.ds = 2
    dollyv = 4.5
    enviro.paralaxoffset = 500

    thesong = song1

  elseif map_num == 3 then

    if not same_stage then
      if loadImagesNow then 

        enviro.paralax = lg.newImage("images/maps/floors/floorsparalax.png")
        enviro.stage = lg.newImage("images/maps/floors/floors.png")
        enviro.sky = lg.newImage("images/maps/floors/floorssky.png")
        enviro.pfloors = lg.newImage("images/maps/floors/floorsplayer.png")
        enviro.floorsveneer2 = lg.newImage("images/maps/floors/floorsveneer2.png")
        enviro.floorsveneer1 = lg.newImage("images/maps/floors/floorsveneer1.png")
        enviro.paralax2 = lg.newImage("images/maps/floors/floorparalax2.png")

      else
        loader.start(function()
          finished_loading = true
          end)
        loader.newImage(enviro,'paralax',"images/maps/floors/floorsparalax.png")
        loader.newImage(enviro,'stage', "images/maps/floors/floors.png")
        loader.newImage(enviro,'sky',"images/maps/floors/floorssky.png")
        loader.newImage(enviro,'pfloors', "images/maps/floors/floorsplayer.png")
        loader.newImage(enviro, 'floorsveneer2',"images/maps/floors/floorsveneer2.png")
        loader.newImage(enviro, 'floorsveneer1',"images/maps/floors/floorsveneer1.png")
        loader.newImage(enviro,'paralax2', "images/maps/floors/floorparalax2.png")
      end
    end


    me.x = 500
    you.x = 3000
    me.y = 900
    you.y = 900
    enviro.rightwall = 5000
    enviro.ds = 5
    thesong = song2
    dollyv = 4.5
    enviro.paralaxoffset = 0

  end

  for i,v in ipairs(players) do
    players[i].old_feet = players[i].y 
  end
  if same_stage then
    camerafol()
  end
  same_stage = false

end


table.insert(the_maps[1].plats, {n=1, y = the_maps[1].floor, x1 = 0, x2 = the_maps[1].rightwall+1, floor = true})
table.insert(the_maps[1].plats, {n=2, y = 1379, x1 = 1120, x2 = 1529})
table.insert(the_maps[1].plats, {n=3, y = 1379, x1 = 1120, x2 = 1529})
table.insert(the_maps[1].plats, {n=4, y = 1627, x1 = 2245, x2 = 2751})
table.insert(the_maps[1].plats, {n=5, x1 = 2751, x2 = 2971, y = 1670})
table.insert(the_maps[1].plats, {n=6, x1 = 3325, x2 = 3765, y = 1669})
table.insert(the_maps[1].plats, {n=7, x1 = 4479, x2 = 4688, y = 1462})
table.insert(the_maps[1].plats, {n=8, x1 = 5104, x2 = 6018, y = 1718})
table.insert(the_maps[1].plats, {n=9, x1 = 5286, x2 = 5472, y = 1540})
table.insert(the_maps[1].plats, {n=10, x1 = 5650, x2 = 5836, y = 1540})
table.insert(the_maps[1].walls, {n=1, y1 = -1, y2 = the_maps[1].floor, x=0, barrier = true})
table.insert(the_maps[1].walls, {n=2, y1 = -1, y2 = the_maps[1].floor, x=the_maps[1].rightwall, barrier = true})


table.insert(the_maps[2].plats, {n=1,y = the_maps[2].floor, x1 = 0, x2 = 1404+1, floor = true})
table.insert(the_maps[2].plats, {n=2,y = 964, x1 = 1404, x2 = the_maps[2].rightwall+1, floor = true})
table.insert(the_maps[2].plats, {n=3,y = 644, x1 = 1616, x2 = 3196})
table.insert(the_maps[2].plats, {n=4,y = 426, x1 = 3003, x2 = 3118})
table.insert(the_maps[2].plats, {n=5,y = 327, x1 = 2637, x2 = 2637+115})
table.insert(the_maps[2].plats, {n=6,y = 327, x1 = 2271, x2 = 2271+115})
table.insert(the_maps[2].plats, {n=7,y = 327, x1 = 1907, x2 = 1907+115})
table.insert(the_maps[2].plats, {n=8,y = 327, x1 = 2637, x2 = 2637+115})
table.insert(the_maps[2].plats, {n=9,y = 934, x1 = 527, x2 = 677})
table.insert(the_maps[2].plats, {n=10,y = 933, x1 = 1893, x2 = 2135})
table.insert(the_maps[2].plats, {n=11,y = 933, x1 = 2321, x2 = 2563})
table.insert(the_maps[2].plats, {n=12,y = 933, x1 = 2749, x2 = 2991})
table.insert(the_maps[2].plats, {n=13,y = 0, x1 = 1535, x2 = 3200})
table.insert(the_maps[2].walls, {n=14,y1 = 0, y2 = 806, x=1614})
table.insert(the_maps[2].walls, {n=15,y1 = 964, y2 = 3000, x=1408, barrier = true})
table.insert(the_maps[2].walls, {n=16,y1 = -1, y2 = the_maps[2].floor, x=0, barrier = true})
table.insert(the_maps[2].walls, {n=17,y1 = -1, y2 = the_maps[2].floor, x=the_maps[2].rightwall, barrier = true})
table.insert(the_maps[2].boxes, {p1 = {x = 96, y = 626},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 163, y = 661},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 254, y = 664},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 339, y = 690},  size = 60, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 486, y = 594},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 679, y = 666},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 888, y = 726},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 1105, y = 723},  size = 40, kind = "leaf", density = 8})
table.insert(the_maps[2].boxes, {p1 = {x = 1270, y = 642},  size = 40, kind = "leaf", density = 8})

table.insert(the_maps[3].plats, {n=1, y = the_maps[3].floor, x1 = 0, x2 = the_maps[3].rightwall+1, floor = true})
table.insert(the_maps[3].plats, {n=2,y = 2688, x1 = 2154, x2 = 2726,glass = true})
table.insert(the_maps[3].plats, {n=3,y = 5616, x1 = 419, x2 = 2139})
table.insert(the_maps[3].plats, {n=4,y = 2756, x1 = 419, x2 = 2139})
table.insert(the_maps[3].plats, {n=5,y = 2756-286, x1 = 419, x2 = 809})
table.insert(the_maps[3].plats, {n=6,y = 2756-286, x1 = 1756, x2 = 2139})
table.insert(the_maps[3].plats, {n=7,y = 2756-286*2, x1 = 419, x2 = 645})
table.insert(the_maps[3].plats, {n=8,y = 2756-286*2, x1 = 2075, x2 = 2139})
table.insert(the_maps[3].plats, {n=9,y = 2756-286*3, x1 = 419, x2 = 636})
table.insert(the_maps[3].plats, {n=10,y = 2756-286*3, x1 = 2070, x2 = 2139})
table.insert(the_maps[3].plats, {n=11,y = 2756-286*4, x1 = 2072, x2 = 2139})
table.insert(the_maps[3].boxes, {p1 = {x = 750, y = 5585},  size = 8, kind = "paper", density = 2})
table.insert(the_maps[3].boxes, {p1 = {x = 847, y = 5295},  size = 8, kind = "paper", density = 6})
table.insert(the_maps[3].boxes, {p1 = {x = 1530, y = 5294},  size = 8, kind = "paper", density = 4})
table.insert(the_maps[3].boxes, {p1 = {x = 1741, y = 5294},  size = 14, kind = "paper", density = 5})
table.insert(the_maps[3].boxes, {p1 = {x = 1568, y = 5582},  size = 8, kind = "paper", density = 4})
table.insert(the_maps[3].boxes, {p1 = {x = 1814, y = 5012},  size = 8, kind = "paper", density = 4})
table.insert(the_maps[3].boxes, {p1 = {x = 741, y = 5010},  size = 8, kind = "paper", density = 5})
table.insert(the_maps[3].boxes, {p1 = {x = 972, y = 5010},  size = 8, kind = "paper", density = 2})
table.insert(the_maps[3].boxes, {p1 = {x = 616, y = 4435},  size = 8, kind = "paper", density = 7})
table.insert(the_maps[3].boxes, {p1 = {x = 1928, y = 4416},  size = 40, kind = "paper", density = 20})
table.insert(the_maps[3].boxes, {p1 = {x = 1536, y = 3580},  size = 5, kind = "paper", density = 2})
table.insert(the_maps[100].plats, {n=1, y = 896, x1 = 0, x2 = 2000+1, floor = true})
table.insert(the_maps[100].plats, {n=2, y = 465, x1 = 32, x2 = 236})
table.insert(the_maps[100].plats, {n=3, y = 540, x1 = 839, x2 = 1016})
table.insert(the_maps[100].plats, {n=4, y = 719, x1 = 0, x2 = 2000})
table.insert(the_maps[100].plats, {n=5, y = 439, x1 = 601, x2 = 760})
table.insert(the_maps[3].walls, {y1 = -1, y2 = the_maps[3].floor+1, x=0, barrier = true})
table.insert(the_maps[3].walls, {y1 = -1, y2 = the_maps[3].floor+1, x=the_maps[3].rightwall, barrier = true})
table.insert(the_maps[100].walls, {n=1, y1 = -1, y2 = the_maps[100].floor, x=0, barrier = true})
table.insert(the_maps[100].walls, {n=2, y1 = -1, y2 = the_maps[100].floor, x=2000, barrier = true})
table.insert(the_maps[100].walls, {n=3, y1 = 3, y2 = the_maps[100].floor+1, x=500, glasswall = the_maps[3].floor})
for i=1, 8 do
  table.insert(the_maps[3].plats, {y = 5616-286*i, x1 = 419, x2 = 2139})
end

for i=1, 10 do
  local bleh = 0
  local blehy = 0
  if i == 1 then
    bleh = 4901
  elseif i == 2 then
    bleh = 4898
  elseif i == 3 then
    bleh = 4895
  elseif i == 4 then
    bleh = 4889
  elseif i == 5 then
    bleh = 4906
  elseif i == 6 then
    bleh = 4899
  elseif i == 7 then
    bleh = 4784
  elseif i == 8 then
    bleh = 4699
  elseif i == 9 then
    bleh = 4889
  elseif i == 10 then
    bleh = 3847
    blehy = 79
    table.insert(the_maps[3].plats, {y = the_maps[3].floor-299*i-blehy, x1 = 4335, x2 = 4908})
  end
  table.insert(the_maps[3].plats, {y = the_maps[3].floor-299*i-blehy, x1 = 3160, x2 = bleh})
end
table.insert(the_maps[3].plats, {y = 5778, x1 = 2142, x2 = 2299})
table.insert(the_maps[3].plats, {y = 3004, x1 = 581, x2 = 1039})


table.insert(the_maps[3].walls, {y1 = 1900, y2 = the_maps[3].floor+1, x=419, glasswall = 5618})
table.insert(the_maps[3].walls, {y1 = 2763, y2 = 5778, x=2139, glasswall = 5618})
table.insert(the_maps[3].walls, {y1 = 1613, y2 = 2184, x=2139, glasswall = y2})
table.insert(the_maps[3].walls, {y1 = 2830, y2 = the_maps[3].floor+1, x=3159})




table.insert(the_maps[3].plats, {y = the_maps[3].floor, x1 = 0, x2 = the_maps[3].rightwall+1, floor = true})
for i,v in ipairs(the_maps[3].plats) do
  the_maps[3].plats[i].n = i
end
