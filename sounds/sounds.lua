-----------------------------------------------
---------------------Songs---------------------
-----------------------------------------------

colortheme = love.audio.newSource("sounds/colortheme2.mp3", "stream")
colortheme:setVolume(.25)
colortheme:setLooping(true)


song1 = love.audio.newSource("sounds/song1.mp3", "stream")
song1:setVolume(.25)
song1:setLooping(true)

song2 = love.audio.newSource("sounds/song2.mp3", "stream")
song2:setVolume(.25)
song2:setLooping(true)

controllerSetupSong = love.audio.newSource("sounds/recordscratch.mp3", "stream")
controllerSetupSong:setVolume(1.8)
controllerSetupSong:setLooping(true)


controllersound = love.audio.newSource("sounds/selector.mp3", "stream")
controllersound:setVolume(.1)
controllersound:setLooping(true)

openingsong = love.audio.newSource("sounds/title.mp3", "stream")
openingsong:setVolume(1.8)
openingsong:setLooping(true)


adj = .14


------------------------------------------------
---------------------Sounds---------------------
------------------------------------------------

function updateSounds()

  randomizePitch()

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
end

function repplay(x)
  if not mute then
    --[[
    if rampspeed < .9 then
      if x:getPitch()>.7 then
        x:setPitch(x:getPitch()*rampspeed)
      end
    else
      if x:getPitch() < .7 then
        x:setPitch(x:getPitch()/rampspeed)
      end
      local name = toString(2)
      if ss.name ~= nil then 
      else
        ss.name = true
      end
    end
    ]]--
    if x:isStopped() then
      x:play()
    else
      x:rewind()
      x:play()
    end
  end



end


function randomizePitch()

  blocksound:setPitch(.8+ (math.random() * .3) )
  wallbreaks:setPitch(1.3 + (math.random() * .3) )
  greenwallbreaks:setPitch(2 + (math.random() * .3) )
  glassbreaks:setPitch(1.3 + (math.random() * .3) )
  
  for i,xx in ipairs(players) do
    xx.blues:setPitch(.7 + (math.random() * .3) )

    xx.airpurp1:setPitch(.5 + (math.random() * .3) )

    xx.airpurp2:setPitch(.4 + (math.random() * .3) )

    xx.greens:setPitch(1.2 + (math.random() * .3) )


    xx.purpsound:setPitch(.8 + (math.random() * .3) )

    xx.purp2:setPitch(.8 + (math.random() * .3) )
    xx.green:setPitch(1.2 + (math.random() * .3) )

    xx.land:setPitch(.8 + (math.random() * .3) )
    xx.flinch1:setPitch(.3 + (math.random() * .3) )

    xx.flinch2:setPitch(.9 + (math.random() * .3) )

    xx.slidesound:setPitch(.8 + (math.random() * .3) )

    xx.runsound:setPitch(1.3 + (math.random() * .3) )

    xx.jumpd:setPitch(1.65 + (math.random() * .3) )

    xx.wallhit:setPitch(.5 + (math.random() * .3) )

    xx.climbsound:setPitch(1.55 + (math.random() * .3) )

    xx.whiff:setPitch(1.6 + (math.random() * .3) )
    xx.orangesou3:setPitch(.6 + (math.random() * .4) )

    xx.orangesou:setPitch(.5 + (math.random() * .4) )

    xx.orangesou2:setPitch(.5 + (math.random() * .4) )

    xx.orangesou4:setPitch(.6 + (math.random() * .4) )

    xx.redsound:setPitch(.8 + (math.random() * .4) )

    xx.redsound2:setPitch(.8 + (math.random() * .4) )

    xx.redsound3:setPitch(.8 + (math.random() * .4) )
    xx.flapsou:setPitch((.4 + (math.random() * .4) ))
    xx.redshattersou:setPitch(.8 + (math.random() * .4) )
    xx.redpushsou:setPitch(.9 + (math.random() * .4) )
  end
end

