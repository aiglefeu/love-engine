
-- Classe nécéssaire --
require "cube"
require "cube2"
-----------------------
edit = {}
map = {x = 500, y = 500}
grillage ={}
Sprite = 0
Chargement = love.graphics.newImage("data/assets/cube.png")

--Variable concernant l'aide à la souris dit grillage --
grillage.size = 20
--X--
grillage.Xmin = 0
grillage.Xmax = grillage.size
--Y--
grillage.Ymin = 0
grillage.Ymax = grillage.size
---------------------------------------------------------

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
  self.x = grillage.Xmin
  self.y = grillage.Ymin
  love.graphics.print(self.x,300,200)
  love.graphics.print(self.y,300,220)

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

--- Aide à la la soruis --

function edit:grillage()
  if (love.mouse.getX()> grillage.Xmin and love.mouse.getX() < grillage.Xmax) then
      self.x = grillage.Xmin
    end
  if (love.mouse.getX()< grillage.Xmin) then
      grillage.Xmin = grillage.Xmin - grillage.size
     grillage.Xmax =  grillage.Xmax- grillage.size
    end
  if (love.mouse.getX()> grillage.Xmax) then
     grillage.Xmax =  grillage.Xmax + grillage.size
     grillage.Xmin = grillage.Xmin + grillage.size
    end

  if (love.mouse.getY()> grillage.Ymin and love.mouse.getY() < grillage.Ymax) then
    self.y = grillage.Ymin
  end
  if (love.mouse.getY() < grillage.Ymin) then
    grillage.Ymin = grillage.Ymin - grillage.size
    grillage.Ymax = grillage.Ymax - grillage.size
  end
  if (love.mouse.getY() > grillage.Ymax) then
    grillage.Ymax = grillage.Ymax + grillage.size
    grillage.Ymin = grillage.Ymin + grillage.size
  end
end
-------------------------
