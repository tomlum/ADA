

--IF Y DIF GREAT THEN GROW THE LINE MORE have an 'or' clause
--HAVE IT SPLIT VERT ALSO? if horiz is same but different vert?

--partition, the hole in the ceiling, the right edge of the apartment

var2tb = true
defhead2ceiling = 90
deffeet2bottom = 90
head2ceiling = defhead2ceiling
feet2bottom = deffeet2bottom
--danger 2 top bottom
danger2tb = dangerbarey

tolandr=0
--updated also later on
winheight = (lg.getHeight()-barheight)


defaultminzoom = .7
defaultmaxzoom = .5
minzoom = defaultminzoom
maxzoom = defaultmaxzoom
minzdis = lg.getWidth()
maxzdis = 4500

cscale = .7

growrate = .02
shrinkrate = .001

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
  rumbleme(me,z/10)
  rumbleme(you,z/10)
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
    tolandr = cscale*lg.getWidth()/4-2*lassowidth
      else
    tolandr = lg.getWidth()/14
    end


  else
    if tolandr - 1 > 0 then
      tolandr = tolandr/1.03
    else
      tolandr = 0
    end

  end


  if not dangerclose then
    if minzoom < defaultminzoom then
      if minzoom + shrinkrate > defaultminzoom then
        minzoom = defaultminzoom
        maxzoom = defaultmaxzoom
      else minzoom = minzoom + shrinkrate
        maxzoom = maxzoom + shrinkrate
      end

    elseif maxzoom > defaultminzoom then
      if minzoom - growrate < defaultminzoom then
        minzoom = defaultminzoom
        maxzoom = defaultmaxzoom
      else maxzoom = minzoom - growrate
        maxzoom = maxzoom - growrate
      end
    end
  else
    if maxzoom < dangerZoom then
      if minzoom + dangerZoomDelta > dangerZoom + (defaultminzoom-defaultmaxzoom) then
        minzoom = dangerZoom + (defaultminzoom-defaultmaxzoom)
        maxzoom = dangerZoom
      else minzoom = minzoom + dangerZoomDelta
        maxzoom = maxzoom + dangerZoomDelta
      end

    elseif maxzoom > dangerZoom then
      if minzoom - dangerZoomDelta < dangerZoom then
        minzoom = dangerZoom + (defaultminzoom-defaultmaxzoom)
        maxzoom = dangerZoom
      else minzoom = minzoom - dangerZoomDelta
        maxzoom = maxzoom - dangerZoomDelta
      end
    end
  end
end

function cammovement()
  

  cinemabars()

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

  winheight = (lg.getHeight()-barheight)
  camreturntozoom()
  beigedif = (winheight - head2ceiling - feet2bottom-120)
  jumpj = initjumpj * cscale/minzoom
  --
  jmax = initjmax * cscale/minzoom
  --basically min j

  ydif = math.abs((you.y-you.j) - (me.y-me.j))

  if ydif/cscale <= beigedif then
    vertone = true
  else vertone = false
  end

  if me.y <= you.y then 
    midypoint = (me.y + (ydif/2) + 30)
  else midypoint = (you.y + (ydif/2) + 30)
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



  if midypoint >= themap.floor - ((winheight/2) - (feet2bottom))*cscale
  then
    youcamfloor = true
    mecamfloor = true
  else
    youcamfloor=false
    mecamfloor = false
  end

  if themode == "fractal" then 
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





camerafol = function ()
  

  xdif = math.abs((you.x+you.v) - (me.x+me.v))
  absdis = math.sqrt(((you.y-me.y)^2)+((you.x-me.x)^2))




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



  if xdif <= screenwidth*cscale/2 + tolandr*2 then 
    onescreen = true
  else onescreen = false
  end




  --indicator function for when at wall, then midpoint becomes some other constant point

  if me.x <= you.x then midpoint = me.mid + (xdif/2)
  elseif you.x < me.x then midpoint = you.mid + (xdif/2)
  end


  mexrig = me.mid - (screenwidth*cscale*.25)+tolandr 
  youxrig = you.mid - (screenwidth*cscale*.75)-tolandr

  meyrig = me.y+60 - winheight*cscale + feet2bottom*cscale
  youyrig = you.y+60 - winheight*cscale + feet2bottom*cscale


  if not mecamfloor and you.y > me.y then 
    youyrig = you.y+60 - winheight*cscale + feet2bottom*cscale

  elseif youcamfloor 
  then
    youyrig = themap.floor - winheight*cscale + feet2bottom*cscale
  elseif not vertone and you.y < me.y then
    youyrig = you.y - head2ceiling*cscale
  end


  if not youcamfloor and you.y < me.y then 
    meyrig = me.y+60 - winheight*cscale + feet2bottom*cscale

  elseif mecamfloor 
  then
    meyrig = themap.floor - winheight*cscale + feet2bottom*cscale
  elseif not vertone and me.y < you.y then
    meyrig = me.y - head2ceiling*cscale
  end




  --removed cause stopping at edges is no
  -- if mecamlwall or youcamlwall then camera.x = 0
  -- end


  -- if mecamrwall or youcamrwall then camera2.x = enviro.rightwall-screenwidth*cscale
  -- end




  if you.x < me.x then

    youxrig = me.mid - (screenwidth*cscale*.75)-tolandr 
    mexrig = you.mid - (screenwidth*cscale*.25)+tolandr

    tempyrig = meyrig
    meyrig = youyrig
    youyrig = tempyrig






    if camera.xfollow 
    then
      tempxfol = true
    else tempxfol = false
    end

    if camera.yfollow 
    then
      tempyfol = true
    else tempyfol = false
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
    camera.y = midypoint - (winheight/2)*cscale
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
  else wallx = 0

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

  topbottomcam()
  camera.x = camera.x + camwobx
  camera2.x = camera2.x + camwobx
  camera.y = camera.y + camwoby
  camera2.y = camera2.y + camwoby

