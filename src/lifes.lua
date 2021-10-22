local obj = obj or require("lib/object")
local lifes = obj:extend()

function lifes:new(x,y,sprite,cpu)
  self.x=x
  self.y=y
  self.s = sprite
  self.cpu = cpu
  return self
end

function tab:update(dt)
end

function tab:draw()
  for i = 1, 3 - #cpu.points then
    love.graphics.draw(self.Sprite, self.x + 10 * i, self.y)
  end
end

return tab