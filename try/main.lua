require "editor"

function love.load()
edit:load()-- charge le curseur
end

function love.update(dt)
entity_adaptation()
edit:update(dt)
edit:grillage()
end

function love.draw()
decor:draw()
edit:draw() --  permet de suivre la souris
end
