-- Les listes --
xdecor={}
ydecor={}
decor = {}
entity_decor ={}
entity_rotation = {}
----------------

-- Main core --
function decor:load()
  self.image = Chargement
  self.width = self.image:getWidth()/2
  self.height = self.image:getHeight()/2
end

function decor:coord()
  table.insert(entity_decor,self.image)
  table.insert(xdecor,grillage.Xmin)
  table.insert(ydecor,grillage.Ymin)
  table.insert(entity_rotation,rotation)

end

function decor:draw()
  for i = 1, table.getn(xdecor) do
    love.graphics.draw(entity_decor[i], xdecor[i], ydecor[i], entity_rotation[i], 1, 1, self.width,self.height)
  end
end
