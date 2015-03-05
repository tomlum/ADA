menu = "color"
oldmenu = "begin"
menuspeed = 10
modes = love.graphics.newImage("enviro/mode.png")
backstreet = love.graphics.newImage("enviro/backstreet.png")
modeselector = love.graphics.newImage("enviro/modeselector.png")
wiper = love.graphics.newImage("enviro/wiper.png")
map = love.graphics.newImage("enviro/map.png")
ptile = love.graphics.newImage("enviro/ptile.png")
gtile = love.graphics.newImage("enviro/gtile.png")
tile = love.graphics.newImage("enviro/tile.png")

musfadein = 0
musfade = 0
tilezoom = .1
colorfromwallspace = 60


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



local shine = require 'shine'
blur = shine.gaussianblur()

love.graphics.setNewFont(20)

mapnum = 1

lightsize = 7
maxwob = 5
function initmenu()
  if menu == "title" and oldmenu ~= "title" then
    faderate = 2.5
    musfadein = 1
    musfade = 0
    allfade = 0
    fadein = 1
    thesong = openingsong
    thesong:rewind()
    repplay(thesong)
    stagey = 0
  elseif menu == "modes" and oldmenu ~= "modes" then
    faderate = 8
    allfade = 0
    fadein = 1
    wipex = -screenwidth*2
    wipespeed = 10
    wobv = 1
    wobj = 1
  elseif menu == "map" and oldmenu ~= "map" then
    allfade = 0
    fadein = 1
  elseif menu == "color" and oldmenu ~= "color" then
    
