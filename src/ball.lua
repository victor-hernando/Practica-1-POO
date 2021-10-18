local Obj = Obj or require ("lib/object")

local ball = Obj:extend()
local deltaX, deltaY
local initSpeed
local playerPts, cpuPts

function ball:new(x,y,radi,velocitat,angle,player,cpu,playerpts,cpupts, sprite)
  self.x=x
  self.y=y
  self.r=radi
  initSpeed=velocitat
  self.vel=velocitat
  self.ang=angle
  self.player=player
  self.cpu=cpu
  --self.playerpts=playerPts
  --self.cpupts=cpuPts
  playerPts=playerpts
  cpuPts=cpupts
  self.sprite=sprite
  return self
end

function ball:update(dt)  
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
 --Check collision
  self:collision(self.player)
  self:collision(self.cpu)
  --Horizontal Edge detection
  if self.y < self.r or self.y > h-self.r then
    self.ang = -(self.ang-math.pi/2)-math.pi/2
  end
  --Vertical Edge detection
  if self.x <= 0 or self.x >= w then
    self.vel=initSpeed
    --Aumenta el valor de score dependiendo de que lado colisione
    if self.x <= 0 then
      cpuPts.points = cpuPts.points + 1
    else
      playerPts.points = playerPts.points + 1
    end
    self.x=w/2
    self.y=h/2
  end
end

function ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.r)
  --love.graphics.draw(self.sprite, self.x, self.y, 0, 0.5, 0.5)
end

function ball:collision(val)
  deltaX = self.x - math.max(val.x, math.min(self.x, val.x + paddleWidth))
  deltaY = self.y - math.max(val.y, math.min(self.y, val.y + paddleHeight))
  --Si la pelota interseca con el objeto pasado como parametro, rebota especularmente y aumenta su velocidad
  if deltaX * deltaX + deltaY * deltaY < self.r * self.r then
    self.vel=self.vel*1.1
    self.ang = -( self.ang - math.pi/2 ) + math.pi/2
    if val.x > w/2 then
      self.x = val.x - self.r
    else
      self.x = val.x + self.r + paddleWidth
    end
  end
end
return ball