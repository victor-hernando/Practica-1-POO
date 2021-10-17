local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local player, cpu
local playerScore, cpuScore
local pilota

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  
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