end




twidth = 0
topy = 0


--length of horiz bar is related to xdif, thickness related to ydif

function topbottomcam()

  if me.y < you.y then 


    topy = 0
    bottomy = winheight/2

  else


    bottomy = 0
    topy = winheight/2

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

  if menu ~= "retry" then
    tods()

    local pzoom2 = 1+(1-math.sqrt(math.sqrt(cscale)))
    lg.draw(enviro.sky, xx.x, 0, 0, 500, 1.1)
    --lg.draw(enviro.sky, camera.x, camera.y/1.1, 0, 500, 1.1)

    if not fightclub and themap.paralaxscale2 ~= nil then
      blurdraw(blur_scale1, function()
          lg.draw(enviro.paralax2, 
            (xx.x+(screenwidth/4)*cscale*pzoom2+paralaxcamshake)*(1-themaps[mapNum].paralaxscale2*pzoom2)
            -(500*(1-themaps[mapNum].paralaxscale2*pzoom2))
            ,
            (xx.y+(screenheight/2)*cscale+paralaxcamshake)*(1-themaps[mapNum].paralaxscale2*pzoom2)+(feet2bottom-paralaxoffset)*(cscale*(1-themaps[mapNum].paralaxscale2*pzoom2)),
            0,
            pzoom2,
            pzoom2)

        end)
    end





    local pzoom = 1+(1-math.sqrt(cscale))
    if themap.paralaxscale ~= nil then
      if themap.rotation ~= nil then
        
        local ps = themap.paralaxscale
        local ips = 1/ps
        
        
        local xoffset = 0
        local yoffset = 0
        if math.deg(themap.rotation)%360 < 10 then
        xoffset = (100)*themap.paralaxscale
        
        yoffset = (100)*themap.paralaxscale
      elseif math.deg(themap.rotation)%360 < 100 then
        yoffset = (themap.height+100)*themap.paralaxscale
        xoffset = (100)*themap.paralaxscale
      elseif math.deg(themap.rotation)%360 < 190 then
        xoffset = (themap.width+100)*themap.paralaxscale
        yoffset = (themap.height+100)*themap.paralaxscale
    elseif math.deg(themap.rotation)%360 < 280 then
        xoffset = (themap.width+100)*themap.paralaxscale  
        yoffset = (100)*themap.paralaxscale
        end
       blurdraw(blur_scale1, function()

            lg.draw(themap.paralax, 
              (xx.x+(screenwidth/2)*cscale*pzoom+paralaxcamshake)*(1-themap.paralaxscale*pzoom)
              
              -(50*(1-themap.paralaxscale*pzoom))
              ,
              (xx.y+(screenheight/2)--*pzoom
                *cscale+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themap.paralaxscale*pzoom))
              
              -(50*(1-themap.paralaxscale*pzoom))
              ,
              themap.rotation,
              pzoom,
              pzoom,
              xoffset,
              yoffset)

          end)
