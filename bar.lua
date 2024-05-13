Bars = {}
Bars.__index = Bars
ActiveBar = {}

function Bars.new(x,y)
    local instance = setmetatable({}, Bars)
    instance.x = x
    instance.y = y
    instance.width = 100
    instance.height = 15
    instance.visible = true
    table.insert(ActiveBar, instance)
end

function Bars:update(dt)
    for _ , bar in ipairs(ActiveBar) do
        if bar.x > 0 then
            if bar.x + bar.width < Window.width then
                if love.keyboard.isDown("left" , "q") then
                    bar.x = bar.x - 300 * dt
                end
                if love.keyboard.isDown("right" , "d") then
                    bar.x = bar.x + 300 * dt
                end
            else
                bar.x = Window.width - bar.width - 1
            end
        else
            bar.x = 1 
        end
    end
end

function Bars:draw()
    for _ , bar in ipairs(ActiveBar) do
        love.graphics.rectangle("fill" , bar.x , bar.y , bar.width , bar.height)
    end
end