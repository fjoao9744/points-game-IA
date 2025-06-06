player = {
    pontos = 0,
    x = 100,
    y = 100
}

IA = {
    pontos = 0,
    x = 100,
    y = 100
}

function love.load()
    love.window.setTitle("game")

    window_size_x, window_size_y = love.graphics.getDimensions()

    x_obj, y_obj = math.random(0, window_size_x - 15), math.random(0, window_size_y - 15)

end

function love.update(dt)
    if IA.x < x_obj then
        IA.x = IA.x + 5

    end
    if IA.x > x_obj then
        IA.x = IA.x - 5

    end

    if IA.y > y_obj then
        IA.y = IA.y - 5

    end

    if IA.y < y_obj then
        IA.y = IA.y + 5

    end

    if love.keyboard.isDown("up") then
        player.y = player.y - 5
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + 5
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - 5
    end

    if love.keyboard.isDown("right") then
        player.x = player.x + 5
    end

    if checkCollision(player.x, player.y, 30, 30, x_obj, y_obj, 15, 15) then
        player.pontos = player.pontos + 1
        x_obj, y_obj = math.random(0, window_size_x - 15), math.random(0, window_size_y - 15)
    end

    if checkCollision(IA.x, IA.y, 30, 30, x_obj, y_obj, 15, 15) then
        IA.pontos = IA.pontos + 1
        x_obj, y_obj = math.random(0, window_size_x - 15), math.random(0, window_size_y - 15)
    end

end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", x_obj, y_obj, 15, 15)
    
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", player.x, player.y, 30, 30)

    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", IA.x, IA.y, 30, 30)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Pontos: " .. player.pontos)
    love.graphics.print("Pontos: " .. IA.pontos, 0, 50)

end

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end
