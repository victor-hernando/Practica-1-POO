local Obj = Obj or require ("lib/object")

local ball = Obj:extend()
local deltaX, deltaY
local initSpeed
local playerPts, cpuPts

function ball:new(x,y,radi,velocitat,angle,player,cpu,playerpts,cpupts)
  self.x=x or w/2
  self.y=y or h/2
  self.r=radi or 10
  initSpeed=velocitat or 50
  self.vel=velocitat or 50
  self.ang=angle or 0
  self.player=player or 0
  self.cpu=cpu or 0
  --self.playerpts=playerPts
  --self.cpupts=cpuPts
  playerPts=playerpts
  cpuPts=cpupts
  return self
end

function ball:update(dt)  
  --Movemos la pelota
  self.x = self.x + self.vel*math.cos(self.ang)*dt
  self.y = self.y + self.vel*math.sin(self.ang)*dt
 --Check collision
  ball.collision(self,self.player)
  ball.collision(self,self.cpu)
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
end

function ball.collision(pilota,val)
  deltaX = pilota.x - math.max(val.x, math.min(pilota.x, val.x + 10))
  deltaY = pilota.y - math.max(val.y, math.min(pilota.y, val.y + 100))
  --Si la pelota interseca con el objeto pasado como parametro, rebota especularmente y aumenta su velocidad
  if deltaX * deltaX + deltaY * deltaY < pilota.r * pilota.r then
    pilota.vel=pilota.vel*1.1
    pilota.ang = -( pilota.ang - math.pi/2 ) + math.pi/2
  end
end
return ball