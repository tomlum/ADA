function play()


	if game_mode == "koth" then
		randomizeplat()
	end

	speedRamp()

	updateSounds()
	gavinAndDan()

	if slowt == slowrate and not (pause or hitpause) and not me.actionshot 
		then

		movex(me,you)
		movex(you,me)
		hboxwall()
		platformcheckx()
		monplatupdate()
		applyMovements()

	end

      --cammovement()
      --if here then slideycling to person
      camerafol()

      if slowt == slowrate and not me.actionshot and not you.actionshot and not (pause or hitpause) then

      	updateboxes()
      	updateparticles()

        --if here then non slideycling to person
        --camerafol()

        whoupdatesfirst = math.random()
        if whoupdatesfirst>.5 then
        	attackmanage(me)
        	spikeupdate(me)
        	boltupdate(me) 
        end
        attackmanage(you)
        spikeupdate(you)
        boltupdate(you)  
        if whoupdatesfirst<=.5 then
        	attackmanage(me)
        	spikeupdate(me)
        	boltupdate(me) 
        end

        postattackmanage(me)
        postattackmanage(you)
        flinchingx(me,you)
        flinchingx(you,me)
        bumpDetection()
        
        dodging(me)
        dodging(you)

        climbs(me)
        climbs(you)

        miscsounds()
        holdmanage(me)
        holdmanage(you)

        orient(me)
        orient(you)

        cammovement()
        --if here then no slow mo twitter
        camerafol()
        camshakeflinch()

    end
    monupdate()
end





function drawPlay()
    cclear()

    --Left Primary Camera
    lg.setScissor(0, 0, screenwidth/2, winheight)
    camera:set()
    drawx(camera)
    camera:unset()
    lg.setScissor()

    --Right Primary Camera
    lg.setScissor(screenwidth/2, 0, screenwidth/2, winheight)
    camera2:set()
    drawx(camera2)
    camera2:unset()
    lg.setScissor()

    --Secondary Cameras (top/bottom)
    if onescreen and not vertone then
      if me.x < you.x then 
        lg.setScissor(screenwidth/2, topy,twidth+1, winheight/2+1)
        camera:set()
        drawx(camera)
        camera:unset()
        lg.setScissor()

        lg.setScissor(screenwidth/2-twidth, bottomy,twidth+1, winheight/2+1)
        camera2:set()
        drawx(camera2)
        camera2:unset()
        lg.setScissor()
    elseif me.x >= you.x then
        lg.setScissor(screenwidth/2-twidth, topy,twidth+1, enviro.screenheight/2+1)
        camera2:set()
        drawx(camera2)
        camera2:unset()
        lg.setScissor()

        lg.setScissor(screenwidth/2, bottomy,twidth+1, enviro.screenheight/2+1)
        camera:set()
        drawx(camera)
        camera:unset()
        lg.setScissor()
    end
end

drawOverlays()
end