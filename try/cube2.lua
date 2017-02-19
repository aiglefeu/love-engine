-- Les listes --
xcoor2={0}
ycoor2={0}
cube2 = {}
----------------

-- Main core --
function cube2:load()
  self.image = love.graphics.newImage("data/assets/cube2.png")
  self.width = self.image:getWidth()/2
  self.height = self.image:getHeight()/2
end

function cube2:coord()
   table.insert(xcoor2, love.mouse.getX())
   table.insert(ycoor2, love.mouse.getY())
end

function cube2:draw()
  for i= 1  , table.getn(xcoor2) do
  love.graphics.draw(self.image, xcoor2[i],ycoor2[i],0,1,1,self.width,self.height)
  end
end
---------------
