-- Les listes --
xcoor={0}
ycoor={0}
cube = {}
----------------

-- Main core --
function cube:load()
  self.image = love.graphics.newImage("data/assets/cube.png")
  self.width = self.image:getWidth()/2
  self.height = self.image:getHeight()/2
end

function cube:coord()
   table.insert(xcoor, love.mouse.getX())
   table.insert(ycoor, love.mouse.getY())
end

function cube:draw()
  for i= 1  , table.getn(xcoor) do
  love.graphics.draw(self.image, xcoor[i],ycoor[i],0,1,1,self.width,self.height)
  end
end
---------------
