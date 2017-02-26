
-- Classe nécéssaire --
require "decor"
-----------------------
edit = {}

-- variable d'édition de la map --
map = {x = 500, y = 500}
grillage ={}
----------------------------------

-- Variable de changement/ chargement de sprite --
Sprite = 0
Chargement = love.graphics.newImage("data/assets/cube.png")
--------------------------------------------------

-- Variable qui définit le sprite --
rotation = 0
pressed = false
rotation_value = 10 -- valeur de la rotation
nombre_de_sprite = 3
------------------------------------

--Variable concernant l'aide à la souris dit grillage --
grillage.size = 30 -- modifier la taille du cadriallage
--X--
grillage.Xmin = 0
grillage.Xmax = grillage.size
--Y--
grillage.Ymin = 0
grillage.Ymax = grillage.size
---------------------------------------------------------

-- cursor adaptation + bloque adaptation --
function entity_adaptation()
  if Sprite == 0 then
    Chargement = love.graphics.newImage("data/assets/cube.png")
    edit:load()
  end

  if Sprite == 1 then
    Chargement = love.graphics.newImage("data/assets/cube2.png")
    edit:load()
  end
  if Sprite == 2 then
    Chargement = love.graphics.newImage("data/assets/cube3.png")
    edit:load()
  end
  if Sprite == 3 then
    Chargement = love.graphics.newImage("data/assets/cube4.png")
    edit:load()
  end
end
-----------------------

-- effet du curseur --
function edit:load()
  self.image = Chargement -- curseur qui change en fonction du sprite
  decor:load()
end

function edit:draw()
  self.x = grillage.Xmin
  self.y = grillage.Ymin
  love.graphics.print(self.x,300,200)
  love.graphics.print(self.y,300,220)

  self.width = self.image:getWidth()/2
  self.height = self.image:getHeight()/2
  love.graphics.print(Sprite,200,200)
  love.graphics.draw(self.image, self.x,self.y,rotation,1,1,self.width,self.height)
end

function edit:update(dt)
  if love.mouse.isDown(1) then
    decor:coord()
  end

-- Rotation des entités --
  if love.keyboard.isDown("r") and pressed == false then
    rotation = rotation + rotation_value*dt
    pressed = true
  end

  if love.keyboard.isDown("e") and pressed == false then
    rotation = rotation - rotation_value*dt
    pressed = true
  end

  if not love.keyboard.isDown("r", "e") and pressed == true then
    pressed = false
  end
--------------------------

  function love.wheelmoved( x, y )
      if y >= 1 and Sprite < nombre_de_sprite then
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
