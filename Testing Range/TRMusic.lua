song1 = love.audio.newSource("sounds/song1.mp3", "stream")
song1:setVolume(.25)
song1:setLooping(true)

selecsong = love.audio.newSource("sounds/selector.mp3", "stream")
selecsong:setVolume(.1)
selecsong:setLooping(true)

openingsong = love.audio.newSource("sounds/title.mp3", "stream")
openingsong:setVolume(.6)
openingsong:setLooping(true)


SFXV = 1



randomizepitch = function ()
blues:setPitch(.8 + (math.random() * .3) )
blues2:setPitch(.8 + (math.random() * .3) )
blues3:setPitch(.8 + (math.random() * .3) )
blues4:setPitch(.8 + (math.random() * .3) )
purp2:setPitch(.8 + (math.random() * .3) )
gr1:setPitch(1.2 + (math.random() * .3) )
gr2:setPitch(1.2 + (math.random() * .3) )
gp1:setPitch(.3 + (math.random() * .3) )
gp2:setPitch(.3 + (math.random() * .3) )
land1:setPitch(.8 + (math.random() * .3) )
land2:setPitch(.8 + (math.random() * .3) )
flinch1:setPitch(.8 + (math.random() * .3) )
flinch2:setPitch(.8 + (math.random() * .3) )
chain1:setPitch(1.3 + (math.random() * .3) )
chain2:setPitch(1.3 + (math.random() * .3) )
airpurp1:setPitch(.3 + (math.random() * .3) )
airpurp2:setPitch(.3 + (math.random() * .3) )
reel1:setPitch(.8 + (math.random() * .3) )
reel2:setPitch(.8 + (math.random() * .3) )
bp1:setPitch(.8 + (math.random() * .3) )
bp2:setPitch(.8 + (math.random() * .3) )
cp1:setPitch(.8 + (math.random() * .3) )
cp2:setPitch(.8 + (math.random() * .3) )
slidesound:setPitch(.8 + (math.random() * .3) )
slidesound2:setPitch(.8 + (math.random() * .3) )
wallbreaks:setPitch(1.3 + (math.random() * .3) )
wallbreaks:setPitch(1.3 + (math.random() * .3) )

end



miscsounds = function()

if me.im == slide and msready and not me.dodge then
			slidesound:play()
			msready = false
elseif me.im ~= slide then msready = true
end

if you.im == slide and not you.dodge and ysready then
			slidesound2:play()
			ysready = false
elseif you.im ~= slide then ysready = true
end



end

readysound = love.audio.newSource("sounds/ready.wav", "stream")
readysound:setVolume(SFXV - .7)

startbplay = function()
if startb:isStopped() then
			startb:play()
		else startb:rewind()
			startb:play()	
		end
end

collides = love.audio.newSource("sounds/collide.wav", "stream")
collides:setVolume(SFXV - .82)


startb2play = function()
if startb:isStopped() then
			startb:play()
		else startb:rewind()
			startb:play()
		end
end

yellowplay = function()
if yellow1:isStopped() then
			yellow1:play()
		else yellow1:rewind()
			yellow1:play()
		end
end

yellowplay2 = function()
if yellow2:isStopped() then
			yellow2:play()
		else yellow2:rewind()
			yellow2:play()
		end
end

cyellowplay = function()
if cyellow1:isStopped() then
			cyellow1:play()
		else cyellow1:rewind()
			cyellow1:play()
		end
end


function repplay(x)
	if x:isStopped() then
			x:play()
		else x:rewind()
			x:play()
		end

end

cyellowplay2 = function()
if cyellow2:isStopped() then
			cyellow2:play()
		else cyellow2:rewind()
			cyellow2:play()
		end
end

wavesound = love.audio.newSource("sounds/wave.wav", "stream")
wavesound:setVolume(SFXV - .92)
wavesound:setPitch(.6)

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


backdodge = love.audio.newSource("sounds/backdodge.wav", "stream")
slidedodge = love.audio.newSource("sounds/dodgeslide.wav", "stream")
backdodge:setVolume(SFXV - .6)
slidedodge:setVolume(SFXV - .6)
backdodge:setPitch(1.2)

backdodge2 = love.audio.newSource("sounds/backdodge.wav", "stream")
slidedodge2 = love.audio.newSource("sounds/dodgeslide.wav", "stream")
backdodge2:setVolume(SFXV - .6)
slidedodge2:setVolume(SFXV - .6)
backdodge2:setPitch(1.2)

gosound = love.audio.newSource("sounds/go.mp3", "stream")
gosound:setVolume(SFXV - .6)


startb = love.audio.newSource("sounds/startb.wav", "stream")
startb:setVolume(SFXV - .93)
startb:setPitch(.8)
startb2 = love.audio.newSource("sounds/startb.wav", "stream")
startb2:setVolume(SFXV - .93)
startb2:setPitch(.8)

