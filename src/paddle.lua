local obj = obj or require("lib/object")
local paddle = obj.extend()

function paddle:new(x,y,width,height,velocitat, player)
  self.x=x
  self.y=y
  self.w=width
  self.h=height
  self.vel=velocitat
  self.offset=offset
  self.player=player
  return self
end

function paddle:update(dt)
  if player == false do
    if target.y<self.y then
      self.y = self.y - self.vel*dt
    elseif target.y>self.y then
      self.y = self.y + self.vel*dt
end

function paddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 3, 3, 1)
end

function paddle:keypressed(dt)
  if player do
    if love.keyboard.isDown("down") then
    self.Y=self.Y+self.vel*dt
    elseif love.keyboard.isDown("up") then
    self.Y=self.Y-self.vel*dt
  end
end

function paddle:setTarget(ball)
  local target = ball
end