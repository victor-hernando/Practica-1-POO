local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local button = buton or require  "src/button"
local hiScr = hiScr or require "hiscores"
local player, cpu
local playerScore, cpuScore
local pilota
local start, exit
local thingsToPrint, thingsStart, thingsPlay, thingsHiScore
local ballSprite, paddleSprite, background
local playerName
-- Hi-Score variables
local scoreTable = hiScr
local lowestVal = 1000
local lowestName
local writing = "return {"
local names = {}
local values = {}

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  thingsToPrint={}
  thingsHiScore={}
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
end

function love.mousepressed()
  if start:checkMouse() then
    playerName = "vic"
    playerScore.name = playerName
    thingsToPrint=thingsPlay
  end
  if  exit:checkMouse() then
    os.exit()
  end
end

function love.keypressed()
  if love.keyboard.isDown("q") then
    if thingsToPrint == thingsPlay then
      updateScores(playerName,playerScore.points)
      thingsToPrint = thingsHiScore
    end
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

function updateScores(name,value)
  for i, v in pairs (scoreTable) do
    if v < lowestVal then
      lowestVal = v
      lowestName = i
    end
  end
  if value > lowestVal then
    for i, v in pairs (scoreTable) do
      if i ~= lowestName then
        table.insert(names,i)
        table.insert(values,v)
      end
    end
    for i, v in ipairs (names) do
      writing = writing..v.."="..values[i]..","
    end
    writing=writing..name.."="..value.."}"
    print (response)
    local hiscore = io.open("hiscores.lua","w")
    io.output(hiscore)
    io.write(writing)
    io.close(hiscore)
    table.insert(names,name)
    table.insert(values,value)
  else
    for i, v in pairs (scoreTable) do
      table.insert(names,i)
      table.insert(values,v)
    end
  end
  for i, v in ipairs (names) do
    table.insert(thingsHiScore,button(550,h/2+50*i,220,40,v..": "..values[i]))
  end
end

