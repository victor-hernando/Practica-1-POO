local obj = obj or require("lib/object")
local paddle = obj.extend()

function paddle:new(x,y,width,height,velocitat)
  self.x=x
  self.y=y
  self.w=width
  self.h=height
  self.vel=velocitat
  self.offset=offset
  return self
end

function paddle:update(dt)
  self.x = self.x + self.vel * dt
  self.y = self.y + self.vel * dt
end

function paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 3, 3, 1)
end
