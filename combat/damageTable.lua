hitpauseamount = 13

bolts_fly_relative = true
combo_pause = false

spark_intensity = 3

wave_frame_rate = 8 --(2 is fast, higher is lower)

v_for_wall_flinch = 10

--FRACTAL
fractal_max_health = 50
fractal_lives = 4

--Landing
j_for_landing = 20	--j necessary for a landing
landing_fric = .3	--friction incurred from landing
landing_wait = 13	--amount of pause from landing
short_land_wait = 10	--amount of pause from a short landing
land_pause_time = 8	--# of frames during landing when you can't move

--Jumping
regJT = 0	--default jumptime
superJumpRatio = 1.3


--set to 0 for whiplash like turning(?)
whiplash = 1 

--DANGER CLOSE
dangerrampspeed = .5
rampnormaldelta = .008
dangerRampDelta = rampnormaldelta*1.5
dangerbarey = 70


v_for_slowww = 5

--Walking Speed
defSpeedMInit = 6
minMaxSpeedDif = 4
accel = .5
--higher means more fric
friction = .27

awaypenalty = .7

initrunspeed = 7
defrunpace = 19

jump_delay = 7
initjmax = 17+9
jumpheight = .6
initjumpj = 12
risegrav = 1
dropgrav = .3
maxgravity = 28




speedminit = defSpeedMInit
speedlimit = speedminit




shakedis = 2
noshake = false

walljumpjt = 14
walljumpj = 12
walljumpv = 9
min_wall_grab_time = 12
--for if holding up
walljumpjt2 = 15
walljumpj2 = 23
walljumpv2 = 7

whiffradius = 150


papertime = 100
--speed necessary to move it
paperweight = 4

fallflinchtime = 55


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
boltspeed = 37

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

minvfordust = 2




--slowdown rate
adecrate = .2
--move rate
amovrate = .7
maxairmove = speedminit*.6