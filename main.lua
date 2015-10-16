-----Naming Conventions-----
--fightclub = a mode/area for testing basic physics and combat
--me = player 1
--you = player 2
--xx = generic parameter for either player
--v = horizontal velocity
--j = vertical velocity
--can't kick combo out of purple kick

--notes:
--put images in more organized place, delete meanyou
--love.timer.sleep?
--change push to prevent pulling
--can rapid kick
--slowdown is weird/notworking 
--pause is broken
--xx.attack_num be more meaningful than 1 - 6
--apa13 xoff is incorrect
--implement action_done on all attacks
--can hexHit use colon and self?

require "initializers"

--Debug/Test Utilities
debug = false
fightclub = true
MODE = "color"
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
