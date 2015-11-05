--playheight = screenheight-health_bar_height



paralaxoffset = 40
var2tb = true
defhead2ceiling = 90
deffeet2bottom = 90
head2ceiling = defhead2ceiling
feet2bottom = deffeet2bottom
--danger 2 top bottom
danger2tb = dangerbarey

--After dangerclose this makes it so 
--xdis necessary for separation is greater
--after separation, camera returns smoothly to 
camera_center_offset=0

defaultminzoom = .7
defaultmaxzoom = .5
minzoom = defaultminzoom
maxzoom = defaultmaxzoom
minzdis = lg.getWidth()
maxzdis = 4500

cscale = .7

growrate = .02
shrinkrate = .001
maxhealth = 1

function updateScreenInfo()
  screenwidth = lg.getWidth()
  screenheight = lg.getHeight()
  if MODE == "play" then
    playheight = screenheight - health_bar_height
    healthratio = (screenwidth/2)/maxhealth
  end
end

function drawcolorstuff(xx)
  spikedraw(xx)
  boltdraw(xx)

  if xx.drawslash then
    lg.setShader(fillshader)
    fillshader:send("shade", 
      vct(thecolors[xx.currentc].c
        ))
    if xx.im.sdir ~= nil then
      lg.draw(xx.im.slash,xx.mid,
        xx.y, -math.rad(90), 1, 1, 0, 36)

    else
      lg.draw(xx.im.slash,xx.mid +15*xx.lr,
        xx.y, 0,xx.lr, 1)

    end

    lg.setShader()
  end

end

function shakez(z)
  shakeboth = true
  rumbleme(me,z/5)
  rumbleme(you,z/5)
  if dangerclose then
    minzoom = dangerZoom + (defaultminzoom-defaultmaxzoom) - dangerZoomDelta * 10*z
    maxzoom = dangerZoom  - dangerZoomDelta * 10*z

  else
    minzoom = defaultminzoom - growrate*z
    maxzoom = defaultmaxzoom - growrate*z
  end
end


function camreturntozoom()

  if onescreen and vertone then
    if lasso then 
      camera_center_offset = cscale*lg.getWidth()/4-2*lassowidth
    else
      camera_center_offset = lg.getWidth()/14
    end


  else
    if camera_center_offset - 1 > 0 then
      camera_center_offset = camera_center_offset/1.03
    else
      camera_center_offset = 0
    end

  end


  if not dangerclose then
    if minzoom < defaultminzoom then
      if minzoom + shrinkrate > defaultminzoom then
        minzoom = defaultminzoom
        maxzoom = defaultmaxzoom
      else 
        minzoom = minzoom + shrinkrate
        maxzoom = maxzoom + shrinkrate
      end

    elseif maxzoom > defaultminzoom then
      if minzoom - growrate < defaultminzoom then
        minzoom = defaultminzoom
        maxzoom = defaultmaxzoom
      else 
        maxzoom = minzoom - growrate
        maxzoom = maxzoom - growrate
      end
    end
  else
    if maxzoom < dangerZoom then
      if minzoom + dangerZoomDelta > dangerZoom + (defaultminzoom-defaultmaxzoom) then
        minzoom = dangerZoom + (defaultminzoom-defaultmaxzoom)
        maxzoom = dangerZoom
      else 
        minzoom = minzoom + dangerZoomDelta
        maxzoom = maxzoom + dangerZoomDelta
      end

    elseif maxzoom > dangerZoom then
      if minzoom - dangerZoomDelta < dangerZoom then
        minzoom = dangerZoom + (defaultminzoom-defaultmaxzoom)
        maxzoom = dangerZoom
      else 
        minzoom = minzoom - dangerZoomDelta
        maxzoom = maxzoom - dangerZoomDelta
      end
    end
  end
end

