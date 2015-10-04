

walklegs1 = {im = lg.newImage("me/walk/legs1.png")}
walklegs2 = {im = lg.newImage("me/walk/legs2.png")}
walklegs3 = {im = lg.newImage("me/walk/legs3.png")}
walklegs4 = {im = lg.newImage("me/walk/legs4.png")}
walklegs5 = {im = lg.newImage("me/walk/legs5.png")}

gahead = lg.newImage("me/attack/green/gahead.png")
walk1 = {im = lg.newImage("me/walk/walk51.png")}
walk2 = {im = lg.newImage("me/walk/walk52.png")}
walk3 = {im = lg.newImage("me/walk/walk53.png")}
walk4 = {im = lg.newImage("me/walk/walk54.png")}
walk5 = {im = lg.newImage("me/walk/walk55.png")}
run1 = {im = lg.newImage("me/walk/run1.png")}
run2 = {im = lg.newImage("me/walk/run2.png")}
run3 = {im = lg.newImage("me/walk/run3.png")}
run4 = {im = lg.newImage("me/walk/run4.png")}
slide = {im = lg.newImage("me/walk/slide.png")}

fade1 = {im = lg.newImage("me/attack/fade1.png")}
fade2 = {im = lg.newImage("me/attack/fade2.png")}
fade3 = {im = lg.newImage("me/attack/fade3.png")}
fade4 = {im = lg.newImage("me/attack/fade4.png")}
fade5 = {im = lg.newImage("me/attack/fade5.png")}
fade6 = {im = lg.newImage("me/attack/fade6.png")}
fade7 = {im = lg.newImage("me/attack/fade7.png")}
fade8 = {im = lg.newImage("me/attack/fade8.png")}
morph1 = lg.newImage("me/attack/morph1.png")
morph2 = lg.newImage("me/attack/morph2.png")
morph3 = lg.newImage("me/attack/morph3.png")
morph4 = lg.newImage("me/attack/morph4.png")
morph5 = lg.newImage("me/attack/morph5.png")
morph6 = lg.newImage("me/attack/morph6.png")
morph7 = lg.newImage("me/attack/morph7.png")
wallgrab = {im = lg.newImage("me/attack/wallgrab.png")
}
partitionp1 = lg.newImage("enviro/partitionp1.png")
partitionp2 = lg.newImage("enviro/partitionp2.png")
--partition:setFilter("nearest")

jumprise = {im = lg.newImage("me/jump/jumprise.png"), extrah = 5}
jumpfalling = {im = lg.newImage("me/jump/jumpfalling.png"), extrah = 5}
landing = {im = lg.newImage("me/jump/landing.png"), yoff = -12}
slowdown = {im = lg.newImage("me/jump/slowdown.png")}
paper1 = lg.newImage("enviro/paper1.png")
paper2 = lg.newImage("enviro/paper2.png")
paper3 = lg.newImage("enviro/paper3.png")
paper4 = lg.newImage("enviro/paper4.png")



sparkfaderate = 5

hour = 0
minute = 0

tod = {1,1,1}
function movetod(delta)
  if minute + delta > 60 then
    minute = 0
    hour = hour + 1
    else minute = minute + delta
    end

    if hour > 23 then hour = 0 
    end


    if hour < 6 then 
      tod = {.5,.5,.8}

    elseif hour < 7 then
      if minute < 30 then
        tod = {
          .5+.5*(minute/30),
          .5+.5*(minute/30),
          .8}
        else
          tod ={
            1,
            1,
            .8+.2*((minute-30)/30)}

          end

        elseif hour < 20 then
          tod = {1,1,1}
        elseif hour < 21 then
          if minute > 30 then
            tod = {
              1-.5*((minute-30)/30),
              1-.5*((minute-30)/30),
              .8}
            else
              tod ={
                1,
                1,
                1-.2*(minute/30)}

              end

              else tod = {.5,.5,.8}
              end

            end

            function tods()

              lg.setShader(todshader)
              todshader:send("todd", 
                {tod[1], tod[2], tod[3], 1}
                ) 

            end

            inverseshader = lg.newShader(
              [[
              vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
              {
                vec4 tc = Texel(texture, texture_coords); 

                return vec4(1-tc[0], 1-tc[1], 1-tc[2], tc[3]);
              }
              ]] )

            todshader = lg.newShader(
              [[
              extern vec4 todd;
              vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
              {
                vec4 texcolor = Texel(texture, texture_coords); 

                return vec4(todd[0]*texcolor[0],todd[1]*texcolor[1],todd[2]*texcolor[2],texcolor[3]);
              }
              ]] )




            fillshader = lg.newShader(
              [[
              extern vec4 shade;
              vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
              {
                vec4 texcolor = Texel(texture, texture_coords); 

                if (texcolor[3]>.01)
                  return shade; 

                  return texcolor; 
                }
                ]] )

            cshader = lg.newShader(
              [[
              vec4 lscreen = vec4(0.0, 1.0, 0.0, 1.0);
              vec4 fscreen = vec4(0.0, 1.0, 1.0, 1.0);
              vec4 rscreen = vec4(1.0, 1.0, 0.0, 1.0);
              vec4 red = vec4(1.0, 0, 0.0, 1.0);
              vec4 yellow = vec4(1.0, 1.0, 0.0, 1.0);
              extern vec4 palette[6];
              vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
              {
                vec4 texcolor = Texel(texture, texture_coords); 

                if (texcolor[0] == texcolor[1] &&
                  texcolor[1] == texcolor[2] &&
                  texcolor[2] == texcolor[0] && 
                  texcolor[1] > .5)
            return vec4(palette[0][0]*texcolor[0],palette[0][1]*texcolor[1],palette[0][2]*texcolor[2],texcolor[3]*palette[0][3]);

            if (texcolor == fscreen)
              return palette[1];  
              if (texcolor == lscreen)
                return palette[4];
                if (texcolor == rscreen)
                  return palette[5];

                  if (texcolor[1] == red[1] && 
                    texcolor[2] == red[2] && 
                    texcolor[0] > 0)
return vec4(palette[2][0]*texcolor[0],palette[2][1]*texcolor[0],palette[2][2]*texcolor[0],texcolor[3]); 


if (texcolor[0] + texcolor[1] +texcolor[2] < 1
  && texcolor[3]> .7)
return vec4(palette[3][0]*(1-texcolor[0]),palette[3][1]*(1-texcolor[1]),palette[3][2]*(1-texcolor[2]),texcolor[3]);

return texcolor; 
}
]])

--vector color transform



function vct(l,a)
  local vctr = l.r
  local vctg = l.g
  local vctb = l.b
  if l.r == 0 then
    vctr = 0
  else
    vctr = l.r/255
  end


  if l.g == 0 then
    vctg = 0
  else
    vctg = l.g/255
  end


  if l.b == 0 then
    vctb = 0
  else
    vctb = l.b/255
  end
  if a == nil then

    return {vctr,vctg,vctb, 1}
  else
    if a == 0 then
      return {vctr,vctg,vctb, 0}
    else
      return {vctr,vctg,vctb, a/255}
    end
  end
end

function rgbset(c)
  lg.setColor(c.r, c.g, c.b)
end

function rgbset(c,a)
  lg.setColor(c.r, c.g, c.b,a)
end


barsmovein = 0
barey = 0
bardis = 100
function cinemabars()

  dangervertone = ydif/dangerZoom <= beigedif
  dangeronescreen = xdif <= screenwidth*dangerZoom/2 + tolandr*2
  dangerclose = dangerCloseIsAThing and dangeronescreen and dangervertone and not slowww

  local tbardis = bardis
  if dangerclose then tbardis = dangerbarey end

  if barsmovein > 0 then 
    barey = barey + barsmovein
    if barey >= tbardis then
      barsmovein = 0
      barey = tbardis 
    end
  elseif barsmovein < 0 then
    barey = barey + barsmovein
    if barey <= 0 then
      barsmovein = 0
      barey = 0
    end
  end



  if dangerclose then
    --[[
    if maxzoom > dangerZoom then
      maxzoom = maxzoom - dangerZoomDelta
      minzoom = minzoom - dangerZoomDelta
    end]]--

    if barey < dangerbarey then
      barsmovein = 2
    end

  elseif slowww then barsmovein = 3
  elseif barey > 0 and slowmot == 0 then
    barsmovein = -4
  end
  barey = 120*(1-rampspeed)


end