for i,xx in ipairs(players) do


  xx.redpushsou = love.audio.newSource("sounds/redpush.wav", "stream")
  xx.redpushsou:setVolume(.1)

  xx.redshattersou = love.audio.newSource("sounds/redshatter.wav", "stream")
  xx.redshattersou:setVolume(.7)

  xx.flapsou = love.audio.newSource("sounds/flap.wav", "stream")
  xx.flapsou:setVolume(.7)

  xx.redblocksou = love.audio.newSource("sounds/redblock.wav", "stream")
  xx.redblocksou:setVolume(.8)

  xx.redsound = love.audio.newSource("sounds/red.wav", "stream")
  xx.redsound:setVolume(.4)
  xx.redsound2 = love.audio.newSource("sounds/red2.wav", "stream")
  xx.redsound2:setVolume(.4)
  xx.redsound3 = love.audio.newSource("sounds/red3.wav", "stream")
  xx.redsound3:setVolume(.4)



  xx.blocksound = love.audio.newSource("sounds/blocksound.wav", "stream")
  xx.blocksound:setVolume(.1)
  xx.blocksound:setPitch(1.2)

  xx.orangesou = love.audio.newSource("sounds/orange2.wav", "stream")
  xx.orangesou:setVolume(.16)

  xx.orangesou3 = love.audio.newSource("sounds/orange2.wav", "stream")
  xx.orangesou3:setVolume(.16)


  xx.orangesou4 = love.audio.newSource("sounds/orange4.wav", "stream")
  xx.orangesou4:setVolume(1)



  xx.orangesou2 = love.audio.newSource("sounds/orange3.wav", "stream")
  xx.orangesou2:setVolume(.8)

  xx.jumpd = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  xx.jumpd:setVolume(1 - .7)


  xx.backdodge = love.audio.newSource("sounds/backdodge.wav", "stream")
  xx.slidedodge = love.audio.newSource("sounds/dodgeslide.wav", "stream")
  xx.backdodge:setVolume(1 - .6)
  xx.slidedodge:setVolume(1 - .6)
  xx.backdodge:setPitch(1.2)


  xx.selected = love.audio.newSource("sounds/selected.wav", "stream")
  xx.selected:setVolume(1 - .85)
  xx.selected:setPitch(1)


  if i == 1 then
    xx.mov = love.audio.newSource("sounds/moving.wav", "stream")
    xx.mov:setVolume(1 - .7)
    xx.mov:setPitch(1.1)
  end

  if i == 2 then
    xx.mov = love.audio.newSource("sounds/moving.wav", "stream")
    xx.mov:setVolume(1 - .7)
    xx.mov:setPitch(.9)
  end


  xx.slidesound = love.audio.newSource("sounds/slide.wav", "static")
  xx.slidesound:setVolume(1-.82)

  xx.runsound = love.audio.newSource("sounds/run.wav", "static")
  xx.runsound:setVolume(1-.8)

  xx.greenbreak = love.audio.newSource("sounds/glass.wav", "static")
  xx.greenbreak:setPitch(1.1)
  xx.greenbreak:setVolume(1-.37-adj)

  xx.flinch1 = love.audio.newSource("sounds/flinch3.wav", "static")
  xx.flinch1:setVolume(1-.7-adj)

  xx.flinch2 = love.audio.newSource("sounds/flinch2.wav", "static")
  xx.flinch2:setVolume(1-.8-adj)

  xx.minch = love.audio.newSource("sounds/greenhit.wav", "static")
  xx.minch:setVolume(1-.7-adj)

  xx.green = love.audio.newSource("sounds/green.mp3", "static")
  xx.green:setVolume(1-.8-adj)

  xx.whiff = love.audio.newSource("sounds/green.mp3", "static")
  xx.whiff:setVolume(1-.7-adj)

  xx.wallhit = love.audio.newSource("sounds/Purple.wav", "static")
  xx.wallhit:setVolume(1-.47-adj)

  xx.purpsound = love.audio.newSource("sounds/Purple.wav", "static")
  xx.purpsound:setVolume(1-.3-adj)


  xx.purp2 = love.audio.newSource("sounds/purple3.wav", "static")
  xx.purp2:setVolume(1-.7-adj)


  xx.land = love.audio.newSource("sounds/land.wav", "static")
  xx.land:setVolume(1-.68-adj)


  xx.climbsound = love.audio.newSource("sounds/land.wav", "static")
  xx.climbsound:setVolume(1-.6-adj)

  xx.airpurp2 = love.audio.newSource("sounds/blue.mp3", "static")
  xx.airpurp2:setVolume(1-.6-adj)

  xx.airpurp1 = love.audio.newSource("sounds/blue.mp3", "static")
  xx.airpurp1:setVolume(1-.6-adj)

  xx.blues = love.audio.newSource("sounds/blue.mp3", "static")
  xx.blues:setVolume(1-.73-adj)

  xx.greens = love.audio.newSource("sounds/blue.mp3", "static")
  xx.greens:setVolume(1-.6-adj)