function cammovement()

  cinemabars()
  camreturntozoom()

  if dangerclose and var2tb then

    if head2ceiling > danger2tb
      then
      head2ceiling = head2ceiling/1.01

    else
      head2ceiling = danger2tb
    end


    if feet2bottom > danger2tb and not bothfloor
      then
      feet2bottom = feet2bottom/1.01

    elseif not bothfloor then
      feet2bottom = danger2tb
    end

  else
    if head2ceiling < defhead2ceiling 
      then
      local change = math.log(defhead2ceiling-head2ceiling)/3
      head2ceiling = head2ceiling + change
    else
      head2ceiling = defhead2ceiling
    end

    if feet2bottom < deffeet2bottom 
      then
      local change = math.log(deffeet2bottom-feet2bottom)/1.5
      feet2bottom = feet2bottom + change
    else
      feet2bottom = deffeet2bottom
    end

  end


  beigedif = (playheight - head2ceiling - feet2bottom-120)
  jumpj = initjumpj * cscale/minzoom
  --
  jmax = initjmax * cscale/minzoom
  --basically min j

  ydif = math.abs((you.y-you.j) - (me.y-me.j))

  if ydif/cscale <= beigedif then

    if no_screen_follow then 
    else
      vertone = true
    end
  else 
    vertone = false
  end

  if me.y <= you.y then 
    midypoint = (me.y + (ydif/2) + 30)
  else 
    midypoint = (you.y + (ydif/2) + 30)
  end


  --removed cause stopping at edges is no
  -- if you.mid + you.v < screenwidth*cscale/4
  -- then 
  -- camera2.xfollow = false
  -- youcamlwall = true


  -- elseif you.mid + you.v > enviro.rightwall-screenwidth*cscale/4
  -- then camera2.xfollow = false
  -- youcamrwall = true
  -- else camera2.xfollow = true
  --   youcamlwall = false
  -- end



  if midypoint >= the_map.floor - ((playheight/2) - (feet2bottom))*cscale
    then
    youcamfloor = true
    mecamfloor = true
  else
    youcamfloor=false
    mecamfloor = false
  end

  if game_mode == "fractal" or no_screen_follow then 
    mecamfloor = false
    youcamfloor = false
  end
  --removed cause stopping at edges is no
  -- if me.mid + me.v < screenwidth*cscale/4
  -- then 
  --   camera.xfollow = false
  --   mecamlwall = true


  -- elseif me.mid + me.v > enviro.rightwall-screenwidth*cscale/4
  -- then camera.xfollow = false
  -- mecamrwall = true
  -- else camera.xfollow = true
  --   mecamlwall = false
  -- end

end




midpoint = 0
onescreen = false
vertone = false
oldonescreen = false
oldvertone = false
ydif = 0
beigedif = 0





