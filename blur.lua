--Germanunkol blurs

blursize = 10


function gblur(f)
 love.graphics.setShader(gshader)
 f()
 love.graphics.setShader()

end


--trippy effect!!!!
function blurdraw2(s,f)

  love.graphics.setShader(blur1)
  love.graphics.setShader(blur2)
  blur1.send(blur1,"blurSize", s/1000)
  blur2.send(blur2,"blurSize", s/1000)

  f()

  love.graphics.setShader()



end



--good with wobble
function HIGHCONTRAST(s,f)

  constrastshader.send(constrastshader,'direction', {1 / love.graphics.getWidth(), 1/love.graphics.getHeight()})
  constrastshader.send(constrastshader,'radius', s)


  love.graphics.setShader(constrastshader)

  f()

  love.graphics.setShader()



end


function blurdraw(s,f)


  --love.graphics.setBlendMode('premultiplied')

  boxblur2.send(boxblur2,'direction', {0,1 / love.graphics.getHeight()})
  boxblur2.send(boxblur2,'radius', s)

  love.graphics.setShader(boxblur2)
  f()

  love.graphics.setShader()




end


function blurdraw22(s,f)


  --love.graphics.setBlendMode('premultiplied')

  boxblur1.send(boxblur1,'direction', {1 / 
      love.graphics.getWidth(), 0})
  boxblur1.send(boxblur1,'radius', s)
  boxblur2.send(boxblur2,'direction', {0,1 / love.graphics.getHeight()})
  boxblur2.send(boxblur2,'radius', s)

  --love.graphics.setBlendMode("multiplicative")
  love.graphics.setBlendMode("replace")
  love.graphics.setShader(boxblur1)
  f()
  love.graphics.setShader(boxblur2)
  f()

  love.graphics.setShader()
  love.graphics.setBlendMode("alpha")




end






  myblur = love.graphics.newShader [[
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


  boxblur4 = love.graphics.newShader [[
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

  contrastshader = love.graphics.newShader [[
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
    return c / (8.0f * radius + 1.0f) * color;
  }

  ]]

  boxblur1 = love.graphics.newShader [[
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

  boxblur2 = love.graphics.newShader [[
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





  blur1 = love.graphics.newShader [[

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


  blur2 = love.graphics.newShader [[

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