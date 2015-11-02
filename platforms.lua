theMaps = {}

maxmodenum = 2

theMaps[1]= {name = "street", 
plats = {}, walls = {},
floor = 1896,
lightx = 707+2.5,
lighty = 142+2.5,
lightcolor = {r = 40, g = 255, b = 0},
rightwall = 7000,
paralaxscale = 4/7,
paralaxscale2 = .4
}
theMaps[2]= {name = "library", 
plats = {}, walls = {}, boxes = {},
floor = 1027,
lightx = 293.5,
lighty = 229.5,
lightcolor = {r = 87, g = 0, b = 158},
rightwall = 3829,
paralaxscale = .65,
paralaxscale2 = .523
}
--paralax has 500 vert and horizontal buffer
theMaps[3]= {name = "floors", 
plats = {}, walls = {}, boxes = {},
floor = 5898,
lightx = 442+2.5,
lighty = 311+2.5,
lightcolor = {r = 255, g = 99, b = 0},
rightwall = 5000,
paralaxscale = .5,
paralaxscale2 = .25
}



theMaps[100]= {name = "fightclub", 
plats = {}, walls = {},
floor = 896,
paralaxscale = 1,
rightwall = 2000
}


table.insert(theMaps[1].plats, {n=1, y = theMaps[1].floor, x1 = 0, x2 = theMaps[1].rightwall+1, floor = true})
table.insert(theMaps[1].plats, {n=2, y = 1379, x1 = 1120, x2 = 1529})
table.insert(theMaps[1].plats, {n=3, y = 1379, x1 = 1120, x2 = 1529})
table.insert(theMaps[1].plats, {n=4, y = 1627, x1 = 2245, x2 = 2751})
table.insert(theMaps[1].plats, {n=5, x1 = 2751, x2 = 2971, y = 1670})
table.insert(theMaps[1].plats, {n=6, x1 = 3325, x2 = 3765, y = 1669})
table.insert(theMaps[1].plats, {n=7, x1 = 4479, x2 = 4688, y = 1462})
table.insert(theMaps[1].plats, {n=8, x1 = 5104, x2 = 6018, y = 1718})
table.insert(theMaps[1].plats, {n=9, x1 = 5286, x2 = 5472, y = 1540})
table.insert(theMaps[1].plats, {n=10, x1 = 5650, x2 = 5836, y = 1540})
table.insert(theMaps[1].walls, {n=11, y1 = -1, y2 = theMaps[1].floor, x=0, barrier = true})
table.insert(theMaps[1].walls, {n=12, y1 = -1, y2 = theMaps[1].floor, x=theMaps[1].rightwall, barrier = true})


table.insert(theMaps[2].plats, {n=1,y = theMaps[2].floor, x1 = 0, x2 = 1404+1, floor = true})
table.insert(theMaps[2].plats, {n=2,y = 964, x1 = 1404, x2 = theMaps[2].rightwall+1, floor = true})
table.insert(theMaps[2].plats, {n=3,y = 644, x1 = 1616, x2 = 3196})
table.insert(theMaps[2].plats, {n=4,y = 426, x1 = 3003, x2 = 3118})
table.insert(theMaps[2].plats, {n=5,y = 327, x1 = 2637, x2 = 2637+115})
table.insert(theMaps[2].plats, {n=6,y = 327, x1 = 2271, x2 = 2271+115})
table.insert(theMaps[2].plats, {n=7,y = 327, x1 = 1907, x2 = 1907+115})
table.insert(theMaps[2].plats, {n=8,y = 327, x1 = 2637, x2 = 2637+115})
table.insert(theMaps[2].plats, {n=9,y = 934, x1 = 527, x2 = 677})
table.insert(theMaps[2].plats, {n=10,y = 933, x1 = 1893, x2 = 2135})
table.insert(theMaps[2].plats, {n=11,y = 933, x1 = 2321, x2 = 2563})
table.insert(theMaps[2].plats, {n=12,y = 933, x1 = 2749, x2 = 2991})
table.insert(theMaps[2].plats, {n=13,y = 0, x1 = 1535, x2 = 3200})
table.insert(theMaps[2].walls, {n=14,y1 = 0, y2 = 806, x=1614})
table.insert(theMaps[2].walls, {n=15,y1 = 964, y2 = 3000, x=1408, barrier = true})
table.insert(theMaps[2].walls, {n=16,y1 = -1, y2 = theMaps[2].floor, x=0, barrier = true})
table.insert(theMaps[2].walls, {n=17,y1 = -1, y2 = theMaps[2].floor, x=theMaps[2].rightwall, barrier = true})
table.insert(theMaps[2].boxes, {p1 = {x = 96, y = 626},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 163, y = 661},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 254, y = 664},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 339, y = 690},  size = 60, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 486, y = 594},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 679, y = 666},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 888, y = 726},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 1105, y = 723},  size = 40, kind = "leaf", density = 8})
table.insert(theMaps[2].boxes, {p1 = {x = 1270, y = 642},  size = 40, kind = "leaf", density = 8})

