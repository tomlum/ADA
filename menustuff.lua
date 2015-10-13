--menu values--
--title
--modes
--map
--color
--pan
--play
--retry


--menu that fades into another???

pressanybutton = lg.newImage("enviro/pressanybutton.png")

noplat = {n=0}








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


function pausing()
  if menu == "play" then 
    if not (me.start or you.start) then
      if pause then
        readytounpause = true
      else
        readytounpause = false
      end
    end

    if pause and readytounpause and (me.start or you.start) then
      pause = false
    end

    if (me.start or you.start) and not pause and not readytounpause then
      pause = true
      readytounpause = false
    end
  end
end

function drawoverlays()
  cclear()

  if not(oldonescreen and onescreen) then
    lg.setColor(53, 53, 53)
    lg.rectangle("fill", wallx, 0, 14*width, enviro.screenheight)
  end
  if not(oldvertone and vertone) then
    lg.setColor(53, 53, 53)
    lg.rectangle("fill",(lg.getWidth()/2)-twidth,(enviro.screenheight/2)-bwidth/2,twidth*2,bwidth)
    lg.setColor(255, 255, 255, 255)
  end

  if not fightclub then
    drawGo()
  end
  drawroulettenumbers()
  if pause and not hitpause then
    lg.sdraw(pausescreen,0,0,0,10,10)
  end

  lg.setShader()
  lg.setColor(0,0,0)
  lg.srectangle("fill",0,0,1440,barey)
  lg.srectangle("fill",0,900,1440,-barey)
  lg.setColor(255,255,255)

end

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

function refreshMenus()
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
    finishedLoading = false
    if themode == nil or themode == "none" then themode = "duel" end
    me.drawontop = function() end
    you.drawontop = function() end
    spines = {}

    allready = false
    tilefadein = 1
    tilefade = 0
    me.left_color_flash = 0
    me.right_color_flash = 0
    you.left_color_flash = 0
    you.right_color_flash = 0
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
  
  oldmenu = menu
end

wobx = 0
woby = 0
wobj = 0
wobv = 0

function updatechapters()
  chaptime = chaptime + 1
  if chapter == 1 then
    ch1update(chaptime)
  end


end


tilescale = 1.3
tile_y_closeness = 78*(screenheight/900)

