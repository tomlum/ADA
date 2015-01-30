
function modesstuff()
  mov:setVolume(SFXV - .3)
  openingsong:setPitch(sfade/255)

  if (me.right or you.right) and modenum < 1 then modenum = modenum + 1 mov:play()
  elseif (me.left or you.left) and modenum > 0 then modenum = modenum - 1 mov:play()	
  end

  if modenum == 0 then 
    themode = "roulette"
    facade = mode2

  elseif modenum == 1 then 
    themode = "classic"
    facade = mode1
  end

  if c1accept() or c2accept() then 
    MENU ="prestage"
    wavesound:play()
  end
end

function stagestuff()
  mov:setVolume(SFXV - .3)
          openingsong:setPitch(sfade/255)
          if MENU == "prestage" then 
            if stagey == 0 then adastartfade = true end
            if stagey > 80 then stagey = stagey + .5
              oscillator = -screenheight/90
            elseif stagey > 50 then stagey = stagey + 1
              oscillator = -screenheight/100
            else
              stagey = stagey + 1.5
              oscillator = -screenheight/90
            end

            if stagey > 100 then MENU = "stage" oscillator = 5
            end

          end

          if not me.left and not me.right and not you.left and not you.right then r2ss = true
          end

          if (me.left or you.left) and MENU == "stage" and not startsfade and stagenum > 0 and r2ss then stagenum = stagenum - 1	mov:play() r2ss = false
          elseif (me.right or you.right) and MENU == "stage" and not startsfade and stagenum < 2 and r2ss then stagenum = stagenum + 1	 mov:play() r2ss = false
          end

          if sfade - 10 <= 0 then MENU = "prechoose" 
            sfade = 0
            mov:setVolume(SFXV - .7)
          elseif startsfade then sfade = sfade - 10
          elseif (c1accept() or c2accept()) and MENU == "stage" then
            if stagenum == 0 then themap = "street"
            elseif stagenum == 1 then themap = "library"
            elseif stagenum == 2 then themap = "floors"
            end
            startsfade = true
            startb:play()
          end

          if stagenum == 0 then themap = "street"
          elseif stagenum == 1 then themap = "library"
          elseif stagenum == 2 then themap = "floors"
          end
  
  
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

          if MENU == "postchoose" then
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
          then MENU = "prepan"
            yoffset = 0
            finishedLoading = false
            seperateSpines = false
          end
  
end


function panstuff()
  MENU = "pan"
        rset = false
        lset = false


        if enviro.dolly == 0 then
          if not mute then
            thesong:rewind()
            thesong:play()
          end
        elseif streetfadehold <= 0 then MENU = "preplay"
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

      if sfade == 255 and adafade <255 and (MENU == "title" or MENU == "modes") then adafade = adafade + 2.5  end

      if MENU == "prestage" and adafade - 3 < 0 then adafade = 0 adastartfade = false
      elseif adastartfade then adafade = adafade - 3
      end

      love.graphics.setColor(sfade,sfade,sfade,255)
      love.graphics.draw(enviro.sunback, 0, 0, 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.v3, 0, 0-stagey*(screenheight/400), 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(enviro.v2, 0, 0-stagey*(screenheight/375), 0, screenwidth/1440, screenheight/900)
      love.graphics.draw(facade, 0, 0-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/900)
      if MENU == "stage" then
        if stagenum == 0 then love.graphics.draw(enviro.stage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage1,(20/1440)*screenwidth, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
        if stagenum == 1 then love.graphics.draw(enviro.stage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage2, screenwidth/2.5, screenheight/2, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
        if stagenum == 2 then love.graphics.draw(enviro.stage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        else love.graphics.draw(enviro.bwstage3, screenwidth/1.6, screenheight/3, 0, screenwidth/1440/1.25, screenheight/900/1.5)
        end
      end
      drawwaves()
      love.graphics.setColor(255,255,255,adafade)
      love.graphics.draw(enviro.ada, 0, 0, 0,screenwidth/1440,screenheight/900)

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