table.insert(theMaps[3].plats, {n=1, y = theMaps[3].floor, x1 = 0, x2 = theMaps[3].rightwall+1, floor = true})
table.insert(theMaps[3].walls, {y1 = -1, y2 = theMaps[3].floor+1, x=0})
table.insert(theMaps[3].walls, {y1 = -1, y2 = theMaps[3].floor+1, x=theMaps[3].rightwall})
table.insert(theMaps[3].plats, {n=1,y = 2688, x1 = 2154, x2 = 2726,glass = true})
table.insert(theMaps[3].plats, {n=2,y = 5616, x1 = 419, x2 = 2139})
table.insert(theMaps[3].plats, {n=3,y = 2756, x1 = 419, x2 = 2139})
table.insert(theMaps[3].plats, {n=4,y = 2756-286, x1 = 419, x2 = 809})
table.insert(theMaps[3].plats, {n=5,y = 2756-286, x1 = 1756, x2 = 2139})
table.insert(theMaps[3].plats, {n=6,y = 2756-286*2, x1 = 419, x2 = 645})
table.insert(theMaps[3].plats, {n=7,y = 2756-286*2, x1 = 2075, x2 = 2139})
table.insert(theMaps[3].plats, {n=8,y = 2756-286*3, x1 = 419, x2 = 636})
table.insert(theMaps[3].plats, {n=9,y = 2756-286*3, x1 = 2070, x2 = 2139})
table.insert(theMaps[3].plats, {n=10,y = 2756-286*4, x1 = 2072, x2 = 2139})
table.insert(theMaps[3].boxes, {p1 = {x = 750, y = 5585},  size = 8, kind = "paper", density = 2})
table.insert(theMaps[3].boxes, {p1 = {x = 847, y = 5295},  size = 8, kind = "paper", density = 6})
table.insert(theMaps[3].boxes, {p1 = {x = 1530, y = 5294},  size = 8, kind = "paper", density = 4})
table.insert(theMaps[3].boxes, {p1 = {x = 1741, y = 5294},  size = 14, kind = "paper", density = 5})
table.insert(theMaps[3].boxes, {p1 = {x = 1568, y = 5582},  size = 8, kind = "paper", density = 4})
table.insert(theMaps[3].boxes, {p1 = {x = 1814, y = 5012},  size = 8, kind = "paper", density = 4})
table.insert(theMaps[3].boxes, {p1 = {x = 741, y = 5010},  size = 8, kind = "paper", density = 5})
table.insert(theMaps[3].boxes, {p1 = {x = 972, y = 5010},  size = 8, kind = "paper", density = 2})
table.insert(theMaps[3].boxes, {p1 = {x = 616, y = 4435},  size = 8, kind = "paper", density = 7})
table.insert(theMaps[3].boxes, {p1 = {x = 1928, y = 4416},  size = 40, kind = "paper", density = 20})
table.insert(theMaps[3].boxes, {p1 = {x = 1536, y = 3580},  size = 5, kind = "paper", density = 2})
table.insert(theMaps[100].plats, {n=1, y = 896, x1 = 0, x2 = 2000+1, floor = true})
table.insert(theMaps[100].plats, {n=2, y = 465, x1 = 32, x2 = 236})
table.insert(theMaps[100].plats, {n=3, y = 541, x1 = 839, x2 = 1016})
table.insert(theMaps[100].plats, {n=4, y = 719, x1 = 655, x2 = 1560})
table.insert(theMaps[100].plats, {n=5, y = 439, x1 = 601, x2 = 760})
table.insert(theMaps[100].walls, {n=1, y1 = -1, y2 = theMaps[100].floor, x=0, barrier = true})
table.insert(theMaps[100].walls, {n=2, y1 = -1, y2 = theMaps[100].floor, x=2000, barrier = true})
table.insert(theMaps[100].walls, {n=2, y1 = 3, y2 = theMaps[100].floor+1, x=500, glasswall = theMaps[3].floor})
for i=1, 8 do
  table.insert(theMaps[3].plats, {y = 5616-286*i, x1 = 419, x2 = 2139})
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
    table.insert(theMaps[3].plats, {y = theMaps[3].floor-299*i-blehy, x1 = 4335, x2 = 4908})
  end
  table.insert(theMaps[3].plats, {y = theMaps[3].floor-299*i-blehy, x1 = 3160, x2 = bleh})
end
table.insert(theMaps[3].plats, {y = 5778, x1 = 2142, x2 = 2299})
table.insert(theMaps[3].plats, {y = 3004, x1 = 581, x2 = 1039})


table.insert(theMaps[3].walls, {y1 = 1900, y2 = theMaps[3].floor+1, x=419, glasswall = 5618})
table.insert(theMaps[3].walls, {y1 = 2763, y2 = 5778, x=2139, glasswall = 5618})
table.insert(theMaps[3].walls, {y1 = 1613, y2 = 2184, x=2139, glasswall = y2})
table.insert(theMaps[3].walls, {y1 = 2830, y2 = theMaps[3].floor+1, x=3159})




table.insert(theMaps[3].plats, {y = theMaps[3].floor, x1 = 0, x2 = theMaps[3].rightwall+1, floor = true})
for i,v in ipairs(theMaps[3].plats) do
  theMaps[3].plats[i].n = i
end