selected = love.audio.newSource("sounds/selected.wav", "stream")
selected:setVolume(SFXV - .85)
selected:setPitch(1)

selected2 = love.audio.newSource("sounds/selected.wav", "stream")
selected2:setVolume(SFXV - .85)
selected2:setPitch(1.1)

mov = love.audio.newSource("sounds/moving.wav", "stream")
mov:setVolume(SFXV - .7)
mov2 = love.audio.newSource("sounds/moving.wav", "stream")
mov2:setVolume(SFXV - .7)
mov2:setPitch(1.2)


slidesound = love.audio.newSource("sounds/slide.wav", "static")
slidesound:setVolume(SFXV-.78)
slidesound2 = love.audio.newSource("sounds/slide.wav", "static")
slidesound2:setVolume(SFXV-.78)


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

adj = .14


wallbreaks = love.audio.newSource("sounds/Purple.wav", "static")
wallbreaks:setPitch(1.4)
wallbreaks:setVolume(SFXV-.15-adj)

wallbreaks2 = love.audio.newSource("sounds/Purple.wav", "static")
wallbreaks2:setPitch(1.4)
wallbreaks2:setVolume(SFXV-.15-adj)

dig1 = love.audio.newSource("sounds/dig.wav", "static")
dig1:setVolume(SFXV-.7-adj)
dig2 = love.audio.newSource("sounds/dig.wav", "static")
dig2:setVolume(SFXV-.7-adj)

bp1 = love.audio.newSource("sounds/bluepurp.wav", "static")
bp1:setVolume(SFXV-.3-adj)
bp2 = love.audio.newSource("sounds/bluepurp.wav", "static")
bp2:setVolume(SFXV-.3-adj)

cp1 = love.audio.newSource("sounds/cp.wav", "static")
cp1:setVolume(SFXV-.65-adj)
cp2 = love.audio.newSource("sounds/cp.wav", "static")
cp2:setVolume(SFXV-.65-adj)

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

airpurp1 = love.audio.newSource("sounds/airpurp.wav", "static")
airpurp1:setVolume(SFXV-.7-adj)
airpurp1:setPitch(.7)


airpurp2 = love.audio.newSource("sounds/airpurp.wav", "static")
airpurp2:setVolume(SFXV-.7-adj)
airpurp2:setPitch(.7)

flinch1 = love.audio.newSource("sounds/flinch.wav", "static")
flinch1:setVolume(SFXV-.75-adj)
flinch2 = love.audio.newSource("sounds/flinch.wav", "static")
flinch2:setVolume(SFXV-.75-adj)

minch1 = love.audio.newSource("sounds/greenhit.wav", "static")
minch1:setVolume(SFXV-.7-adj)
minch2 = love.audio.newSource("sounds/greenhit.wav", "static")
minch2:setVolume(SFXV-.7-adj)



cg1 = love.audio.newSource("sounds/cg.wav", "static")
cg1:setVolume(SFXV-.67-adj)
cg1:setPitch(1.3)
cg2 = love.audio.newSource("sounds/cg.wav", "static")
cg2:setVolume(SFXV-.67-adj)
cg2:setPitch(1.3)


gr1 = love.audio.newSource("sounds/green.mp3", "static")
gr1:setVolume(SFXV-.8-adj)
gr2 = love.audio.newSource("sounds/green.mp3", "static")
gr2:setVolume(SFXV-.8-adj)

gp1 = love.audio.newSource("sounds/blue.mp3", "static")
gp1:setVolume(SFXV-.65-adj)
gp2 = love.audio.newSource("sounds/blue.mp3", "static")
gp2:setVolume(SFXV-.65-adj)

purp1 = love.audio.newSource("sounds/Purple.wav", "static")
purp1:setVolume(SFXV-.3-adj)

purp2 = love.audio.newSource("sounds/Purple.wav", "static")
purp2:setVolume(SFXV-.3-adj)

land1 = love.audio.newSource("sounds/land.wav", "static")
land1:setVolume(SFXV-.68-adj)

land2 = love.audio.newSource("sounds/land.wav", "static")
land2:setVolume(SFXV-.68-adj)


bcs = love.audio.newSource("sounds/cb.wav", "static")
bcs:setVolume(SFXV-.47-adj)

slowmo = love.audio.newSource("sounds/slowmo.mp3", "static")
slowmo:setVolume(SFXV-.3-adj)

blues = love.audio.newSource("sounds/blue.mp3", "static")
blues:setVolume(SFXV-.7-adj)
blues:setPitch(.7)

blues2 = love.audio.newSource("sounds/blue.mp3", "static")
blues2:setVolume(SFXV-.7-adj)
blues2:setPitch(.7)

blues3 = love.audio.newSource("sounds/blue.mp3", "static")
blues3:setVolume(SFXV-.7-adj)
blues3:setPitch(.7)

blues4 = love.audio.newSource("sounds/blue.mp3", "static")
blues4:setVolume(SFXV-.7-adj)
blues4:setPitch(.7)