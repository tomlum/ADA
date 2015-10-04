require "utilities"
require "lasso"

function initPlayer(xx)
	xx.oldv = 0
	xx.hit = false
	xx.old_feet = xx.y


	xx.rampspeed = 1
	xx.ramptimer = 0
	xx.rampcanhit = 0
end

function initWorld()
end

function initLove()
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
end