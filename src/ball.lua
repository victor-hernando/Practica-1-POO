local obj = obj or require"C:\Users\bigth\Documents\Universitat\2on\T1\Programacio\Practiques\Prac1\LovePong\Practica 1 POO\lib\object.lua"
local ball = obj.extend()

function ball:new(x,y,radi,velocitat,angle)
  self.x=x
  self.y=y
  self.r=radi
  self.vel=velocitat
  self.ang=angle
  --self.player=player
  --self.cpu=cpu
  return self
end

function ball:update(dt)
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
end

function ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.r)
end

return ball