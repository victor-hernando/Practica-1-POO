local obj = obj or require("lib/object")
local paddle = obj:extend()

function paddle:new(x,y,width,height,velocitat, player)
  self.x=x or 30
  self.y=y or w/2+50
  self.w=width or 30
  self.h=height or 100
  self.vel=velocitat or 40
  self.offset=offset or 30
  self.player=player or false
  return self
end

function paddle:update(dt)
  if player == false then
    if target.y<self.y then
      self.y = self.y - self.vel*dt
    elseif target.y>self.y then
      self.y = self.y + self.vel*dt
    end
  end
end

function paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 3, 3, 1)
end

function paddle:keypressed(dt)
  if player then
    if love.keyboard.isDown("down") then
    self.Y=self.Y+self.vel*dt
    elseif love.keyboard.isDown("up") then
    self.Y=self.Y-self.vel*dt
    end
  end
end


function paddle:setTarget(ball)
  local target = ball
end
return paddle