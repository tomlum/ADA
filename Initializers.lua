require "utilities"
require "lasso"

function initPlayer(xx)
	xx.is_player = true

	xx.oldv = 0
	xx.hit = false
	xx.old_feet = xx.y


	xx.rampspeed = 1
	xx.ramptimer = 0
	xx.rampcanhit = 0

	xx.wall_grab = false

	--Count of a repeated move (e.g. basic punch combo)
	xx.repcounter = 0

	--Purple Initializers
	xx.spikes = {}

end

function initFightClub()
	if fightclub then 
		if menu == "play" then
			loadImagesNow = true
			placespeople = true 
		end

		themode = "fractal"
		menu = "play"
		if not loadImagesNow then
			mapNum = 100
		end
		theMap = theMaps[mapNum]
		placespeople = true
			loadStage()
		while(not finishedLoading) do
			loader.update() 
		end
	end

end

function initJoysticks()
	joysticks = love.joystick.getJoysticks()

end

function initMenus()
	stagey = 0
	modenum = 0
	pause = false
	oldmenu = "begin"

	mefaceselector = 0
	youfaceselector = 0
	juststartedpost = true
	ln = 0
	rn = 0

	retryfade = 0
	fadeupretry = 0

	lcx = -screenwidth 
	rcx = screenwidth*1.5
end

function initLove()


	screenwidth = lg.getWidth()
	screenheight = lg.getHeight()

	if fullscreen then 
		love.window.setMode(1280, 800, {resizable=true, fullscreen = true, vsync=true})
	else
		love.window.setMode(1280/1.5, 800/1.5, {resizable=true, fullscreen = false, vsync=true})
	end

	lg.setDefaultFilter("linear","nearest",1)
	math.randomseed(os.clock())
	finishedLoading = false
end

function initDependencies()
require "blur"
require "menustuff"
require "damageTable"
require "meandyou"
require "camera"
require "hits"
require "music"
require "fizix"
require "animation"
require "joysticks"
require "attack"
require "attacks/green"
require "attacks/blue"
require "attacks/purple"
require "attacks/orange"
require "attacks/red"
require "ai"
require "gameModes/koth"
require "gameModes/fractal"
require "colorcontrol"
require "story/ch1/ch1"
require "enviro/colorbox"
require "death"
require "chaptermanage"
loader = require "love-loader"
require "blossom"
require "story/ch1/ch1"
require "platforms"
end