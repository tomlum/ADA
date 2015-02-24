

vforwallflinch = 10

walljumprange = 3.5


initjumpj = 12+2+1
--
initjmax = 17+2
--basically min j
jt = 0
risegrav = 1.3
dropgrav = .4

jforlanding = 20
landingfric = .3
landingwait = 10
shortlandwait = 7

maxgravity = 28
speedminit = 7
speedlimit = speedminit
accel = .5
minmaxdif = 4


maxhealth = 280
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
paperweight = 12

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

hopj = 22
hopj2 = 20
hopv2 = speedlimit + 2
climbj = 6

purplefuse = -70

minedropgrav = 17
ychargetime = 40
minedam = 12
cminedam = 17
bydam = 55
dettime = 250

grenadethrowv = 10
grenadethrowy = 10


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
runpace = 23


--slowdown rate
adecrate = .5
--move rate
amovrate = .7

]]--

runj = 10
runjt = 3
runjmax = 8

minvfordust = 3


--higher means more fric
fricrate = .75

initrunspeed = 10
runpace = 19

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