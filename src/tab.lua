local obj = obj or require("lib/object")
local tab = obj:extend()

function tab:new(x,y,sprite,text,scale)
  self.x=x
  self.y=y
  self.spr = sprite
  self.text = text or " "
  self.sc = scale or 1
  return self
end

function tab:update(dt)
end

function tab:draw()
  love.graphics.draw(self.spr,self.x,self.y,0, self.sc, self.sc)
  love.graphics.print(self.text,self.x,self.y+27)
end

return tab