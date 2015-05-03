boltsflyrelative = true
combopause = false

kothscoretowin = 5000

waveframerate = 8 --(2 is fast, higher is lower)

vforwallflinch = 10

walljumprange = 3.5


--
--basically min j
jt = 0

jforlanding = 20
landingfric = .3
landingwait = 13
shortlandwait = 10
frameswhilelandcantmove = 8


--set to 0 for whiplash like turning
whiplash = 1 


--THE BIG ONES
--THE BIG ONES
--THE BIG ONES
defspeedminit = 6
minmaxdif = 4
accel = .5
--higher means more fric
--friction
fricrate = .6

awaypenalty = .7

initrunspeed = 8
defrunpace = 19

initjmax = 17+9
jumpheight = .6
initjumpj = 12
risegrav = 1
dropgrav = .3
maxgravity = 28

maxhealth = 180









speedminit = defspeedminit
speedlimit = speedminit




shakedis = 2
noshake = false

thebug = 0

towardaway = true

walljumpdis = 20
minvforwalljump = 2
walljumpjt = 14
walljumpvv = 12
walljumpv = 12
--for if holding up
walljumpjt2 = 15
walljumpvv2 = 14
walljumpv2 = 8

whiffradius = 150


papertime = 100
--speed necessary to move it
paperweight = 8

blanddam = 15
bsft = 30
swaittime = 48
sandboltdam = 8
sandboltknockup = 20
gsft = 15

fallflinchtime = 55

psft = 75
psdam = 5

tornadodur = 1000
windpush = 5

windft = 4

sminedam = 12
gsft = 10

hopj = 15
hopj2 = 10
hopv2 = speedlimit -5
climbj = 9

purplefuse = -70

minedropgrav = 17
ychargetime = 40
minedam = 12
cminedam = 17
bydam = 55
dettime = 250



boltdamage = 6
greenchargetime = 40
pauseforgreen = 4


chargepunchdamage = 70
airbluedam = 15
bluedam = 5
bluechargetime = 28

boltdespawntime = 500
chboltmultrate = 30
boltspeed = 33

bboltspeed = 37

pboltspeed = 18
pboltdam = 7

spikechargetime = 45
bspikedamage = 22
aspikedamage = 15
spikedamage = 5
purpleairfootdam = 10
bluechargedam = 80

chargespikedur = 40
cpdam = 10
cpdampoke = 20
digtime = 150
pfootairdam = 17



--how long before the purp bolt drops
timetodrop = 70

--greenflinchtime
byft = 50
yft = 40
cyft = 55
gft = 10
abft = 10
bft = 30
bcft = 55
pft = 30
apft = 50
bpft = 55
cpft = 100
cpftpoke = 30




--[[
maxgravity = 27
speedlimit = 13

runspeed = 22
xx.runpace = 23


--slowdown rate
adecrate = .5
--move rate
amovrate = .7

]]--

runj = 10
runjt = 3
runjmax = 8

minvfordust = 3




--slowdown rate
adecrate = .2
--move rate
amovrate = .7
maxairmove = speedminit*.6



function thev(x)
	
local dis = 1
local v = 1
while dis < x
	do dis = dis + v
		v = v + fricrate-.04
end

return v

end