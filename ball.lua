Balls = {}
Balls.__index = Balls
ActiveBalls = {}

function Balls.new(x,y)
    local instance = setmetatable({}, Balls)
    instance.x = x
    instance.y = y
    instance.xVel = 180
    instance.yVel = 180
    instance.width = 15
    instance.height = 15
    instance.visible = true
    table.insert(ActiveBalls, instance)
end

function Balls:update(dt)
    for i , ball in ipairs(ActiveBalls) do
        if ball.x + ball.width > Window.width or ball.x < 0 then
            ball.xVel = (ball.xVel * -1)
        end
        if ball.y < 0 then
            ball.yVel = ball.yVel * -1
        end
        if ball.y + ball.height > Window.height then
            table.remove(ActiveBalls, i)
        end
        ball.x = ball.x + ball.xVel * dt
        ball.y = ball.y + ball.yVel * dt
    end
end

function Balls:draw()
    for _ , ball in ipairs(ActiveBalls) do
        love.graphics.rectangle("fill" , ball.x , ball.y , ball.width , ball.height)
    end
end