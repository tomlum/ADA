
blanddam = 15
bsft = 30
swaittime = 48
sandboltdam = 8
sandboltknockup = 14
gsft = 15

psft = 75
psdam = 5

windft = 4

sminedam = 12
gsft = 10

hopv = 30
hopv2 = 10
climbv = 11

purplefuse = -70

minedropgrav = 17
ychargetime = 40
minedam = 12
cminedam = 17
bydam = 45
dettime = 250

grenadethrowv = 10
grenadethrowy = 10


boltdamage = 6
greenchargetime = 40


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
bspikedamage = 15
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
bcft = 45
pft = 30
apft = 50
bpft = 55
cpft = 100
cpftpoke = 30





maxgravity = 25
speedlimit = 13



function thev(x)
	
local dis = 1
local v = 1
while dis < x
	do dis = dis + v
		v = v + .93
end

return v

end