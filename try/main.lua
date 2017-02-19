require "editor"
require "cube"

function love.load()
cube:load()  -- charge les cubes
cube2:load()  -- charge les cubes
edit:load()-- charge le curseur

end

function love.update(dt)
Cursorupdate()
edit:update()
end

function love.draw()
cube:draw()
cube2:draw() -- affiche les cubes quand cliquer
edit:draw() --  permet de suivre la souris
end
