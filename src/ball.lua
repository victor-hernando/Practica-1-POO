local obj = obj or require"C:\Users\bigth\Documents\Universitat\2on\T1\Programacio\Practiques\Prac1\LovePong\Practica 1 POO\lib\object.lua"

local ball = obj.extend()
local deltaX, deltaY
local initSpeed
local playerPts, cpuPts

function ball:new(x,y,radi,velocitat,angle,player,cpu,score)
  self.x=x
  self.y=y
  self.r=radi
  initSpeed=velocitat
  self.vel=velocitat
  self.ang=angle
  self.player=player
  self.cpu=cpu
  self.scr
  return self
end

function ball:update(dt)  
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
  --Check collision
  ball:collision(player)
  ball:collision(cpu)
  --Horizontal Edge detection
  if self.y < self.r or self.y > h-self.r then
    self.ang = -(self.ang-math.pi/2)-math.pi/2
  end
  
  --Vertical Edge detection
  if self.x < self.r or self.x > w-self.x then
    self.x=w/2
    self.y=h/2
    self.vel=initSpeed
    --Aumenta el valor de score dependiendo de que lado colisione
    if self.x < self.r then
      cpupts = cpupts + 1
    else
      playerpts = playerpts + 1
    end
  end
end

function ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.r)
end

function ball:collision(obj)
  deltaX = self.x - math.max(obj.x, math.min(self.x, obj.x + 10))
  deltaY = self.y - math.max(obj.y, math.min(self.y, obj.y + 100))
  --Si la pelota interseca con el objeto pasado como parametro, rebota especularmente y aumenta su velocidad
  if deltaX * deltaX + deltaY * deltaY < self.r * self.r then
    self.vel=self.vel*1.1
    self.ang = -( self.ang - math.pi/2 ) + math.pi/2
  end
  
return ball