--colorshader draw start
function csds(xx, flip)

  local bleed = ((maxhealth-xx.health)/maxhealth)
  local shadee = {
    r=xx.shade.r - 
    (xx.shade.r - xx.shade.r/255*(xx.color.c.r))*bleed/2,
    g=xx.shade.g -
    (xx.shade.g - xx.shade.g/255*(xx.color.c.g))*bleed/2,
    b=xx.shade.b -
    (xx.shade.b - xx.shade.b/255*(xx.color.c.b))*bleed/2
  }
  local shadeea = 255

  if xx.color.n == 2 and xx.animcounter >= 7 and xx.greenflicker and math.sqrt(xx.v^2+xx.j^2) > 6 and xx.type ~= 2 then
   shadeea = 0
 end

 local colora = 150

 local cctv = (xx.cct/colorchangetime)
 local lefcolor = {r = (xx.leftc.c.r + shadee.r/2)*2/3,
 g = (xx.leftc.c.g + shadee.g/2)*2/3,
 b = (xx.leftc.c.b + shadee.b/2)*2/3}
 if xx.leftc.n == xx.currentc then

   lefcolor = {r = (xx.leftc.c.r + shadee.r)/2+(((xx.leftc.c.r - shadee.r)/2)*cctv),
   g = (xx.leftc.c.g + shadee.g)/2+(((xx.leftc.c.g - shadee.g)/2)*cctv),
   b = (xx.leftc.c.b + shadee.b)/2+(((xx.leftc.c.b - shadee.b)/2)*cctv)}

 end

 local righcolor = {r = (xx.rightc.c.r + shadee.r/2)*2/3,
 g = (xx.rightc.c.g + shadee.g/2)*2/3,
 b = (xx.rightc.c.b + shadee.b/2)*2/3}
 if xx.rightc.n == xx.currentc then

  righcolor = {r = (xx.rightc.c.r + shadee.r)/2+(((xx.rightc.c.r - shadee.r)/2)*cctv),
  g = (xx.rightc.c.g + shadee.g)/2+(((xx.rightc.c.g - shadee.g)/2)*cctv),
  b = (xx.rightc.c.b + shadee.b)/2+(((xx.rightc.c.b - shadee.b)/2)*cctv)}

end




local rc = vct(lefcolor)
local lc = vct(righcolor)
if (xx.lr < 0 and flip~=nil) or xx.lr > 0 then
  lc = vct(lefcolor)
  rc = vct(righcolor)
end
--[[
  local rc = vct(xx.leftc.c,colora)
    local lc = vct(xx.rightc.c,colora)
  if (xx.lr < 0 and flip~=nil) or xx.lr > 0 then
    lc = vct(xx.leftc.c,colora)
    rc = vct(xx.rightc.c,colora)
  end
]]--

local outlinee = {
  r=xx.outline.r - 
  (xx.outline.r - xx.outline.r/200*(xx.color.c.r))*bleed,
  g=xx.outline.g -
  (xx.outline.g - xx.outline.r/200*(xx.color.c.g))*bleed,
  b=xx.outline.b -
  (xx.outline.b - xx.outline.r/200*(xx.color.c.b))*bleed
}

lg.setShader(cshader)
if xx.currentc == 4 or xx.cchangeto.n == 4 then
  cshader:send( "palette", 
    vct(shadee), 
    vct({r = xx.color.c.r/(xx.rlvl/10+1),g = xx.color.c.g/(xx.rlvl/10+1),b = xx.color.c.b/(xx.rlvl/10+1)}),
    vct({r = thecolors[xx.currentc].c.r/(xx.rlvl/6+1), g = thecolors[xx.currentc].c.g/(xx.rlvl/6+1), b = thecolors[xx.currentc].c.b/(xx.rlvl/6+1)}), 
    vct(outlinee),
    lc,
    rc
    ) 
else
  cshader:send( "palette", 
    vct(shadee, shadeea), 
    vct(xx.color.c),
    vct(thecolors[xx.currentc].c), 
    vct(outlinee),
    lc,
    rc

    ) 
end
end






traillength = 7
trailfadeness = 10

me.trail={}
you.trail={}





function updatemytrail(xx)
  for i = #xx.trail, 1, -1 do
    cur = xx.trail[i]


    cur.t = cur.t + 1*rampspeed

    if cur.t >= traillength then 
      table.remove(xx.trail, i)
    end

  end

end

function drawmytrail(xx)


  for i = #xx.trail, 1, -1 do
    cur = xx.trail[i]


    if cur.im.xoff == nil then cur.im.xoff = 0 end
    if cur.im.yoff == nil then cur.im.yoff = 0 end
    lg.setShader(fillshader)
    if cur.dangertrail ~= nil then
      fillshader:send("shade", 
        vct(thecolors[cur.colornum].c, 
          (255/traillength)*(traillength/cur.t)/trailfadeness
          ))
    else
      fillshader:send("shade", 
        vct(thecolors[cur.colornum].c, 
          (255/traillength)*(traillength/cur.t)
          ))
    end

    lg.draw(cur.im.im, cur.xanimate-cur.im.xoff*cur.lr, cur.y-cur.im.yoff, 0, cur.lr, 1)
    if cur.legs ~= nil then
      if cur.im.legsy == nil then cur.im.legsy = 0 end
      lg.draw(cur.legs,cur.xanimate-cur.im.xoff*cur.lr, cur.y-cur.im.yoff+cur.im.legsy, 0, cur.lr, 1)
    end
    lg.setShader()
    cclear()

  end


end

me.j = 0

whatlevel = function()

if placespeople then
  placespeople = false

  you.initwy = 0
  me.initwy = 0
  finishedLoading = false
  playfade = 0
  me.deathclock = 0
  you.deathclock = 0
  me.animcounter = 0
  you.animcounter = 0
  me.v = 0
  you.v = 0
  me.push = 0
  you.push = 0
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


  if themode == "fractal" then 
    you.lives = fractal_lives
    me.lives = fractal_lives
    maxhealth = fractal_max_health
  elseif themode == "duel" then 
    maxhealth = 150
  elseif themode == "koth" then 
    maxhealth = 50
  end
  me.score = 0
  you.score = 0
  me.health = maxhealth
  you.health = maxhealth
  me.oldhealth = me.health
  you.oldhealth = you.health


  if themap.name == "fightclub" then

    loader.start(function()
      finishedLoading = true
      end)

    enviro.rightwall = 2000
    loader.newImage(enviro,'paralax', "enviro/fightclubparalax.png")
    loader.newImage(enviro,'stage', "enviro/fightclub.png")

    loader.newImage(enviro,"sky","enviro/ready.png")
    me.x = putmehere
    you.x = putyouhere
    me.im = idle1
    you.im = idle1
    me.y = themaps[100].floor - 60
    you.y = themaps[100].floor - 60
    floor = themaps[100].floor



  elseif mapNum == 1 then
    me.y = themaps[1].floor - 200
    you.y = themaps[1].floor - 200
    if loadImagesNow then
      enviro.stage=lg.newImage( "enviro/astreet.png")
      enviro.paralax=lg.newImage("enviro/paralax.png")
      enviro.paralax2=lg.newImage("enviro/paralax2.png")
      enviro.sky=lg.newImage("enviro/sky.png")
      enviro.lightson=lg.newImage("enviro/lightson.png")
      enviro.lightsoff=lg.newImage( "enviro/lightsoff.png")
        --enviro.floor=lg.newImage( "enviro/astreet.png")
        enviro.rafters=lg.newImage("enviro/rafters.png")

      else
        loader.newImage(enviro,'stage', "enviro/astreet.png")
        loader.start(function()
          finishedLoading = true
          end)
        loader.newImage(enviro,"paralax","enviro/paralax.png")
        loader.newImage(enviro,"paralax2","enviro/paralax2.png")
        loader.newImage(enviro,"sky","enviro/sky.png")
        loader.newImage(enviro,'lightson',"enviro/lightson.png")
        loader.newImage(enviro,'lightsoff', "enviro/lightsoff.png")
        --loader.newImage(enviro,'floor', "enviro/astreet.png")
        loader.newImage(enviro,'rafters',"enviro/rafters.png")
      end
      lighttimer = 0
      me.x = 1000
      you.x = 6000
      enviro.rightwall = 6600-20
      enviro.ds = 5
      thesong = song1



    elseif mapNum == 2 then

      if loadImagesNow then 

        enviro.paralax = lg.newImage("enviro/libraryparalax.png")
        enviro.paralax2 = lg.newImage("enviro/libraryparalax2.png")
        enviro.stage = lg.newImage("enviro/library.png")
        enviro.sky = lg.newImage("enviro/librarysky.png")

        enviro.plibrary = lg.newImage("enviro/libraryplayer.png")
        enviro.thelibraryveneer = lg.newImage("enviro/libraryveneer.png")


      else
        loader.start(function()
          finishedLoading = true
          end)
        loader.newImage(enviro,'paralax',"enviro/libraryparalax.png")
        loader.newImage(enviro,'paralax2', "enviro/libraryparalax2.png")
        loader.newImage(enviro,'stage', "enviro/library.png")
        loader.newImage(enviro,'sky',"enviro/librarysky.png")
        loader.newImage(enviro,'plibrary', "enviro/libraryplayer.png")
        loader.newImage(enviro, 'thelibraryveneer',"enviro/libraryveneer.png")
      end

      me.x = 20--700
      you.x = 2000
      me.y = 300
      you.y = 300
      enviro.rightwall = 3700 
      enviro.ds = 2

      thesong = song2

    elseif mapNum == 3 then
      if loadImagesNow then 

        enviro.paralax = lg.newImage("enviro/floorsparalax.png")
        enviro.stage = lg.newImage( "enviro/floors.png")
        enviro.sky = lg.newImage("enviro/floorssky.png")
        enviro.pfloors = lg.newImage( "enviro/floorsplayer.png")
        enviro.floorsveneer2 = lg.newImage("enviro/floorsveneer2.png")
        enviro.floorsveneer1 = lg.newImage("enviro/floorsveneer1.png")
        enviro.paralax2 = lg.newImage("enviro/floorparalax2.png")

      else
        loader.start(function()
          finishedLoading = true
          end)
        loader.newImage(enviro,'paralax',"enviro/floorsparalax.png")
        loader.newImage(enviro,'stage', "enviro/floors.png")
        loader.newImage(enviro,'sky',"enviro/floorssky.png")
        loader.newImage(enviro,'pfloors', "enviro/floorsplayer.png")
        loader.newImage(enviro, 'floorsveneer2',"enviro/floorsveneer2.png")
        loader.newImage(enviro, 'floorsveneer1',"enviro/floorsveneer1.png")
        loader.newImage(enviro,'paralax2', "enviro/floorparalax2.png")
      end


      me.x = 500
      you.x = 3000
      me.y = 300
      you.y = 300
      enviro.rightwall = 5000
      enviro.ds = 5
      thesong = song2

    end

    for i,v in ipairs(players) do
      players[i].oldpy = players[i].y 
    end

  end
