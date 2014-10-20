

function love.load()
x = 10
y = 10
end
function love.update()

end

function love.draw()
	local joysticks = love.joystick.getJoysticks()
    for i, joystick in ipairs(joysticks) do
        love.graphics.print(joystick:getName(), 10, i * 100)
        love.graphics.print(joystick:getAxis(1), 10, i * 120)
        love.graphics.print(joystick:getAxis(2), 10, i * 130)
        love.graphics.print(joystick:getAxis(3), 10, i * 160)
        love.graphics.print(joystick:getAxis(6), 10, i * 170)
    end
end
--1 is x 2 is y 3 is ry



