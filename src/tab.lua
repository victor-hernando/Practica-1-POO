local obj = obj or require("lib/object")
local tab = obj:extend()

function tab:new(x,y,sprite,text)
  self.x=x
  self.y=y
  self.spr = sprite
  self.text = text or " "
  return self
end

function tab:update(dt)
end

function tab:draw()
  love.graphics.draw(self.spr,self.x,self.y)
  love.graphics.print(self.text,self.x+20,self.y+27)
end

return tab