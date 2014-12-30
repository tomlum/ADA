--is this causing trouble?  Search that phrase

me.c={r = 255, g = 255, b = 255}
you.c={r = 255, g = 255, b = 255}

--new color control

function NCC(xx)
  if xx.color == 0 then 
    xx.c={r = 255, g = 255, b = 255}
  
  elseif xx.color == 1 then
    xx.c={r = 87, g = 0, b = 158}
  elseif xx.color == 2 then
    xx.c={r = 40, g = 255, b = 0}
  end

end

function veins(xx)
  --draw the image and then the image.v
  
end


mynumbers = {1,2,3,4}
yournumbers = {1,2,3,4}

function onlytwoattacks()


  if not me.a1 and not me.a2 and not me.a3 and not me.a4
  then mynumbers = {1,2,3,4}
  end

  if not you.a1 and not you.a2 and not you.a3 and not you.a4
  then yournumbers = {1,2,3,4}
  end

  if me.a1 and table.getn(mynumbers) > 2 then
    for i,v in ipairs(mynumbers) do 
      if v == 1 then table.remove(mynumbers, i)
      end
    end
  end

  if me.a2 and table.getn(mynumbers) > 2 then
    for i,v in ipairs(mynumbers) do 
      if v == 2 then table.remove(mynumbers, i)
      end
    end
  end

  if me.a3 and table.getn(mynumbers) > 2 then
    for i,v in ipairs(mynumbers) do 
      if v == 3 then table.remove(mynumbers, i)
      end
    end
  end

  if me.a4 and table.getn(mynumbers) > 2 then
    for i,v in ipairs(mynumbers) do 
      if v == 4 then table.remove(mynumbers, i)
      end
    end
  end

  if you.a1 and table.getn(yournumbers) > 2 then
    for i,v in ipairs(yournumbers) do 
      if v == 1 then table.remove(yournumbers, i)
      end
    end
  end

  if you.a2 and table.getn(yournumbers) > 2 then
    for i,v in ipairs(yournumbers) do 
      if v == 2 then table.remove(yournumbers, i)
      end
    end
  end

  if you.a3 and table.getn(yournumbers) > 2 then
    for i,v in ipairs(yournumbers) do 
      if v == 3 then table.remove(yournumbers, i)
      end
    end
  end

  if you.a4 and table.getn(yournumbers) > 2 then
    for i,v in ipairs(yournumbers) do 
      if v == 4 then table.remove(yournumbers, i)
      end
    end
  end


  for i,v in ipairs(mynumbers) do 
    if table.getn(mynumbers) <= 2 then
      if v == 1 then me.a1 = false end
      if v == 2 then me.a2 = false end
      if v == 3 then me.a3 = false end
      if v == 4 then me.a4 = false end
    end
  end

  for i,v in ipairs(yournumbers) do
    if table.getn(yournumbers) <= 2 then
      if v == 1 then you.a1 = false end
      if v == 2 then you.a2 = false end
      if v == 3 then you.a3 = false end
      if v == 4 then you.a4 = false end
    end
  end



end





function specialrandom(x)
  return math.ceil(math.random(x))

end

function myroulettespin()
  mcolorlist = {"b","g","p","y","s"}
  if math.random(17) < 1 then 
    mcolorlist[math.ceil(math.random(5))] = 0
  end 
  ranm1 = specialrandom(5)
  if mcolorlist[ranm1] == "b" then mbb = 1
  elseif mcolorlist[ranm1] == "p" then mpp = 1
  elseif mcolorlist[ranm1] == "g" then mgg = 1
  elseif mcolorlist[ranm1] == "y" then myy = 1
  elseif mcolorlist[ranm1] == "s" then mss = 1
  end
  table.remove(mcolorlist,ranm1)
  ranm1 = specialrandom(4)
  if mcolorlist[ranm1] == "b" then mbb = 2
  elseif mcolorlist[ranm1] == "p" then mpp = 2
  elseif mcolorlist[ranm1] == "g" then mgg = 2
  elseif mcolorlist[ranm1] == "y" then myy = 2
  elseif mcolorlist[ranm1] == "s" then mss = 2
  end
  table.remove(mcolorlist,ranm1)
  ranm1 = specialrandom(3)
  if mcolorlist[ranm1] == "b" then mbb = 3
  elseif mcolorlist[ranm1] == "p" then mpp = 3
  elseif mcolorlist[ranm1] == "g" then mgg = 3
  elseif mcolorlist[ranm1] == "y" then myy = 3
  elseif mcolorlist[ranm1] == "s" then mss = 3
  end
  ranm1 = specialrandom(2)
  if mcolorlist[ranm1] == "b" then mbb = 4
  elseif mcolorlist[ranm1] == "p" then mpp = 4
  elseif mcolorlist[ranm1] == "g" then mgg = 4
  elseif mcolorlist[ranm1] == "y" then myy = 4
  elseif mcolorlist[ranm1] == "s" then mss = 4
  end
  table.remove(mcolorlist,ranm1)
end