end


gosound = love.audio.newSource("sounds/go.mp3", "stream")
gosound:setVolume(1 - .6)


startb = love.audio.newSource("sounds/startb.wav", "stream")
startb:setVolume(1 - .93)
startb:setPitch(.8)
startb2 = love.audio.newSource("sounds/startb.wav", "stream")
startb2:setVolume(1 - .93)
startb2:setPitch(.8)
mov = love.audio.newSource("sounds/moving.wav", "stream")
mov:setVolume(1 - .7)

blocksound = love.audio.newSource("sounds/block.wav", "stream")
blocksound:setVolume(1 - .6)

wavesound = love.audio.newSource("sounds/wave.wav", "stream")
wavesound:setVolume(1 - .92)
wavesound:setPitch(.6)

modesound = love.audio.newSource("sounds/mode.wav", "stream")
modesound:setVolume(1-.82)

slowmo = love.audio.newSource("sounds/slowmo.mp3", "static")
slowmo:setVolume(1-.3-adj)

replaced = love.audio.newSource("sounds/replaced.wav", "static")
replaced:setVolume(1-.50)
replaced:setPitch(.8)
replaced2 = love.audio.newSource("sounds/replaced.wav", "static")
replaced2:setVolume(1-.50)
replaced2:setPitch(.9)

deathsound = love.audio.newSource("sounds/death.wav", "static")
deathsound:setVolume(1-.99)
deathsound2 = love.audio.newSource("sounds/death2.wav", "static")
deathsound2:setVolume(1-.9)

wallbreaks = love.audio.newSource("sounds/Purple.wav", "static")
greenwallbreaks = love.audio.newSource("sounds/Purple.wav", "static")
wallbreaks:setPitch(1.4)
wallbreaks:setVolume(1-.15-adj)
greenwallbreaks:setPitch(1.8)
greenwallbreaks:setVolume(1-.3-adj)

glassbreaks = love.audio.newSource("sounds/glass.wav", "static")
glassbreaks:setPitch(1.8)
glassbreaks:setVolume(1-.7-adj)

grabsou = love.audio.newSource("sounds/grab.wav", "stream")
grabsou:setVolume(1 - .5)
grabreleasesou = love.audio.newSource("sounds/grabrelease.wav", "stream")
grabreleasesou:setVolume(1 - .5)
throwsou = love.audio.newSource("sounds/throw.wav", "stream")
throwsou:setVolume(1 - .5)

readysound = love.audio.newSource("sounds/ready.wav", "stream")
readysound:setVolume(1 - .7)

ready2sound = love.audio.newSource("sounds/pickcolor.wav", "stream")
ready2sound:setVolume(1 - .7)


collides = love.audio.newSource("sounds/collide.wav", "stream")
collides:setVolume(1 - .82)

collidesar = {}
collidesar[1] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[1]:setVolume(1 - .82)
collidesar[2] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[2]:setVolume(1 - .82)
collidesar[3] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[3]:setVolume(1 - .82)
collidesar[4] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[4]:setVolume(1 - .82)
collidesar[5] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[5]:setVolume(1 - .82)
collidesar[6] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[6]:setVolume(1 - .82)
collidesar[7] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[7]:setVolume(1 - .82)
collidesar[8] = love.audio.newSource("sounds/collide.wav", "stream")
collidesar[8]:setVolume(1 - .82)


function miscsounds()

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
