--you.y dependent on previous but you.x depends on bolt speed, the sendback v is dependent on the i number
--delete in reverse order?

boltdamage = 6
chargepunchdamage = 70
airbluedam = 15
bluedam = 10

boltdespawntime = 500
chboltmultrate = 30
boltspeed = 33

bboltspeed = 37

pboltspeed = 18
pboltdam = 10

bspikedamage = 15
aspikedamage = 23
spikedamage = 6
purpleairfootdam = 15
bluechargedam = 80

chargespikedur = 40
cpdam = 60
cpdampoke = 20
digtime = 150
pfootairdam = 20



--how long before the purp bolt drops
timetodrop = 70

--greenflinchtime
gft = 10
abft = 5
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
		v = v + .95
end

return v

end