function camerafol()

  if not no_screen_follow then
    xdif = math.abs((you.x+you.v) - (me.x+me.v))
    absdis = math.sqrt(((you.y-me.y)^2)+((you.x-me.x)^2))
  else
    xdif = 0
    absdis = 0
  end

  if absdis <= minzdis
    then cscale = maxzoom
  elseif absdis > maxzdis then
    cscale = minzoom
  elseif absdis > minzdis then
    cscale = ((minzoom-maxzoom)*((absdis-minzdis)/(maxzdis-minzdis))) + maxzoom

  end 


  camera2.scaleX = cscale
  camera2.scaleY = cscale

  camera.scaleX = cscale
  camera.scaleY = cscale



  if xdif <= screenwidth*cscale/2 + camera_center_offset*2 then 
    if no_screen_follow then 
    else
      onescreen = true
    end
    else onescreen = false
    end




    --indicator function for when at wall, then midpoint becomes some other constant point

    if me.x <= you.x then midpoint = me.mid + (xdif/2)
    elseif you.x < me.x then midpoint = you.mid + (xdif/2)
    end


    mexrig = me.mid - (screenwidth*cscale*.25) + camera_center_offset 
    youxrig = you.mid - (screenwidth*cscale*.75) - camera_center_offset


    meyrig = me.y+60 - playheight*cscale + feet2bottom*cscale
    youyrig = you.y+60 - playheight*cscale + feet2bottom*cscale


    if not mecamfloor and you.y > me.y then 
      youyrig = you.y+60 - playheight*cscale + feet2bottom*cscale

    elseif youcamfloor 
      then
      youyrig = the_map.floor - playheight*cscale + feet2bottom*cscale
    elseif not vertone and you.y < me.y then
      youyrig = you.y - head2ceiling*cscale
    end


    if not youcamfloor and you.y < me.y then 
      meyrig = me.y+60 - playheight*cscale + feet2bottom*cscale

    elseif mecamfloor 
      then
      meyrig = the_map.floor - playheight*cscale + feet2bottom*cscale
    elseif not vertone and me.y < you.y then
      meyrig = me.y - head2ceiling*cscale
    end



    --removed cause stopping at edges is no
    -- if mecamlwall or youcamlwall then camera.x = 0
    -- end


    -- if mecamrwall or youcamrwall then camera2.x = enviro.rightwall-screenwidth*cscale
    -- end


    if you.x < me.x and not no_screen_follow then

      youxrig = me.mid - (screenwidth*cscale*.75)-camera_center_offset 
      mexrig = you.mid - (screenwidth*cscale*.25)+camera_center_offset

      tempyrig = meyrig
      meyrig = youyrig
      youyrig = tempyrig






      if camera.xfollow 
        then
        tempxfol = true
      else 
        tempxfol = false
      end

      if camera.yfollow 
        then
        tempyfol = true
      else 
        tempyfol = false
      end
      camera.xfollow = camera2.xfollow
      camera.yfollow = camera2.yfollow
      camera2.xfollow = tempxfol
      camera2.yfollow = tempyfol
    end










    if camera.xfollow then
      camera.x = mexrig
    end

    camera.y = meyrig




    if camera2.xfollow then
      camera2.x = youxrig
    end 

    camera2.y = youyrig





    if onescreen 
      then 

      camera.x = midpoint - screenwidth*cscale/2
      camera2.x = camera.x


    end

    if camera.x <= 0 and camera2.x <= 0 then 
      --removed cause stopping at edges is no
      -- camera.x = 0 
      -- camera2.x = camera.x

    elseif camera2.x + screenwidth*cscale >= enviro.rightwall and camera.x + screenwidth*cscale >= enviro.rightwall then
      --removed cause stopping at edges is no
      -- camera2.x = enviro.rightwall - screenwidth*cscale 
      -- camera.x = camera2.x
    end

    --if one screen and leftwall then midpoint = some fixed point away from the wall

    bothfloor = youcamfloor and mecamfloor


    if vertone and not bothfloor then 
      camera.y = midypoint - (playheight/2)*cscale
      camera2.y = camera.y  
    end






    --the middle wall thing, divider

    if camera.x <= 0 or camera2.x + screenwidth*cscale >= enviro.rightwall then
      --removed cause stopping at edges is no
      -- then xdif = math.abs((camera.x) - (camera2.x)) + screenwidth*cscale/2
    end

    if xdif > screenwidth*cscale then 
      width = 1.3
      wallx = (screenwidth/2 - 7) + ((1-width) * 7)
    elseif xdif <= screenwidth*cscale/2 then 
      width = 0
    elseif xdif > screenwidth*cscale/2 then 
      width = (xdif - screenwidth*cscale/2)/(screenwidth*cscale/2) + .3
      wallx = (screenwidth/2 - 7) + ((1-width) * 7)
    else 
      wallx = 0

    end

    if onescreen then width = 0
      wallx = 0
    end

    if ydif/cscale > beigedif*4 then 
      bwidth = 15
    elseif ydif/cscale >= beigedif  then
      bwidth =1 + ((ydif/cscale-beigedif)/(beigedif*4)) * 15

    elseif ydif/cscale <= beigedif
      then
      bwidth = 0



    end 

    if no_screen_follow then
      camera.y = me.y+60 - playheight*cscale + feet2bottom*cscale
      camera2.y = you.y+60 - playheight*cscale + feet2bottom*cscale
    end

    topbottomcam()
    camera.x = camera.x + camwobx
    camera2.x = camera2.x + camwobx
    camera.y = camera.y + camwoby
    camera2.y = camera2.y + camwoby
    camerawobble()


  end




  twidth = 0
  topy = 0


  --length of horiz bar is related to xdif, thickness related to ydif

  function topbottomcam()

    if me.y < you.y then 


      topy = 0
      bottomy = playheight/2

    else


      bottomy = 0
      topy = playheight/2

    end

    if xdif <= screenwidth*cscale/4 then 
      twidth = (screenwidth/2)
    elseif xdif < screenwidth*cscale/2 then
      twidth = (screenwidth/2) - ((xdif-screenwidth*cscale/4)/(screenwidth*cscale/4))*(screenwidth/2)
      --twidth = screenwidth*cscale/2- ((xdif-screenwidth*cscale/4)/((screenwidth*cscale/2)-screenwidth*cscale/4))*(screenwidth*cscale/2)
    else 
      twidth = 0 
    end


  end









  camera = {}
  camera.x = 0
  camera.y = 1300 - 3 - 510
  camera.scaleX = cscale
  camera.scaleY = cscale
  camera.rotation = 0
  camera.xfollow = true
  camera.yfollow = true

  function camera:set()
    lg.push()
    lg.rotate(-self.rotation)
    lg.scale(1 / self.scaleX, 1 / self.scaleY)
    lg.translate(-self.x, -self.y)
  end

  function camera:unset()
    lg.pop()
  end

  function camera:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
  end

  function camera:rotate(dr)
    self.rotation = self.rotation + dr
  end

  function camera:scale(sx, sy)
    sx = sx or 1
    self.scaleX = self.scaleX * sx
    self.scaleY = self.scaleY * (sy or sx)
  end

  function camera:setPosition(x, y)
    self.x = x or self.x
    self.y = y or self.y
  end

  function camera:setScale(sx, sy)
    self.scaleX = sx or self.scaleX
    self.scaleY = sy or self.scaleY

  end





  camera2 = {}
  camera2.x = 0
  camera2.y = 1300 - 3 - 510
  camera2.scaleX = cscale
  camera2.scaleY = cscale
  camera2.rotation = 0
  camera2.xfollow = true
  camera2.yfollow = true

  function camera2:set()
    lg.push()
    lg.rotate(-self.rotation)
    lg.scale(1 / self.scaleX, 1 / self.scaleY)
    lg.translate(-self.x, -self.y)
  end

  function camera2:unset()
    lg.pop()
  end

  function camera2:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
  end

  function camera2:rotate(dr)
    self.rotation = self.rotation + dr
  end

  function camera2:scale(sx, sy)
    sx = sx or 1
    self.scaleX = self.scaleX * sx
    self.scaleY = self.scaleY * (sy or sx)
  end

  function camera2:setPosition(x, y)
    self.x = x or self.x
    self.y = y or self.y
  end

  function camera2:setScale(sx, sy)
    self.scaleX = sx or self.scaleX
    self.scaleY = sy or self.scaleY
  end

  --lower = more wobble
  cam_wobble_degree = 100
  camwob_max = 10
  camwobx = 0
  camwoby = 0
  camwobv = 0
  camwobj = 0
  camwobvflip = -1
  camwobjflip = -1

  function camerawobble()
    if dangerclose then

      camwobv = camwobv+camwobvflip*floRan(.1, .2)
      if camwobv > camwob_max-floRan(0, camwob_max/5)  then
        camwobvflip = -1
        camwobv = -camwobv/2
      elseif camwobv < -camwob_max + floRan(0, camwob_max/5) then
        camwobvflip = 1
        camwobv = -camwobv/2
      end


      camwobj = camwobj+camwobjflip*floRan(.1, .2)
      if camwobj > camwob_max-floRan(0, camwob_max/5) then 
        camwobjflip = -1
        camwobj = -camwobj/2
      elseif camwobj < -camwob_max + floRan(0, camwob_max/5) then
        camwobjflip = 1
        camwobj = -camwobj/2
      end

      camwobx = bof(-camwob_max, camwobx+camwobv/cam_wobble_degree, camwob_max)
      camwoby = bof(-camwob_max, camwoby+camwobj/cam_wobble_degree, camwob_max)
    else
      camwobx = 0
      camwoby = 0
    end
  end


  paralaxshaketimer = 0
  paralaxcamshake = 0
  function drawx(xx)


    local blur_scale1 = 1/1000*cscale^2
    local rob = 0
    if paralaxshake then
      paralaxshaketimer = 4
    end
    if paralaxshaketimer > 0 then
      paralaxshaketimer = paralaxshaketimer - 1
      paralaxcamshake = shakedis*math.random(-3,3)*math.random()
    end

    paralaxshake = false

    if MODE ~= "retry" then
      tods()

      local pzoom2 = 1+(1-math.sqrt(math.sqrt(cscale)))
      lg.draw(enviro.sky, xx.x, 0, 0, 500, 1.1)
      --lg.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)

      if not fightclub and the_map.paralaxscale2 ~= nil then
        blurdraw(blur_scale1, function()
          lg.draw(enviro.paralax2, 
            (xx.x+(screenwidth/4)*cscale*pzoom2+paralaxcamshake)*(1-the_maps[mapNum].paralaxscale2*pzoom2)
            -(500*(1-the_maps[mapNum].paralaxscale2*pzoom2))
            ,
            (xx.y+(screenheight/2)*cscale+paralaxcamshake)*(1-the_maps[mapNum].paralaxscale2*pzoom2)+(feet2bottom-paralaxoffset)*(cscale*(1-the_maps[mapNum].paralaxscale2*pzoom2)),
            0,
            pzoom2,
            pzoom2)
          end)
      end





      local pzoom = 1+(1-math.sqrt(cscale))
      if the_map.paralaxscale ~= nil then
        if the_map.rotation ~= nil then

          local ps = the_map.paralaxscale
          local ips = 1/ps


          local xoffset = 0
          local yoffset = 0
          if math.deg(the_map.rotation)%360 < 10 then
            xoffset = (100)*the_map.paralaxscale
            yoffset = (100)*the_map.paralaxscale
          elseif math.deg(the_map.rotation)%360 < 100 then
            yoffset = (the_map.height+100)*the_map.paralaxscale
            xoffset = (100)*the_map.paralaxscale
          elseif math.deg(the_map.rotation)%360 < 190 then
            xoffset = (the_map.width+100)*the_map.paralaxscale
            yoffset = (the_map.height+100)*the_map.paralaxscale
          elseif math.deg(the_map.rotation)%360 < 280 then
            xoffset = (the_map.width+100)*the_map.paralaxscale  
            yoffset = (100)*the_map.paralaxscale
          end
          blurdraw(blur_scale1, function()

            lg.draw(the_map.paralax, 
              (xx.x+(screenwidth/2)*cscale*pzoom+paralaxcamshake)*(1-the_map.paralaxscale*pzoom)

              -(50*(1-the_map.paralaxscale*pzoom))
              ,
              (xx.y+(screenheight/2)--*pzoom
                *cscale+paralaxcamshake)*(1-the_map.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-the_map.paralaxscale*pzoom))

              -(50*(1-the_map.paralaxscale*pzoom))
              ,
              the_map.rotation,
              pzoom,
              pzoom,
              xoffset,
              yoffset)

            end)



        else

          blurdraw(blur_scale1, function()

            lg.draw(enviro.paralax, 
              (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-the_maps[mapNum].paralaxscale*pzoom)
              -(500*(1-the_maps[mapNum].paralaxscale*pzoom)),
              (xx.y+(screenheight/2)--*pzoom
                *cscale+paralaxcamshake)*(1-the_maps[mapNum].paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-the_maps[mapNum].paralaxscale*pzoom)),
              0,
              pzoom,
              pzoom)

            end)
        end
      end



      cclear()


      tods() 
      if the_map.rotation~=nil then
        if math.deg(the_map.rotation)%180 > 80 then
          lg.draw(the_map.stage, the_map.height/2, the_map.width/2, the_map.rotation, 1, 1, the_map.width/2, the_map.height/2)
          drawbackgroundbox(0,0,-500,the_map.width)
          drawbackgroundbox(the_map.height,0,500,the_map.width)
          drawbackgroundbox(-500,0,the_map.height+1000,-500)
          drawbackgroundbox(-500,the_map.width,the_map.height+1000,500)
        else
          lg.draw(the_map.stage, the_map.width/2, the_map.height/2, the_map.rotation, 1, 1, the_map.width/2, the_map.height/2)
          drawbackgroundbox(0,0,-500,the_map.height)
          drawbackgroundbox(the_map.width,0,500,the_map.height)
          drawbackgroundbox(-500,0,the_map.width+1000,-500)
          drawbackgroundbox(-500,the_map.height,the_map.width+1000,500)
        end


      else
        lg.draw(enviro.stage, 0, 0)
      end

      --lg.draw(enviro.stage, 0, 0) 
      if mapNum == 1 then
        drawstreetprestuff()
      end
      lg.setShader()
    end

    drawbackparticles()

    if me.flinch then 

      drawPlayer(me)

      drawPlayer(you)

    else


      drawPlayer(you)

      drawPlayer(me)

    end
    if MODE ~= "retry" then

      drawparticles()
      lg.setShader()

      mondraw()
    end
    if game_mode == "koth" then
      drawhighlight()
      if MODE == "retry" then
        if me.score >= kothscoretowin then 
          kotharrowdraw(me)
        else
          kotharrowdraw(you)
        end
      else
        kotharrowdraw(me)
        kotharrowdraw(you)
      end
    end

    if MODE ~= "retry" then
      if the_map.facade~=nil then
        lg.draw(the_map.facade,0,0)
      end
      lg.setShader()
      cclear()


      if mapNum == 1 then
        drawstreetstuff()
      elseif mapNum == 2 then
        drawlibrarystuff()
      elseif mapNum == 3 then
        drawfloorsstuff()
      end
      if drawboxes then drawHexBoxes() end
    end

  end


  function drawbackgroundbox(x,y,w,h)
    lg.setBackgroundColor(backgroundcolor.r,backgroundcolor.g,backgroundcolor.b)
    lg.rectangle("fill", x, y, w, h)
  end