function yourroulettespin()
  ycolorlist = {"b","g","p","y","s"}
  if math.random(17) < 1 then 
    ycolorlist[math.ceil(math.random(5))] = 0
  end 
  ranm1 = specialrandom(5)
  if ycolorlist[ranm1] == "b" then ybb = 1
  elseif ycolorlist[ranm1] == "p" then ypp = 1
  elseif ycolorlist[ranm1] == "g" then ygg = 1
  elseif ycolorlist[ranm1] == "y" then yyy = 1
  elseif ycolorlist[ranm1] == "s" then yss = 1
  end
  table.remove(ycolorlist,ranm1)
  ranm1 = specialrandom(4)
  if ycolorlist[ranm1] == "b" then ybb = 2
  elseif ycolorlist[ranm1] == "p" then ypp = 2
  elseif ycolorlist[ranm1] == "g" then ygg = 2
  elseif ycolorlist[ranm1] == "y" then yyy = 2
  elseif ycolorlist[ranm1] == "s" then yss = 2
  end
  table.remove(ycolorlist,ranm1)
  ranm1 = specialrandom(3)
  if ycolorlist[ranm1] == "b" then ybb = 3
  elseif ycolorlist[ranm1] == "p" then ypp = 3
  elseif ycolorlist[ranm1] == "g" then ygg = 3
  elseif ycolorlist[ranm1] == "y" then yyy = 3
  elseif ycolorlist[ranm1] == "s" then yss = 3
  end
  ranm1 = specialrandom(2)
  if ycolorlist[ranm1] == "b" then ybb = 4
  elseif ycolorlist[ranm1] == "p" then ypp = 4
  elseif ycolorlist[ranm1] == "g" then ygg = 4
  elseif ycolorlist[ranm1] == "y" then yyy = 4
  elseif ycolorlist[ranm1] == "s" then yss = 4
  end
  table.remove(ycolorlist,ranm1)
end


