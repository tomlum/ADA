brotherstitle = lg.newImage("story/ch1/brothers.png")


cinematicbusy = false

function ch1init()
  chaptime = 1600
  titlefade1 = 255
  titlefade2 = 255
  titlefade3 = 255
  titlefade4 = 255
  titlefade5 = 255
  titleflicker = 200
end

function ch1update(ct)
  local starttime = 100
  if ct < -starttime+300 then
  elseif ct < -starttime+300*2 then
    titlefade1 = math.max(0, (titlefade1-6))
  elseif ct < -starttime+300*3 then
    titlefade2 = math.max(0, (titlefade2-6))
  elseif ct < -starttime+300*4 then
    titlefade3 = math.max(0, (titlefade3-6))
  elseif ct < -starttime+300*5 then
    titlefade4 = math.max(0, (titlefade4-6))
  elseif ct < -starttime+300*6 then
    titlefade5 = math.max(0, (titlefade5-6))
  end
end

function act1draw(ct)

end

function act1update(ct)

end

function drawch1()
  titleflicker = math.max(math.min(titleflicker + math.random(-5,5), 255), 150)
  lg.setColor(titleflicker,titleflicker,titleflicker)
  lg.sdraw(brotherstitle,0, 0)
  lg.setColor(0,0,0,titlefade1)
  local spacing = 70

  lg.srectangle("fill", 46, -spacing+215, 10000,spacing)
  lg.setColor(0,0,0,titlefade2)
  lg.srectangle("fill", 46, -spacing+215+spacing, 10000,spacing)
  lg.setColor(0,0,0,titlefade3)
  lg.srectangle("fill", 46, -spacing+215+spacing*2, 10000,spacing)
  lg.setColor(0,0,0,titlefade4)
  lg.srectangle("fill", 46, -spacing+215+spacing*3, 10000,spacing-10)
  lg.setColor(0,0,0,titlefade5)
  lg.srectangle("fill", 46, -spacing+200+spacing*4, 10000,spacing)
  lg.setColor(0,0,0,titlefade6)
  cclear()
end