--[[
        if math.deg(themap.rotation)%360 < 80 then     
          lg.draw(themap.paralax, 
            (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-themap.paralaxscale*pzoom),
            (xx.y+(screenheight/2)--*pzoom
              *cscale+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themap.paralaxscale*pzoom)),
            themap.rotation,
            pzoom,
            pzoom)

        elseif math.deg(themap.rotation)%360 < 170 then

          lg.draw(themap.paralax, 
            (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+themap.height,
            (xx.y+(screenheight/2)--*pzoom
              *cscale+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themap.paralaxscale*pzoom))
            
            ,
            themap.rotation,
            pzoom,
            pzoom)


        elseif math.deg(themap.rotation)%360 < 260 then     
          lg.draw(themap.paralax, 
            (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+themap.width,
            (xx.y+(screenheight/2)--*pzoom
              *cscale+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themap.paralaxscale*pzoom))+themap.height,
            themap.rotation,
            pzoom,
            pzoom)
          
          elseif math.deg(themap.rotation)%360 < 360 then     
           lg.draw(themap.paralax, 
            (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-themap.paralaxscale*pzoom),
            (xx.y+(screenheight/2)--*pzoom
              *cscale+paralaxcamshake)*(1-themap.paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themap.paralaxscale*pzoom))+themap.width,
            themap.rotation,
            pzoom,
            pzoom)

      end
      ]]--
      
      

      else

        blurdraw(blur_scale1, function()

            lg.draw(enviro.paralax, 
              (xx.x+(screenwidth/4)*cscale*pzoom+paralaxcamshake)*(1-themaps[mapNum].paralaxscale*pzoom)
              -(500*(1-themaps[mapNum].paralaxscale*pzoom)),
              (xx.y+(screenheight/2)--*pzoom
                *cscale+paralaxcamshake)*(1-themaps[mapNum].paralaxscale*pzoom)+(feet2bottom-paralaxoffset)*(cscale*(1-themaps[mapNum].paralaxscale*pzoom)),
              0,
              pzoom,
              pzoom)

          end)
      end
    end



    --[[
    for i = 0, .9, .1 do

      blurdraw(blur_scale1, function()
          lg.draw(p, 
            (xx.x+(screenwidth/2)*cscale+rob)*(1-i),
            (xx.y+(screenheight/2)*cscale+rob)*(1-i)+(feet2bottom-paralaxoffset)*(cscale*(1-i)),
            0,
            i,
            i)
        end)
    end
    ]]--

    --[[
    blurdraw(.0002/cscale, function()
        lg.draw(p, 
          xx.x*.75,
          xx.y*.75+feet2bottom*(cscale/.75),
          0,
          1/4,
          1/4)
      end)
    ]]--

    cclear()


    tods() 
    if themap.rotation~=nil then
      if math.deg(themap.rotation)%180 > 80 then
        lg.draw(themap.stage, themap.height/2, themap.width/2, themap.rotation, 1, 1, themap.width/2, themap.height/2)
        drawbackgroundbox(0,0,-500,themap.width)
        drawbackgroundbox(themap.height,0,500,themap.width)
        drawbackgroundbox(-500,0,themap.height+1000,-500)
        drawbackgroundbox(-500,themap.width,themap.height+1000,500)
      else
        lg.draw(themap.stage, themap.width/2, themap.height/2, themap.rotation, 1, 1, themap.width/2, themap.height/2)
        drawbackgroundbox(0,0,-500,themap.height)
        drawbackgroundbox(themap.width,0,500,themap.height)
        drawbackgroundbox(-500,0,themap.width+1000,-500)
        drawbackgroundbox(-500,themap.height,themap.width+1000,500)
      end
      
      
    else
      lg.draw(enviro.stage, 0, 0)
    end

    --lg.draw(enviro.stage, 0, 0) 
    if themap.name == "street" then
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
  if menu ~= "retry" then

    drawparticles()
    lg.setShader()

    mondraw()
  end
  if themode == "koth" then
    drawhighlight()
    if menu == "retry" then
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

  if menu ~= "retry" then
    if themap.facade~=nil then
      lg.draw(themap.facade,0,0)
    end
    lg.setShader()
    cclear()


    if themap.name == "street" then
      drawstreetstuff()
    elseif themap.name == "library" then
      drawlibrarystuff()
    elseif themap.name == "floors" then
      drawfloorsstuff()
    end
    if drawboxes then drawHexBoxes() end
  end

end


hitpausecounter = 0
bloom_bar_min = 10
bloom_bar_max = 50

function pauseonhit()
  if hitpausecounter > hitpauseamount/2 and hitpause then
    hitpausecounter = 0
    hitpause = false
  elseif hitpause then
    if hitpausecounter == 0 then
      hitpausecounter = -hitpauseamount/2+.01
      topblossombar = 
      {
        0, 0,
        lg.getWidth(), 0,
        lg.getWidth(), floRan(bloom_bar_min,bloom_bar_max),
        0, floRan(bloom_bar_min,bloom_bar_max)
      }

      bottomblossombar = 
      {
        0, lg.getHeight(),
        lg.getWidth(), lg.getHeight(),
        lg.getWidth(), lg.getHeight()-floRan(bloom_bar_min,bloom_bar_max),
        0, lg.getHeight()-floRan(bloom_bar_min,bloom_bar_max)
      }


      leftblossombar = 
      {
        0, 0,
        floRan(bloom_bar_min,bloom_bar_max), 0,
        floRan(bloom_bar_min,bloom_bar_max), lg.getHeight(),
        0, lg.getHeight()
      }

      rightblossombar = 
      {
        lg.getWidth(), 0,
        lg.getWidth()-floRan(bloom_bar_min,bloom_bar_max), 0,
        lg.getWidth()-floRan(bloom_bar_min,bloom_bar_max), lg.getHeight(),
        lg.getWidth(), lg.getHeight()
      }
    end
    for i,xx in ipairs(players) do
      if not xx.flinch then
        setColorA(xx.color.c, 155*math.abs((math.abs(hitpausecounter)-(hitpauseamount/2)))/(hitpauseamount/2))
      end
    end
    lg.polygon("fill", topblossombar)
    lg.polygon("fill", bottomblossombar)
    lg.polygon("fill", leftblossombar)
    lg.polygon("fill", rightblossombar)
    blooms:update()

    hitpausecounter = hitpausecounter+1
  end
end
