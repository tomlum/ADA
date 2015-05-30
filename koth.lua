
kothscoretowin = 100
ranplattimer = 0
karrow = lg.newImage("enviro/karrow.png")
krown = lg.newImage("enviro/krown.png")
kothcolor = {r = 253, g= 253, b = 25}
krownshader = lg.newShader(
  [[
  extern vec4 ncolor;
  extern vec4 score;
  extern vec4 outline;
  vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
  {
    vec4 texcolor = Texel(texture, texture_coords); 


    if (texcolor[0] - texcolor[1]>.8)
    return outline; 

    if (texcolor[2]>score[1]&&texcolor[3]>0)
    return ncolor;
    
    return vec4(0.0,0.0,0.0,0.0);
  }
  ]] )


kotharrowradius = 30
function kotharrowdraw(xx)
  colorshift(kothcolor,2)
  if kothplat ~= nil and not (xx.plat~=nil and xx.plat.n==kothplat.n) then
    local platx = (kothplat.x2 - kothplat.x1)/2+kothplat.x1


    local kangle = math.rad(180)-math.atan(
      (kothplat.y-(xx.y+30))
      /
      -(platx-xx.mid)
    )
    if (platx-xx.mid) > 0 then
      kangle = kangle + math.rad(180)
    end
    love.graphics.setColor(kothcolor.r,kothcolor.g,kothcolor.b)
    lg.draw(karrow,xx.mid+kotharrowradius*math.cos(kangle),
      xx.y+30+kotharrowradius*math.sin(kangle), kangle+math.rad(45),1,1,0,10)
  else
    
    xx.score = xx.score + 1
    
    local myscore = 1-(xx.score/kothscoretowin)
    lg.setShader(krownshader)
    krownshader:send("ncolor", 
      {1,1,0,1}
    ) 
    krownshader:send("score", 
      {myscore, myscore, myscore, myscore}
    ) 

    krownshader:send("outline", 
      {.5, .5, 0, 1}
    )
    lg.draw(krown, xx.mid, xx.y-10, 0, 1, 1, 6, 8) 
    lg.setShader()
  end
  
 
  
end

function drawhighlight()
  love.graphics.setColor(kothcolor.r,kothcolor.g,kothcolor.b)
  if kothplat ~= nil then
    lg.draw(plathighlight, kothplat.x1, kothplat.y, 0, kothplat.x2-kothplat.x1, -1)
  end
 cclear()

end

function randomizeplat()
  if ranplattimer > 1000 then
    ranplattimer = 0
oldplat = kothplat
    kothplat = nil
  end
  ranplattimer = ranplattimer + 1 
  
    while(kothplat == nil or kothplat.floor) or (kothplat==oldplat) do
      local rannum = math.random(1,#themaps[mapnum].plats)
      kothplat = themaps[mapnum].plats[rannum]
    end

end