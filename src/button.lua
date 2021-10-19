local obj = obj or require("lib/object")
local button = obj:extend()
local deltaX, deltaY

function button:new(x,y,width,height,text)
  self.x=x
  self.y=y
  self.width=width
  self.height=height
  self.text=text
  return self
end

function button:update(dt)
end

function button:draw()
  love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
  love.graphics.print(self.text,self.x+10,self.y)
end

function button:checkMouse()
  deltaX = love.mouse.getX() - math.max(self.x, math.min(self.x + self.width, love.mouse.getX() ))
  deltaY = love.mouse.getY() - math.max(self.y, math.min(self.y + self.height, love.mouse.getY() ))
  return(deltaX * deltaX + deltaY * deltaY < 100)
end

return button