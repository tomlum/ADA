-----Naming Conventions-----
--fightclub = a mode/area for testing basic physics and combat
--me = player 1
--you = player 2
--xx = generic parameter for either player
--v = horizontal velocity
--j = vertical velocity
--MODE = primary game mode
--can't kick combo out of purple kick

--notes:
--Times square, have a facade layer that's black or something so this way it looks like back lit
--If you hit glass floor with enough j break through it
--love.timer.sleep?
--change push to prevent pulling
--can rapid kick
--slowdown is weird/notworking 
--apa13 xoff is incorrect
--can hexHit use colon and self?

require "initializers"

--Debug/Test Utilities
demo = true
debug = false
fightclub = false
MODE = "controllerSetup"
notilebouncing = true
melcolor = 1
mercolor = 4
youlcolor = 3
yourcolor = 2
therampspeed = .2
mapNum = 3
rampspeed= therampspeed
drawBoxes = false
drawFeet = true
volume = 0
fullscreen = false
readout = false
putmehere = 1000
putyouhere = 1025
chapter = 1
oldchapter = "bob"
lassoisathing = false
dangerCloseIsAThing = true


mute = false

love.audio.setVolume(volume)

initLove()
initDependencies()

theMap = theMaps[mapNum]

function love.load()

  initPlayer(me)
  initPlayer(you)
  initMenus()
  initJoysticks()
  initFightClub()
  
end


function love.update()

  modeManager()
  updateLoader()
  updateScreenInfo()
  updateControllers()

  if MODE == "story" then
    updatechapters()

  elseif MODE == "preplay" or MODE == "play" then 
    MODE = "play"
    --Update characters, physics, points, etc, there's a lot behind this
    play()
    handleRetry()
    t_colorShift(thecolors[2].c)
    t_colorShift(me.outline)
    t_colorShift(you.outline)

  elseif MODE == "retry" then
    handleRetry()

  end

end





function love.draw()

  if MODE ~= "play" and MODE ~= "story" then
    drawmenus()

  elseif MODE == "play" then
    drawPlay()

  elseif MODE == "story" then
    drawStory()
  end

  if debug or fightclub then
    debugReadouts()
  end

end
