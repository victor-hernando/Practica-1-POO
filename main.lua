local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
--local button = buton or require  "src/button"
local player, cpu
local playerScore, cpuScore
local pilota
local start, exit
local thingsToPrint

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  --manageThings(start,true)
  --start=button(200,h/2,50,20,"Start")
  --exit=button(600,h/2,50,20,"Exit")
  --table.insert(thingsToPrint,start)
  --table.insert(thingsToPrint,exit)
  player = paddle(margeX,margeY-paddleHeight/2,paddleWidth,paddleHeight,paddleVel,true)
  cpu = paddle(w-(margeX+paddleWidth),margeY-paddleHeight/2,paddleWidth,paddleHeight,paddleVel*0.75,false)
  playerScore = score(initScore,playerScoreX,scoreY)
  cpuScore = score(initScore,cpuScoreX,scoreY)
  pilota = ball(xBall,yBall,rBall,initBallVel,initBallAng,player,cpu,playerScore,cpuScore)
  cpu.setTarget(pilota)
end

function love.update(dt)
  pilota:update(dt)
  player:update(dt)
  cpu:update(dt)
end

function love.draw()
  love.graphics.line(w/2,0,w/2,h)
  pilota:draw()
  player:draw()
  cpu:draw()
  playerScore:draw()
  cpuScore:draw()
end
--[[
function manageThings(thing, whatToDo)
  if whatToDo == true then
    table.insert(thingsToPrint,thing)
  else
    for i,v in ipairs(thingsToPrint) do
      if v == thing then
        table.remove(thingsToPrint,i)
      end
    end
  end
end
--]]

