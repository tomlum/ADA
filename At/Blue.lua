


you.bluechargetimer = 0
you.bluepause = 0
you.bnext = 0
you.bp = 0
you.bluechargetime = 50
you.airready = true
you.d = 0
you.bnext = 0
you.walktimer=0
you.bjstop = false

me.bluechargetimer = 0
me.bluepause = 0
me.bnext = 0
me.bp = 0
me.bluechargetime = 50
me.airready = true
me.d = 0
me.bnext = 0
me.walktimer=0
me.bjstop = false


function blueblade(x, yy, mm, cy, cm)

  if yy.g then yy.airready = true
  end

  local xdif = (mm.mid - yy.mid) * yy.lr

  if yy.g then yy.airready = true
  end

  if yy.bluepause <= 0 or yy.flinch or yy.bcancel then 
    yy.bnext = 0
    yy.bluechargetimer = 0
    yy.blu = false
    yy.d = 0
  else yy.blu = true
  end
  if not yy.g then

    if yy.bnext == "nevergonnahappen"
    then yy.bnext = "oh it happened"

    elseif yy.bnext == 202 and not yy.g
    then 
      if yy.j >= 0
      then yy.im = briseend
      else yy.im = bfallend
      end
      yy.d = 0
    elseif yy.bnext == 201 and not x and not yy.g
    then 
      yy.airready = false
      if (yy.j >= 0 and not cy.down) or (cy.up and yy.j < 0) then
        hboxc({x = yy.mid, y= yy.y+30}, 
          {x = yy.mid, y= yy.y-200-yy.j},
          {x = yy.mid+200*yy.lr+yy.v, y= yy.y-200-yy.j},
          {x = yy.mid+yy.v, y= yy.y+30}, true, yy.lr, true, true, yy.v + (5*yy.lr), yy.j+6, airbluedam, true, abft/3, 0, 0, false, false, yy.id)


        mm.g = false --?!?!?!?!?!?!?!?!?!!?!?

        yy.d = 8
        yy.im = brise 
        if (cy.up and yy.j < 0) then yy.j = 70
        else
          yy.j = 19
        end


        yy.v = yy.v + .2 * yy.lr
        repplay(yy.blues)

      elseif (yy.j < 0 and not cy.up) or (cy.down and yy.j >= 0) then
        yy.d = 6
        if (cy.down and yy.j >=0) then yy.j = -30
        else
          yy.j = yy.j - 5
          repplay(yy.blues)
        end
        yy.v = yy.v + 1 * yy.lr
        hboxc({x = yy.mid, y= yy.y+30}, 
          {x = yy.mid, y= yy.y+200-yy.j},
          {x = yy.mid+200*yy.lr+yy.v, y= yy.y+200-yy.j},
          {x = yy.mid+yy.v, y= yy.y+30}, true, yy.lr, true, true, yy.v + (10*yy.lr), yy.j-20, airbluedam, true, abft/3, 0, 0, false, false, yy.id)



        if yy.bp == 24 then yy.im = bfall
        elseif yy.bp == 18
        then yy.im = bfall2
        else yy.im = bfall3
        end
      end
    elseif yy.airready and x and not yy.g and yy.bnext <=201 then
      if yy.j >= 0 then 
        yy.im = briseprep
      else yy.im = bfallprep
      end
      yy.bnext = 200
      yy.d = 24
      yy.bluepause = 30
      yy.blu = false
    else yy.d = 0
      yy.bluechargetimer = 0
      yy.bjstop = false
    end

  else
    if yy.bnext==20 then yy.im = bc2 
      yy.d = 24
      hc(yy.mid, yy.y+30, yy.mid+yy.v+170*yy.lr, yy.y+30-yy.j, false, yy.lr, false, true, yy.v + (80*yy.lr), yy.j, bluechargedam, true, bcft, 0, 0, false, false, yy.id)

    elseif yy.bnext==21 then yy.im = bc2 
      yy.d = 24
      repplay(bcs2)
    elseif yy.bnext==22 then yy.im = bc3 
      yy.d = 12
      if yy.bp > 20 and platformcheck(yy.mid + (50*yy.lr),yy.y,-70) and platformcheck(yy.mid + (100*yy.lr),yy.y,-70) then
        makefloorrubble(yy.mid + (50*yy.lr), yy.feet, 3*yy.lr,4)
      end
    elseif yy.bnext>=23 and yy.bnext < 100 then yy.im = bcend
      yy.d = 0 

    elseif not x and yy.bnext == 19 
    then yy.im = bc1
      yy.d = 12


    elseif yy.bluechargetimer > bluechargetime and x and yy.bnext <= 19
    then yy.im = bluecharging
      yy.bluepause = 30
      yy.blu = false
      yy.d = 24
      yy.bp = 24
      yy.bnext = 18

    elseif yy.bnext == 12 then
      yy.im = bcend
      yy.d = 0
    elseif yy.bnext == 11 then
      yy.im = bcend
      yy.d = 12
      yy.v = yy.v + (-8 * yy.lr)
    elseif yy.bnext == 10 and not x
    then yy.im = blue33
      yy.d = 12
      yy.bluechargetimer = 0
      hc(yy.mid, yy.y+30, yy.mid+yy.v+250*yy.lr, yy.y+30-yy.j, true, yy.lr, true, true, yy.v + (20*yy.lr), yy.j, bluedam, true, bft/2, 0, 0, false, false, yy.id)
    elseif yy.bnext == 9 and not x
    then yy.im = blue32
      yy.d = 24
      yy.bluechargetimer = 0

      repplay(yy.blues)
    elseif yy.bnext == 8 and not x
    then yy.im = blue32
      yy.d = 24
      yy.bluechargetimer = 0
    elseif yy.bnext == 7 and not x
    then yy.im = blue31
      yy.d = 12
      yy.bluechargetimer = 0

    elseif x and yy.bnext == 6 or yy.bnext == 7 then 
      yy.im = blue3start
      yy.bnext = 7
      yy.bluepause = 25
      yy.blu = false
      yy.bluechargetimer = yy.bluechargetimer + 1



    elseif yy.bnext == 6
    then yy.im = blue23
      yy.d = 0
    elseif yy.bnext == 5
    then yy.im = blue22
      yy.d = 8
      repplay(yy.blues)	
      hc(yy.mid, yy.y+30, yy.mid+yy.v+160*yy.lr, yy.y+30-yy.j, true, yy.lr, true, true, yy.v + (4*yy.lr), yy.j, bluedam, true, bft/3, 0, 0, false, false, yy.id)
      --hc(you.mid, you.y+30, you.mid+yy.v+160*yy.lr, you.y+30-yy.j, true, yy.lr, true, true, yy.v + (4*yy.lr), yy.j, bluedam, true, bft, 0, 0, false, false, 2)
    elseif yy.bnext == 4 and not x
    then yy.im = blue21
      if controller2.right and yy.lr > 0 then
        yy.v = yy.v + 8
      elseif
      controller2.left and yy.lr < 0 then 
        yy.v = yy.v - 8
      else
        yy.v = yy.v + (4 * yy.lr)
      end
      yy.d = 12
      yy.bluechargetimer = 0
    elseif x and yy.bnext == 3 or yy.bnext == 4 then 
      yy.im = blue2start
      yy.bnext = 4
      yy.bluepause = 25
      yy.blu = false
      yy.bluechargetimer = yy.bluechargetimer + 1


    elseif yy.bnext == 3 then
      yy.im = blue1end
      yy.stop = true
      yy.d = 0
    elseif yy.bnext == 2
    then
      yy.im = blue12
      yy.d = 12
      repplay(yy.blues)		

      hc(yy.mid, yy.y+30, yy.mid+yy.v+160*yy.lr, yy.y+30-yy.j, false, yy.lr, false, true, yy.v + (4*yy.lr), yy.j, bluedam, true, bft/2, 0, 0, false, false, yy.id)

      --hcCheck(you.mid, you.y+30, you.mid+yy.v, you.y+30-yy.j, 2)
    elseif yy.bnext == 1 and not x then
      yy.im = blue11
      yy.d = 24
      if controller2.right and yy.lr > 0 then
        yy.v = yy.v + 7
      elseif
      controller2.left and yy.lr < 0 then 
        yy.v = yy.v - 7
      else
        yy.v = yy.v + (6 * yy.lr)
      end
      yy.bluechargetimer = 0
    elseif x and yy.bnext == 0 or yy.bnext == 1 then 
      yy.im = blue1start
      yy.bnext = 1
      yy.bluepause = 23
      yy.blu = false
      yy.bluechargetimer = yy.bluechargetimer + 1
      yy.d = 0
      if yy.walktimer< 7 then 
        yy.im = bwalk1
      elseif yy.walktimer>= 7 and yy.walktimer< 14 then
        yy.im = bwalk2
      elseif yy.walktimer>= 14 and yy.walktimer< 21 then
        yy.im = bwalk3
      elseif yy.walktimer>= 21 and yy.walktimer< 28 then
        yy.im = bwalk4
      elseif yy.walktimer>= 28 and yy.walktimer< 35 then
        yy.im = bwalk5
      else
        yy.walktimer= 0
      end

    else yy.d = 0
      yy.bluechargetimer = 0
      yy.bjstop = false


    end
  end
  if yy.bnext > 0 and yy.bnext < 200
  then yy.bjstop = true
  end

  if yy.bp > -10000000000 
  then
    yy.bp = yy.bp - yy.d
  end
  if yy.bp <= 0
  then yy.bnext = yy.bnext + 1
    yy.bp = 24
  end


  if yy.bluepause > 0
  then
    yy.bluepause = yy.bluepause - 1
    yy.stop = true
  end
  if yy.bnext == 1 then yy.stop = false
  end
end

