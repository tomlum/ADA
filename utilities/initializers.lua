lg = love.graphics
draw = lg.draw
newImage = lg.newImage
lg.setDefaultFilter("linear","nearest",1)
players = {}
me = {}
you = {}
table.insert(players, 
	me)
table.insert(players, 
	you)

me.id = 1
you.id = 2


function initPlayer(xx)
	xx.is_player = true

	xx.lrum = 0
	xx.rrum = 0

	xx.x = 0
	xx.v = 0
	xx.mid = 0
	xx.j = 0
	xx.g = false
	xx.y = 0


	xx.spin_sigil = false
	xx.sigil_rot = 0
	xx.sigil_fade = 0

	xx.outlineh = math.random()

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

	xx.slidetimer = 0
	xx.slide = false
	xx.dodgetype = 0

	xx.jt = 0
	xx.landing_counter = 0
end

function initFightClub()
	if fightclub then 
		if MODE == "play" then
			loadImagesNow = true
			placespeople = true 
		end

		game_mode = "duel"
		MODE = "play"
		if not loadImagesNow then
			map_num = 100
		end
		the_map = the_maps[map_num]
		placespeople = true
		loadStage()
		while(not finished_loading) do
			loader.update() 
		end
	end

	for i,xx in ipairs(players) do
		xx.g = true
	end
end

function initJoysticks()
	joysticks = love.joystick.getJoysticks()
end

function initMenus()
	stagey = 0
	modenum = 1
	pause = false
	OLD_MODE = "begin"

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

	OS_String = love.system.getOS()

	screenwidth = lg.getWidth()
	screenheight = lg.getHeight()

	if fullscreen then 
		love.window.setMode(1280, 800, {resizable=true, fullscreen = true, vsync=true})
	else
		love.window.setMode(1280/1.5, 800/1.5, {resizable=true, fullscreen = false, vsync=true})
	end

	math.randomseed(os.clock())
	finished_loading = false
end

function initDependencies()
require "combat/damageTable"
require "utilities/utilities"
require "sounds/sounds"
require "menus"
require "animation/animation"
require "animation/blur"
require "animation/colorbox"
require "animation/blossom"
require "story/chaptermanage"
require "story/ch1/ch1"
require "combat/fizix"
require "combat/attack"
require "combat/death"
require "combat/colors/green"
require "combat/colors/blue"
require "combat/colors/purple"
require "combat/colors/orange"
require "combat/colors/red"
require "combat/colorcontrol"
require "combat/ai"
require "combat/hits"
require "combat/stages"
require "combat/lasso"
require "combat/gameModes/koth"
require "combat/gameModes/fractal"
require "combat/play"
end