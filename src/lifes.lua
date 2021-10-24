--Marc Lloret & Victor Hernando

local obj = obj or require("lib/object")
local lifes = obj:extend()

function lifes:new(x,y,sprite,cpu, scale)
  self.x=x
  self.y=y
  self.s = sprite
  self.cpu = cpu
  self.sc = scale
  return self
end

function lifes:update(dt)
end

function lifes:draw()
  for i = 1, 3 - self.cpu.points do
    love.graphics.draw(self.s, self.x * i, self.y, 0, self.sc, self.sc)
  end
end

return lifes