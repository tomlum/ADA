require "story/ch1/ch1"
pressanybutton = lg.newImage("enviro/pressanybutton.png")

oldmenu = "begin"
notilebouncing = true
--menu that fades into another???
noplat = {n=0;}

maxmodenum = 2

themaps = {}
themaps[1]= {name = "street", 
plats = {}, walls = {},
floor = 1896,
lightx = 707+2.5,
lighty = 142+2.5,
lightcolor = {r = 40, g = 255, b = 0},
rightwall = 7000,
paralaxscale = 4/7,
paralaxscale2 = .4
}
themaps[2]= {name = "library", 
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
themaps[3]= {name = "floors", 
plats = {}, walls = {}, boxes = {},
floor = 5898,
lightx = 442+2.5,
lighty = 311+2.5,
lightcolor = {r = 255, g = 99, b = 0},
rightwall = 5000,
paralaxscale = .5,
paralaxscale2 = .25
}



themaps[100]= {name = "fightclub", 
plats = {}, walls = {},
floor = 896,
paralaxscale = 1,
rightwall = 2000
}


themap = themaps[1]


---[[


letterboxheight = 80
menuspeed = 7
pausescreen = lg.newImage("enviro/paused.png")
modes = lg.newImage("enviro/mode.png")
backstreet = lg.newImage("enviro/backstreet.png")
modeselector = lg.newImage("enviro/modeselector.png")
wiper = lg.newImage("enviro/wiper.png")
map = lg.newImage("enviro/map.png")
ptile = lg.newImage("enviro/ptile.png")
gtile = lg.newImage("enviro/gtile.png")
otile = lg.newImage("enviro/otile.png")
tile = lg.newImage("enviro/tile.png")
glogo = {im = lg.newImage("enviro/greenlogo.png")}
questionlogo = {im=lg.newImage("enviro/questionmark.png")}
shoulder = lg.newImage("enviro/shoulder.png")
ready = lg.newImage("enviro/ready.png")

musfadein = 0
musfade = 0
tilezoom = .1
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

function lg.sdraw(im, x, y, rot, sx, sy) 
  if rot == nil then 
    lg.draw(im,x*(screenwidth/1440),y*(screenheight/900), 0, (screenwidth/1440), (screenheight/900))
  else
    lg.draw(im,x*(screenwidth/1440),y*(screenheight/900), rot, sx*(screenwidth/1440), sy*(screenheight/900))
  end
end

function lg.srectangle(mode, x, y, width, height) 
  lg.rectangle(mode, x*screenwidth/1440, y*screenheight/900, width*screenwidth/1440, height*screenheight/900) 
end

lg.setNewFont(20)


lightsize = 7
maxwob = 7
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

    me.readytoplay = false
    you.readytoplay = false
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

  elseif menu == "story" and oldmenu ~= "story" then

    chapterinit()



  end
end

wobx = 0
woby = 0
wobj = 0
wobv = 0

function updatechapters()
  chaptime = chaptime + 1
  if chapter == 1 then
    chap1update(chaptime)
  end


end

function drawmenus()


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


    lg.setColor(allfade,allfade,allfade,255)
    --lg.setColor(255,255,255,255)
    lg.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
    lg.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
    lg.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
    lg.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)

    drawwaves()
    for i = 0, #thecolors-1 do 
      local color = thecolors[i]
      if color.s~=nil then
        lg.setColor(color.c.r,color.c.g,color.c.b, allfade)
        lg.sdraw(enviro.ada, 0, i*90, 0, .5, .5)
      end
    end
    
    lg.setColor(255,255,255,allfade)
    lg.draw(pressanybutton, screenwidth/2, screenheight/2, 0, screenwidth/1440,screenheight/900, 48, 18)
    lg.setColor(0,0,0)
    lg.srectangle("fill", 0, 900-stagey*4, 1440, 900)


  elseif menu == "modes" or menu == "premap" then

    if cancels() then menu = "title" end




    if menu == "premap" then
      if wipex < 0 then
        wipex = wipex + screenwidth/wipefraction
      else 
        menu = "map"
      end
    end

    if menu == "modes" then

      if downs() and modenum < maxmodenum then modenum = modenum + 1 mov:play()
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
    elseif modenum == 2 then 
      selectorx = 365
      selectory = 642
      themode = "koth"
    end
    lg.setColor(allfade,allfade,allfade,255)
    blurdraw(.001,function() lg.sdraw(backstreet,wobx-maxwob/2,woby-maxwob/2,0,1.1,1.1) end)
    lg.setColor(allfade/2,allfade/2,allfade/1,255)
    lg.sdraw(modes,0,0)
    lg.sdraw(modeselector, selectorx, selectory)
    lg.sdraw(wiper,wipex,0)

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


    lg.setColor(allfade,allfade,allfade,255)
    lg.draw(map,0,0, 0, screenwidth/1440, screenheight/900)
    lg.setColor(themaps[mapnum].lightcolor.r,themaps[mapnum].lightcolor.g,themaps[mapnum].lightcolor.b,math.random(150,255)*(allfade/255))
    lg.circle("fill",(themaps[mapnum].lightx)*(screenwidth/1440),(themaps[mapnum].lighty)*(screenheight/900),lightsize*(screenwidth/1440))
    local wordspacing = 20
    for i = 0, screenheight/wordspacing do
      lg.print(string.upper(themaps[mapnum].name), 1000*(screenwidth/1440), i*wordspacing)
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
        lg.setColor((tilefade),(tilefade),(tilefade))
      else
        lg.setColor(me.leftc.c.r,me.leftc.c.g,me.leftc.c.b)
      end
      lg.sdraw(shoulder, colorfromwallspace-80,tilesep)



      if me.rightc.n == 0 then 
        lg.setColor((tilefade),(tilefade),(tilefade))
      else
        lg.setColor(me.rightc.c.r,me.rightc.c.g,me.rightc.c.b)
      end
      lg.sdraw(shoulder, 720-colorfromwallspace-140,-tilesep,0,-1,1)


      if you.leftc.n == 0 then 
        lg.setColor((tilefade),(tilefade),(tilefade))
      else
        lg.setColor(you.leftc.c.r,you.leftc.c.g,you.leftc.c.b)
      end
      lg.sdraw(shoulder, 720 +colorfromwallspace+140,-tilesep)



      if you.rightc.n == 0 then 
        lg.setColor((tilefade),(tilefade),(tilefade))
      else
        lg.setColor(you.rightc.c.r,you.rightc.c.g,you.rightc.c.b)
      end
      lg.sdraw(shoulder, 1440-colorfromwallspace+80,tilesep,0,-1,1)




    end

    if tileset or allready then
      lg.setColor(255,255,255)
      drawspine()

    end

    lg.setColor(255,255,255)

    if tileset then 
      lg.setShader(cshader)
      cshader:send( "palette", 
        {me.shade.r, me.shade.g, me.shade.b, 1}, 
        vct(thecolors[me.selectedcolor+1].c),
        vct(thecolors[me.selectedcolor+1].c), 
        vct(me.outline)

        ) 
      if me.selectedcolor+1>numofcolors then
        lg.sdraw(thecolors[me.selectedcolor+1].logo.im,360+tilesep,-tilesep,0,7,7) 
      else
        lg.sdraw(thecolors[me.selectedcolor+1].logo.im,520+tilesep,-tilesep, math.rad(15), 5,5) 
      end
      lg.setShader()
    end
    if tileset then 
      lg.setShader(cshader)
      cshader:send( "palette", 
        {you.shade.r, you.shade.g, you.shade.b, 1}, 
        vct(thecolors[you.selectedcolor+1].c),
        vct(thecolors[you.selectedcolor+1].c), 
        vct(you.outline)

        ) 
      if you.selectedcolor+1>numofcolors then
        lg.sdraw(thecolors[you.selectedcolor+1].logo.im,1440-520-220-tilesep,-tilesep,0,7,7) 
      else
        lg.sdraw(thecolors[you.selectedcolor+1].logo.im,1440-520-tilesep,-tilesep,-math.rad(15),-5,5) 

      end
      lg.setShader()
    end



    lg.setColor(allfade,allfade,allfade,255)
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

              function me.drawontop() lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b) 
                lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-450*(tilezoom), 0, v.lr*(1+tilezoom), (1+tilezoom))
              end

            else
              function me.drawontop() 
                lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))-tilesep/i, v.y, 0, v.lr, 1)
              end
            end

          else
            lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
            lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))-tilesep/i, v.y, 0, v.lr, 1)
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
                    lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                    lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-(450*(tilezoom)), 0, -v.lr*(1+tilezoom), (1+tilezoom))
                  end
                else
                  function you.drawontop() 
                    lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                    lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))+tilesep/i, v.y, 0, -v.lr, 1)
                  end
                end
              else
                lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr))+tilesep/i, v.y, 0, -v.lr, 1)
              end



            end
            you.drawontop()

            if not me.readytoplay then
              if me.rightbump and not me.holda then 
                me.rightc = thecolors[me.selectedcolor+1]
                repplay(me.selected)
      --repplay(thecolors[me.selectedcolor+1].sound)
    elseif me.leftbump and not me.holda then 
      me.leftc = thecolors[me.selectedcolor+1]
      repplay(me.selected)
      --repplay(thecolors[me.selectedcolor+1].sound)
    end
  end
  if not you.readytoplay then
    if you.rightbump and not you.holda then 
      you.rightc = thecolors[you.selectedcolor+1]
      repplay(you.selected)
      --repplay(thecolors[you.selectedcolor+1].sound)
    elseif you.leftbump and not you.holda then 
      you.leftc = thecolors[you.selectedcolor+1]
      repplay(you.selected)
      --repplay(thecolors[you.selectedcolor+1].sound)
    end
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



  lg.setColor(255, 255, 255)
  if me.readytoplay then
    lg.sdraw(ready, 100, 70+tilesep,0,5,5)
  else
    if me.right and not me.dirholda then me.selectedcolor = (me.selectedcolor + 1)%(#tiles)
      repplay(me.mov)
    elseif me.left and not me.dirholda then me.selectedcolor = (me.selectedcolor - 1)%(#tiles)
      repplay(me.mov)
    elseif me.down and not me.dirholda then me.selectedcolor = (me.selectedcolor + #tiles/2)%(#tiles)
      repplay(me.mov)
    elseif me.up and not me.dirholda then me.selectedcolor = (me.selectedcolor - #tiles/2)%(#tiles)
      repplay(me.mov)
    end


  end

  if you.readytoplay then
    lg.sdraw(ready, 1440-100-(64*5), 70+tilesep,0,5,5)

  else
    if you.right and not you.dirholda then you.selectedcolor = (you.selectedcolor - 1)%(#tiles2)
      repplay(you.mov)
    elseif you.left and not you.dirholda then you.selectedcolor = (you.selectedcolor + 1)%(#tiles2)
      repplay(you.mov)
    elseif you.down and not you.dirholda then you.selectedcolor = (you.selectedcolor + #tiles2/2)%(#tiles2)
      repplay(you.mov)
    elseif you.up and not you.dirholda then you.selectedcolor = (you.selectedcolor - #tiles2/2)%(#tiles2)
      repplay(you.mov)
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

  lg.setColor(allfade,allfade,allfade)
  lg.sdraw(enviro.sky, 0, 0, 0, 150, 1)
  lg.sdraw(enviro.paralax, -dollyx/2,  -enviro.paralax:getHeight()+900-letterboxheight-30)
  lg.sdraw(enviro.stage, -dollyx, -themap.floor+900 -letterboxheight-30)
  lg.setColor(0,0,0)
  lg.srectangle("fill", 0, 0, 1440, hof(letterboxheight, 450-3^(dollyx/50)))

  lg.srectangle("fill", 0, 900, 1440, -hof(letterboxheight, 450-3^(dollyx/50)))
  dollyx = dollyx + dollyv


elseif menu == "retry" then

  if allfade +fadein*2<= 0 and nextstop ~= "?" then
    allfade = 0
    menu = nextstop
    if menu == "pan" then
      placespeople = true
    end
  end

  lg.setColor(225,225,225)

  if fadein < 0 then
    lg.setColor(allfade,allfade,allfade)
  else
    lg.setColor(255,255,255)
  end
  lg.srectangle("fill", 0, 0, 1440, 900)


  lg.setScissor(0, 0, screenwidth/2, winheight)
  camera:set()
  drawx(camera)
  camera:unset()
  lg.setScissor()



  lg.setScissor(screenwidth/2, 0, screenwidth/2, winheight)
  camera2:set()

  drawx(camera2)

  camera2:unset()
  lg.setScissor()

  if onescreen and not vertone then
    if me.x < you.x then 

      lg.setScissor(screenwidth/2, topy,screenwidth, winheight/2+1)
      camera:set()
      drawx(camera)
      camera:unset()
      lg.setScissor()

      lg.setScissor(screenwidth/2-twidth, bottomy,screenwidth, winheight/2+1)
      camera2:set()
      drawx(camera2)
      camera2:unset()
      lg.setScissor()
    elseif me.x >= you.x then

      lg.setScissor(screenwidth/2-twidth, topy,screenwidth, enviro.screenheight/2+1)
      camera2:set()
      drawx(camera2)
      camera2:unset()
      lg.setScissor()

      lg.setScissor(screenwidth/2, bottomy,screenwidth, enviro.screenheight/2+1)
      camera:set()
      drawx(camera)
      camera:unset()
      lg.setScissor()
    end
  end



    --retry()

    lg.setColor(0,0,0,allfade)
    lg.sdraw(enviro.retry, 0, 0)

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


