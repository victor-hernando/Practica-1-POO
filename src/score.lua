local obj = obj or require("lib/object")
local score = obj:extend()

function score:new(points,x,y)
  self.points=points
  self.x=x
  self.y=y
  love.graphics.setFont(love.graphics.newFont("pong.ttf",fontScale), fontScale )
  return self
end

function score:update(dt)
end

function score:draw()
  love.graphics.print(self.points, self.x, self.y, 0, 1, 1, 0, 0, 0, 0)
end
return score

