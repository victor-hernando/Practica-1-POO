local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local button = buton or require  "src/button"
local hiscr = io.open("hiscores","r")
local player, cpu
local playerScore, cpuScore
local pilota
local start, exit
local thingsToPrint, thingsStart, thingsPlay
local ballSprite, paddleSprite, background

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  thingsToPrint={}
  ballSprite = love.graphics.newImage("Sprites/pilota.png")
  --paddleSprite = love.graphics.newImage("Sprites/paddle.png")
  --background = love.graphics.newImage("Sprites/background.png")
  start=button(150,h/2,130,40,"Start")
  exit=button(550,h/2,90,40,"Exit")
  thingsStart={start,exit}
  player = paddle(margeX,margeY-paddleHeight/2,paddleWidth,paddleHeight,paddleVel,true)
  cpu = paddle(w-(margeX+paddleWidth),margeY-paddleHeight/2,paddleWidth,paddleHeight,paddleVel*0.75,false)
  playerScore = score(initScore,playerScoreX,scoreY)
  cpuScore = score(initScore,cpuScoreX,scoreY)
  pilota = ball(xBall,yBall,rBall,initBallVel,initBallAng,player,cpu,playerScore,cpuScore, ballSprite)
  cpu.setTarget(pilota)
  thingsPlay = {player,cpu,playerScore,cpuScore,pilota}
  thingsToPrint = thingsStart
  
  
  io.input(hiscr)
  --print(io.read())
  a=io.read()
  print(a[1])
  --local hiscr = io.open("hiscores","w")
  --io.output(hiscr)
  --io.write("hola")
  
end

function love.mousepressed()
  if start:checkMouse() then
    thingsToPrint=thingsPlay
  end
  if  exit:checkMouse() then
    os.exit()
  end
end

function love.update(dt)
  for i,v in ipairs(thingsToPrint) do
    v:update(dt)
  end
end

function love.draw()
  for i,v in ipairs(thingsToPrint) do
    v:draw()
  end
end

