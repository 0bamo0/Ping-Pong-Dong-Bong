Balls = {}
Balls.__index = Balls
ActiveBalls = {}

function Balls.new(x,y)
    local instance = setmetatable({}, Balls)
    instance.x = x
    instance.y = y
    instance.width = 15
    instance.height = 15
    instance.visible = true
    table.insert(ActiveBalls, instance)
end

function Balls:update(dt)
    for _ , ball in ipairs(ActiveBalls) do
        if ball.x + ball.width > Window.width or ball.x < 0 then
            self.XVel = (self.XVel * -1)
        end

        if ball.y + ball.height > Window.height or ball.y < 0 then
            self.YVel = self.YVel * -1
        end
        ball.x = ball.x + self.XVel * dt
        ball.y = ball.y + self.YVel * dt
    end
end

function Balls:draw()
    for _ , ball in ipairs(ActiveBalls) do
        love.graphics.rectangle("fill" , ball.x , ball.y , ball.width , ball.height)
    end
end