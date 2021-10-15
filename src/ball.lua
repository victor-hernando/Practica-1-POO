local obj = obj or require"C:\Users\bigth\Documents\Universitat\2on\T1\Programacio\Practiques\Prac1\LovePong\Practica 1 POO\lib\object.lua"

local ball = obj.extend()
local deltaX, deltaY


function ball:new(x,y,radi,velocitat,angle,player,cpu)
  self.x=x
  self.y=y
  self.r=radi
  self.vel=velocitat
  self.ang=angle
  self.player=player
  self.cpu=cpu
  return self
end

function ball:update(dt)  
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
  --Check collision
  ball:collision(player)
  ball:collision(cpu)
  
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