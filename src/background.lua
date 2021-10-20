local Obj = Obj or require ("lib/object")
local background = Obj:extend()

function background:new(fons,planetes)
  self.backg = fons
  self.planets = planetes
  return self
end

function background:update(dt)
end

function background:draw()
  love.graphics.draw(self.backg,0,0)
  love.graphics.draw(self.planets,0,0)
end

return background
