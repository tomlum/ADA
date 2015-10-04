require "utilities"
require "lasso"

function initPlayer(xx)
	xx.oldv = 0
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
require "DamageTable"
require "meandyou"
require "camera"
require "Hits"
require "Music"
require "FIZIX"
require "Animation"
require "Joysticks"
require "ATTACK"
require "at/GG"
require "at/BB"
require "at/pp"
require "at/OO"
require "at/RR"
require "ai"
require "koth"
require "colorcontrol"
require "story/ch1/ch1"
require "enviro/colorbox"
require "fractal"
require "death"
require "chaptermanage"
loader = require "love-loader"
require "blossom"
end