me.selectedcolor = 0
you.selectedcolor = 0
    for i,v in ipairs(tiles) do
      if v.ud == "top" then
        v.y = -450-(#tiles/2-v.column)*100
        j=-11
      else 
        v.y = 900+(#tiles/2-v.column)*100
        j=11
      end
    end
    
    for i,v in ipairs(tiles2) do
      if v.ud == "top" then
        v.y = -450-(#tiles2/2-v.column)*100
        j=-11
      else 
        v.y = 900+(#tiles2/2-v.column)*100
        j=11
      end
    end
    
    allfade = 255
    fadein = 0
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
    allfade = allfade + faderate
    if allfade + 2 >= 255 then
      fadein = 0
      allfade = 255
    end
  elseif fadein < 0 then
    allfade = allfade - faderate
    if allfade -2 <= 0 then
      fadein = 0
      allfade = 0
    end
  end

  if musfadein > 0 then 
    musfade = musfade + 2
    if musfade + 2 >= 255 then
      musfadein = 0
      musfade = 255
    end
  elseif musfadein < 0 then
    musfade = musfade - 2
    if musfade -2 <= 0 then
      musfadein = 0
      musfade = 0
    end
  end
  if thesong~= nil then
    thesong:setPitch(musfade/255)
  end

  if menu == "title" or menu == "premode" then
    if c1accept() or c2accept() then
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
    love.graphics.rectangle("fill", 0, screenheight-stagey*(screenheight/250), screenwidth, screenheight)


  elseif menu == "modes" or menu == "premap" then

    if cancels() then menu = "title" end

    if modenum == 0 then
      themode = "duel"
    elseif modenum == 0 then
      themode = "spectrum"
    end



    if menu == "premap" then
      if wipex < 0 then
        wipex = wipex + screenwidth/wipespeed
      else 
        menu = "map"
      end
    end

    if menu == "modes" then

      if downs() and modenum < 1 then modenum = modenum + 1 mov:play()
      elseif ups() and modenum > 0 then modenum = modenum - 1 mov:play()	
      end
    end

    if c1accept() or c2accept() then
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
    love.graphics.setColor(allfade/1.5,allfade/1.5,allfade/1.5,255)
    blur(function() love.graphics.draw(backstreet,wobx-maxwob*2,woby-maxwob*2,0, screenwidth/1440, screenheight/900) end)
    love.graphics.setColor(allfade/2,allfade/2,allfade/1,255)
    love.graphics.draw(modes,0,0,0, screenwidth/1440, screenheight/900)
    love.graphics.draw(modeselector, selectorx*(screenwidth/1440), selectory*(screenheight/900), 0,screenwidth/1440,screenheight/900)
    love.graphics.draw(wiper,wipex,0,0, screenwidth/1440, screenheight/900)

  elseif menu == "map" or menu == "precolor" then


    if cancels() then menu = "modes" end

    if downs() and mapnum < 3 then mapnum = mapnum + 1 mov:play()
    elseif ups() and mapnum > 1 then mapnum = mapnum - 1 mov:play()	
    end

    if c1accept() or c2accept() then
      menu = "color"
      repplay(modesound)
    end

    love.graphics.setColor(allfade,allfade,allfade,255)
    love.graphics.draw(map,0,0, 0, screenwidth/1440, screenheight/900)
    love.graphics.setColor(themaps[mapnum].lightcolor.r,themaps[mapnum].lightcolor.g,themaps[mapnum].lightcolor.b,math.random(150,255)*(allfade/255))
    love.graphics.circle("fill",(themaps[mapnum].lightx)*(screenwidth/1440),(themaps[mapnum].lighty)*(screenheight/900),lightsize*(screenwidth/1440))
    local wordspacing = 20
    for i = 0, screenheight/wordspacing do
      love.graphics.print(themaps[mapnum].name, 1000*(screenwidth/1440), i*wordspacing)
    end



  elseif menu == "color" or menu == "prepan" then

if cancels() then menu = "map" end
if me.right and not me.dirholda then me.selectedcolor = (me.selectedcolor + 1)%(#tiles)
elseif me.left and not me.dirholda then me.selectedcolor = (me.selectedcolor - 1)%(#tiles)
elseif me.down and not me.dirholda then me.selectedcolor = (me.selectedcolor + #tiles/2)%(#tiles)
elseif me.up and not me.dirholda then me.selectedcolor = (me.selectedcolor - #tiles/2)%(#tiles)
end

if you.right and not you.dirholda then you.selectedcolor = (you.selectedcolor - 1)%(#tiles2)
elseif you.left and not you.dirholda then you.selectedcolor = (you.selectedcolor + 1)%(#tiles2)
elseif you.down and not you.dirholda then you.selectedcolor = (you.selectedcolor + #tiles2/2)%(#tiles2)
elseif you.up and not you.dirholda then you.selectedcolor = (you.selectedcolor - #tiles2/2)%(#tiles2)
  end



    love.graphics.setColor(allfade,allfade,allfade,255)
    for i,v in ipairs(tiles) do
      if v.ud == "top" then
        if v.y - v.j > 25 then 
          if v.j < -10 then
            v.j = -v.j/3

          else v.y = 25 v.j = 0
          end
        end

        if v.y ~= 25 then v.j = v.j - .4 end


      else
        if v.y - v.j <450-25 then 
          if v.j > 10 then
            v.j = -v.j/3

          else v.y = 450-25 v.j = 0
          end
        end

        if v.y ~= 450-25 then v.j = v.j + .4 end



      end
      v.y = v.y - v.j
      if i == me.selectedcolor+1 then
      function me.drawontop() love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b) 
        love.graphics.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-450*(tilezoom), 0, v.lr*(1+tilezoom), (1+tilezoom))
        end
        else
      love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
        love.graphics.sdraw(thecolors[i].tile, colorfromwallspace+(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)), v.y, 0, v.lr, 1)
      end




  end
      me.drawontop()
  
  
  
  for i,v in ipairs(tiles2) do
      if v.ud == "top" then
        if v.y - v.j > 25 then 
          if v.j < -10 then
            v.j = -v.j/3

          else v.y = 25 v.j = 0
          end
        end

        if v.y ~= 25 then v.j = v.j - .4 end


      else
        if v.y - v.j <450-25 then 
          
      collides[i]:setVolume(SFXV - .82-(.1/(math.abs(v.j))))
      repplay(collides[i])
          if v.j > 10 then
            v.j = -v.j/3

          else v.y = 450-25 v.j = 0
          end
        end

        if v.y ~= 450-25 then v.j = v.j + .4 end



      end
      v.y = v.y - v.j
      
       if i == you.selectedcolor+1 then
      function you.drawontop() 
      love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
        love.graphics.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)-(100*(tilezoom))), v.y-(450*(tilezoom)), 0, -v.lr*(1+tilezoom), (1+tilezoom))
      end
      else
      love.graphics.setColor(thecolors[i].c.r,thecolors[i].c.g,thecolors[i].c.b)
        love.graphics.sdraw(thecolors[i].tile, 1440-colorfromwallspace-(((i-1)%(#tiles/2))*(100+tilespacing)-(50*v.lr)), v.y, 0, -v.lr, 1)
end



  end
  you.drawontop()
  
  


    love.graphics.setColor(allfade,allfade,allfade,255)

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
    finishedLoading = false
    seperateSpines = false
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
  or me.a1
  or me.a2
  or me.a3
  or you.a1
  or you.a2
  or you.a3 
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



  function drawchoosestuff()
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(enviro.lselect, ((lcx - ln)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)	
    love.graphics.draw(enviro.rselect, ((720-lcx + rn)/1440)*screenwidth, 0, 0, screenwidth/1440, screenheight/900)
    love.graphics.setColor(255,255,255,255)

    if lset then 



      if mbb<=0 then 
        love.graphics.setColor(br,bg,bb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.btile, ((tileoffset-ln+mbindent)/1440)*screenwidth, ((tileyoffset+74)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



      if mgg<=0 then 
        love.graphics.setColor(gr,gg,gb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.gtile, ((tileoffset-ln-9+mgindent)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



      if mpp<=0 then 
        love.graphics.setColor(pr,pg,pb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.ptile, ((tileoffset-ln-18+mpindent)/1440)*screenwidth, ((tileyoffset+202)/900)*screenheight, 0, screenwidth/1440, screenheight/900)

      if myy<=0 then 
        love.graphics.setColor(yer,yeg,yeb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.ytile, ((tileoffset-ln-27+myindent)/1440)*screenwidth, ((tileyoffset+266)/900)*screenheight, 0, screenwidth/1440, screenheight/900)



      if mss<=0 then 
        love.graphics.setColor(sr,sg,sb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.stile, ((tileoffset-ln-36+msindent)/1440)*screenwidth, ((tileyoffset+330)/900)*screenheight, 0, screenwidth/1440, screenheight/900)


      love.graphics.setColor(255,255,255,255)
      if mechoosecolor then

        mbindent, mgindent, mpindent, myindent, msindent = 0,0,0,0,0

        if meseleccurrent == 0 then mbindent = 20
        elseif meseleccurrent == 1 then mgindent = 20
        elseif meseleccurrent == 2 then mpindent = 20
        elseif meseleccurrent == 3 then myindent = 20
        elseif meseleccurrent == 4 then msindent = 20
        end


        --love.graphics.draw(enviro.rselecter, ((tileoffset-ln-115-(meseleccurrent*9))/1440)*screenwidth, ((tileyoffset+10 + 64*(meseleccurrent+1))/900)*screenheight, 0, screenwidth/1440, screenheight/900)
        if me.down and mr2c and msy < (screenheight * .46) then 
          msy = msy + (screenheight * .15)
          mr2c = false
          meseleccurrent = meseleccurrent + 1
          mov:play()
        elseif me.up and mr2c and msy > (screenheight * .14)  then 
          msy = msy - (screenheight * .15)
          meseleccurrent = meseleccurrent - 1
          mr2c = false
          mov:play()
        elseif not me.down and not me.up then mr2c = true
        end
      end




    end

    if rset then 


      if ybb<=0 then 
        love.graphics.setColor(br,bg,bb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.btile, ((1440-tileoffset+rn-ybindent)/1440)*screenwidth, ((tileyoffset+74)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)


      if ygg<=0 then 
        love.graphics.setColor(gr,gg,gb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.gtile, ((1440-tileoffset+rn+9-ygindent)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)


      if ypp<=0 then 
        love.graphics.setColor(pr,pg,pb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.ptile, ((1440-tileoffset+rn+18-ypindent)/1440)*screenwidth, ((tileyoffset+202)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)

      if yyy<=0 then 
        love.graphics.setColor(yer,yeg,yeb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.ytile, ((1440-tileoffset+rn+27-yyindent)/1440)*screenwidth, ((tileyoffset+266)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)



      if yss<=0 then 
        love.graphics.setColor(sr,sg,sb,255)
      else love.graphics.setColor(255,255,255,255)
      end
      love.graphics.draw(enviro.stile, ((1440-tileoffset+rn+36-ysindent)/1440)*screenwidth, ((tileyoffset+330)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)



      if youchoosecolor then

        ybindent, ygindent, ypindent, yyindent, ysindent = 0,0,0,0,0

        if youseleccurrent == 0 then ybindent = 20
        elseif youseleccurrent == 1 then ygindent = 20
        elseif youseleccurrent == 2 then ypindent = 20
        elseif youseleccurrent == 3 then yyindent = 20
        elseif youseleccurrent == 4 then ysindent = 20
        end

        if you.down and yr2c and ysy < (screenheight * .46) then 
          ysy = ysy + (screenheight * .15)
          yr2c = false
          youseleccurrent = youseleccurrent+1
          mov2:play()
        elseif you.up and yr2c and ysy > (screenheight * .14) then 
          ysy = ysy - (screenheight * .15)
          yr2c = false
          youseleccurrent = youseleccurrent - 1
          mov2:play()
        elseif not you.down and not you.up then yr2c = true
        end
      end





    end

    if r1 + g1 + b1 == 765 then a11flick = icflicker
    else a11flick = 255 end
    if a21g + a21r + a21b == 765 then a21flick = icflicker
    else a21flick = 255 end
    if a31g + a31r + a31b == 765 then a31flick = icflicker
    else a31flick = 255 end
    if a41g + a41r + a41b == 765 then a41flick = icflicker
    else a41flick = 255 end

    if r2 + g2 + b2 == 765 then a12flick = icflicker
    else a12flick = 255 end
    if a22g + a22r + a22b == 765 then a22flick = icflicker
    else a22flick = 255 end
    if a32g + a32r + a32b == 765 then a32flick = icflicker
    else a32flick = 255 end
    if a42g + a42r + a42b == 765 then a42flick = icflicker
    else a42flick = 255 end



    if rset and lset then


      love.graphics.setColor(r1,g1,b1,a11flick)
      love.graphics.draw(enviro.a1, ((252+33-ln)/1440)*screenwidth, ((65)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((141)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)

      love.graphics.setColor(a21r,a21g,a21b,a21flick)
      love.graphics.draw(enviro.a2, ((232+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.vert, ((388+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)

      love.graphics.setColor(a31r,a31g,a31b,a31flick)
      love.graphics.draw(enviro.a3, ((336+33-ln)/1440)*screenwidth, ((85)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.vert, ((401+33-ln)/1440)*screenwidth, ((145)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)

      love.graphics.setColor(a41r,a41g,a41b,a41flick)
      love.graphics.draw(enviro.a4, ((252+33-ln)/1440)*screenwidth, ((170)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.horiz, ((392+33-ln)/1440)*screenwidth, ((154)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)


      love.graphics.setColor(r2,g2,b2,a12flick)
      love.graphics.draw(enviro.a1, ((252 + 720+rn)/1440)*screenwidth, (65/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (141/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)


      love.graphics.setColor(a22r,a22g,a22b,a22flick)
      love.graphics.draw(enviro.a2, ((232 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.vert, ((388 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)


      love.graphics.setColor(a32r,a32g,a32b,a32flick)
      love.graphics.draw(enviro.a3, ((336 + 720+rn)/1440)*screenwidth, (85/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.vert, ((401 + 720+rn)/1440)*screenwidth, (145/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)

      love.graphics.setColor(a42r,a42g,a42b,a42flick)
      love.graphics.draw(enviro.a4, ((252 + 720+rn)/1440)*screenwidth, (170/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.horiz, ((392 + 720+rn)/1440)*screenwidth, (154/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(255,255,255,255)


      love.graphics.draw(mecurrentframe, ((232-7-ln)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      love.graphics.setColor(155, 155, 155, 255)
      love.graphics.draw(youcurrentframe, ((488 + 720 +7+rn)/1440)*screenwidth, ((262-6)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)
      love.graphics.setColor(a31r,a31g,a31b,255)
      if mecurrentframe == enviro.pframe then 
        love.graphics.draw(me.face, ((240-7 + 45-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      elseif mecurrentframe == enviro.bframe then 
        love.graphics.draw(me.face, ((232-7 + 47-ln)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      elseif mecurrentframe == enviro.sframe then 
        love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)

      else
        love.graphics.draw(me.face, ((234-7 + 47-ln)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      end

      love.graphics.setColor(a22r,a22g,a22b,255)
      if youcurrentframe == enviro.pframe then
        love.graphics.draw(you.face, ((1440-240-45-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      elseif youcurrentframe == enviro.bframe then
        love.graphics.draw(you.face, ((1440-232-47-13.5+7+rn)/1440)*screenwidth, ((262-6+128)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      elseif youcurrentframe == enviro.sframe then
        love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+130)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      else
        love.graphics.draw(you.face, ((1440-234-47-13.5+7+rn)/1440)*screenwidth, ((262-6+127)/900)*screenheight,0, screenwidth/1080, screenheight/675)
      end
      --why is this here? love.graphics.draw(face1, ((232+720)/1440)*screenwidth, (600/900)*screenheight, 0, screenwidth, screenheight)

      wa = 36 + 18



      if youchooseface then

        --- -10

        love.graphics.draw(slantbar, screenwidth, 0, 0 ,-screenwidth/1440, screenheight/900) 
        love.graphics.setColor(yf1r, yf1g, yf1b, 255)
        love.graphics.draw(face1, ((1440 - 40-70)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(yf2r, yf2g, yf2b, 255)
        love.graphics.draw(face2, ((1440 - 40-70 - 8)/1440)*screenwidth, ((tileyoffset+138 + 56)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(yf3r, yf3g, yf3b, 255)
        love.graphics.draw(face3, ((1440 - 40-70 - 16)/1440)*screenwidth, ((tileyoffset+138 + 56*2)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(yf4r, yf4g, yf4b, 255)
        love.graphics.draw(face4, ((1440 - 40-70 - 8*3)/1440)*screenwidth, ((tileyoffset+138 + 56*3)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(yf5r, yf5g, yf5b, 255)
        love.graphics.draw(face5, ((1440 - 40-70 - 8*4)/1440)*screenwidth, ((tileyoffset+138 + 56*4)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(yf6r, yf6g, yf6b, 255)
        love.graphics.draw(face6, ((1440 - 40-70 - 8*5)/1440)*screenwidth, ((tileyoffset+138 + 56*5)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)



        love.graphics.setColor(a22r, a22g, a22b, 255)
        love.graphics.draw(faceselector, ((1440 - 40 - 70 - 2 + 82 - (8 * youfaceselector))/1440)*screenwidth, ((tileyoffset+138 - 10 + 56*youfaceselector)/900)*screenheight, 0, -screenwidth/1440, screenheight/900)

      end
      if mechooseface then

        love.graphics.draw(slantbar, 0, 0, 0 ,screenwidth/1440, screenheight/900) 


        love.graphics.setColor(mf1r, mf1g, mf1b, 255)
        love.graphics.draw(face1, ((70)/1440)*screenwidth, ((tileyoffset+138)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(mf2r, mf2g, mf2b, 255)
        love.graphics.draw(face2, ((70 + 8)/1440)*screenwidth, ((tileyoffset+138 + 56)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(mf3r, mf3g, mf3b, 255)
        love.graphics.draw(face3, ((70 + 16)/1440)*screenwidth, ((tileyoffset+138 + 56*2)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(mf4r, mf4g, mf4b, 255)
        love.graphics.draw(face4, ((70 + 8*3)/1440)*screenwidth, ((tileyoffset+138 + 56*3)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(mf5r, mf5g, mf5b, 255)
        love.graphics.draw(face5, ((70 + 8*4)/1440)*screenwidth, ((tileyoffset+138 + 56*4)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)
        love.graphics.setColor(mf6r, mf6g, mf6b, 255)
        love.graphics.draw(face6, ((70 + 8*5)/1440)*screenwidth, ((tileyoffset+138 + 56*5)/900)*screenheight, 0, 4*screenwidth/1440, 4*screenheight/900)

        love.graphics.setColor(a31r, a31g, a31b, 255)
        love.graphics.draw(faceselector, ((30 + (8 * mefaceselector))/1440)*screenwidth, ((tileyoffset+138 - 10 + 56*mefaceselector)/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      end



      --22
      if youreadytoplay then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(ready, ((267 + 720 +rn)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      end

      if mereadytoplay then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(ready, ((300-ln)/1440)*screenwidth, (107/900)*screenheight, 0, screenwidth/1440, screenheight/900)
      end







      drawspine()

      --drawtriangles()

    end


  end