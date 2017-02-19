
-- Classe nécéssaire --
require "cube"
require "cube2"
-----------------------
edit = {}
Sprite = 0
Chargement = love.graphics.newImage("data/assets/cube.png")

-- cursor adaptation --
function Cursorupdate()
  if Sprite == 0 then
    Chargement = love.graphics.newImage("data/assets/cube.png")
    edit:load()
  end

  if Sprite == 1 then
    Chargement = love.graphics.newImage("data/assets/cube2.png")
    edit:load()
  end
end
-----------------------

-- effet du curseur --
function edit:load()
  self.image = Chargement -- curseur qui change en fonction du sprite
end

function edit:draw()
  self.x = love.mouse.getX()
  self.y = love.mouse.getY()

  self.width = self.image:getWidth()/2
  self.height = self.image:getHeight()/2
  love.graphics.print(Sprite,200,200)
  love.graphics.draw(self.image, self.x,self.y,0,1,1,self.width,self.height)
end

function edit:update()
  if love.mouse.isDown(1) then

    if Sprite == 0 then
      cube:coord()
    end

    if Sprite == 1 then
      cube2:coord()
    end

  end
  function love.wheelmoved( x, y )
      if y >= 1 and Sprite < 1 then
        Sprite = Sprite + 1
        y = 0
      end

      if y <= -1 and Sprite > 0 then
        Sprite = Sprite - 1
        y = 0
      end
    end
end
---------------------
