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
openingsong:setVolume(.6)
openingsong:setLooping(true)


SFXV = 1


function repplay(x)
	if x:isStopped() then
			x:play()
		else x:rewind()
			x:play()
		end

end


randomizepitch = function ()
me.blues:setPitch(.8 + (math.random() * .3) )
you.blues:setPitch(.8 + (math.random() * .3) )
purp2:setPitch(.8 + (math.random() * .3) )
gr1:setPitch(1.2 + (math.random() * .3) )
gr2:setPitch(1.2 + (math.random() * .3) )
gp1:setPitch(.3 + (math.random() * .3) )
gp2:setPitch(.3 + (math.random() * .3) )
land1:setPitch(.8 + (math.random() * .3) )
land2:setPitch(.8 + (math.random() * .3) )
flinch1:setPitch(.6 + (math.random() * .3) )
flinch2:setPitch(.6 + (math.random() * .3) )
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
runsound:setPitch(1.3 + (math.random() * .3) )
runsound2:setPitch(1.3 + (math.random() * .3) )
me.jumpd:setPitch(1.65 + (math.random() * .3) )
you.jumpd:setPitch(1.65 + (math.random() * .3) )
wallbreaks:setPitch(1.3 + (math.random() * .3) )
greenwallbreaks:setPitch(2 + (math.random() * .3) )
glassbreaks:setPitch(1.3 + (math.random() * .3) )
wallhit1:setPitch(.5 + (math.random() * .3) )
wallhit2:setPitch(.5 + (math.random() * .3) )
climbsound:setPitch(1.55 + (math.random() * .3) )
climbsound2:setPitch(1.55 + (math.random() * .3) )
blocksound:setPitch(.8+ (math.random() * .3) )
blocksound2:setPitch(.8 + (math.random() * .3) )
me.flapsnd:setPitch(.8+ (math.random() * .3) )
you.flapsnd:setPitch(.8 + (math.random() * .3) )
whiff1:setPitch(1.6 + (math.random() * .3) )
whiff2:setPitch(1.6 + (math.random() * .3) )
tornadosound1:setPitch(1.6 + (math.random() * .3) )
tornadosound2:setPitch(1.6 + (math.random() * .3) )

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

tornadosound1 = love.audio.newSource("sounds/tornado.wav", "stream")
tornadosound1:setVolume(SFXV - .7)
tornadosound2 = love.audio.newSource("sounds/tornado.wav", "stream")
tornadosound2:setVolume(SFXV - .7)


collides = love.audio.newSource("sounds/collide.wav", "stream")
collides:setVolume(SFXV - .82)


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

flapblues = love.audio.newSource("sounds/blue.mp3", "static")
flapblues:setVolume(SFXV-adj-.6)
flapblues:setPitch(1.5)

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
slidesound:setVolume(SFXV-.82)
slidesound2 = love.audio.newSource("sounds/slide.wav", "static")
slidesound2:setVolume(SFXV-.82)

runsound = love.audio.newSource("sounds/run.wav", "static")
runsound:setVolume(SFXV-.8)
runsound2 = love.audio.newSource("sounds/run.wav", "static")
runsound2:setVolume(SFXV-.8)

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
flinch1:setVolume(SFXV-.7-adj)
flinch2 = love.audio.newSource("sounds/flinch.wav", "static")
flinch2:setVolume(SFXV-.7-adj)

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

whiff1 = love.audio.newSource("sounds/green.mp3", "static")
whiff1:setVolume(SFXV-.83-adj)
whiff2 = love.audio.newSource("sounds/green.mp3", "static")
whiff2:setVolume(SFXV-.83-adj)


gp1 = love.audio.newSource("sounds/blue.mp3", "static")
gp1:setVolume(SFXV-.65-adj)
gp2 = love.audio.newSource("sounds/blue.mp3", "static")
gp2:setVolume(SFXV-.65-adj)

wallhit1 = love.audio.newSource("sounds/Purple.wav", "static")
wallhit1:setVolume(SFXV-.47-adj)

wallhit2 = love.audio.newSource("sounds/Purple.wav", "static")
wallhit2:setVolume(SFXV-.47-adj)

function distan(x,y,a,b)
return math.sqrt(math.pow(x - a,2) + math.pow(y - b,2))
end

function distanc(x,y)
return math.sqrt(math.pow(x.x - y.x,2) + math.pow(x.y - y.y,2))
end

disadj1 = 0
disadj2 = 0


bpurp1hit = love.audio.newSource("sounds/Purple.wav", "static")
bpurp1hit:setPitch(.6)
bpurp1hit:setVolume(SFXV-.6-adj)

bpurp2hit = love.audio.newSource("sounds/Purple.wav", "static")
bpurp2hit:setPitch(.6)
bpurp2hit:setVolume(SFXV-.6-adj)

purp1 = love.audio.newSource("sounds/Purple.wav", "static")
purp1:setVolume(SFXV-.3-adj)

purp2 = love.audio.newSource("sounds/Purple.wav", "static")
purp2:setVolume(SFXV-.3-adj)

land1 = love.audio.newSource("sounds/land.wav", "static")
land1:setVolume(SFXV-.68-adj)

land2 = love.audio.newSource("sounds/land.wav", "static")
land2:setVolume(SFXV-.68-adj)

climbsound = love.audio.newSource("sounds/land.wav", "static")
climbsound:setVolume(SFXV-.6-adj)
climbsound2 = love.audio.newSource("sounds/land.wav", "static")
climbsound2:setVolume(SFXV-.6-adj)


bcs = love.audio.newSource("sounds/cb.wav", "static")
bcs:setVolume(SFXV-.47-adj)

bcs2 = love.audio.newSource("sounds/cb.wav", "static")
bcs2:setVolume(SFXV-.47-adj)

slowmo = love.audio.newSource("sounds/slowmo.mp3", "static")
slowmo:setVolume(SFXV-.3-adj)

me.blues = love.audio.newSource("sounds/blue.mp3", "static")
me.blues:setVolume(SFXV-.7-adj)
me.blues:setPitch(.7)

you.blues = love.audio.newSource("sounds/blue.mp3", "static")
you.blues:setVolume(SFXV-.7-adj)
you.blues:setPitch(.7)