colorassign = function()



  if lset and rset and MENU == "choose" then 

    selecsong:play()
    if collide then
      if collides:isStopped() then
        collides:play()
      else colides:rewind()
        collides:play()
      end
      settriangles()
      collide = false
    end

    if mereadytoplay and youreadytoplay and ((me.start and mns) or (you.start and yns)) then MENU = "postchoose"
      selecsong:stop()
      readysound:play()
    end



    if me.a1 then me.a2, me.a3, me.a4 = false, false, false
    elseif me.a2 then me.a1, me.a3, me.a4 = false, false, false
    elseif me.a3 then me.a2, me.a1, me.a4 = false, false, false
    elseif me.a4 then me.a2, me.a1, me.a3 = false, false, false
    end

    if not me.block and not me.left and not me.right and not me.a1 and not me.a2 and not me.a3 and not me.start and not me.a4 and not me.up and not me.down then
      mns = true
    end




    if mns and mechoosecolor and me.start
    then mechooseface = true 
      repplay(startb)

      mechoosecolor = false
      mns = false
    elseif mns and mechooseface and me.block then
      mechooseface = false
      mechoosecolor = true
      mns = false
      replaced:play()
    elseif mns and mechooseface and me.start
    then mechooseface = false 
      repplay(startb)
      mns = false
      mereadytoplay = true
    elseif mns and mereadytoplay and me.block then 
      mereadytoplay = false
      mechooseface = true
      mns = false
      mechoosecolor = false
      replaced:play()
    end


    if mechooseface then

      if me.up and mns and mefaceselector > 0 
      then mefaceselector = mefaceselector - 1
        mns = false
        mov:play()
      elseif me.down and mns and mefaceselector < 5 
      then mefaceselector = mefaceselector + 1
        mns = false
        mov:play()
      end




      if mefaceselector == 0 and mns then
        me.face = face1 
        mf1r, mf1g, mf1b = a31r,a31g,a31b
      else 
        mf1r,mf1g,mf1b = 255,255,255
      end


      if mefaceselector == 1 then
        me.face = face2 
        mf2r, mf2g, mf2b = a31r,a31g,a31b
      else
        mf2r,mf2g,mf2b = 255,255,255
      end

      if mefaceselector == 2 then
        me.face = face3 
        mf3r, mf3g, mf3b = a31r,a31g,a31b
      else
        mf3r,mf3g,mf3b = 255,255,255
      end


      if mefaceselector == 3 then
        me.face = face4 
        mf4r, mf4g, mf4b = a31r,a31g,a31b
      else
        mf4r,mf4g,mf4b = 255,255,255
      end

      if mefaceselector == 4 then
        me.face = face5 
        mf5r, mf5g, mf5b = a31r,a31g,a31b
      else
        mf5r,mf5g,mf5b = 255,255,255
      end

      if mefaceselector == 5 then
        me.face = face6 
        mf6r, mf6g, mf6b = a31r,a31g,a31b
      else
        mf6r,mf6g,mf6b = 255,255,255
      end




    end


    if yns and youchoosecolor and you.start
    then youchooseface = true 
      repplay(startb2)
      youchoosecolor = false
      yns = false
    elseif yns and youchooseface and you.block then
      youchooseface = false
      youchoosecolor = true
      yns = false
      replaced2:play()
    elseif yns and youchooseface and you.start
    then youchooseface = false
      repplay(startb2)
      yns = false
      youreadytoplay = true
    elseif yns and youreadytoplay and you.block then 
      youreadytoplay = false
      youchooseface = true
      youchoosecolor = false
      yns = false
      replaced2:play()
    end


    if youchooseface then


      if you.up and yns and youfaceselector > 0 
      then youfaceselector = youfaceselector - 1
        yns = false
        mov2:play()
      elseif you.down and yns and youfaceselector < 5 
      then youfaceselector = youfaceselector + 1
        yns = false
        mov2:play()
      end


      if youfaceselector == 0 then
        you.face = face1 
        yf1r, yf1g, yf1b = a22r,a22g,a22b
      else
        yf1r,yf1g,yf1b = 255,255,255
      end

      if youfaceselector == 1 then
        you.face = face2 
        yf2r, yf2g, yf2b = a22r,a22g,a22b
      else
        yf2r,yf2g,yf2b = 255,255,255
      end

      if youfaceselector == 2 then
        you.face = face3 
        yf3r, yf3g, yf3b = a22r,a22g,a22b
      else
        yf3r,yf3g,yf3b = 255,255,255
      end


      if youfaceselector == 3 then
        you.face = face4 
        yf4r, yf4g, yf4b = a22r,a22g,a22b
      else
        yf4r,yf4g,yf4b = 255,255,255
      end

      if youfaceselector == 4 then
        you.face = face5 
        yf5r, yf5g, yf5b = a22r,a22g,a22b
      elseif you.face ~= face5 then
        yf5r,yf5g,yf5b = 255,255,255
      end

      if youfaceselector == 5 then
        you.face = face6 
        yf6r, yf6g, yf6b = a22r,a22g,a22b
      else
        yf6r,yf6g,yf6b = 255,255,255
      end










    end



    if mechoosecolor then 
      if meseleccurrent == 0 
      then 

        mecurrentframe = enviro.bframe


        if mns then
          if me.a1 
          then 
            mbselec = true
            mns = false
            mbb = 1
            repplay(selected)	elseif me.a2 
            then mbselec = true
              mns = false
              mbb = 2
              repplay(selected)	elseif me.a3
              then mbselec = true
                mns = false
                mbb = 3
                repplay(selected)	elseif me.a4
                then mbselec = true
                  mns = false
                  mbb = 4
                  repplay(selected)	elseif me.block
                  then mbselec = false
                    mns = false
                    mbb = 0	
                    replaced:play()
                  end

                  if mgg == mbb then mgg = 0
                    if mbb ~= 0 then replaced:play() end
                  elseif mpp == mbb then mpp = 0
                    if mbb ~= 0 then replaced:play() end
                  elseif myy == mbb then myy = 0
                    if mbb ~= 0 then replaced:play() end
                  elseif mss == mbb then mss = 0
                    if mbb ~= 0 then replaced:play() end
                  end

                end



              elseif meseleccurrent == 1 
              then 

                mecurrentframe = enviro.gframe




                if mns then
                  if me.a1 
                  then mgselec = true
                    mns = false
                    mgg = 1
                    repplay(selected)	elseif me.a2 
                    then mgselec = true
                      mns = false
                      mgg = 2
                      repplay(selected)	elseif me.a3
                      then mgselec = true
                        mns = false
                        mgg = 3
                        repplay(selected)	elseif me.a4
                        then mgselec = true
                          mns = false
                          mgg = 4
                          repplay(selected)	elseif me.block
                          then mgselec = false
                            mns = false
                            mgg = 0	
                            replaced:play()
                          end

                          if mbb == mgg then mbb = 0
                            if mgg ~= 0 then replaced:play() end
                          elseif mpp == mgg then mpp = 0
                            if mgg ~= 0 then replaced:play() end
                          elseif myy == mgg then myy = 0
                            if mgg ~= 0 then replaced:play() end
                          elseif mss == mgg then mss = 0
                            if mgg ~= 0 then replaced:play() end
                          end


                        end

                      elseif meseleccurrent == 2 
                      then 

                        mecurrentframe = enviro.pframe




                        if mns then
                          if me.a1 
                          then mpselec = true
                            mns = false
                            mpp = 1
                            repplay(selected)	elseif me.a2 
                            then mpselec = true
                              mns = false
                              mpp = 2
                              repplay(selected)	elseif me.a3
                              then mpselec = true
                                mns = false
                                mpp = 3
                                repplay(selected)	elseif me.a4
                                then mpselec = true
                                  mns = false
                                  mpp = 4
                                  repplay(selected)	elseif me.block
                                  then mpselec = false
                                    mns = false
                                    mpp = 0	
                                    replaced:play()
                                  end

                                  if mpp == mbb then mbb = 0
                                    if mpp ~= 0 then replaced:play() end
                                  elseif mpp == mgg then mgg = 0
                                    if mpp ~= 0 then replaced:play() end
                                  elseif myy == mpp then myy = 0
                                    if mpp ~= 0 then replaced:play() end
                                  elseif mss == myy then mss = 0
                                    if myy ~= 0 then replaced:play() end
                                  end

                                end

                              elseif meseleccurrent == 3 
                              then 

                                mecurrentframe = enviro.yframe


                                if mns then
                                  if me.a1 
                                  then
                                    mns = false
                                    myy = 1
                                    repplay(selected)	elseif me.a2 
                                    then 
                                      mns = false
                                      myy = 2
                                      repplay(selected)	elseif me.a3
                                      then 
                                        mns = false
                                        myy = 3
                                        repplay(selected)	elseif me.a4
                                        then 
                                          mns = false
                                          myy = 4
                                          repplay(selected)	elseif me.block
                                          then
                                            mns = false
                                            myy = 0	
                                            replaced2:play()
                                          end

                                          if myy == mgg then mgg = 0
                                            if myy ~= 0 then replaced2:play() end
                                          elseif myy == mpp then mpp = 0
                                            if myy ~= 0 then replaced2:play() end
                                          elseif myy == mbb then mbb = 0
                                            if myy ~= 0 then replaced2:play() end
                                          elseif mss == myy then mss = 0
                                            if myy ~= 0 then replaced:play() end
                                          end



                                        end

                                      elseif meseleccurrent == 4 
                                      then 

                                        mecurrentframe = enviro.sframe



                                        if mns then
                                          if me.a1 
                                          then 
                                            mns = false
                                            mss = 1
                                            repplay(selected)	
                                          elseif me.a2 
                                          then 
                                            mns = false
                                            mss = 2
                                            repplay(selected)	
                                          elseif me.a3
                                          then 
                                            mns = false
                                            mss = 3
                                            repplay(selected)	
                                          elseif me.a4
                                          then 
                                            mns = false
                                            mss = 4
                                            repplay(selected)	
                                          elseif me.block
                                          then mpselec = false
                                            mns = false
                                            mss = 0	
                                            replaced:play()
                                          end

                                          if mss == mbb then mbb = 0
                                            if mss ~= 0 then replaced:play() end
                                          elseif mss == mgg then mgg = 0
                                            if mss ~= 0 then replaced:play() end
                                          elseif mss == myy then myy = 0
                                            if mss ~= 0 then replaced:play() end
                                          elseif mss == mpp then mpp = 0
                                            if mss ~= 0 then replaced:play() end
                                          end


                                        end













                                      end
                                    end



                                    if you.a1 then you.a2, you.a3, you.a4 = false, false, false
                                    elseif you.a2 then you.a1, you.a3, you.a4 = false, false, false
                                    elseif you.a3 then you.a2, you.a1, you.a4 = false, false, false
                                    elseif you.a4 then you.a2, you.a1, you.a3 = false, false, false
                                    end



                                    if not you.block and not you.left and not you.right and  not you.a1 and not you.start and not you.a2 and not you.a3 and not you.a4 and not you.up and not you.down then
                                      yns = true
                                    end





                                    if youchoosecolor then

                                      if youseleccurrent == 0 
                                      then 

                                        youcurrentframe = enviro.bframe



                                        if yns then
                                          if you.a1 
                                          then 
                                            ybselec = true
                                            yns = false
                                            ybb = 1
                                            repplay(selected2)	elseif you.a2 
                                            then ybselec = true
                                              yns = false
                                              ybb = 2
                                              repplay(selected2)	elseif you.a3
                                              then ybselec = true
                                                yns = false
                                                ybb = 3
                                                repplay(selected2)	elseif you.a4
                                                then ybselec = true
                                                  yns = false
                                                  ybb = 4
                                                  repplay(selected2)		elseif you.block
                                                  then ybselec = false
                                                    yns = false
                                                    ybb = 0	
                                                    replaced2:play()

                                                  end

                                                  if ygg == ybb then ygg = 0
                                                    if ybb ~= 0 then replaced2:play() end
                                                  elseif ypp == ybb then ypp = 0
                                                    if ybb ~= 0 then replaced2:play() end
                                                  elseif yyy == ybb then yyy = 0
                                                    if ybb ~= 0 then replaced2:play() end
                                                  elseif yss == ybb then yss = 0
                                                    if ybb ~= 0 then replaced2:play() end
                                                  end

                                                end



                                              elseif youseleccurrent == 1 
                                              then 

                                                youcurrentframe = enviro.gframe





                                                if yns then
                                                  if you.a1 
                                                  then ygselec = true
                                                    yns = false
                                                    ygg = 1
                                                    repplay(selected2)	elseif you.a2 
                                                    then ygselec = true
                                                      yns = false
                                                      ygg = 2
                                                      repplay(selected2)	elseif you.a3
                                                      then ygselec = true
                                                        yns = false
                                                        ygg = 3
                                                        repplay(selected2)	elseif you.a4
                                                        then ygselec = true
                                                          yns = false
                                                          ygg = 4
                                                          repplay(selected2)	elseif you.block
                                                          then ygselec = false
                                                            yns = false
                                                            ygg = 0	
                                                            replaced2:play()
                                                          end

                                                          if ybb == ygg then ybb = 0
                                                            if ygg ~= 0 then replaced2:play() end
                                                          elseif ypp == ygg then ypp = 0
                                                            if ygg ~= 0 then replaced2:play() end
                                                          elseif yyy == ygg then yyy = 0
                                                            if ygg ~= 0 then replaced2:play() end
                                                          elseif yss == ygg then yss = 0
                                                            if ygg ~= 0 then replaced2:play() end
                                                          end



                                                        end

                                                      elseif youseleccurrent == 2 
                                                      then 

                                                        youcurrentframe = enviro.pframe



                                                        if yns then
                                                          if you.a1 
                                                          then ypselec = true
                                                            yns = false
                                                            ypp = 1
                                                            repplay(selected2)	elseif you.a2 
                                                            then ypselec = true
                                                              yns = false
                                                              ypp = 2
                                                              repplay(selected2)	elseif you.a3
                                                              then ypselec = true
                                                                yns = false
                                                                ypp = 3
                                                                repplay(selected2)	elseif you.a4
                                                                then ypselec = true
                                                                  yns = false
                                                                  ypp = 4
                                                                  repplay(selected2)	elseif you.block
                                                                  then ypselec = false
                                                                    yns = false
                                                                    ypp = 0	
                                                                    replaced2:play()
                                                                  end

                                                                  if ypp == ybb then ybb = 0
                                                                    if ypp ~= 0 then replaced2:play() end
                                                                  elseif ypp == ygg then ygg = 0
                                                                    if ypp ~= 0 then replaced2:play() end
                                                                  elseif yyy == ypp then yyy = 0
                                                                    if ypp ~= 0 then replaced2:play() end
                                                                  elseif yss == ypp then yss = 0
                                                                    if ypp ~= 0 then replaced2:play() end
                                                                  end


                                                                end


                                                              elseif youseleccurrent == 3 
                                                              then 

                                                                youcurrentframe = enviro.yframe



                                                                if yns then
                                                                  if you.a1 
                                                                  then
                                                                    yns = false
                                                                    yyy = 1
                                                                    repplay(selected2)	elseif you.a2 
                                                                    then 
                                                                      yns = false
                                                                      yyy = 2
                                                                      repplay(selected2)	elseif you.a3
                                                                      then 
                                                                        yns = false
                                                                        yyy = 3
                                                                        repplay(selected2)	elseif you.a4
                                                                        then 
                                                                          yns = false
                                                                          yyy = 4
                                                                          repplay(selected2)	elseif you.block
                                                                          then
                                                                            yns = false
                                                                            yyy = 0	
                                                                            replaced2:play()
                                                                          end


                                                                          if yyy == ygg then ygg = 0
                                                                            if yyy ~= 0 then replaced2:play() end
                                                                          elseif yyy == ypp then ypp = 0
                                                                            if yyy ~= 0 then replaced2:play() end
                                                                          elseif yyy == ybb then ybb = 0
                                                                            if yyy ~= 0 then replaced2:play() end
                                                                          elseif yss == yyy then yss = 0
                                                                            if yyy ~= 0 then replaced2:play() end
                                                                          end

                                                                        end


                                                                      elseif youseleccurrent == 4 
                                                                      then 

                                                                        youcurrentframe = enviro.sframe

                                                                        if yns then
                                                                          if you.a1 
                                                                          then
                                                                            yns = false
                                                                            yss = 1
                                                                            repplay(selected2)	elseif you.a2 
                                                                            then 
                                                                              yns = false
                                                                              yss = 2
                                                                              repplay(selected2)	elseif you.a3
                                                                              then 
                                                                                yns = false
                                                                                yss = 3
                                                                                repplay(selected2)	elseif you.a4
                                                                                then 
                                                                                  yns = false
                                                                                  yss = 4
                                                                                  repplay(selected2)	elseif you.block
                                                                                  then
                                                                                    yns = false
                                                                                    yss = 0	
                                                                                    replaced2:play()
                                                                                  end


                                                                                  if yss == ygg then ygg = 0
                                                                                    if yss ~= 0 then replaced2:play() end
                                                                                  elseif yss == ypp then ypp = 0
                                                                                    if yss ~= 0 then replaced2:play() end
                                                                                  elseif yss == ybb then ybb = 0
                                                                                    if yss ~= 0 then replaced2:play() end
                                                                                  elseif yss == yyy then yyy = 0
                                                                                    if yss ~= 0 then replaced2:play() end
                                                                                  end


                                                                                end


                                                                              end










                                                                            end


                                                                          end



                                                                          if mbb == 1 then mb = me.a1 r1,g1,b1 = br,bg,bb
                                                                          elseif mgg == 1 then mg = me.a1 r1,g1,b1 = gr,gg,gb
                                                                          elseif mpp == 1 then mp = me.a1 r1,g1,b1 = pr,pg,pb
                                                                          elseif myy == 1 then my = me.a1 r1,g1,b1 = yer,yeg,yeb
                                                                          elseif mss == 1 then ms = me.a1 r1,g1,b1 = sr,sg,sb
                                                                          else r1,g1,b1 = 255,255,255
                                                                          end

                                                                          if mbb == 2 then mb = me.a2 a21r,a21g,a21b = br,bg,bb
                                                                          elseif mgg == 2 then mg = me.a2 a21r,a21g,a21b = gr,gg,gb
                                                                          elseif mpp == 2 then mp = me.a2 a21r,a21g,a21b = pr,pg,pb
                                                                          elseif myy == 2 then my = me.a2 a21r,a21g,a21b = yer,yeg,yeb
                                                                          elseif mss == 2 then ms = me.a2 a21r,a21g,a21b = sr,sg,sb
                                                                          else a21r,a21g,a21b = 255,255,255
                                                                          end

                                                                          if mbb == 3 then mb = me.a3 a31r,a31g,a31b = br,bg,bb
                                                                          elseif mgg == 3 then mg = me.a3 a31r,a31g,a31b = gr,gg,gb
                                                                          elseif mpp == 3 then mp = me.a3 a31r,a31g,a31b = pr,pg,pb
                                                                          elseif myy == 3 then my = me.a3 a31r,a31g,a31b = yer,yeg,yeb
                                                                          elseif mss == 3 then ms = me.a3 a31r,a31g,a31b = sr,sg,sb
                                                                          else a31r,a31g,a31b = 255,255,255
                                                                          end

                                                                          if mbb == 4 then mb = me.a4 a41r,a41g,a41b = br,bg,bb
                                                                          elseif mgg == 4 then mg = me.a4 a41r,a41g,a41b = gr,gg,gb
                                                                          elseif mpp == 4 then mp = me.a4 a41r,a41g,a41b = pr,pg,pb
                                                                          elseif myy == 4 then my = me.a4 a41r,a41g,a41b = yer,yeg,yeb
                                                                          elseif mss == 4 then ms = me.a4 a41r,a41g,a41b = sr,sg,sb
                                                                          else a41r,a41g,a41b = 255,255,255
                                                                          end


                                                                          if ybb == 1 then yb = you.a1 r2,g2,b2 = br,bg,bb
                                                                          elseif ygg == 1 then yg = you.a1 r2,g2,b2 = gr,gg,gb
                                                                          elseif ypp == 1 then yp = you.a1 r2,g2,b2 = pr,pg,pb
                                                                          elseif yyy == 1 then yy = you.a1 r2,g2,b2 = yer,yeg,yeb
                                                                          elseif yss == 1 then ys = you.a1 r2,g2,b2 = sr,sg,sb
                                                                          else r2,g2,b2 = 255,255,255
                                                                          end


                                                                          if ybb == 2 then yb = you.a2 a22r,a22g,a22b = br,bg,bb
                                                                          elseif ygg == 2 then yg = you.a2 a22r,a22g,a22b = gr,gg,gb
                                                                          elseif ypp == 2 then yp = you.a2 a22r,a22g,a22b = pr,pg,pb
                                                                          elseif yyy == 2 then yy = you.a2 a22r,a22g,a22b = yer,yeg,yeb
                                                                          elseif yss == 2 then ys = you.a2 a22r,a22g,a22b = sr,sg,sb
                                                                          else a22r,a22g,a22b = 255,255,255
                                                                          end

                                                                          if ybb == 3 then yb = you.a3 a32r,a32g,a32b = br,bg,bb
                                                                          elseif ygg == 3 then yg = you.a3 a32r,a32g,a32b = gr,gg,gb
                                                                          elseif ypp == 3 then yp = you.a3 a32r,a32g,a32b = pr,pg,pb
                                                                          elseif yyy == 3 then yy = you.a3 a32r,a32g,a32b = yer,yeg,yeb
                                                                          elseif yss == 3 then ys = you.a3 a32r,a32g,a32b = sr,sg,sb
                                                                          else a32r,a32g,a32b = 255,255,255
                                                                          end

                                                                          if ybb == 4 then yb = you.a4 a42r,a42g,a42b = br,bg,bb
                                                                          elseif ygg == 4 then yg = you.a4 a42r,a42g,a42b = gr,gg,gb
                                                                          elseif ypp == 4 then yp = you.a4 a42r,a42g,a42b = pr,pg,pb
                                                                          elseif yyy == 4 then yy = you.a4 a42r,a42g,a42b = yer,yeg,yeb
                                                                          elseif yss == 4 then ys = you.a4 a42r,a42g,a42b = sr,sg,sb
                                                                          else a42r,a42g,a42b = 255,255,255
                                                                          end



                                                                        end




                                                                        function mclearprimarys(x)

                                                                          if x ~= me.blue then me.blue = false end
                                                                          if x ~= me.green then me.green = false end
                                                                          if x ~= me.yellow then me.yellow = false end
                                                                          if x ~= me.purple then me.purple = false end
                                                                          if x ~= me.sand then me.sand = false end
                                                                        end


                                                                        function yclearprimarys(x)
                                                                          if x ~= you.blue then you.blue = false end
                                                                          if x ~= you.green then you.green = false end
                                                                          if x ~= you.yellow then you.yellow = false end
                                                                          if x ~= you.purple then you.purple = false end
                                                                          if x ~= you.sand then you.sand = false end
                                                                        end

                                                                        function anyofmyprimes()
                                                                          if me.blue or me.blu
                                                                          or me.yellow or meyell
                                                                          or me.green or me.gree
                                                                          or me.purple or me.purp
                                                                          or me.sand or mesan
                                                                          then return true
                                                                          else return false
                                                                          end
                                                                        end

                                                                        function anyofyourprimes()
                                                                          if you.blue or you.blu
                                                                          or you.yellow or youyell
                                                                          or you.green or you.gree
                                                                          or you.purple or youpurp
                                                                          or you.sand or yousan
                                                                          then return true
                                                                          else return false
                                                                          end
                                                                        end

                                                                        function anyofmycombos()
                                                                          if me.gurple or
                                                                          me.burple or
                                                                          me.bellow or
                                                                          me.gellow or
                                                                          me.pellow or
                                                                          me.breen or
                                                                          me.bland or
                                                                          me.grand or
                                                                          me.yend or
                                                                          me.pund
                                                                          then return
                                                                            true
                                                                          else return false
                                                                          end
                                                                        end

                                                                        function anyofyourcombos()
                                                                          if you.gurple or
                                                                          you.burple or
                                                                          you.bellow or
                                                                          you.gellow or
                                                                          you.pellow or
                                                                          you.breen or
                                                                          you.bland or
                                                                          you.grand or
                                                                          you.yend or
                                                                          you.pund
                                                                          then return
                                                                            true
                                                                          else return false
                                                                          end
                                                                        end

                                                                        --transfer
                                                                        function ycombofalsify()
                                                                          you.gcancel = true
                                                                          you.pcancel = true
                                                                          you.bcancel = true
                                                                          you.ycancel = true
                                                                          you.scancel = true

                                                                          you.purple = false
                                                                          you.green = false
                                                                          you.blue = false 
                                                                          you.yellow = false
                                                                          you.sand = false

                                                                          you.gurple = false
                                                                          you.burple = false
                                                                          you.bellow = false
                                                                          you.gellow = false
                                                                          you.pellow = false
                                                                          you.breen = false
                                                                          you.bland = false
                                                                          you.grand = false
                                                                          you.yend = false
                                                                          you.pund = false

                                                                        end

                                                                        function mcombofalsify()
                                                                          me.gcancel = true
                                                                          me.pcancel = true
                                                                          me.bcancel = true
                                                                          me.ycancel = true
                                                                          me.scancel = true

                                                                          me.purple = false
                                                                          me.green = false
                                                                          me.blue = false 
                                                                          me.yellow = false
                                                                          me.sand = false

                                                                          me.gurple = false
                                                                          me.burple = false
                                                                          me.bellow = false
                                                                          me.gellow = false
                                                                          me.pellow = false
                                                                          me.breen = false
                                                                          me.bland = false
                                                                          me.breen = false
                                                                          me.bland = false
                                                                          me.grand = false
                                                                          me.yend = false
                                                                          me.pund = false


                                                                        end



                                                                        --transfer
                                                                        function colorcontrol(x,y,z,x2,y2,z2,a,a2,b,b2)
                                                                          if me.dodgetype == "none" then
                                                                            me.blue = x
                                                                            me.green = y
                                                                            me.purple = z
                                                                            me.yellow = a
                                                                            me.sand = b
                                                                          end
                                                                          if you.dodgetype == "none" then

                                                                            you.blue = x2
                                                                            you.green = y2
                                                                            you.purple = z2
                                                                            you.yellow = a2
                                                                            you.sand = b2
                                                                          end



                                                                          if MENU == "play"
                                                                          then



                                                                            if mebur
                                                                            or mebre
                                                                            or megur 
                                                                            or mepell
                                                                            or mebell  
                                                                            or megell
                                                                            or meblan
                                                                            or megran
                                                                            or mepun
                                                                            or meyen
                                                                            or me.running



                                                                            -- or me.gree
                                                                            -- or me.blu
                                                                            -- or mepurp
                                                                            -- or meyell
                                                                            then
                                                                              me.blue = false
                                                                              me.purple = false
                                                                              me.green = false
                                                                              me.yellow = false
                                                                              me.sand = false
                                                                              nomedodge = true
                                                                            else
                                                                              nomedodge = false
                                                                            end

                                                                            if  you.bur 
                                                                            or yougur
                                                                            or youbre
                                                                            or youpell
                                                                            or youbell
                                                                            or yougell
                                                                            or youpun
                                                                            or youblan
                                                                            or yougran 
                                                                            or youyen
                                                                            or you.running

                                                                            -- or you.gree
                                                                            -- or you.blu
                                                                            -- or youpurp
                                                                            -- or youyell
                                                                            then
                                                                              you.blue = false
                                                                              you.purple = false
                                                                              you.green = false
                                                                              you.yellow = false
                                                                              you.sand = false
                                                                              noyoudodge = true
                                                                            else 
                                                                              noyoudodge = false
                                                                            end



                                                                            if me.blue and me.sand and not me.san and not me.blu then 
                                                                              mcombofalsify()
                                                                              me.bland = true
                                                                            elseif not me.sand and not me.blue then me.bland = false
                                                                            end

                                                                            if you.blue and you.sand and not you.san and not you.blu then 
                                                                              ycombofalsify()
                                                                              you.bland = true
                                                                            elseif not you.sand and not you.blue then you.bland = false
                                                                            end


                                                                            if me.green and me.sand and not me.san and not me.gree then 
                                                                              mcombofalsify()
                                                                              me.grand = true
                                                                            elseif not me.sand and not me.green then me.grand = false
                                                                            end


                                                                            if me.yellow and me.sand and not me.san and not meyell then 
                                                                              mcombofalsify()
                                                                              me.yend = true
                                                                            elseif not me.sand and not me.yellow then me.yend = false
                                                                            end


                                                                            if me.purple and me.sand and not me.san and not me.purp then 
                                                                              mcombofalsify()
                                                                              me.pund = true
                                                                            elseif not me.sand and not me.purple then me.pund = false
                                                                            end





                                                                            if you.green and you.sand and not you.san and not you.gree then 
                                                                              ycombofalsify()
                                                                              you.grand = true
                                                                            elseif not you.sand and not you.green then you.grand = false
                                                                            end


                                                                            if you.yellow and you.sand and not you.san and not youyell then 
                                                                              ycombofalsify()
                                                                              you.yend = true
                                                                            elseif not you.sand and not you.yellow then you.yend = false
                                                                            end


                                                                            if you.purple and you.sand and not you.san and not you.purp then 
                                                                              ycombofalsify()
                                                                              you.pund = true
                                                                            elseif not you.sand and not you.purple then you.pund = false
                                                                            end









                                                                            if you.blue and you.green and not you.gree and not you.blu then 
                                                                              ycombofalsify()
                                                                              you.breen = true
                                                                            elseif not you.green and not you.blue then you.breen = false
                                                                            end


                                                                            if me.blue and me.green and not me.gree and not me.blu then 
                                                                              mcombofalsify()
                                                                              me.breen = true
                                                                            elseif not me.green and not me.blue then me.breen = false
                                                                            end

                                                                            if me.blue and me.purple and not me.purp and not me.blu then 
                                                                              mcombofalsify()
                                                                              me.burple = true
                                                                            elseif not me.purple and not me.blue then me.burple = false
                                                                            end


                                                                            if you.blue and you.purple and not you.purp and not you.blu then 
                                                                              ycombofalsify()
                                                                              you.burple = true


                                                                            elseif not you.purple and not you.blue then you.burple = false
                                                                            end




                                                                            --add and not me.gree?is this causing trouble?
                                                                            if me.green and me.purple and not me.purp then 
                                                                              mcombofalsify()
                                                                              me.gurple = true

                                                                            elseif not me.purple and not me.green then me.gurple = false
                                                                            end

                                                                            if you.green and you.purple and not you.purp then 
                                                                              ycombofalsify()
                                                                              you.gurple = true

                                                                            elseif not you.purple and not you.green then you.gurple = false
                                                                            end




                                                                            if you.yellow and you.blue and not you.blu and not youyell then 
                                                                              ycombofalsify()
                                                                              you.bellow = true

                                                                            elseif not you.blue and not you.yellow then you.bellow = false
                                                                            end


                                                                            if me.yellow and me.blue and not me.blu and not meyell then 
                                                                              mcombofalsify()
                                                                              me.bellow = true

                                                                            elseif not me.blue and not me.yellow then me.bellow = false
                                                                            end




                                                                            if you.yellow and you.purple and not you.purp then 
                                                                              ycombofalsify()
                                                                              you.pellow = true

                                                                            elseif not you.purple and not you.yellow then you.pellow = false
                                                                            end


                                                                            if me.yellow and me.purple and not me.purp then 
                                                                              mcombofalsify()
                                                                              me.pellow = true

                                                                            elseif not me.purple and not me.yellow then me.pellow = false
                                                                            end

                                                                            if me.yellow and me.green then 
                                                                              mcombofalsify()
                                                                              me.gellow = true

                                                                            elseif not me.green and not me.yellow then me.gellow = false
                                                                            end


                                                                            if you.yellow and you.green and not you.gree and not youyell then 
                                                                              ycombofalsify()
                                                                              you.gellow = true

                                                                            elseif not you.green and not you.yellow then you.gellow = false
                                                                            end







                                                                            if meyell or me.yellow then
                                                                              --add you bree = false?
                                                                              mclearprimarys(me.yellow)
                                                                              me.ycancel = false
                                                                            end

                                                                            if youyell or you.yellow then
                                                                              --add you bree = false?
                                                                              yclearprimarys(you.yellow)
                                                                              you.ycancel = false
                                                                            end

                                                                            if me.san or me.sand then
                                                                              --add you bree = false?
                                                                              mclearprimarys(me.sand)
                                                                              me.scancel = false
                                                                            end

                                                                            if you.san or you.sand then
                                                                              --add you bree = false?
                                                                              yclearprimarys(you.sand)
                                                                              you.scancel = false
                                                                            end





                                                                            if me.purp or me.purple then
                                                                              --add you bree = false?
                                                                              mclearprimarys(me.purple)
                                                                              me.pcancel = false
                                                                            end

                                                                            if me.blu or me.blue then
                                                                              mclearprimarys(me.blue)
                                                                              me.bcancel = false
                                                                            end

                                                                            if me.gree or me.green then
                                                                              mclearprimarys(me.green)
                                                                              me.gcancel = false
                                                                            end


                                                                            if you.purp or you.purple then
                                                                              yclearprimarys(you.purple)
                                                                              you.pcancel = false
                                                                            end

                                                                            if you.blu or you.blue then
                                                                              yclearprimarys(you.blue)
                                                                              you.bcancel = false
                                                                            end

                                                                            if you.gree or you.green then
                                                                              yclearprimarys(you.green)
                                                                              you.gcancel = false
                                                                            end



                                                                            --TRANSFER
                                                                            --this is for when you activate a combo but then let go of one
                                                                            if nomedodge or anyofmycombos() then
                                                                              me.blue = false
                                                                              me.purple = false
                                                                              me.green = false
                                                                              me.yellow = false
                                                                              me.sand = false
                                                                              me.ycancel = true
                                                                              me.gcancel = true
                                                                              me.pcancel = true
                                                                              me.bcancel = true
                                                                              me.scancel = true
                                                                            end

                                                                            if noyoudodge or anyofyourcombos() then
                                                                              you.blue = false
                                                                              you.purple = false
                                                                              you.green = false
                                                                              you.yellow = false
                                                                              you.sand = false
                                                                              you.ycancel = true
                                                                              you.gcancel = true
                                                                              you.pcancel = true
                                                                              you.bcancel = true
                                                                              you.scancel = true
                                                                            end




                                                                          end

                                                                          if me.landing then
                                                                            me.blue = false
                                                                            me.purple = false
                                                                            me.green = false
                                                                            me.yellow = false
                                                                            me.sand = false
                                                                          end
                                                                          if you.landing then
                                                                            you.blue = false
                                                                            you.purple = false
                                                                            you.green = false
                                                                            you.yellow = false
                                                                            you.sand = false
                                                                          end

                                                                        end

                                                                        yer = 255
                                                                        yeg = 246 
                                                                        yeb = 0

                                                                        pr = 158
                                                                        pg = 0 
                                                                        pb = 203

                                                                        gr = 60
                                                                        gg = 255
                                                                        gb = 88

                                                                        br = 0
                                                                        bg = 174
                                                                        bb = 255

                                                                        sr = 209
                                                                        sg = 178
                                                                        sb = 102



