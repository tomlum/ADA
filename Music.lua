--origsetPitch = setPitch
--function Source:setPitch(pitch)
--  self:origsetPitch(pitch * .1)
--end

--function Account:withdraw (v)
--      self.balance = self.balance - v
--    end

colortheme = love.audio.newSource("sounds/colortheme.mp3", "stream")
colortheme:setVolume(.25)
colortheme:setLooping(true)

song1 = love.audio.newSource("sounds/song1.mp3", "stream")
song1:setVolume(.25)
song1:setLooping(true)

song2 = love.audio.newSource("sounds/song2.mp3", "stream")
song2:setVolume(.25)
song2:setLooping(true)

selecsong = love.audio.newSource("sounds/selector.mp3", "stream")
selecsong:setVolume(.1)
selecsong:setLooping(true)

openingsong = love.audio.newSource("sounds/title.mp3", "stream")
if not mute then
  openingsong:setVolume(.6)
else
  openingsong:setVolume(0)
end
openingsong:setLooping(true)


SFXV = 1
--TEsound.volume("all",.1)

ss = {}

function repplay(x)
  if not mute then
    if  < 1 then
      if x:getPitch()>.2 then
        x:setPitch(x:getPitch()*RAMPSPEED)
      end
    else
      if x:getPitch() < .2 then
        x:setPitch(x:getPitch()/)
      end
      --[[ local name = toString(2)
      if ss.name ~= nil then 
      else
        ss.name = true
      end
      ]]--
      end
      if x:isStopped() then
        x:play()
      else x:rewind()
        x:play()
      end
    end



  end


  randomizepitch = function ()
    me.blues:setPitch(.7 + (math.random() * .3) )
    you.blues:setPitch(.7 + (math.random() * .3) )
    me.greens:setPitch(1.2 + (math.random() * .3) )
    you.greens:setPitch(1.2 + (math.random() * .3) )
    you.purpsound:setPitch(.8 + (math.random() * .3) )
    me.purpsound:setPitch(.8 + (math.random() * .3) )
    you.purp2:setPitch(.8 + (math.random() * .3) )
    me.purp2:setPitch(.8 + (math.random() * .3) )
    me.green:setPitch(1.2 + (math.random() * .3) )
    you.green:setPitch(1.2 + (math.random() * .3) )
    gp1:setPitch(.3 + (math.random() * .3) )
    gp2:setPitch(.3 + (math.random() * .3) )
    me.land:setPitch(.8 + (math.random() * .3) )
    you.land:setPitch(.8 + (math.random() * .3) )
    me.flinch1:setPitch(.3 + (math.random() * .3) )
    you.flinch1:setPitch(.3 + (math.random() * .3) )
    me.flinch2:setPitch(.9 + (math.random() * .3) )
    you.flinch2:setPitch(.9 + (math.random() * .3) )
    chain1:setPitch(1.3 + (math.random() * .3) )
    chain2:setPitch(1.3 + (math.random() * .3) )
    me.airpurp:setPitch(.3 + (math.random() * .3) )
    you.airpurp:setPitch(.3 + (math.random() * .3) )
    reel1:setPitch(.8 + (math.random() * .3) )
    reel2:setPitch(.8 + (math.random() * .3) )
    you.bpsound:setPitch(.8 + (math.random() * .3) )
    me.bpsound:setPitch(.8 + (math.random() * .3) )
    me.cp:setPitch(.8 + (math.random() * .3) )
    you.cp:setPitch(.8 + (math.random() * .3) )
    me.slidesound:setPitch(.8 + (math.random() * .3) )
    you.slidesound:setPitch(.8 + (math.random() * .3) )
    me.runsound:setPitch(1.3 + (math.random() * .3) )
    you.runsound:setPitch(1.3 + (math.random() * .3) )
    me.jumpd:setPitch(1.65 + (math.random() * .3) )
    you.jumpd:setPitch(1.65 + (math.random() * .3) )
    wallbreaks:setPitch(1.3 + (math.random() * .3) )
    greenwallbreaks:setPitch(2 + (math.random() * .3) )
    glassbreaks:setPitch(1.3 + (math.random() * .3) )
    me.wallhit:setPitch(.5 + (math.random() * .3) )
    you.wallhit:setPitch(.5 + (math.random() * .3) )
    me.climbsound:setPitch(1.55 + (math.random() * .3) )
    you.climbsound:setPitch(1.55 + (math.random() * .3) )
    blocksound:setPitch(.8+ (math.random() * .3) )
    blocksound2:setPitch(.8 + (math.random() * .3) )
    me.flapsnd:setPitch(.8+ (math.random() * .3) )
    you.flapsnd:setPitch(.8 + (math.random() * .3) )
    me.whiff:setPitch(1.6 + (math.random() * .3) )
    you.whiff:setPitch(1.6 + (math.random() * .3) )
    tornadosound1:setPitch(1.6 + (math.random() * .3) )
    tornadosound2:setPitch(1.6 + (math.random() * .3) )

  end


  me.blocksound = love.audio.newSource("sounds/blocksound.wav", "stream")
  me.blocksound:setVolume(.1)
  me.blocksound:setPitch(1.2)
  you.blocksound = love.audio.newSource("sounds/blocksound.wav", "stream")
  you.blocksound:setVolume(.1)


  miscsounds = function()

    if me.im == slide and msready and not me.dodge then
      repplay(me.slidesound)
      msready = false
    elseif me.im ~= slide then msready = true
    end

    if you.im == slide and not you.dodge and ysready then
      repplay(you.slidesound)
      ysready = false
    elseif you.im ~= slide then ysready = true
    end


  end



  readysound = love.audio.newSource("sounds/ready.wav", "stream")
  readysound:setVolume(SFXV - .7)

  tornadosound1 = love.audio.newSource("sounds/tornado.wav", "stream")
  tornadosound1:setVolume(SFXV - .7)
  tornadosound2 = love.audio.newSource("sounds/tornado.wav", "stream")
  tornadosound2:setVolume(SFXV - .7)

  collides = love.audio.newSource("sounds/collide.wav", "stream")
  collides:setVolume(SFXV - .82)

  collidesar = {}
  collidesar[1] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[1]:setVolume(SFXV - .82)
  collidesar[2] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[2]:setVolume(SFXV - .82)
  collidesar[3] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[3]:setVolume(SFXV - .82)
  collidesar[4] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[4]:setVolume(SFXV - .82)
  collidesar[5] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[5]:setVolume(SFXV - .82)
  collidesar[6] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[6]:setVolume(SFXV - .82)
  collidesar[7] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[7]:setVolume(SFXV - .82)
  collidesar[8] = love.audio.newSource("sounds/collide.wav", "stream")
  collidesar[8]:setVolume(SFXV - .82)


  colorgsound = love.audio.newSource("sounds/gsound.mp3", "stream")

  colorpsound = love.audio.newSource("sounds/psound.mp3", "stream")


  adj = .14


  blocksound = love.audio.newSource("sounds/block.wav", "stream")
  blocksound:setVolume(SFXV - .6)

  pwss = love.audio.newSource("sounds/purpwings.wav", "stream")
  pwss:setVolume(SFXV-adj-.55)

  pwss2 = love.audio.newSource("sounds/purpwings.wav", "stream")
  pwss2:setVolume(SFXV-adj-.55)

  blueflap = love.audio.newSource("sounds/flap.wav", "stream")
  blueflap:setVolume(SFXV)
  blueflap:setPitch(1.5)

  me.flapblues = love.audio.newSource("sounds/blue.mp3", "static")
  me.flapblues:setVolume(SFXV-adj-.6)
  me.flapblues:setPitch(1.5)

  you.flapblues = love.audio.newSource("sounds/blue.mp3", "static")
  you.flapblues:setVolume(SFXV-adj-.6)
  you.flapblues:setPitch(1.5)

  flapyoublues = love.audio.newSource("sounds/blue.mp3", "static")
  flapyoublues:setVolume(SFXV-adj-.6)
  flapyoublues:setPitch(1.3)

  blueflap2 = love.audio.newSource("sounds/flap.wav", "stream")
  blueflap2:setVolume(SFXV)
  blueflap2:setPitch(1.3)

  me.flapsnd = love.audio.newSource("sounds/flap.wav", "stream")
  me.flapsnd:setVolume(SFXV - .4)

  you.flapsnd = love.audio.newSource("sounds/flap.wav", "stream")
  you.flapsnd:setVolume(SFXV - .4)

  blocksound2 = love.audio.newSource("sounds/block.wav", "stream")
  blocksound2:setVolume(SFXV - .6)

  wavesound = love.audio.newSource("sounds/wave.wav", "stream")
  wavesound:setVolume(SFXV - .92)
  wavesound:setPitch(.6)

  modesound = love.audio.newSource("sounds/mode.wav", "stream")
  modesound:setVolume(SFXV-.82)

  grenade1 = love.audio.newSource("sounds/grenade.wav", "stream")
  grenade1:setVolume(SFXV - .8)
  grenade2 = love.audio.newSource("sounds/grenade.wav", "stream")
  grenade2:setVolume(SFXV - 8)

  yellow1 = love.audio.newSource("sounds/yellow.wav", "stream")
  yellow1:setVolume(SFXV - .3)
  yellow2 = love.audio.newSource("sounds/yellow.wav", "stream")
  yellow2:setVolume(SFXV - .3)

  cyellow1 = love.audio.newSource("sounds/cyellow.wav", "stream")
  cyellow1:setVolume(SFXV - .4)
  cyellow2 = love.audio.newSource("sounds/cyellow.wav", "stream")
  cyellow2:setVolume(SFXV - .4)

  me.jumpd = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  me.jumpd:setVolume(SFXV - .7)
  you.jumpd = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  you.jumpd:setVolume(SFXV - .7)

  me.backdodge = love.audio.newSource("sounds/backdodge.wav", "stream")
  me.slidedodge = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  me.backdodge:setVolume(SFXV - .6)
  me.slidedodge:setVolume(SFXV - .6)
  me.backdodge:setPitch(1.2)

  you.backdodge = love.audio.newSource("sounds/backdodge.wav", "stream")
  you.slidedodge = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  you.backdodge:setVolume(SFXV - .6)
  you.slidedodge:setVolume(SFXV - .6)
  you.backdodge:setPitch(1.2)

  gosound = love.audio.newSource("sounds/go.mp3", "stream")
  gosound:setVolume(SFXV - .6)


  startb = love.audio.newSource("sounds/startb.wav", "stream")
  startb:setVolume(SFXV - .93)
  startb:setPitch(.8)
  startb2 = love.audio.newSource("sounds/startb.wav", "stream")
  startb2:setVolume(SFXV - .93)
  startb2:setPitch(.8)

  me.selected = love.audio.newSource("sounds/selected.wav", "stream")
  me.selected:setVolume(SFXV - .85)
  me.selected:setPitch(1)

  you.selected = love.audio.newSource("sounds/selected.wav", "stream")
  you.selected:setVolume(SFXV - .85)
  you.selected:setPitch(1.1)

  mov = love.audio.newSource("sounds/moving.wav", "stream")
  mov:setVolume(SFXV - .7)
  mov2 = love.audio.newSource("sounds/moving.wav", "stream")
  mov2:setVolume(SFXV - .7)
  mov2:setPitch(1.2)


  me.slidesound = love.audio.newSource("sounds/slide.wav", "static")
  me.slidesound:setVolume(SFXV-.82)
  you.slidesound = love.audio.newSource("sounds/slide.wav", "static")
  you.slidesound:setVolume(SFXV-.82)

  me.runsound = love.audio.newSource("sounds/run.wav", "static")
  me.runsound:setVolume(SFXV-.8)
  you.runsound = love.audio.newSource("sounds/run.wav", "static")
  you.runsound:setVolume(SFXV-.8)

  replaced = love.audio.newSource("sounds/replaced.wav", "static")
  replaced:setVolume(SFXV-.50)
  replaced:setPitch(.8)
  replaced2 = love.audio.newSource("sounds/replaced.wav", "static")
  replaced2:setVolume(SFXV-.50)
  replaced2:setPitch(.9)

  deathsound = love.audio.newSource("sounds/death.wav", "static")
  deathsound:setVolume(SFXV-.99)
  deathsound2 = love.audio.newSource("sounds/death2.wav", "static")
  deathsound2:setVolume(SFXV-.9)




  wallbreaks = love.audio.newSource("sounds/Purple.wav", "static")
  greenwallbreaks = love.audio.newSource("sounds/Purple.wav", "static")
  wallbreaks:setPitch(1.4)
  wallbreaks:setVolume(SFXV-.15-adj)
  greenwallbreaks:setPitch(1.8)
  greenwallbreaks:setVolume(SFXV-.3-adj)

  glassbreaks = love.audio.newSource("sounds/glass.wav", "static")
  glassbreaks:setPitch(1.8)
  glassbreaks:setVolume(SFXV-.7-adj)

  me.greenbreak = love.audio.newSource("sounds/glass.wav", "static")
  me.greenbreak:setPitch(1.1)
  me.greenbreak:setVolume(SFXV-.37-adj)

  you.greenbreak = love.audio.newSource("sounds/glass.wav", "static")
  you.greenbreak:setPitch(1.1)
  you.greenbreak:setVolume(SFXV-.37-adj)

  dig1 = love.audio.newSource("sounds/dig.wav", "static")
  dig1:setVolume(SFXV-.7-adj)
  dig2 = love.audio.newSource("sounds/dig.wav", "static")
  dig2:setVolume(SFXV-.7-adj)

  you.bpsound = love.audio.newSource("sounds/bluepurp.wav", "static")
  you.bpsound:setVolume(SFXV-.3-adj)
  me.bpsound = love.audio.newSource("sounds/bluepurp.wav", "static")
  me.bpsound:setVolume(SFXV-.3-adj)

  me.cp = love.audio.newSource("sounds/cp.wav", "static")
  me.cp:setVolume(SFXV-.65-adj)
  you.cp = love.audio.newSource("sounds/cp.wav", "static")
  you.cp:setVolume(SFXV-.65-adj)

  chain1 = love.audio.newSource("sounds/chain.wav", "static")
  chain1:setVolume(SFXV-.85-adj)
  chain2 = love.audio.newSource("sounds/chain.wav", "static")
  chain2:setVolume(SFXV-.85-adj)

  hook1 = love.audio.newSource("sounds/hook.wav", "static")
  hook1:setVolume(SFXV-.7-adj)
  hook2 = love.audio.newSource("sounds/hook.wav", "static")
  hook2:setVolume(SFXV-.7-adj)

  reel1 = love.audio.newSource("sounds/reel.wav", "static")
  reel1:setVolume(SFXV-.4-adj)
  reel2 = love.audio.newSource("sounds/reel.wav", "static")
  reel2:setVolume(SFXV-.4-adj)

  me.airpurp = love.audio.newSource("sounds/airpurp.wav", "static")
  me.airpurp:setVolume(SFXV-.7-adj)
  me.airpurp:setPitch(.7)


  you.airpurp = love.audio.newSource("sounds/airpurp.wav", "static")
  you.airpurp:setVolume(SFXV-.7-adj)
  you.airpurp:setPitch(.7)

  me.flinch1 = love.audio.newSource("sounds/flinch3.wav", "static")
  me.flinch1:setVolume(SFXV-.7-adj)
  you.flinch1 = love.audio.newSource("sounds/flinch3.wav", "static")
  you.flinch1:setVolume(SFXV-.7-adj)

  me.flinch2 = love.audio.newSource("sounds/flinch2.wav", "static")
  me.flinch2:setVolume(SFXV-.8-adj)
  you.flinch2 = love.audio.newSource("sounds/flinch2.wav", "static")
  you.flinch2:setVolume(SFXV-.8-adj)

  me.minch = love.audio.newSource("sounds/greenhit.wav", "static")
  me.minch:setVolume(SFXV-.7-adj)
  you.minch = love.audio.newSource("sounds/greenhit.wav", "static")
  you.minch:setVolume(SFXV-.7-adj)



  cg1 = love.audio.newSource("sounds/cg.wav", "static")
  cg1:setVolume(SFXV-.67-adj)
  cg1:setPitch(1.3)
  cg2 = love.audio.newSource("sounds/cg.wav", "static")
  cg2:setVolume(SFXV-.67-adj)
  cg2:setPitch(1.3)

  whiff = love.audio.newSource("sounds/green.mp3", "static")
  whiff:setVolume(SFXV-.9-adj)


  me.green = love.audio.newSource("sounds/green.mp3", "static")
  me.green:setVolume(SFXV-.8-adj)
  you.green = love.audio.newSource("sounds/green.mp3", "static")
  you.green:setVolume(SFXV-.8-adj)

  me.whiff = love.audio.newSource("sounds/green.mp3", "static")
  me.whiff:setVolume(SFXV-.83-adj)
  you.whiff = love.audio.newSource("sounds/green.mp3", "static")
  you.whiff:setVolume(SFXV-.83-adj)


  gp1 = love.audio.newSource("sounds/blue.mp3", "static")
  gp1:setVolume(SFXV-.65-adj)
  gp2 = love.audio.newSource("sounds/blue.mp3", "static")
  gp2:setVolume(SFXV-.65-adj)

  me.wallhit = love.audio.newSource("sounds/Purple.wav", "static")
  me.wallhit:setVolume(SFXV-.47-adj)

  you.wallhit = love.audio.newSource("sounds/Purple.wav", "static")
  you.wallhit:setVolume(SFXV-.47-adj)

  function distan(x,y,a,b)
    return math.sqrt(math.pow(x - a,2) + math.pow(y - b,2))
  end

  function distanc(x,y)
    return math.sqrt(math.pow(x.x - y.x,2) + math.pow(x.y - y.y,2))
  end

  me.pdisadj = 0
  you.pdisadj = 0


  bpurp1hit = love.audio.newSource("sounds/Purple.wav", "static")
  bpurp1hit:setPitch(.6)
  bpurp1hit:setVolume(SFXV-.6-adj)

  bpurp2hit = love.audio.newSource("sounds/Purple.wav", "static")
  bpurp2hit:setPitch(.6)
  bpurp2hit:setVolume(SFXV-.6-adj)

  me.purpsound = love.audio.newSource("sounds/Purple.wav", "static")
  me.purpsound:setVolume(SFXV-.3-adj)

  you.purpsound = love.audio.newSource("sounds/Purple.wav", "static")
  you.purpsound:setVolume(SFXV-.3-adj)

  me.purp2 = love.audio.newSource("sounds/Purple3.wav", "static")
  me.purp2:setVolume(SFXV-.7-adj)

  you.purp2 = love.audio.newSource("sounds/Purple3.wav", "static")
  you.purp2:setVolume(SFXV-.7-adj)

  me.land = love.audio.newSource("sounds/land.wav", "static")
  me.land:setVolume(SFXV-.68-adj)

  you.land = love.audio.newSource("sounds/land.wav", "static")
  you.land:setVolume(SFXV-.68-adj)

  me.climbsound = love.audio.newSource("sounds/land.wav", "static")
  me.climbsound:setVolume(SFXV-.6-adj)
  you.climbsound = love.audio.newSource("sounds/land.wav", "static")
  you.climbsound:setVolume(SFXV-.6-adj)


  bcs = love.audio.newSource("sounds/cb.wav", "static")
  bcs:setVolume(SFXV-.47-adj)

  bcs2 = love.audio.newSource("sounds/cb.wav", "static")
  bcs2:setVolume(SFXV-.47-adj)

  slowmo = love.audio.newSource("sounds/slowmo.mp3", "static")
  slowmo:setVolume(SFXV-.3-adj)

  me.blues = love.audio.newSource("sounds/blue.mp3", "static")
  me.blues:setVolume(SFXV-.6-adj)
  me.blues:setPitch(.7)

  you.blues = love.audio.newSource("sounds/blue.mp3", "static")
  you.blues:setVolume(SFXV-.7-adj)
  you.blues:setPitch(.7)

  me.greens = love.audio.newSource("sounds/blue.mp3", "static")
  me.greens:setVolume(SFXV-.6-adj)
  me.greens:setPitch(.7)

  you.greens = love.audio.newSource("sounds/blue.mp3", "static")
  you.greens:setVolume(SFXV-.7-adj)
  you.greens:setPitch(.7)