tile_dis_from_center = screenwidth/12.2

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

    if downs() and mapNum < 3 then mapNum = mapNum + 1 repplay(mov)
    elseif ups() and mapNum > 1 then mapNum = mapNum - 1 repplay(mov)
    end

    themap = themaps[mapNum]

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
    lg.setColor(themaps[mapNum].lightcolor.r,themaps[mapNum].lightcolor.g,themaps[mapNum].lightcolor.b,math.random(150,255)*(allfade/255))
    lg.circle("fill",(themaps[mapNum].lightx)*(screenwidth/1440),(themaps[mapNum].lighty)*(screenheight/900),lightsize*(screenwidth/1440))
    local wordspacing = 20
    for i = 0, screenheight/wordspacing do
      lg.print(string.upper(themaps[mapNum].name), 1000*(screenwidth/1440), i*wordspacing)
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

      if me.rightc.n ~= 0 then
        lg.setColor(255,255,255,hof(0, 220-me.right_color_flash))
        lg.rectangle("fill", 0, 0, screenwidth/2, screenheight)
      end

      if me.leftc.n ~= 0 then
        lg.setColor(255,255,255,hof(0, 220-me.left_color_flash))
        lg.rectangle("fill", 0, 0, screenwidth/2, screenheight)
      end

      if me.leftc.n == 0 then 
        lg.setColor(0,0,0,0)
      else
        if me.left_color_flash < 255 then
          me.left_color_flash = me.left_color_flash*1.1+1
          if me.left_color_flash >= 255 then
            me.left_color_flash = 255
          end
        end
        lg.setColor(
          hof(me.leftc.c.r, 255-me.left_color_flash),
          hof(me.leftc.c.g, 255-me.left_color_flash),
          hof(me.leftc.c.b, 255-me.left_color_flash))
      end
      lg.polygon("fill", screenwidth*3/10+tilesep/30, screenheight+tilesep, screenwidth*1/10+tilesep, 0, 0+tilesep, 0)



      if me.rightc.n == 0 then 
        lg.setColor(0,0,0,0)
      else
        if me.right_color_flash < 255 then
          me.right_color_flash = me.right_color_flash*1.1+1
          if me.right_color_flash >= 255 then
            me.right_color_flash = 255
          end
        end
        lg.setColor(
          hof(me.rightc.c.r, 255-me.right_color_flash),
          hof(me.rightc.c.g, 255-me.right_color_flash),
          hof(me.rightc.c.b, 255-me.right_color_flash))
      end      
      lg.polygon("fill", screenwidth*1/10-tilesep/30, screenheight, screenwidth*4/10-tilesep, 0, screenwidth*3/10-tilesep, 0)



      if you.rightc.n ~= 0 then
        lg.setColor(255,255,255,hof(0, 220-you.right_color_flash))
        lg.rectangle("fill", screenwidth/2, 0, screenwidth/2, screenheight)
      end

      if you.leftc.n ~= 0 then
        lg.setColor(255,255,255,hof(0, 220-you.left_color_flash))
        lg.rectangle("fill", screenwidth/2, 0, screenwidth/2, screenheight)
      end

      if you.leftc.n == 0 then 
        --lg.setColor((tilefade),(tilefade),(tilefade))
        lg.setColor(0, 0, 0, 0)
      else
        if you.left_color_flash < 255 then
          you.left_color_flash = you.left_color_flash*1.1+1
          if you.left_color_flash >= 255 then
            you.left_color_flash = 255
          end
        end
        lg.setColor(
          hof(you.leftc.c.r, 255-you.left_color_flash),
          hof(you.leftc.c.g, 255-you.left_color_flash),
          hof(you.leftc.c.b, 255-you.left_color_flash))
      end
      lg.polygon("fill", screenwidth*9/10+tilesep/30, screenheight, screenwidth*6/10+tilesep, 0, screenwidth*7/10+tilesep, 0)
      --lg.sdraw(shoulder, 720 +colorfromwallspace+140,-tilesep)


      if you.rightc.n == 0 then 
        --lg.setColor((tilefade),(tilefade),(tilefade))
        lg.setColor(0,0,0,0)
      else
        if you.right_color_flash < 255 then
          you.right_color_flash = you.right_color_flash*1.1+1
          if you.right_color_flash >= 255 then
            you.right_color_flash = 255
          end
        end
        lg.setColor(
          hof(you.rightc.c.r, 255-you.right_color_flash),
          hof(you.rightc.c.g, 255-you.right_color_flash),
          hof(you.rightc.c.b, 255-you.right_color_flash))
      end
      lg.polygon("fill", screenwidth*7/10-tilesep/30, screenheight+tilesep, screenwidth*9/10-tilesep, 0, screenwidth-tilesep, 0)
      --lg.sdraw(shoulder, 1440-colorfromwallspace+80,tilesep,0,-1,1)




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
        if v.y - v.j > (25+tile_y_closeness) then 
          if v.j < -10 and not notilebouncing then
            v.j = -v.j/3
            else v.y = (25+tile_y_closeness) v.j = 0
            end
          end

          if v.y ~= (25+tile_y_closeness) then v.j = v.j - .4 end


        else
          if v.y - v.j <450-(25+tile_y_closeness) then 
            if v.j > 10 and not notilebouncing then
              v.j = -v.j/3

              else v.y = 450-(25+tile_y_closeness) v.j = 0
              end
            end

            if v.y ~= 450-(25+tile_y_closeness) then v.j = v.j + .4 end



          end
          v.y = v.y - v.j



          if i == me.selectedcolor+1 and tileset then


            if not me.readytoplay then


              function me.drawontop() lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b) 
                lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr)-(100*(tilezoom)))+tile_dis_from_center, v.y-450*(tilezoom), 0, v.lr*(1+tilezoom)/tilescale, (1+tilezoom)/tilescale)
              end

            else
              function me.drawontop() 
                lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr))-tilesep/i+tile_dis_from_center, v.y, 0, v.lr/tilescale, 1/tilescale)
              end
            end

          else
            lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
            lg.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr))-tilesep/i+tile_dis_from_center, v.y, 0, v.lr/tilescale, 1/tilescale)
          end

        end
        me.drawontop()


        for i,v in ipairs(tiles2) do
          if v.ud == "top" then
            if v.y - v.j > (25+tile_y_closeness) then 
              if v.j < -10 and not notilebouncing then
                v.j = -v.j/3

                else v.y = (25+tile_y_closeness) v.j = 0
                end
              end

              if v.y ~= (25+tile_y_closeness) then v.j = v.j - .4 end


            else
              if v.y - v.j <450-(25+tile_y_closeness) then 

                collidesar[i]:setVolume(SFXV - .82-(.1/(math.abs(v.j))))
                repplay(collidesar[i])
                if v.j > 10 and not notilebouncing then
                  v.j = -v.j/3

                  else v.y = 450-(25+tile_y_closeness) v.j = 0
                  end
                end

                if v.y ~= 450-(25+tile_y_closeness) then v.j = v.j + .4 end



              end
              v.y = v.y - v.j

              if i == you.selectedcolor+1 and tileset  then



                if not you.readytoplay then
                  function you.drawontop() 
                    lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                    lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr)-(100*(tilezoom)))-tile_dis_from_center, v.y-(450*(tilezoom)), 0, -v.lr*(1+tilezoom)/tilescale, (1+tilezoom)/tilescale)
                  end
                else
                  function you.drawontop() 
                    lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                    lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr))+tilesep/i-tile_dis_from_center, v.y, 0, -v.lr/tilescale, 1/tilescale)
                  end
                end
              else
                lg.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
                lg.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100/tilescale+tilespacing)-(50/tilescale*v.lr))+tilesep/i-tile_dis_from_center, v.y, 0, -v.lr/tilescale, 1/tilescale)
              end



            end
            you.drawontop()

            if not me.readytoplay then
              if me.rightbump and not me.holda then 
                me.rightc = thecolors[me.selectedcolor+1]
                repplay(me.selected)

                me.right_color_flash = 0 
      --repplay(thecolors[me.selectedcolor+1].sound)
    elseif me.leftbump and not me.holda then 
      me.leftc = thecolors[me.selectedcolor+1]
      repplay(me.selected)
      me.left_color_flash = 0 
      --repplay(thecolors[me.selectedcolor+1].sound)
    end
  end
  if not you.readytoplay then
    if you.rightbump and not you.holda then 

      you.right_color_flash = 0 
      you.rightc = thecolors[you.selectedcolor+1]
      repplay(you.selected)
      --repplay(thecolors[you.selectedcolor+1].sound)
    elseif you.leftbump and not you.holda then 

      you.left_color_flash = 0 
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
      you.right_color_flash = 0 
      you.left_color_flash = 0 
      me.right_color_flash = 0 
      me.left_color_flash = 0 
      tilesep = 1
      placespeople = true
      thesong:stop()
      repplay(readysound)
      musfade = 0
      musfadein = 0
    elseif tilesep < 4000 then
      tilesep = tilesep +  tilesep*.09
    end
    if finishedLoading then
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




function panstuff()
  menu = "pan"


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


