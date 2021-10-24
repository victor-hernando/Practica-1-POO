--Marc Lloret & Victor Hernando

local tab = tab or require("src/tab")
local button = tab:extend()
local deltaX, deltaY

function button:new(x,y,sprite,spritePressed)
  self.super.new(self,x,y)
  self.spr = sprite
  self.sprPrs = spritePressed
  self.actualSprite = self.spr
  self.w = self.actualSprite:getWidth()
  self.h = self.actualSprite:getHeight()
  return self
end

function button:update(dt)
  if love.mouse.getX() > self.x and love.mouse.getX() < self.x + self.w and love.mouse.getY() > self.y and love.mouse.getY() < self.y + self.h then
    self.actualSprite = self.sprPrs
  else
    self.actualSprite = self.spr
  end
end

function button:draw()
   love.graphics.draw(self.actualSprite, self.x, self.y)
end

function button:checkMouse()
  deltaX = love.mouse.getX() - math.max(self.x, math.min(self.x + self.w, love.mouse.getX() ))
  deltaY = love.mouse.getY() - math.max(self.y, math.min(self.y + self.h, love.mouse.getY() ))
  return(deltaX * deltaX + deltaY * deltaY < 100)
end

return button