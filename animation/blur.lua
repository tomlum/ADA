--Germanunkol blurs

blursize = 10


function gblur(f)
 lg.setShader(gshader)
 f()
 lg.setShader()

end


--trippy effect!!!!
function blurdraw2(s,f)
  
  lg.setShader(blur1)
  lg.setShader(blur2)
  blur1.send(blur1,"blurSize", s/1000)
  blur2.send(blur2,"blurSize", s/1000)

  f()

  lg.setShader()



end



--good with wobble
function HIGHCONTRAST(s,f)

  constrastshader.send(constrastshader,'direction', {1 / lg.getWidth(), 1/lg.getHeight()})
  constrastshader.send(constrastshader,'radius', s)


  lg.setShader(constrastshader)

  f()

  lg.setShader()



end


function blurdraw(s,f)


blur10:send("todd", 
    {tod[1], tod[2], tod[3], 1}
  ) 

  blur10.send(blur10,'blurSize', s)

  lg.setShader(blur10)
  f()

  lg.setShader()




end


function blurdraw22(s,f)


  --lg.setBlendMode('premultiplied')

  boxblur1.send(boxblur1,'direction', {1 / 
      lg.getWidth(), 0})
  boxblur1.send(boxblur1,'radius', s)
  boxblur2.send(boxblur2,'direction', {0,1 / lg.getHeight()})
  boxblur2.send(boxblur2,'radius', s)

  --lg.setBlendMode("multiplicative")
  lg.setBlendMode("replace")
  lg.setShader(boxblur1)
  f()
  lg.setShader(boxblur2)
  f()

  lg.setShader()
  lg.setBlendMode("alpha")




end



blur10 = lg.newShader [[

  extern number blurSize;
  extern number radius;
  extern vec4 todd;
  vec4 effect(vec4 color, Image texture, vec2 vTexCoord, vec2 pixel_coords)
  {
    vec4 sum = vec4(0.0);
    vec4 texcolor = Texel(texture, vTexCoord); 
    // take nine samples, with the distance blurSize between them
    sum += texture2D(texture, vec2(vTexCoord.x - 4.0*blurSize, vTexCoord.y)) * 0.05;
    sum += texture2D(texture, vec2(vTexCoord.x - 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x - 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x - blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * 0.16;
    sum += texture2D(texture, vec2(vTexCoord.x + blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x + 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x + 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x + 4.0*blurSize, vTexCoord.y)) * 0.05;
    
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 4.0*blurSize)) * 0.05;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 3.0*blurSize)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 2.0*blurSize)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y- blurSize)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * 0.16;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + blurSize)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 2.0*blurSize)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 3.0*blurSize)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 4.0*blurSize)) * 0.05;

    sum = sum/2.3;
return vec4(todd[0]*sum[0],todd[1]*sum[1],todd[2]*sum[2], texcolor[3]);
  }
  ]]



  myblur = lg.newShader [[
  extern number radius;
  vec4 effect( vec4 color, Image texture, vec2 tc, vec2 screen_coords ){
    vec4 c = Texel(texture, tc);

    for (float i = -radius; i <= radius; i += .25f)
    {
      for (float j = -radius; j <= radius; j += .25f)
      {
        c += Texel(texture, tc + i + j)/2;
      }
    }
    return c;
  }
  ]]


  boxblur4 = lg.newShader [[
  extern vec2 direction;
  extern number radius;
  vec4 effect(vec4 color, Image texture, vec2 tc, vec2 _)
  {
    vec4 c = vec4(0.0f);

    for (float i = -radius; i <= radius; i += .25f)
    {
      for (float j = -radius; j <= radius; j += .25f)
      {
        c += Texel(texture, tc + i * direction + j * direction);
      }
    }
    return c / (8.0f * radius * radius + 1.0f) * color;
  }

  ]]



  boxblur1 = lg.newShader [[
  extern vec2 direction;
  extern number radius;
  vec4 effect(vec4 color, Image texture, vec2 tc, vec2 _)
  {
    vec4 c = vec4(0.0f);

    for (float i = -radius; i <= radius; i += .25f)
    {
      c += Texel(texture, tc + i * direction);
    }
    return c / (8.0f * radius + 1.0f) * color;
  }
  ]]

  boxblur2 = lg.newShader [[
  extern vec2 direction;
  extern number radius;
  vec4 effect(vec4 color, Image texture, vec2 tc, vec2 _)
  {
    vec4 c = vec4(0.0f);

    for (float i = -radius; i <= radius; i += .25f)
    {
      c += Texel(texture, tc + i * direction);
    }
    return c / (8.0f * radius + 1.0f) * color;
  }
  ]]





  blur1 = lg.newShader [[

  extern number blurSize;
  extern number radius;
  vec4 effect(vec4 color, Image texture, vec2 vTexCoord, vec2 pixel_coords)
  {
    vec4 sum = vec4(0.0);
    // take nine samples, with the distance blurSize between them
    sum += texture2D(texture, vec2(vTexCoord.x - 4.0*blurSize, vTexCoord.y)) * 0.05;
    sum += texture2D(texture, vec2(vTexCoord.x - 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x - 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x - blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * 0.16;
    sum += texture2D(texture, vec2(vTexCoord.x + blurSize, vTexCoord.y)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x + 2.0*blurSize, vTexCoord.y)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x + 3.0*blurSize, vTexCoord.y)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x + 4.0*blurSize, vTexCoord.y)) * 0.05;


    return sum;
  }
  ]]
  blur1.send(blur1,"blurSize", 2)


  blur2 = lg.newShader [[

  extern number blurSize;
  vec4 effect(vec4 color, Image texture, vec2 vTexCoord, vec2 pixel_coords)
  {
    vec4 sum = vec4(0.0);
    // take nine samples, with the distance blurSize between them
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 4.0*blurSize)) * 0.05;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 3.0*blurSize)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 2.0*blurSize)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y- blurSize)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * 0.16;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + blurSize)) * 0.15;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 2.0*blurSize)) * 0.12;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 3.0*blurSize)) * 0.09;
    sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 4.0*blurSize)) * 0.05;

    return sum;
  }
  ]]

  blur2.send(blur2,"blurSize", 2)