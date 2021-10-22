local obj = obj or require("lib/object")
local lifes = obj:extend()

function lifes:new(x,y,sprite,cpu)
  self.x=x
  self.y=y
  self.s = sprite
  self.cpu = cpu
  return self
end

function lifes:update(dt)
end

function lifes:draw()
  for i = 1, 3 - self.cpu.points do
    love.graphics.draw(self.s, self.x + (2+self.s:getWidth()) * i, self.y)
  end
end

return lifes