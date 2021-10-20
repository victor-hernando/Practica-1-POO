local Obj = Obj or require ("lib/object")

local ball = Obj:extend()
local deltaX, deltaY
local initSpeed
local playerPts, cpuPts
local rotation

function ball:new(x,y,width,height,velocitat,angle,player,cpu,playerpts,cpupts,sprite)

function ball:new(x,y,radi,velocitat,angle,player,cpu,playerpts,cpupts,sprite, rotationSpeed)

  self.x=x
  self.y=y
  self.w=width
  self.h=height
  initSpeed=velocitat
  self.vel=velocitat
  self.ang=angle
  self.player=player
  self.cpu=cpu
  playerPts=playerpts
  cpuPts=cpupts
  self.img=sprite
  self.sprite = sprite
  self.rotSpeed = rotationSpeed or 5
  rotation = 0
  return self
end

function ball:update(dt)  
  rotation = rotation + self.rotSpeed * dt
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
 --Check collision
  self:collision(self.player)
  self:collision(self.cpu)
  --Horizontal Edge detection
  if self.y < 0 or self.y > h-self.h then
    self.ang = -(self.ang-math.pi/2)-math.pi/2
  end
  --Vertical Edge detection
  if self.x <= 0 or self.x + self.w >= w then
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
  love.graphics.draw(self.img, self.x, self.y)
  --love.graphics.draw(self.sprite, self.x, self.y, 0, 0.5, 0.5)
end

function ball:collision(val)

  if (self.x < val.x + val.w and self.x + self.w > val.x and self.y < val.y + val.h and self.h + self.y > val.y) then
    self.vel=self.vel*1.1
    self.ang = -(self.ang - math.pi/2 ) + math.pi/2
    if val.x > w/2 then
      self.x = val.x - self.h
    else
      self.x = val.x + val.w
    end
  end  

end
--[[function ball:collision(val)
  deltaX = self.x - math.max(val.x, math.min(self.x, val.x + val.w))
  deltaY = self.y - math.max(val.y, math.min(self.y, val.y + val.h))
  --Si la pelota interseca con el objeto pasado como parametro, rebota especularmente y aumenta su velocidad
  if deltaX * deltaX + deltaY * deltaY < self.h/2 * self.h/2 then
    
    self.vel=self.vel*1.1
    self.ang = -( self.ang - math.pi/2 ) + math.pi/2
    if val.x > w/2 then
      self.x = val.x - self.h/2
    else
      self.x = val.x + self.h/2 + val.w
    end
  if deltaX * deltaX + deltaY * deltaY < pilota.r * pilota.r then
    pilota.vel=pilota.vel*1.1
    pilota.ang = -( pilota.ang - math.pi/2 ) + math.pi/2
      if val.x > w/2 then 
        pilota.x = val.x - pilota.r
      else
        pilota.x = val.x + paddleWidth + pilota.r
      end
  end
end--]]

return ball