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
--Allow keyboard to do throw and wall jump
--Currently green forward can knock through floor... is it hline??
--fix camera minor jump on fullscreen from verticalm
--add new finish to combo to Orange, long strike
--air dash
--Times square, have a facade layer that's black or something so this way it looks like back lit against lights
--If you hit glass floor with enough j break through it
--love.timer.sleep?
--change push to prevent pulling
--can rapid kick
--slowdown is weird/notworking 
--apa13 xoff is incorrect
--can hexHit use colon and self?

require "utilities/initializers"

--Filming utilities
infinitepan = false
no_screen_follow = false
drawControllers = false
waver_outlines = true
drawtrails = false
noslowmo = false

--Debug/Test Utilities
fightclub = true
demo = false
debug = false
MODE = "controllerSetup"

notilebouncing = false
melcolor = 1
mercolor = 4
youlcolor = 3
yourcolor = 2
therampspeed = .2
mapNum = 2
rampspeed= therampspeed
drawBoxes = false
drawFeet = false
volume = 0
fullscreen = false
readout = false
putmehere = 1000
putyouhere = 1025
chapter = 1
oldchapter = "bob"
lassoisathing = false
dangerCloseIsAThing = not no_screen_follow

mute = false


if demo then

  fightclub = false
  infinitepan = false
  no_screen_follow = false
  drawControllers = false
  waver_outlines = true
  drawtrails = false
  noslowmo = false
  MODE = "controllerSetup"
  melcolor = 0
  mercolor = 0
  youlcolor = 0
  yourcolor = 0
  fullscreen = true
  mapNum = 1
  volume = 1

end


love.audio.setVolume(volume)

initLove()
initDependencies()

the_map = the_maps[mapNum]

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

  if demo then  drawControlsOverlay() end

  if debug or fightclub then
    debugReadouts()
  end
  lg.setColor(25,25,25)

  drawTrainingWheels()
  --monitorParticles(100,100)
  --lg.print(tostring(me.dodgetype), 300, 320)
  --lg.rectangle("fill", screenwidth/2,0,screenwidth,screenheight)

end
