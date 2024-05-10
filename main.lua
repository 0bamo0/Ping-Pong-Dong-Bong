require('ball')
require('bar')


function love.load()
    Window = {}
    Balls.XVel = -150
    Balls.YVel = -150
    Balls.new(50,50)
    Bars.new(50,500)
end

function love.update(dt)
    Window.width , Window.height = love.graphics.getDimensions()
    Balls:update(dt)
    Bars:update(dt)
    for _ , bar in ipairs(ActiveBar) do
        for _ , ball in ipairs(ActiveBalls) do
            if bar.x < ball.x + ball.width and
            ball.x < bar.x + bar.width and
            bar.y < ball.y + ball.height and
            ball.y < bar.y + bar.height then
                Balls.XVel = (Balls.XVel * -1)
                Balls.YVel = (Balls.YVel * -1)
            end
        end
    end
end

function love.draw()
    Balls:draw()
    Bars:draw()
end