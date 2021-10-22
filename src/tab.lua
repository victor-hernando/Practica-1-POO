local obj = obj or require("lib/object")
local tab = obj:extend()

function tab:new(x,y,width,height,text)
  self.x=x
  self.y=y
  self.w = sprite:getWidth()
  self.h = sprite:getHeight()
  self.text = text or " "
  return self
end

function tab:update(dt)
end

function tab:draw()
  love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
  love.graphics.print(self.text,self.x+10,self.y)
end

return tab