end
ma1fade= 100
ma2fade= 100
ma3fade= 100
ma4fade= 100
ya1fade= 100
ya2fade= 100
ya3fade= 100
ya4fade= 100
basefade = 80


actionshotdur = 70

me.im = idle1
you.im = idle1


function drawPlayer(xx)
  if dangerclose and xx.v ~=0 then
    table.insert(xx.trail, 
      {color = clone(xx.color), im = clone(xx.im), lr = xx.lr, xanimate = xx.xanimate, x = xx.x, y = xx.y, t = .3, colornum = xx.currentc, legs = clone(xx.curimlegs), legsy = xx.im.legsy,dangertrail = true})


  end

  drawmytrail(xx)
  if xx.greenkcondition then
    if xx.lr > 0 then
      csds(xx)
      lg.draw(garmback,xx.mid -2*xx.lr,
        xx.y+26, math.rad(-xx.lr*xx.gangle),xx.lr,1,-7+4,-8+4)

    else
      csds(xx,true)
      lg.draw(garmfront,xx.mid -2*xx.lr,
        xx.y+26, math.rad(-xx.lr*xx.gangle),xx.lr,1,4,7)


    end

    lg.setShader()
  end


  if xx.im.xoff == nil then xx.im.xoff = 0 end
  if xx.im.yoff == nil then xx.im.yoff = 0 end

  local xim = xx.im.im
  local xxx = xx.xanimate-xx.im.xoff*xx.lr
  local xxy = xx.y-xx.im.yoff
  local xlr = xx.lr



  if mode == "retry" and fadein < 0 then
    lg.setColor(255,255,255,allfade)
  end



  csds(xx)
  lg.draw(xim,xxx, xxy, 0, xlr, 1)
  lg.setShader()




  if xx.im.legsy ~= nil then
    csds(xx)
    xx.curimlegs = xx.im.legs
    if not (xx.v == 0 or xx.slide) then
      if xx.walktimer < 7 then 

        xx.curimlegs = walklegs1.im
      elseif xx.walktimer >= 7 and xx.walktimer < 14 then
        xx.curimlegs = walklegs2.im
      elseif xx.walktimer >= 14 and xx.walktimer < 21 then
        xx.curimlegs = walklegs3.im
      elseif xx.walktimer >= 21 and xx.walktimer < 28 then
        xx.curimlegs = walklegs4.im
      elseif xx.walktimer >= 28 and xx.walktimer < 35 then
        xx.curimlegs = walklegs5.im
      else
        xx.walktimer = 0
      end
    end
    lg.draw(xx.curimlegs,xxx, xxy+xx.im.legsy, 0, xlr, 1)

  else
    xx.curimlegs = nil
    lg.setShader()
  end




  if  xx.greenkcondition then

    if xx.lr > 0 then
      csds(xx)
      lg.draw(garmfront,xx.mid -2*xx.lr,
        xx.y+26, math.rad(-xx.lr*xx.gangle),xx.lr,1,4,7)


    else
      csds(xx,true)
      lg.draw(garmback,xx.mid -2*xx.lr,
        xx.y+26, math.rad(-xx.lr*xx.gangle),xx.lr,1,-7+4,-8+4)

      lg.draw(gahead,xx.mid-11*xx.lr, xx.y+6, 0, xlr, 1) 

      lg.setShader()
    end
  end



  lg.setColor(255, 255, 255, 255)
  drawcolorstuff(xx)
  bolttraildraw(xx)

  if drawFeet then
    local pextra = 0
    if xx.im.extrah ~= nil then
      pextra = xx.im.extrah
    end
    lg.setColor(255,0,0)
    lg.rectangle("fill", xx.x, xx.oldpy, xx.width,1)
    lg.setColor(0,0,255)
    lg.rectangle("fill", xx.x, xx.y+me.height-xx.j-pextra, xx.width,1)
  end




end


