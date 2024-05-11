require('ball')
require('bar')


function love.load()
    Window = {}
    Window.width , Window.height = love.graphics.getDimensions()
    Balls.new(50,50)
    Bars.new(Window.width/2,500)
end

function love.update(dt)
    Window.width , Window.height = love.graphics.getDimensions()
    Balls:update(dt)
    Bars:update(dt)
    for _,ball in ipairs(ActiveBalls) do
        for _,bar in ipairs(ActiveBar) do
            if BoxsCollisions(ball.x,ball.y,ball.width,ball.height,bar.x,bar.y,bar.width,bar.height) then
                ball.yVel = ball.yVel * -1
                if ball.xVel > 0 and ball.x > bar.x and ball.x < bar.x + bar.width/2 then
                    print('hting the bar to the left half while moving right')
                elseif ball.xVel > 0 and ball.x > bar.x and ball.x > bar.x + bar.width/2 then
                    print('hting the bar to the right half while moving right')
                elseif ball.xVel < 0 and ball.x > bar.x and ball.x < bar.x + bar.width/2 then
                    print('hting the bar to the left half while moving left')
                elseif ball.xVel < 0 and ball.x > bar.x and ball.x > bar.x + bar.width/2 then
                    print('hting the bar to the right half while moving left')
                end
            end
        end
    end
            end

function BoxsCollisions(x1,y1,w1,h1,x2,y2,w2,h2)
    if  x2 < x1 + w1 and
        x1 < x2 + w2 and
        y2 < y1 + h1 and
        y1 < y2 + h2 then
            return true 
        end
end

function love.draw()
    Balls:draw()
    Bars:draw()
end

function love.mousepressed(x , y ,key)
    if key == 1 then
        Balls.new(x,y)
    end
end