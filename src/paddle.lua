local obj = obj or require("lib/object")
local paddle = obj:extend()
local target

function paddle:new(x,y,width,height,velocitat, player)
  self.x=x
  self.y=y
  self.w=width
  self.h=height
  self.vel=velocitat
  self.offset=self.h/2
  self.player=player
  return self
end

function paddle:update(dt)
  if self.player==true then
    if love.keyboard.isDown("s") then
      self.y=self.y+self.vel*dt
    elseif love.keyboard.isDown("w") then
      self.y=self.y-self.vel*dt
    end
  else
    if target.y<self.y+self.offset then
      self.y = self.y - self.vel*dt
    elseif target.y>self.y+self.offset then
      self.y = self.y + self.vel*dt
    end
  end
end

function paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end
function paddle.setTarget(ball)
  target = ball
end
return paddle