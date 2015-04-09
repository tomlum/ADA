
oldmenu = "begin"
notilebouncing = true
--menu that fades into another???
noplat = {n=0;}

themaps = {}
themaps[1]= {name = "street", 
  plats = {}, walls = {},
  floor = 1896,
  lightx = 707+2.5,
  lighty = 142+2.5,
  lightcolor = {r = 40, g = 255, b = 0},
  rightwall = 7000
}
themaps[2]= {name = "library", 
  plats = {}, walls = {},
  floor = 896,
  lightx = 293.5,
  lighty = 229.5,
  lightcolor = {r = 87, g = 0, b = 158},
  rightwall = 4000
}

themaps[3]= {name = "floors", 
  plats = {}, walls = {},
  floor = 5898,
  lightx = 442+2.5,
  lighty = 311+2.5,
  lightcolor = {r = 255, g = 99, b = 0},
  rightwall = 5000
}



themaps[100]= {name = "fightclub", 
  plats = {}, walls = {},
  floor = 896
}


themap = themaps[1]


---[[
function xrubble(xx)
  for i = #themap.walls, 1, -1 do 
    local wall = themap.walls[i]
    if rampcanhit and ((xx.mid + xx.v > wall.x and xx.mid < wall.x) or
      (xx.mid + xx.v < wall.x and xx.mid > wall.x)
    )
    and 
    (
      xx.y >= wall.y1 
      or
      xx.feet <= wall.y2
    ) then
    for i = xx.y, xx.feet do
      if wall.glasswall~=nil then
        if (wall.glasswall > 0 and i < wall.glasswall) or (wall.glasswall < 0 and i > -wall.glasswall) then 
          makenglass(wall.x,i,xx.v,xx.j, 1)
        else makenrubble("vert", wall.x,i,xx.v,xx.j, 1)
        end
      else
        makenrubble("vert", wall.x,i,xx.v,xx.j, 1)

      end


    end


    break
  end

end
end


letterboxheight = 80
menuspeed = 10
modes = love.graphics.newImage("enviro/mode.png")
backstreet = love.graphics.newImage("enviro/backstreet.png")
modeselector = love.graphics.newImage("enviro/modeselector.png")
wiper = love.graphics.newImage("enviro/wiper.png")
map = love.graphics.newImage("enviro/map.png")
ptile = love.graphics.newImage("enviro/ptile.png")
gtile = love.graphics.newImage("enviro/gtile.png")
otile = love.graphics.newImage("enviro/otile.png")
tile = love.graphics.newImage("enviro/tile.png")
plogo = love.graphics.newImage("enviro/plogo.png")
glogo = love.graphics.newImage("enviro/glogo.png")
ologo = love.graphics.newImage("enviro/ologo.png")
questionlogo = love.graphics.newImage("enviro/questionmark.png")
shoulder = love.graphics.newImage("enviro/shoulder.png")
ready = love.graphics.newImage("enviro/ready.png")

musfadein = 0
musfade = 0
tilezoom = .05
colorfromwallspace = 100


tilespacing = 0
inittilej = 11
tiles = {}
table.insert(tiles, {y=0,ud="top",lr=1,j=-inittilej, column = 1})
table.insert(tiles, {y=0,ud="top",lr=-1,j=-inittilej, column = 2})
table.insert(tiles, {y=0,ud="top",lr=1,j=-inittilej, column = 3})
table.insert(tiles, {y=0,ud="top",lr=-1,j=-inittilej, column = 4})

table.insert(tiles, {y=0,ud="bottom",lr=1,j=inittilej, column = 1})
table.insert(tiles, {y=0,ud="bottom",lr=-1,j=inittilej, column = 2})
table.insert(tiles, {y=0,ud="bottom",lr=1,j=inittilej, column = 3})
table.insert(tiles, {y=0,ud="bottom",lr=-1,j=inittilej, column = 4})

tiles2 = {}
table.insert(tiles2, {y=0,ud="top",lr=1,j=-inittilej, column = 1})
table.insert(tiles2, {y=0,ud="top",lr=-1,j=-inittilej, column = 2})
table.insert(tiles2, {y=0,ud="top",lr=1,j=-inittilej, column = 3})
table.insert(tiles2, {y=0,ud="top",lr=-1,j=-inittilej, column = 4})
table.insert(tiles2, {y=0,ud="bottom",lr=1,j=inittilej, column = 1})
table.insert(tiles2, {y=0,ud="bottom",lr=-1,j=inittilej, column = 2})
table.insert(tiles2, {y=0,ud="bottom",lr=1,j=inittilej, column = 3})
table.insert(tiles2, {y=0,ud="bottom",lr=-1,j=inittilej, column = 4})

function love.graphics.sdraw(im, x, y, rot, sx, sy) 
  if rot == nil then 
    love.graphics.draw(im,x*(screenwidth/1440),y*(screenheight/900), 0, (screenwidth/1440), (screenheight/900))
  else
    love.graphics.draw(im,x*(screenwidth/1440),y*(screenheight/900), rot, sx*(screenwidth/1440), sy*(screenheight/900))
  end
end

function love.graphics.srectangle(mode, x, y, width, height) 
  love.graphics.rectangle(mode, x*screenwidth/1440, y*screenheight/900, width*screenwidth/1440, height*screenheight/900) 
end


love.graphics.setNewFont(20)

mapnum = 1

lightsize = 7
maxwob = 10
function initmenu()
  if menu == "title" and oldmenu ~= "title" then
    musfadein = 3
    musfade = 0
    allfade = 0
    fadein = 3
    thesong = openingsong
    thesong:rewind()
    repplay(thesong)
    stagey = 0
  elseif menu == "modes" and oldmenu ~= "modes" then
    allfade = 0
    fadein = 8
    wipex = -screenwidth*6
    wipefraction = 5
    wobv = 1
    wobj = 1
  elseif menu == "map" and oldmenu ~= "map" then
    allfade = 1
    fadein = 9
  elseif menu == "color" and oldmenu ~= "color" then
    soscillator = 0
    finishedloading = false
    if themode == nil or themode == "none" then themode = "duel" end
    me.drawontop = function() end
    you.drawontop = function() end
    spines = {}

    allready = false
    tilefadein = 1
    tilefade = 0
    tilefadehold = 0
    musfade = 255
    musfadein = 0
    me.readytoplay = false
    you.readytoplay = false
    tileset = false
    separatespines = false
    tilesep = 0
    thesong = colortheme


    me.rightc = thecolors[0]
    you.rightc = thecolors[0]
    me.leftc = thecolors[0]
    you.leftc = thecolors[0]

    me.selectedcolor = 0
    you.selectedcolor = 0
    for i,v in ipairs(tiles) do
      if v.ud == "top" then
        v.y = -450-(#tiles/2-v.column)*100
        v.j=-11
      else 
        v.y = 900+(#tiles/2-v.column)*100
        v.j=11
      end
    end

    for i,v in ipairs(tiles2) do
      if v.ud == "top" then
        v.y = -450-(#tiles2/2-v.column)*100
        v.j=-11
      else 
        v.y = 900+(#tiles2/2-v.column)*100
        v.j=11
      end
    end

    allfade = 255
    fadein = 0

  elseif menu == "pan" and oldmenu ~= "pan" then
    thesong:play()
    spines = {}
    fadein = 0
    musfadein = 0
    musfade = 255
    allfade = 255
    dollyx = 0
    dollyv = 7
    streetfadehold = 1
    streetfadestart = false

  elseif menu == "retry" and oldmenu ~= "retry" then
    fadein = 0
    allfade = 0
    musfade = 0
    beginretry = false
    nextstop = "?"
    if thesong ~= nil then
      thesong:stop()
    end
    streetfadehold = 1
    streetfadestart = false

  end
  oldmenu = menu
end

wobx = 0
woby = 0
wobj = 0
wobv = 0

function drawmenus()
  initmenu()

  if wobx- wobv > maxwob then wobv = wobv + math.random()/3
  elseif wobx- wobv < -maxwob then wobv = wobv - math.random()/3
  end

  if woby- wobj > maxwob then wobj = wobj + math.random()/3
  elseif woby- wobj < -maxwob then wobj = wobj - math.random()/3
  end
  wobx = wobx - wobv/2
  woby = woby - wobj/2

  if fadein > 0 then 
    allfade = allfade + fadein
    if allfade + fadein >= 255 then
      fadein = 0
      allfade = 255
    end
  elseif fadein < 0 then
    allfade = allfade + fadein
    if allfade +fadein <= 0 then
      fadein = 0
      allfade = 0
    end
  end

  if musfadein > 0 then 
    musfade = musfade + musfadein
    if musfade + musfadein >= 255 then
      musfadein = 0
      musfade = 255
    end
  elseif musfadein < 0 then
    musfade = musfade + musfadein
    if musfade +musfadein <= 0 then
      musfadein = 0
      musfade = 0
    end
  end

  if thesong~= nil then
    if musfade == 0 then
      thesong:pause()
    else
      thesong:play()
      thesong:setPitch(musfade/255)
    end
  end

  if menu == "title" or menu == "premode" then
    if (c1accept() or c2accept()) and menu=="title" then
      menu = "premode" 
      repplay(wavesound)
    end

    if menu == "premode" then
      if stagey < 300 then
        stagey = stagey + 1
        stagey = stagey + stagey/200*menuspeed
      else 
        menu = "modes"
      end
    end


    love.graphics.setColor(allfade,allfade,allfade,255)
    --love.graphics.setColor(255,255,255,255)
    love.graphics.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)

    drawwaves()
    love.graphics.setColor(255,255,255,allfade)
    love.graphics.draw(enviro.ada, 0, 0, 0,screenwidth/1440,screenheight/900)
    love.graphics.setColor(0,0,0)
    love.graphics.srectangle("fill", 0, 900-stagey*4, 1440, 900)


  elseif menu == "modes" or menu == "premap" then

    if cancels() then menu = "title" end

    if modenum == 0 then
      themode = "duel"
    elseif modenum == 0 then
      themode = "spectrum"
    end



    if menu == "premap" then
      if wipex < 0 then
        wipex = wipex + screenwidth/wipefraction
      else 
        menu = "map"
      end
    end

    if menu == "modes" then

      if downs() and modenum < 1 then modenum = modenum + 1 mov:play()
      elseif ups() and modenum > 0 then modenum = modenum - 1 mov:play()	
      end
    end

    if (c1accept() and not me.holda) or (not you.holda and c2accept()) and menu == "modes" then
      menu = "premap"
      repplay(modesound)
    end


    if modenum == 0 then 
      selectorx = 285
      selectory = 167
      themode = "duel"

    elseif modenum == 1 then 
      selectorx = 326
      selectory = 411
      themode = "spectrum"
    end
    love.graphics.setColor(allfade,allfade,allfade,255)
    blurdraw(2,function() love.graphics.sdraw(backstreet,wobx-maxwob*2,woby-maxwob*2) end)
    love.graphics.setColor(allfade/2,allfade/2,allfade/1,255)
    love.graphics.sdraw(modes,0,0)
    love.graphics.sdraw(modeselector, selectorx, selectory)
    love.graphics.sdraw(wiper,wipex,0)

  elseif menu == "map" or menu == "precolor" then


    if cancels() then menu = "modes" end

    if downs() and mapnum < 3 then mapnum = mapnum + 1 repplay(mov)
    elseif ups() and mapnum > 1 then mapnum = mapnum - 1 repplay(mov)
    end

    themap = themaps[mapnum]

    if (c1accept() and not me.holda) or (not you.holda and c2accept())and menu == "map" then
      fadein = -5
      repplay(modesound)
      musfadein = -5
    end

    if allfade - fadein <= 0 then
      menu = "color"
    end


    love.graphics.setColor(allfade,allfade,allfade,255)
    love.graphics.draw(map,0,0, 0, screenwidth/1440, screenheight/900)
    love.graphics.setColor(themaps[mapnum].lightcolor.r,themaps[mapnum].lightcolor.g,themaps[mapnum].lightcolor.b,math.random(150,255)*(allfade/255))
    love.graphics.circle("fill",(themaps[mapnum].lightx)*(screenwidth/1440),(themaps[mapnum].lighty)*(screenheight/900),lightsize*(screenwidth/1440))
    local wordspacing = 20
    for i = 0, screenheight/wordspacing do
      love.graphics.print(string.upper(themaps[mapnum].name), 1000*(screenwidth/1440), i*wordspacing)
    end



  elseif menu == "color" or menu == "prepan" then



    tileset = true
    for i,v in ipairs(tiles) do
      if v.j ~= 0 then
        tileset = false
      end
    end


    if tileset then
      tilefade = tilefadef(tilefadein,tilefade,5)
      tilefadein = tilefadeinf(tilefadein,tilefade,5)


      if me.leftc.n == 0 then 
        love.graphics.setColor((tilefade),(tilefade),(tilefade))
      else
        love.graphics.setColor(me.leftc.c.r,me.leftc.c.g,me.leftc.c.b)
      end
      love.graphics.sdraw(shoulder, colorfromwallspace-80,tilesep)



      if me.rightc.n == 0 then 
        love.graphics.setColor((tilefade),(tilefade),(tilefade))
      else
        love.graphics.setColor(me.rightc.c.r,me.rightc.c.g,me.rightc.c.b)
      end
      love.graphics.sdraw(shoulder, 720-colorfromwallspace-140,-tilesep,0,-1,1)


      if you.leftc.n == 0 then 
        love.graphics.setColor((tilefade),(tilefade),(tilefade))
      else
        love.graphics.setColor(you.leftc.c.r,you.leftc.c.g,you.leftc.c.b)
      end
      love.graphics.sdraw(shoulder, 720 +colorfromwallspace+140,-tilesep)



      if you.rightc.n == 0 then 
        love.graphics.setColor((tilefade),(tilefade),(tilefade))
      else
        love.graphics.setColor(you.rightc.c.r,you.rightc.c.g,you.rightc.c.b)
      end
      love.graphics.sdraw(shoulder, 1440-colorfromwallspace+80,tilesep,0,-1,1)




    end

    if tileset or allready then
      love.graphics.setColor(255,255,255)
      drawspine()

    end

    love.graphics.setColor(255,255,255)

    if tileset then love.graphics.sdraw(thecolors[me.selectedcolor+1].logo,420+tilesep,-tilesep) 
    end

    if tileset then 
      p2shade()
      if you.selectedcolor+1>2 then
        love.graphics.sdraw(thecolors[you.selectedcolor+1].logo,1440-420-300-tilesep,-tilesep,0,1,1) 
      else
        love.graphics.sdraw(thecolors[you.selectedcolor+1].logo,1440-420-tilesep,-tilesep,0,-1,1) 
      end
    end



    love.graphics.setColor(allfade,allfade,allfade,255)
    for i,v in ipairs(tiles) do
      if v.ud == "top" then
        if v.y - v.j > 25 then 
          if v.j < -10 and not notilebouncing then
            v.j = -v.j/3
          else v.y = 25 v.j = 0
          end
        end

        if v.y ~= 25 then v.j = v.j - .4 end


      else
        if v.y - v.j <450-25 then 
          if v.j > 10 and not notilebouncing then
            v.j = -v.j/3

          else v.y = 450-25 v.j = 0
          end
        end

        if v.y ~= 450-25 then v.j = v.j + .4 end



      end
      v.y = v.y - v.j



      if i == me.selectedcolor+1 and tileset then

        if not me.readytoplay then

          function me.drawontop() love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b) 
            love.graphics.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-450*(tilezoom), 0, v.lr*(1+tilezoom), (1+tilezoom))
          end

        else
          function me.drawontop() 
            love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
            love.graphics.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))-tilesep/i, v.y, 0, v.lr, 1)
          end
        end

      else
        love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
        love.graphics.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))-tilesep/i, v.y, 0, v.lr, 1)
      end


    end
    me.drawontop()


    for i,v in ipairs(tiles2) do
      if v.ud == "top" then
        if v.y - v.j > 25 then 
          if v.j < -10 and not notilebouncing then
            v.j = -v.j/3

          else v.y = 25 v.j = 0
          end
        end

        if v.y ~= 25 then v.j = v.j - .4 end


      else
        if v.y - v.j <450-25 then 

          collidesar[i]:setVolume(SFXV - .82-(.1/(math.abs(v.j))))
          repplay(collidesar[i])
          if v.j > 10 and not notilebouncing then
            v.j = -v.j/3

          else v.y = 450-25 v.j = 0
          end
        end

        if v.y ~= 450-25 then v.j = v.j + .4 end



      end
      v.y = v.y - v.j

      if i == you.selectedcolor+1 and tileset  then



        if not you.readytoplay then
          function you.drawontop() 
            love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
            love.graphics.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-(450*(tilezoom)), 0, -v.lr*(1+tilezoom), (1+tilezoom))
          end
        else
          function you.drawontop() 
            love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
            love.graphics.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))+tilesep/i, v.y, 0, -v.lr, 1)
          end
        end
      else
        love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
        love.graphics.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))+tilesep/i, v.y, 0, -v.lr, 1)
      end



    end
    you.drawontop()

    if me.rightbump and not me.holda then 
      me.rightc = thecolors[me.selectedcolor+1]
      repplay(me.selected)
    elseif me.leftbump and not me.holda then 
      me.leftc = thecolors[me.selectedcolor+1]
      repplay(me.selected)
    end


    if you.rightbump and not you.holda then 
      you.rightc = thecolors[you.selectedcolor+1]
      repplay(you.selected)
    elseif you.leftbump and not you.holda then 
      you.leftc = thecolors[you.selectedcolor+1]
      repplay(you.selected)
    end

    if me.block and not me.holda and not me.readytoplay then 
      menu = "map"
      tileset = false
    end
    if you.block and not you.holda and not you.readytoplay then 
      menu = "map" 
      tileset = false
    end

    if me.start and not me.readytoplay then me.readytoplay = true repplay(me.selected) end
    if me.block and not you.readytoplay then me.readytoplay = false end
    if you.start and not you.readytoplay then you.readytoplay = true repplay(you.selected)  end
    if you.block and not me.readytoplay then you.readytoplay = false end



    love.graphics.setColor(255, 255, 255)
    if me.readytoplay then
      love.graphics.sdraw(ready, 100, 70+tilesep,0,5,5)
    else
      if me.right and not me.dirholda then me.selectedcolor = (me.selectedcolor + 1)%(#tiles)
      elseif me.left and not me.dirholda then me.selectedcolor = (me.selectedcolor - 1)%(#tiles)
      elseif me.down and not me.dirholda then me.selectedcolor = (me.selectedcolor + #tiles/2)%(#tiles)
      elseif me.up and not me.dirholda then me.selectedcolor = (me.selectedcolor - #tiles/2)%(#tiles)
      end


    end

    if you.readytoplay then
      love.graphics.sdraw(ready, 1440-100-(64*5), 70+tilesep,0,5,5)

    else
      if you.right and not you.dirholda then you.selectedcolor = (you.selectedcolor - 1)%(#tiles2)
      elseif you.left and not you.dirholda then you.selectedcolor = (you.selectedcolor + 1)%(#tiles2)
      elseif you.down and not you.dirholda then you.selectedcolor = (you.selectedcolor + #tiles2/2)%(#tiles2)
      elseif you.up and not you.dirholda then you.selectedcolor = (you.selectedcolor - #tiles2/2)%(#tiles2)
      end

    end

    if you.readytoplay and me.readytoplay then
      if tilesep == 0 then
        tilesep = 1
        placespeople = true
        thesong:stop()
        repplay(readysound)
        musfade = 0
        musfadein = 0
      elseif tilesep < 4000 then
        tilesep = tilesep +  tilesep*.09
      end
      if finishedloading then
        separatespines = true
      end
    end
    if 
    math.abs(soscillator)>400 then 
      menu = "pan"
    end



  elseif menu == "pan" then

    if dollyx == 0 then
      if not mute then
        thesong:rewind()
        repplay(thesong)
      end
    elseif streetfadehold <= 0 then 
      menu = "play"
      gotimer = 0
    elseif streetfadestart then streetfadehold = streetfadehold - 1
    elseif dollyx + screenwidth > themap.rightwall-1440*1.5
    or c1accept() or c2accept()
    then 
      fadein = -5
    end

    if allfade == 0 and not streetfadestart then
      streetfadestart = true
      streetfadehold = math.random(50,100)
      dollyx = 0

    end

    love.graphics.setColor(allfade,allfade,allfade)
    love.graphics.sdraw(enviro.sky, 0, 0, 0, 150, 1)
    love.graphics.sdraw(enviro.paralax, -dollyx/2,  -enviro.paralax:getHeight()+900-letterboxheight-30)
    love.graphics.sdraw(enviro.stage, -dollyx, -themap.floor+900 -letterboxheight-30)
    love.graphics.setColor(0,0,0)
    love.graphics.srectangle("fill", 0, 0, 1440, hof(letterboxheight, 450-3^(dollyx/50)))

    love.graphics.srectangle("fill", 0, 900, 1440, -hof(letterboxheight, 450-3^(dollyx/50)))
    dollyx = dollyx + dollyv


  elseif menu == "retry" then

    if allfade +fadein*2<= 0 and nextstop ~= "?" then
      allfade = 0
      menu = nextstop
      if menu == "pan" then
        placespeople = true
      end
    end

    love.graphics.setColor(225,225,225)

    if fadein < 0 then
      love.graphics.setColor(allfade,allfade,allfade)
    else
      love.graphics.setColor(255,255,255)
    end
    love.graphics.srectangle("fill", 0, 0, 1440, 900)




    love.graphics.setScissor(0, 0, screenwidth/2, enviro.screenheight)
    camera:set()
    drawa(me)

    love.graphics.setColor(255,255,255)

    drawa(you)


    love.graphics.setColor(255,255,255)

    camera:unset()
    love.graphics.setScissor()



    love.graphics.setScissor(screenwidth/2, 0, screenwidth/2, enviro.screenheight)
    camera2:set()

    drawa(me)

    drawa(you)

    camera2:unset()
    love.graphics.setScissor()

    death(me, you)
    death(you, me)
    retry()

    love.graphics.setColor(0,0,0,allfade)
    love.graphics.sdraw(enviro.retry, 0, 0)

    if beginretry then
      fadein = 5
      if (me.blockb and not me.holda) or (not you.holda and you.blockb) then 
        nextstop = "pan" 
        fadein = -4 
        beginretry = false
      end
      if (c1accept() and not me.holda) or (not you.holda and c2accept()) then
        nextstop = "map"
        fadein = -4
        beginretry = false
      end

    end



  end
  holdmanage(me)
  holdmanage(you)
end




























function choosestuff()

  openingsong:stop()





  if cflicker == 255 then cfhold = cfhold + 1
  elseif cflicker <= 0 then cfup = true
  end

  if cfhold > 60 then cfhold = 0 cfup = false
  end


  if cfup and cfhold == 0 then cflicker = cflicker + 15
  elseif not cfup then cflicker = cflicker - 15
  end

  icflicker = cflicker

  if menu == "postchoose" then
    rset = true
    lset = true
    if juststartedpost then juststartedpost = false
      placespeople = true


      rn = 1
      ln = 1
    elseif not juststartedpost then 
      rn = rn + (rn*.08)
      ln = ln + (ln*.08)
    end
  end

  if not lset and lcx  + screenwidth/30 < 0 then lcx = lcx + screenwidth/30
  else lset = true
    lcx = 0
  end 

  if not rset and rcx - screenwidth/30 > screenwidth/2 then rcx = rcx - screenwidth/30
  else rset = true
    rcx = screenwidth/2
  end

  if rn > 1000020 and ln > 1000020 and math.abs(soscillator)>400 
  then menu = "prepan"
    yoffset = 0
    finishedloading = false
    separatespines = false
  end

end


function panstuff()
  menu = "pan"
  rset = false
  lset = false


  if enviro.dolly == 0 then
    if not mute then
      thesong:rewind()
      repplay(thesong)
    end
  elseif streetfadehold <= 0 then menu = "preplay"
  elseif streetfade <= 0 then streetfadehold = streetfadehold - 1
  elseif streetfadestart then streetfade = streetfade - 5
  elseif enviro.dolly + screenwidth > enviro.rightwall/2
  or c1accept() or c2accept()
  then 
    streetfadestart = true	
  end

  enviro.dolly = enviro.dolly + enviro.ds

end


function drawcity()

  if sfade + 5 <= 255 then
    sfade = sfade + 5
  end

  if menu=="premodes" then
    adastartfade = true end

    if sfade == 255 and adafade <255 and (menu == "title") then adafade = adafade + 2.5  end

    if menu == "premodes" and adafade - 3 < 0 then adafade = 0 adastartfade = false
    elseif adastartfade then adafade = adafade - 3
    end

    love.graphics.setColor(sfade,sfade,sfade,255)
    love.graphics.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
    love.graphics.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)

    drawwaves()
    love.graphics.setColor(255,255,255,adafade)
    love.graphics.draw(enviro.ada, 0, 0, 0,screenwidth/1440,screenheight/900)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 0, screenheight*1.2-stagey*4, screenwidth, screenheight)

  end

