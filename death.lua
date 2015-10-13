

function death2(xx)
  if (themode == "duel" and xx.health < 0) or 
  (themode == "spectrum" and xx.lives <= 0) 
  or 
  (themode == "koth" and xx.score >= kothscoretowin)
  or 
  (themode == "fractal" and xx.lives <= 0) then
        menu = "retry"
  end
  
  
  
  
  
  
  
     if xx.health <= 0 then 
     xx.flinch = false
     xx.ft = 0
    xx.stop = true
    xx.jstop = true
    if not xx.g then xx.im = airdying
    else
      xx.im = dying
    end
  
  
end


if (themode == "koth" or themode == "fractal") and xx.health <= 0 then
    if xx.deathclock == 0 then
      
xx.lives = xx.lives - 1
if xx.lives > 0 then
    throwinto()
    end
    end
    if xx.deathclock < 150 then
      xx.deathclock = xx.deathclock + 1

  end
  
    if xx.deathclock == 1 then 
      deathsound:play()
      deathsound2:play() 
    end
    
    if xx.deathclock >= 150 then 
      xx.deathclock = 0 
      xx.health = maxhealth
    elseif xx.deathclock > 104+ 30 then xx.im = invis
  elseif xx.deathclock > 101+ 30 then xx.im = fade8
    
      makensparks(xx.mid,xx.y,xx.v+3, xx.j-3, 255,255,255, 10)
      makensparks(xx.mid,xx.y,xx.v-3, xx.j-3, 255,255,255, 10)
    elseif xx.deathclock > 98+ 30 then xx.im = fade7
      
    elseif xx.deathclock > 95+ 30 then xx.im = fade6
      if themode == "fractal" then
        if xx.lives > 0 then
        fractalrespawn(xx)
        end
        elseif themode == "koth" then
      kothrespawn(xx)
      end
    elseif xx.deathclock > 92+ 30 then xx.im = fade5
    elseif xx.deathclock > 89+ 30 then xx.im = fade4
    elseif xx.deathclock > 86+ 30 then xx.im = fade3
    elseif xx.deathclock > 83+ 30 then xx.im = fade2
    elseif xx.deathclock > 80+ 30 then xx.im = fade1
    end

end








if themode == "koth" and (xx.score >= kothscoretowin) and allfade < 1 then
    beginretry = true
    
  elseif themode == "duel" or (themode == "spectrum" and xx.lives == 0) then
    if xx.health<0 then 
      xx.dead = true
      
      if xx.deathclock < 143 then
        if xx.deathclock == 142 then

          beginretry = true
        end
        xx.deathclock = xx.deathclock + 1

      end
      if xx.deathclock == 1 then 
        deathsound:play()
        deathsound2:play() 
      end
      if xx.deathclock > 104+ 30 then xx.im = invis
      elseif xx.deathclock > 101+ 30 then xx.im = fade8 
      elseif xx.deathclock > 98+ 30 then xx.im = fade7
      elseif xx.deathclock > 95+ 30 then xx.im = fade6
      elseif xx.deathclock > 92+ 30 then xx.im = fade5
      elseif xx.deathclock > 89+ 30 then xx.im = fade4
      elseif xx.deathclock > 86+ 30 then xx.im = fade3
      elseif xx.deathclock > 83+ 30 then xx.im = fade2
      elseif xx.deathclock > 80+ 30 then xx.im = fade1
      end
    end


  elseif themode == "spectrum" then
    if xx.health<0 then 
      if not xx.dead then xx.lives = xx.lives - 1
        deathsound2:play() end
        xx.dead = true
        xx.deathclock = xx.deathclock + 1
        if xx.deathclock > 104- 30 then 
          xx.dead = false
          xx.deathclock = 0
          xx.health = maxhealth
          xx.v = 0
          xx.j = 0
  

        elseif xx.deathclock > 101- 30 then xx.im = fade8 
          yy.im = morph7
        elseif xx.deathclock > 98- 30 then xx.im = fade7
          yy.im = morph7
        elseif xx.deathclock > 95- 30 then xx.im = fade6
          yy.im = morph6
        elseif xx.deathclock > 92- 30 then xx.im = fade5
          yy.im = morph5
        elseif xx.deathclock > 89- 30 then xx.im = fade4
          yy.im = morph4
        elseif xx.deathclock > 86- 30 then xx.im = fade3
          yy.im = morph3
        elseif xx.deathclock > 83- 30 then xx.im = fade2
          yy.im = morph2
        elseif xx.deathclock > 80- 30 then xx.im = fade1
          yy.im = morph1
        end
      end

    end




end