function actionshotstuff(xx)

  if xx.actionshot then
    musfadein = -10
    xx.numofspikes = 0
    xx.uppercuthit = false
    --xx.hitsomeonewithpurp = false

    if xx.color.n == xx.cchangeto.n and (xx.color.n~=xx.cantreturntothis) and (xx.a1b or xx.a2b or xx.a3b or xx.a4b) and xx.combo<xx.maxcombo then
      if xx.color.n == 2 and xx.a4b then
        xx.animcounter = 8
        xx.type = 2
        xx.im = greenk1
      else
        xx.repcounter = 0
        xx.currentc = xx.color.n
        xx.cmbo=true--combo(xx)
        xx.actionshot = false

        musfadein = 10
        xx.actiontimer = 0

      end
    end
    minzoom = minzoom + .02+((xx.actiontimer)^2)/300000 --(math.exp(1)^wobbletimer)*math.cos(2*math.pi*wobbletimer)
    maxzoom = maxzoom + .02+((xx.actiontimer)^2)/300000 --(math.exp(1)^wobbletimer)*math.cos(2*math.pi*wobbletimer)

  end

  ColorChange(xx)
  ColorChanging(xx)

  if xx.actiontimer == 1 
    then xx.actionshot = false 

    musfadein = 10
    xx.actiontimer = 0

    if not pause then
      --deathsound:play()
      collides:play()
      --bcs:play()




    end

  elseif xx.actionshot == true and xx.actiontimer == 0 
    then xx.actiontimer = actionshotdur
  elseif xx.actiontimer > 0 
    then xx.actiontimer = xx.actiontimer - 1
      thesong:setPitch(rampspeed)
    else xx.actiontimer = 0
    end


  end




  function settriangles()
    mytriangles = {}
    yourtriangles = {}
    while table.getn(mytriangles) < 18
      do 
      table.insert(mytriangles, {(math.ceil(math.random(0,12))), (math.ceil(math.random(0,10))), (math.ceil(math.random(0,7)))})
      table.insert(yourtriangles, {(math.ceil(math.random(0,12))), (math.ceil(math.random(0,10))), (math.ceil(math.random(0,7)))})
    end
  end
  function drawtriangles()
    for i,v in ipairs(mytriangles) do
      for p,q in ipairs(mytriangles[i])
        do 
        if p == 1 then lg.setColor(a21r, a21g, a21b)
        elseif p == 2 then lg.setColor(a31r, a31g, a31b)
        elseif p == 3 then lg.setColor(a41r, a41g, a41b)
        end
        if q == 1 then
          lg.draw(triangle, ((520 + (p * 50)-ln)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,0, screenwidth/1440, screenheight/900)
        elseif q == 2 then 

          lg.draw(triangle, ((570 + (p * 50)-ln)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,1.57079633, screenwidth/1440, screenheight/900)
        elseif q == 3 then 

          lg.draw(triangle, ((570 + (p * 50)-ln)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*2, screenwidth/1440, screenheight/900)
        elseif q == 4 then 

          lg.draw(triangle, ((520 + (p * 50)-ln)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*3, screenwidth/1440, screenheight/900)
        end
      end
    end
    for i,v in ipairs(yourtriangles) do
      for p,q in ipairs(yourtriangles[i])
        do 
        if p == 1 then lg.setColor(a22r, a22g, a22b)
        elseif p == 2 then lg.setColor(a32r, a32g, a32b)
        elseif p == 3 then lg.setColor(a42r, a42g, a42b)
        end
        if q == 1 then
          lg.draw(triangle, ((1440 - 520 - 50 - (p * 50)+rn)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,0, screenwidth/1440, screenheight/900)
        elseif q == 2 then 

          lg.draw(triangle, ((1440 - 470 - 50 - (p * 50)+rn)/1440)*screenwidth, ((-50 + (i * 50))/900)*screenheight,1.57079633, screenwidth/1440, screenheight/900)
        elseif q == 3 then 

          lg.draw(triangle, ((1440 - 470 - 50 - (p * 50)+rn)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*2, screenwidth/1440, screenheight/900)
        elseif q == 4 then 

          lg.draw(triangle, ((1440 - 520 - 50 - (p * 50)+rn)/1440)*screenwidth, ((i * 50)/900)*screenheight,1.57079633*3, screenwidth/1440, screenheight/900)
        end
      end
    end
    lg.setColor(255,255,255)
  end

  lights = function ()
  if lighttimer >= 70
    then
    lighttimer = - math.random(100,300)
  elseif lighttimer >= 50
    then enviro.light = enviro.lightsoff
    lighttimer = lighttimer + 1
  elseif lighttimer >= 36 
    then enviro.light = enviro.lightson
    lighttimer = lighttimer + 1
  elseif lighttimer >= 31 
    then enviro.light = enviro.lightsoff
    lighttimer = lighttimer + 1
    else enviro.light = enviro.lightson
      lighttimer = lighttimer + 1





    end
  end
  me.wjt = 0
  me.initwy = 0
  you.wjt = 0
  you.initwy = 0
--the x coord for either wall to walljump off of
wallwalljump = 45
--wallcheckhelper

--when you do it from the right side it doesnt turn around, maybe check the lr

me.walllr = 0
me.wallx = 0
you.walllr = 0
you.wallx = 0

function drawstreetprestuff()
  lg.draw(enviro.light, 4448, 1525)
  lights()

end
drawstreetstuff = function()
lg.draw(enviro.stagefloor, 0, 0, 0, 1, 20)
lg.draw(enviro.rafters,5608-502, 1536)
drawpartition(0, themaps[1].floor, -1)
drawpartition(themaps[1].rightwall, themaps[1].floor, 1)

end

function drawpartition(fx, fy, lr)
  local i = fy
  while i > 0 do
    lg.draw(partitionp2, fx-3*lr, i, 0, -lr*3, 3, 40, 115)
    if i == fy then
      lg.draw(partitionp1, fx-3*-lr, i, 0, -lr, 1, 0, 10)
    end
    i = i - 115*3
  end
end


drawlibrarystuff = function()
if rampcanhit and math.random() > .5 then makenwater(602,930,0,2,1)
end
lg.draw(enviro.plibrary,0,0)
drawpartition(0, themaps[2].floor, -1)
drawpartition(themaps[2].rightwall, 964, 1)
libraryveneer()
lg.setColor(27,27,27,255)
lg.rectangle("fill", -3000, themaps[2].floor, 6000+themaps[2].rightwall, 1000)
cclear()
end

drawfloorsstuff = function()
lg.draw(enviro.pfloors,0,0)
drawpartition(0, themaps[3].floor, -1)
drawpartition(themaps[3].rightwall, themaps[3].floor, 1)
floorsveneer()
end

enviro.rubble = lg.newImage("enviro/rubble.png")
enviro.glass = lg.newImage("enviro/glass.png")
enviro.spark = lg.newImage("enviro/spark.png")
enviro.spark2 = lg.newImage("enviro/spark2.png")
enviro.spark3 = lg.newImage("enviro/spark3.png")
enviro.leaf = lg.newImage("enviro/leaf.png")
leaves = {}
rubble = {}
glasseses = {}
dust = {}
papers = {}
dustn = 0
blackn = 0
glassn = 0
glassclarity = 255
elar = frana
function drawbackparticles()
  blooms:draw()
  drawsparks()
end

function drawparticles()
  drawleaves()
  drawdust()
  drawglass()
  drawrubble()
  drawwater()
  drawpapers()
  
  drawcolorboxes()

end

function updateparticles()
  updateleaves()
  updatesparks()
  updatedust()
  updateglass()
  updaterubble()
  updatewater()
  updatepapers()
  updatecolorboxes()
  blooms:update()
end

function drawpapers()


  for i,v in ipairs(papers)do



    if v.n < 10 then lg.draw(paper1,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    elseif v.n < 20 then lg.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    elseif v.n < 30 then lg.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    elseif v.n < papertime -20 then lg.draw(paper4,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    elseif v.n < papertime -10 then lg.draw(paper3,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    elseif v.n < papertime then lg.draw(paper2,v.x-10*v.lr,v.y-10, v.r, v.lr*1, 1)
    end

  end
end

function updatepapers()

  for i = #papers, 1, -1 do
    local temp = papers[i]
    --if paper hits the ceiling
    local lr = 1
    if temp.v < 0 then lr = -1 end
    if lineplatcheck(temp.x, temp.y-3,temp.v*1.3, temp.j*1.3) or
      linewallcheck(temp.x+lr*4, temp.y-3,temp.v*1.3, temp.j*1.3)
      then table.remove(papers,i) end

    end
    for i,v in ipairs(papers)do
      if not me.actionshot and not you.actionshot and not pause then
        v.y = v.y - v.j*1.3*rampspeed
        v.x = v.x + v.v*1.3*rampspeed
        if v.v > 1.5 then v.v = v.v - .4*rampspeed
        elseif v.v < -1.5 then v.v = v.v + .4*rampspeed
        end
        if v.j > -1 then v.j = v.j - .2*rampspeed
        end

        if math.abs(me.mid-v.x) < 25 and math.abs(me.y+27 - v.y) < 50 and me.v+me.j > 7
          then v.v = v.v + me.v*.05
          v.j = v.j + me.j*.005 + .2
        end
        if math.abs(you.mid-v.x) < 25 and math.abs(you.y+27 - v.y) < 50 and you.v+you.j > 7
          then v.v = v.v + you.v*.05
          v.j = v.j + you.j*.005 + .2
        end



        if v.n < papertime then
          v.n = v.n + 3
          else v.n = 0
            v.lr = -v.lr
          end
        end



      end
    end


    function updateleaves()

      for i = #leaves, 1, -1 do
        local temp = leaves[i]
        local lr = 1
        if temp.v < 0 then lr = -1 end
        if lineplatcheck(temp.x, temp.y+3,temp.v, temp.j) or
          linewallcheck(temp.x+lr*4, temp.y+3,temp.v, temp.j)
          then table.remove(leaves,i) end

        end
        for i,v in ipairs(leaves)do
          if not me.actionshot and not you.actionshot and not pause then
            v.y = v.y - v.j*rampspeed
            v.x = v.x + v.v*rampspeed

            if v.v >= 2 then
              v.swing = true
            elseif v.v <= -2 then
              v.swing = false
            end

            if v.swing then v.v = v.v - .1*rampspeed
              else v.v = v.v + .1*rampspeed+math.random()/50
              end
              if v.j > -1 then v.j = v.j - .1*rampspeed-math.random()/50
              end

              if math.abs(me.mid-v.x) < 25 and math.abs(me.y+27 - v.y) < 50 and me.v+me.j > 7
                then v.v = v.v + me.v*.05
                v.j = v.j + me.j*.02 + .2
              end
              if math.abs(you.mid-v.x) < 25 and math.abs(you.y+27 - v.y) < 50 and you.v+you.j > 7
                then v.v = v.v + you.v*.05
                v.j = v.j + you.j*.02 + .2
              end

              local rotaval = 6-hof(lof(6,v.v), -6)
              v.r = math.rad(-90) + math.rad(180)*rotaval/12

            end



          end
        end
        function drawleaves()


          for i,v in ipairs(leaves)do

            tsetColor(v.color.r, v.color.g,v.color.b)
            lg.draw(enviro.leaf,v.x,v.y, v.r-math.rad(45), 1, 1, 5, 0)

          end
        end

        function makenleaves(ex,why,vee,jay,n)
          for i = 1, n do
            local rb = math.random(0,80)
            table.insert(leaves,{x = ex, y = why, v=vee*math.random(), j = jay*math.random()+math.random()*4, swing = true,

              color = {r=rb, g=math.random(100, 255), b=rb}, r = 0
              })
          end
        end


        function makenpaper(ex,why,vee,jay,en)
          for i = en, 1, -1 do
            if math.random() > .5 then 
              elar = 1
              else elar = -1
              end
              if vee > 0 then
                table.insert(papers,{x = ex, y = why, v=vee/3 + math.random()*5, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
              elseif vee < 0 then
                table.insert(papers,{x = ex, y = why, v=vee/3 - math.random()*5, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
              else
                table.insert(papers,{x = ex, y = why, v=vee/3 + math.random()*5*elar, j = math.random()*5+jay/7,n = math.random(papertime),lr = elar})
              end
            end
          end


          function updateglass()
           for i = #glasseses, 1, -1 do
            local temp = glasseses[i]
            local lr = 1
            if temp.v < 0 then lr = -1 end
            if lineplatcheck(temp.x, temp.y,temp.v*1.2, temp.j*1.2) or linewallcheck(temp.x+lr, temp.y,temp.v*1.2, temp.j*1.2)  or i > 500 then table.remove(glasseses,i) end


          end
          for i,v in ipairs(glasseses)do
            if not me.actionshot and not you.actionshot and not pause then
              v.y = v.y - v.j*1.15*rampspeed
              v.x = v.x + v.v*1.15*rampspeed
              v.j = v.j - .18*rampspeed
            end

          end
        end

        function drawglass()

          for i,v in ipairs(glasseses)do
            if not me.actionshot and not you.actionshot and not pause then

              glassn = math.random(155,255)
              glassclarity = math.random(55,255)
            end
            tsetColor(glassn,255,255,glassclarity)
            lg.draw(enviro.glass,v.x,v.y,70/(v.v+v.y),math.random()*math.random(-1,1),math.random()*math.random(-1,1), 1, 1)
            lg.setColor(255,255,255)

          end
        end



        function tsetColor(r,g,b,a)
          lg.setColor(r*tod[1], g*tod[2], b*tod[3], a)
        end

        function tsetColor(r,g,b)
          lg.setColor(r*tod[1], g*tod[2], b*tod[3], 255)
        end

        function drawdust()

          for i,v in ipairs(dust)do
            if not me.actionshot and not you.actionshot and not pause then
              dustn = math.random(100,200)
            end
            tsetColor(dustn,dustn,dustn,.3)
            lg.draw(enviro.rubble,v.x,v.y-2,70/(v.v+v.y),1,1)
            lg.setColor(255,255,255)

          end


        end

        function updatedust()

          for i = #dust, 1, -1 do
            local temp = dust[i]

            local lr = 1
            if temp.v < 0 then lr = -1 end

            if lineplatcheck(temp.x, temp.y,temp.v*3, temp.j*2) or linewallcheck(temp.x+lr, temp.y,temp.v*3, temp.j*2) or i > 500 then table.remove(dust,i) end

          end

          for i,v in ipairs(dust)do
            if not me.actionshot and not you.actionshot and not pause then
              v.y = v.y - v.j*rampspeed*2
              v.x = v.x + v.v*rampspeed*3
              v.j = v.j - .6*rampspeed
            end

          end


        end


        rubbletimer = 0

        function updaterubble()
          if rubbletimer > 100 then rubbletimer = 0
          else
            rubbletimer = rubbletimer + 1*rampspeed
          end
          local lr = 1
          for i = #rubble, 1, -1 do
            local temp = rubble[i]

            if temp.v < 0 then lr = -1 end
            if lineplatcheck(temp.x, temp.y,temp.v*2, temp.j*2) or linewallcheck(temp.x+lr, temp.y,temp.v*2, temp.j*2) or i > 400 then table.remove(rubble,i) end

          end

          for i,v in ipairs(rubble)do
            if not me.actionshot and not you.actionshot and not pause then
              v.y = v.y - v.j*rampspeed*2
              v.x = v.x + v.v*rampspeed*2
              v.j = v.j - .2*rampspeed/1.5*2
              v.rot = v.rot + math.random() *rampspeed 
            end
          end
        end

        function drawrubble()

          for i,v in ipairs(rubble)do
            if not me.actionshot and not you.actionshot and not pause then
              blackn = math.random(80,120)
            end
            tsetColor(blackn,blackn,blackn)
            lg.draw(enviro.rubble,v.x,v.y,rubbletimer/10+v.rot,2,2,1,1)
            lg.setColor(255,255,255)
          end
        end



        waterdrops = {}
        function updatewater()

          for i = #waterdrops, 1, -1 do
            local temp = waterdrops[i]
            local v = temp

            local lr = 1
            if temp.v < 0 then lr = -1 end

            if lineplatcheck(temp.x, temp.y,temp.v*2, temp.j*2) or linewallcheck(temp.x+lr, temp.y,temp.v*2, temp.j*2) then 
              if lineplatcheck(temp.x, temp.y,temp.v*2, temp.j*2) then
                temp.j = 0
              end

              if linewallcheck(temp.x+lr, temp.y,temp.v, temp.j)  then
                temp.v = -temp.v/2
              end
              if temp.fade==nil then
                temp.fade = 100
                temp.v = temp.v/2
              end
            end
            for j,k in ipairs(players) do 
              hline(v, 10000,
                {x=v.x, y=v.y},
                {x=v.x+v.v, y=v.y-v.j},
                function(p)
                  if math.abs(v.v * p.v) == v.v * p.v  then
                    v.v=-v.v/2
                  else
                    v.v=-v.v/2+p.v/3

                  end

                  if math.abs(v.j * p.j) == v.j * p.j  then
                    v.j=-v.j/2
                  else
                    v.j=-v.j/2+p.j/3

                  end

                  if temp.fade==nil then
                    temp.fade = 100
                    temp.v = temp.v/2
                  else
                    temp.fade = temp.fade - 2
                  end

                end
                )

            end

            if not me.actionshot and not you.actionshot and not pause then
              v.y = v.y - v.j*rampspeed*2
              v.x = v.x + v.v*rampspeed*2
              v.j = v.j - .1*rampspeed*1.3
              if v.fade ~= nil then

                if v.fade < 0 then
                  table.remove(waterdrops, i)
                else
                  v.fade = v.fade - 2
                end
              end
            end

          end
        end


        function drawwater()
          for i,v in ipairs(waterdrops) do
           blackn = math.random(150,255)
           tsetColor(50,50,blackn)

           if v.fade ~= nil then
            lg.draw(enviro.rubble,v.x,v.y,rubbletimer/10+v.rot,1.5*(v.fade/100),1.5*(v.fade/100),((v.fade/100)*1.5)/2,((v.fade/100)*1.5)/2)
          else
            lg.draw(enviro.rubble,v.x,v.y,rubbletimer/10+v.rot,1.5,1.5,1,1)
          end
        end
      end



      function makerunrubble(why,ex,vee, lr)
        if rampcanhit then
          for i = 7, 1, -1 do
            table.insert(dust,{x = ex, y = why, v=math.random(vee/2, vee) + math.random()*lr, j = math.random(1,3)+math.random()})
          end
        end
      end
      function makeslidedust(why,ex,vee)
        if rampcanhit then
          if vee > minvfordust and math.random() > .5 then
            table.insert(dust,{x = ex, y = why, v=vee/3 + math.random(3), j = math.random(0,vee/5)})
          elseif vee < -minvfordust and math.random() > .5 then
            table.insert(dust,{x = ex, y = why, v=vee/3 - math.random(3), j = math.random(0,-vee/5)})
          end
        end

      end








      function makenrubble(ty, ex,why,vee,jay, n)

        if ty == "vert" then 
          for i = n, 1, -1 do
            if vee > 0 then
              table.insert(rubble,{x = ex, y = why-i*2, v=math.random(0, vee) + math.random(), j = jay+1*math.random(5)+math.random(), rot = math.random() + math.random(1,5)})
            else
              table.insert(rubble,{x = ex, y = why-i*2, v=math.random(vee, 0) - math.random(), j = jay+1*math.random(5)+math.random(), rot = math.random() + math.random(1,5)})
            end
          end
        elseif ty == "horiz" then

          for i = n, 1, -1 do
            if vee > 0 then
              table.insert(rubble,{x = ex+i, y = why, v=math.random(0, vee) + math.random(), j = jay+1*math.random(5)+math.random(), rot = math.random() + math.random(1,5)})
            else
              table.insert(rubble,{x = ex+i, y = why, v=math.random(vee, 0) - math.random(), j = jay+1*math.random(5)+math.random(), rot = math.random() + math.random(1,5)})
            end
          end
        end
      end

      function makenglass(ex,why,vee,jay,n)
        for i = 1, n do
          table.insert(glasseses,{x = ex, y = why, v=vee*math.random(), j = jay*math.random()+math.random()*4})
        end
      end


      function makenwater(ex,why,vee,jay,n)
        for i = 1, n do
          table.insert(waterdrops,{x = ex, y = why, v=vee + math.random()+math.random(-1,0), j = jay+math.random()+math.random(-3,2), rot = math.random()})
        end
      end




      function makefloorrubble(ex,why,vee,jay)
        if jay > 0 then miscjay = 1
          why = why - 60
          jay = jay/2
          else miscjay = -1
          end

          table.insert(rubble,{x = ex-2, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-4, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-6, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-8, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-10, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-12, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-14, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-16, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-18, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+2, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+4, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+6, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+8, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+10, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+12, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+14, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+16, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+18, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-2, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-4, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-6, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-8, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-10, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-12, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-14, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-16, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex-18, y = why, v=vee - math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+2, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+4, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+6, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+8, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+10, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+12, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+14, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+16, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          table.insert(rubble,{x = ex+18, y = why, v=vee + math.random()*(5), j = jay + miscjay*math.random()*3})
          blackn = math.random(200)

        end

        function makefloorglass(ex,why,vee,jay)
          if jay > 0 then miscjay = 1
            why = why - 60
            jay = jay/2
            else miscjay = -1
            end
            table.insert(glasseses,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-2, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-4, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-6, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-8, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-10, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-12, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-14, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-16, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex-18, y = why, v=vee - math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+2, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+4, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+6, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+8, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+10, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+12, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+14, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+16, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            table.insert(glasseses,{x = ex+18, y = why, v=vee + math.random(5), j = jay + miscjay*math.random(3)})
            blackn = math.random(200)
          end

          lvfade = 255
          lvfade2 = 255

          function wallslowmehdown()
            if me.v > 6 then me.v = me.v - 5
            elseif me.v < -6 then me.v = me.v + 5
            end
          end
          function wallslowyouhdown()
            if you.v > 6 then you.v = you.v - 5
            elseif you.v < -6 then you.v = you.v + 5
            end
          end
          function wallslowyouvdown()
            if you.j > 5 then you.j = you.j - 4
            elseif you.j < -5 then you.j = you.j + 4
            end
          end
          function wallslowmevdown()
            if me.j > 5 then me.j = me.j - 4
            elseif me.j < -5 then me.j = me.j + 4
            end
          end
          function libraryveneer()
            if themap.name == "library" then
              if lvfade > 0  and ((me.mid > 1605 and me.mid < 3202 and me.feet > 0) or (you.mid > 1605 and you.mid < 3202 and you.feet > 0))
                then lvfade = lvfade - 5
              elseif lvfade < 255 then lvfade = lvfade + 5
              end
    --tsetColor(255,255,255,lvfade)
    lg.setColor(255*tod[1],255*tod[2],255*tod[3],lvfade)
    lg.draw(enviro.thelibraryveneer, 1535, 0)
    lg.setColor(255,255,255)
  end
end

function floorsveneer()
  if themap.name == "floors" then
    if lvfade > 0  and ((me.mid > 416 and me.mid < 2142 and me.feet > 1899) or (you.mid > 416 and you.mid < 2142 and you.feet > 1899))
      then lvfade = lvfade - 5
    elseif lvfade < 255 then lvfade = lvfade + 5
    end
    if lvfade2 > 0  and ((me.mid > 3157 and me.mid < 4896 and me.feet > 2829) or (you.mid > 3157 and you.mid < 4896 and you.feet > 2829))
      then lvfade2 = lvfade2 - 5
    elseif lvfade2 < 255 then lvfade2 = lvfade2 + 5
    end
    lg.setColor(255*tod[1],255*tod[2],255*tod[3],lvfade)
    lg.draw(enviro.floorsveneer1, 416, 1898)
    lg.setColor(255*tod[1],255*tod[2],255*tod[3],lvfade2)
    lg.draw(enviro.floorsveneer2, 3157, 2829)
    lg.setColor(255,255,255)
  end
end

spines = {}
function aboutso(x,y)
  if (x <= y and x + 2 > y) or (x >= y and x - 2 < y)
    then return true
    else return false
    end
  end
--[[
retry = function()

  if (you.dead and me.dead) then 
  elseif you.dead or you.score > me.score then 
    lg.setColor(me.color.c.r,me.color.c.g,me.color.c.b, retryfade)
    lg.sdraw(enviro.v, 100, 100, 0, 1, 1)
  elseif me.dead or me.score > you.score then
    lg.setColor(you.color.c.r,you.color.c.g,you.color.c.b, retryfade)
    lg.sdraw(enviro.v, screenwidth-100, 100, 0, -1, 1)
  end

  lg.setColor(0, 0, 0, retryfade)
  lg.draw(enviro.retry, 0, 0, 0, screenwidth/1440, screenheight/900)
end
]]--

oscillator = 0
oup=true
soscillator = 15
soup=true
spinespacing = 10
spineymove = -40-spinespacing
separatespines = false
drawspine = function()
if table.getn(spines) < 1 and menu == "color"
  then
  soup=true
  spinestartx = 615
  for i=1, 24 do
    table.insert(spines, {x=spinestartx, y=0, n=24-i, v=0, spinecolor = 0, spinecolor2 = 0})


  end


end

if separatespines then 
  if soscillator < -8 then soscillator = soscillator - 2
  elseif soscillator > 8 then  soscillator = soscillator + 2
  end
end

oddeven = oddeven + 1

if soscillator == 15 then soup = false
elseif soscillator == -15 then soup = true 
end
  --this works
  -- if soscillator == 0 and soup then n = 10
  -- elseif soscillator == 1.5*n then soup = false
  -- elseif sosfirst and soscillator == n then soup = false
  -- elseif soscillator == -1.5*n then soup = true sosfirst = false
  -- end
  if soup then soscillator = soscillator + .5
    else soscillator = soscillator - .5
    end
    for i,v in ipairs(spines) do
      if oddeven%4 == 1 then
        if v.n >= 1 then 
          v.v = spines[i+1].v
          v.x = v.x + v.v 
          if v.v == 14.5 then 
            v.spinecolor = spines[i+1].spinecolor
          elseif v.v == -14.5 then 
            v.spinecolor2 = spines[i+1].spinecolor2
          end
        else
          if v.v == 14.5 then 
            if v.spinecolor2 == 0 then v.spinecolor2 = 1
              else v.spinecolor2 = 0
              end
            elseif v.v == -14.5 then 
              if v.spinecolor == 0 then v.spinecolor = 1
                else v.spinecolor = 0
                end
              end

              v.v = soscillator
              v.x = v.x + v.v
            end
          end

          if v.v >= 0 then
            if v.spinecolor == 0 then 
              lg.setColor(me.leftc.c.r,me.leftc.c.g,me.leftc.c.b)
            elseif v.spinecolor == 1 then 
              lg.setColor(me.rightc.c.r,me.rightc.c.g,me.rightc.c.b)
            end
            lg.sdraw(enviro.spine, v.x, (v.n * (40+spinespacing))+spineymove)

            if v.spinecolor2 == 0 then 
              lg.setColor(you.leftc.c.r,you.leftc.c.g,you.leftc.c.b)
            elseif v.spinecolor2 == 1 then 
              lg.setColor(you.rightc.c.r,you.rightc.c.g,you.rightc.c.b)
            end
            lg.sdraw(enviro.spine, 1440 - v.x, (v.n * (40+spinespacing))+spineymove, 0, -1, 1)
          else
            if v.spinecolor2 == 0 then 
              lg.setColor(you.leftc.c.r,you.leftc.c.g,you.leftc.c.b)
            elseif v.spinecolor2 == 1 then 
              lg.setColor(you.rightc.c.r,you.rightc.c.g,you.rightc.c.b)
            end
            lg.sdraw(enviro.spine, 1440 - v.x, (v.n * (40+spinespacing))+spineymove, 0, -1, 1)

            if v.spinecolor == 0 then 
              lg.setColor(me.leftc.c.r,me.leftc.c.g,me.leftc.c.b)
            elseif v.spinecolor == 1 then 
              lg.setColor(me.rightc.c.r,me.rightc.c.g,me.rightc.c.b)
            end
            lg.sdraw(enviro.spine, v.x, (v.n * (40+spinespacing))+spineymove)
          end
        end

      end


      waves = {}
      table.insert(waves, {x=0, y=0, n=23, v=0})
      table.insert(waves, {x=0, y=0, n=22, v=0})
      table.insert(waves, {x=0, y=0, n=21, v=0})
      table.insert(waves, {x=0, y=0, n=20, v=0})
      table.insert(waves, {x=0, y=0, n=19, v=0})
      table.insert(waves, {x=0, y=0, n=18, v=0})
      table.insert(waves, {x=0, y=0, n=17, v=0})
      table.insert(waves, {x=0, y=0, n=16, v=0})
      table.insert(waves, {x=0, y=0, n=15, v=0})
      table.insert(waves, {x=0, y=0, n=14, v=0})
      table.insert(waves, {x=0, y=0, n=13, v=0})
      table.insert(waves, {x=0, y=0, n=12, v=0})
      table.insert(waves, {x=0, y=0, n=11, v=0})
      table.insert(waves, {x=0, y=0, n=10, v=0})
      table.insert(waves, {x=0, y=0, n=9, v=0})
      table.insert(waves, {x=0, y=0, n=8, v=0})
      table.insert(waves, {x=0, y=0, n=7, v=0})
      table.insert(waves, {x=0, y=0, n=6, v=0})
      table.insert(waves, {x=0, y=0, n=5, v=0})
      table.insert(waves, {x=0, y=0, n=4, v=0})
      table.insert(waves, {x=0, y=0, n=3, v=0})
      table.insert(waves, {x=0, y=0, n=2, v=0})
      table.insert(waves, {x=0, y=0, n=1, v=0})
      table.insert(waves, {x=0, y=0, n=0, v=0})

      oddeven = 0

      drawwaves = function()
      if oddeven >=100 then
        oddeven = 1
      else
        oddeven = oddeven + 1
      end

      if oscillator >= 4 then oup = false
      elseif oscillator <= -4                                                                                                                then oup = true
      end
      if oup then oscillator = oscillator + .1 + math.random()/10
        else  oscillator = oscillator - .1 - math.random()/10
        end

        for i,v in ipairs(waves) do
          v.x = (screenwidth/24) * v.n
          if oddeven%wave_frame_rate == 1 then
            if v.n >= 1 then v.v = waves[i+1].v
              v.y = v.y - v.v
            else 
              v.v = oscillator 
              v.y = v.y - v.v
            end
          end
          lg.draw(enviro.wave, v.x, v.y+(screenheight*.7)-stagey*(screenheight/350), 0, screenwidth/1440, screenheight/700)

        end
      end


      gotimer = 0
      function go()
        if gotimer==0 then gosound:rewind()
        end
        if gotimer < 40 then
          gotimer = gotimer + 1
          lg.draw(enviro.go,screenwidth/4 -5 + math.random(10),screenheight/4-5 + math.random(10),0,screenwidth/1440,screenheight/900)
          gosound:play()
        end
      end

      me.deathclock = 0
      you.deathclock = 0
      function drawroulettenumbers()
        numshake = math.random(-5,5)
        if themode == "roulette" then
          if you.deathclock < 5 and you.deathclock > 0 then
            lg.draw(enviro.x,0,0,0,screenwidth/1440,screenheight/900)
            if you.lives == 4 then lg.draw(enviro.iv,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif you.lives == 3 then lg.draw(enviro.iii,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif you.lives == 2 then lg.draw(enviro.ii,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif you.lives == 1 then lg.draw(enviro.i,screenwidth - (530/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            end
          elseif me.deathclock < 5 and me.deathclock > 0 then
            lg.draw(enviro.x,0,0,0,screenwidth/1440,screenheight/900)
            if me.lives == 4 then lg.draw(enviro.iv,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif me.lives == 3 then lg.draw(enviro.iii,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif me.lives == 2 then lg.draw(enviro.ii,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            elseif me.lives == 1 then lg.draw(enviro.i,(30/1440)*screenwidth+numshake,(100/900)*screenheight+numshake,0,screenwidth/1440,screenheight/900)
            end
          end
        end
      end





  --function that adjusts the x for flipping left and right

  you.idletimer = 0
  me.idletimer = 0
  ay = 0
  me.walktimer = 0
  you.walktimer = 0


  orientlr = function(xx)

  me.xleft = me.x + 30
  me.mid = me.x + 15
  you.xleft = you.x + 30
  you.mid = you.x + 15

  if not xx.slowdown and not xx.slide and not xx.stop and not xx.pause and not xx.flinch
    and (xx.dodgetype~=2 and xx.dodgetype >-1) and xx.wjt ==0 and not xx.purplanding
    and not xx.greenkcondition
    then
    if xx.right then xx.lr = 1
    elseif xx.left then xx.lr = -1
    end
  end
  if xx.lr > 0 then

    xx.xanimate = xx.x
  else 
    xx.xanimate = xx.xleft
  end



end


idleanimatex = function(xx)
if xx.idletimer < 17 then 
  xx.idletimer = xx.idletimer + 1*ramp(xx)
  if xx.health<maxhealth/2 then
    xx.im = idle3
  else
    xx.im = idle1
  end
elseif xx.idletimer >= 17 and xx.idletimer < 33 then
  xx.idletimer = xx.idletimer + 1
  if xx.health<maxhealth/2 then

    xx.im = idle4
  else

    xx.im = idle2
  end
elseif xx.idletimer >=33 then
  xx.idletimer = 0
end

if xx.j ~= 0 then
  xx.superjumptimer = 0
elseif xx.dubtimer < -15 then
  xx.cansuperjump = true
  xx.superjumptimer = 13
  xx.im = landing 
elseif xx.superjumptimer > 0 then
  xx.im = landing 
  xx.cansuperjump = true
  xx.superjumptimer = rodib(xx.superjumptimer,1,0)

end


end


walkxx = function (xx)

if xx.v*xx.lr > 0 then
  xx.walktimer = xx.walktimer + 1*ramp(xx)
else
  xx.walktimer = xx.walktimer - 1*ramp(xx)
end



if xx.running and not xx.dodge then 

  if xx.walktimer >= xx.runpace+2 then xx.im = run4 
    xx.walktimer = 0
    repplay(xx.runsound)
    makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
  elseif xx.walktimer >= xx.runpace + 1 then xx.im = run4 
    makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
  elseif xx.walktimer >= xx.runpace/2 + 2 then xx.im = run3 
  elseif xx.walktimer >= xx.runpace/2 then xx.im = run2 
    makerunrubble(xx.y+50,xx.mid,-xx.v,xx.lr)
    repplay(xx.runsound)
  elseif xx.walktimer >= 0 then xx.im = run1 
  end  
else

  if xx.walktimer < 7 then 
    xx.im = walk1
    if xx.walktimer < 0 then 
      xx.walktimer = 34
    end
  elseif xx.walktimer >= 7 and xx.walktimer < 14 then
    xx.im = walk2
  elseif xx.walktimer >= 14 and xx.walktimer < 21 then
    xx.im = walk3
  elseif xx.walktimer >= 21 and xx.walktimer < 28 then
    xx.im = walk4
  elseif xx.walktimer >= 28 and xx.walktimer < 35 then
    xx.im = walk5
  else
    xx.walktimer = 0
  end
end
end

landxcheck = function (xx)
if xx.landingcounter <= 0	
  then xx.landing = false
else
  xx.landingcounter = xx.landingcounter - 1*ramp(xx)
end
end
you.slidetimer = 0
me.slidetimer = 0
slidexcheck = function (xx)
if xx.slidetimer < 6
  then 
  xx.slidetimer = xx.slidetimer + 1*ramp(xx)
elseif xx.slidetimer >= 6
  then xx.slide = false

end
end


animate = function (xx)
landxcheck(xx)
slidexcheck(xx)
if xx.slide 
  then xx.im = slide
  makeslidedust(xx.y+50,xx.mid + 15 * xx.lr,xx.v)


elseif xx.landing
  then 
  if xx.purplanding then
    xx.im = apk2

  else
    xx.im = landing
  end
elseif xx.g and aboutso(xx.v, xx.push) and not xx.slide 
  then idleanimatex(xx)
  xx.walktimer = 0
elseif not xx.g
  then
  if xx.wjt == 0 then
    if xx.j > 0 then 
      xx.im = jumprise
      else xx.im = jumpfalling
      end
    end
  else
    walkxx(xx)
  end


end

  --SPARKS COLOR BASED ON ATTACK COLOR?!?!?!?!?!?

  sparks = {}

  function makesparks(ex,why,vee, jay, arr,gee,bee)

    for i = 10, 1, -1 do
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(0,jay),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(0,jay),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(-jay,0),r=arr,g=gee,b=bee, rot = math.random(0,360)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(-jay/2,jay/2),r=arr,g=gee,b=bee, rot = math.random(0,360)})

    end

  end

  function makensparks(ex,why,ve, jy, arr,gee,bee, n)
    local force = ve+jy/2
    for i = n*spark_intensity, 1, -1 do
      local flip1 = 1
      local flip2 = 1
      if math.random()>.5 then
        flip1 = -1
      end
      if math.random()>.5 then
        flip2 = -1
      end
      vee = force*math.asin(math.rad(math.random(1,90)))*flip1
      jay = force*math.acos(math.rad(math.random(1,90)))*flip2
      table.insert(sparks,{x = ex, y = why, v=vee, j = jay,r=colorchange(arr),g=colorchange(gee),b=colorchange(bee), rot = math.random(0,360), shape = math.random(1,3)})

    end
  end

  function makensparksbox(ex,why,vee, jay, arr,gee,bee, n)

    for i = n, 1, -1 do
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(0,jay)+math.random(),r=colorchange(arr),g=colorchange(gee),b=colorchange(bee), rot = math.random(0,360), shape = math.random(1,3)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(0,jay)+math.random(),r=colorchange(arr),g=colorchange(gee),b=colorchange(bee), rot = math.random(0,360), shape = math.random(1,3)})
      table.insert(sparks,{x = ex, y = why, v=vee*math.random(), j = math.random(-jay,0)+math.random(),r=colorchange(arr),g=colorchange(gee),b=colorchange(bee), rot = math.random(0,360), shape = math.random(1,3)})
      table.insert(sparks,{x = ex, y = why, v=-vee*math.random(), j = math.random(-jay/2,jay/2)+math.random(),r=colorchange(arr),g=colorchange(gee),b=colorchange(bee), rot = math.random(0,360), shape = math.random(1,3)})

    end


  end

  function makenslashsparks(ex,why,vee, jay, arr,gee,bee,n)
    for i = 0, n do
      if vee > 0 then
        if jay < 0 then
          table.insert(sparks,{x = ex, y = why, v=floRan(0,vee), j = floRan(jay,0),r=arr,g=gee,b=bee,rot=math.random(0,360), shape = math.random(1,3)})
        else
          table.insert(sparks,{x = ex, y = why, v=floRan(0,vee), j = floRan(0,jay),r=arr,g=gee,b=bee,rot=math.random(0,360), shape = math.random(1,3)})
        end
      else
        if jay < 0 then
          table.insert(sparks,{x = ex, y = why, v=floRan(vee,0), j = floRan(jay,0),r=arr,g=gee,b=bee,rot=math.random(0,360), shape = math.random(1,3)})
        else
          table.insert(sparks,{x = ex, y = why, v=floRan(vee,0), j = floRan(0,jay),r=arr,g=gee,b=bee,rot=math.random(0,360), shape = math.random(1,3)})
        end
      end
    end
  end

  function updatesparks()

    for i, temp in ipairs(sparks) do
      if lineplatcheck(temp.x, temp.y,temp.v*1.6, temp.j*1.6) or
        linewallcheck(temp.x, temp.y,temp.v*1.6, temp.j*1.6)or temp.x < 0 or temp.y < 0
        or temp.x > themap.rightwall or
        temp.y > themap.floor then table.remove(sparks,i)

      end

    end

    for i,v in ipairs(sparks)do
      if not me.actionshot and not you.actionshot and not pause then
        v.y = v.y - v.j*rampspeed*1.6
        v.x = v.x + v.v*rampspeed*1.6
        v.j = v.j - .1*rampspeed*1.6
        v.rot = v.rot + math.random() *rampspeed
      end



    end
  end


  function drawsparks()

    for i,v in ipairs(sparks)do


      v.r = lof(v.r+math.random()*sparkfaderate*rampspeed,255)
      v.g = lof(v.g+math.random()*sparkfaderate*rampspeed,255)
      v.b = lof(v.b+math.random()*sparkfaderate*rampspeed,255)
      lg.setColor(v.r,v.g,v.b,math.random(150,255))
      if v.shape == 1 then
        lg.draw(enviro.spark,v.x-2,v.y-2,v.rot,math.random()/2,math.random()/2)
      elseif v.shape == 2 then
        lg.draw(enviro.spark2,v.x-2,v.y-2,v.rot,math.random()/2,math.random()/2)

      elseif v.shape == 3 then
        lg.draw(enviro.spark3,v.x-2,v.y-2,v.rot,math.random()/2,math.random()/2)

      end

    end
    lg.setColor(255,255,255)
  end



  slowtime = 95
  speedramp = false
  slowmot = 0
  function gavinanddan()
    if slowmot > 0 then
      slowmot = slowmot - 1
      speedramp = true
      musfadein = -3


    elseif slowww then 
      slowww = false 
      slowmot = slowtime

    else 
      speedramp = false
      slowmot = 0
      if musfade == 0 then
        musfadein = 10
        musfade = 255
        repplay(collides)
      --deathsound:play()
      --bcs:play()
    end


  end



end



function xrubble(xx)
  for i = #themap.walls, 1, -1 do 
    local wall = themap.walls[i]
    if (
      (xx.mid + xx.v > wall.x and xx.mid <= wall.x) or
      (xx.mid + xx.v < wall.x and xx.mid >= wall.x)
      )
    and 
    (
      (xx.y+(xx.height)/2 >= wall.y1 and 
        xx.y+(xx.height)/2 <= wall.y2 )
      ) then
    if xx.flinch then
      slowww = true
    end
    for i = xx.y, xx.feet, 1 do
      if wall.fractal ~= nil then
        if math.floor(i%10)==0 then
          makensparks(wall.x+(math.abs(xx.v)/xx.v), i, xx.v, xx.j, xx.color.c.r,xx.color.c.g,xx.color.c.b,1)
          
        end
        
      elseif wall.glasswall~=nil then
        if (wall.glasswall > 0 and i < wall.glasswall) or (wall.glasswall < 0 and i > -wall.glasswall)
          and math.floor(i%2)==0
          then 
          makenglass(wall.x,i,xx.v,xx.j, 1)
        elseif math.floor(i%20)==0 then
          makenrubble("vert", wall.x,i,xx.v,xx.j, 1)
        end
      elseif math.floor(i%20)==0 then
        makenrubble("vert", wall.x,i,xx.v,xx.j/2, 1)

      end


    end


    break
  end

end
end

