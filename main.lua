local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local button = buton or require  "src/button"
local values = values or require "hiscores"
local background = background or require"src/background"
local lifes = lifes or require "src/lifes"
local tab = tab or require"src/tab"
local player, cpu
local playerScore, cpuScore, playerLife
local pilota, fons
local start, exit, finish, name, meeting
local thingsToPrint, thingsStart, thingsCatchName, thingsPlay, thingsHiScore
local ballSprite, paddleSprite
local startButton, startButtonPressed, quitButton, quitButtonPressed, nameButton, insertNameButton, gameOver, heart
local writing = "return {"
local clickSound, soundtrack, colisionSound, scoreSound, loseSound

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  
  clickSound = love.audio.newSource("sounds/Click.wav", "static")
  soundtrack = love.audio.newSource("sounds/Soundtrack.mp3", "stream")
  soundtrack:setVolume(0.6)
  colisionSound = love.audio.newSource("sounds/BallCollision.mp3", "static")
  scoreSound = love.audio.newSource("sounds/MakePoint.mp3", "static")
  scoreSound:setVolume(0.8)
  loseSound = love.audio.newSource("sounds/LosePoint.mp3", "static")
  
  ballSprite = love.graphics.newImage("sprites/ball.png")
  playerSprite = love.graphics.newImage("sprites/paddle1.png")
  cpuSprite = love.graphics.newImage("sprites/paddle2.png")
  startButton = love.graphics.newImage("sprites/PlayButton.png")
  startButtonPressed = love.graphics.newImage("sprites/PlayButtonPressed.png")
  quitButton = love.graphics.newImage("sprites/QuitButton.png")
  quitButtonPressed = love.graphics.newImage("sprites/QuitButtonPressed.png")
  nameButton = love.graphics.newImage("sprites/NameButton.png")
  insertNameButton = love.graphics.newImage("sprites/InsertName.png")
  gameOver = love.graphics.newImage("sprites/GameOver.png")
  heart = love.graphics.newImage("sprites/Heart.png")
  
  thingsToPrint = {}
  finish = tab(w/2-gameOver:getWidth()/2.8,-62,gameOver, " ", 0.7)
  name = tab(w/2 - insertNameButton:getWidth()/2,200,insertNameButton)
  meeting = tab(w/2 - nameButton:getWidth()/2 ,80,nameButton)
  thingsHiScore = {finish}
  thingsCatchName = {meeting,name}
  
  start=button(100,h/2.35, startButton, startButtonPressed)
  exit=button(490,h/2.35, quitButton, quitButtonPressed)
  thingsStart={start,exit}
  
  fons = background(love.graphics.newImage("sprites/background.png"), love.graphics.newImage("sprites/planets.png"))
  
  player = paddle(margeX,margeY-playerSprite:getHeight()/2,playerSprite:getWidth(),playerSprite:getHeight(),paddleVel,true, playerSprite)
  cpu = paddle(w-(margeX+cpuSprite:getWidth()),margeY-cpuSprite:getHeight()/2,cpuSprite:getWidth(),cpuSprite:getHeight(),paddleVel*0.75,false, cpuSprite)
  
  playerScore = score(initScore,playerScoreX,scoreY)
  cpuScore = score(initScore,cpuScoreX,scoreY)
  playerLife = lifes(60, 30, heart, cpuScore, 0.065, 0.065)
  pilota = ball(xBall,yBall,ballSprite:getWidth(),ballSprite:getHeight(),initBallVel, initBallAng,player,cpu,playerScore,cpuScore, ballSprite, colisionSound, scoreSound, loseSound)
  
  cpu.setTarget(pilota)
  
  soundtrack:play()
  thingsPlay = {player,cpu,playerScore,cpuScore,playerLife,pilota}
  thingsToPrint = thingsStart
end

function love.update(dt)
  for i,v in ipairs(thingsToPrint) do
    v:update(dt)
  end
  if cpuScore.points >= 3 then
    updateScores(playerScore.name, playerScore.points)
    thingsToPrint = thingsHiScore
    cpuScore.points = 0
  end
end

function love.mousepressed()
  if start:checkMouse() then
    clickSound:play()
    thingsToPrint=thingsCatchName
  end
  if  exit:checkMouse() then
    os.exit()
  end
end

function love.keypressed(key)
  if thingsToPrint == thingsCatchName and key == "return" then
    thingsToPrint = thingsPlay
    playerScore.name = name.text
  end
  if thingsToPrint == thingsPlay and key == "q" then
    updateScores(playerScore.name, playerScore.points)
    thingsToPrint = thingsHiScore
  end
end

function love.textinput(text)
    local a = text
  if thingsToPrint == thingsCatchName then
    name.text = name.text..a
    if #name.text >= 7 then
      thingsToPrint = thingsPlay
      playerScore.name = name.text
    end
  end
end

function love.draw()
  fons:draw()
  for i,v in ipairs(thingsToPrint) do
    v:draw()
  end
end

function updateScores(name,value)
  for i, v in pairs (values) do
    --print(names[i]..v)
    if value >= v[2] then
      table.insert(values,i,{name,value})
      break
    end    
  end
  if #values > 3 then
    table.remove(values)
  end
  
  for i, v in pairs (values) do
      writing = writing..'{"'..v[1]..'",'..v[2]..'},'
  end
  writing = string.sub(writing,1,#writing - 1).."}"
  print (writing)
  local write = io.open("hiscores.lua","w")
  io.output(write)
  io.write(writing)
  io.close(write)
  for i, v in ipairs (values) do
    table.insert(thingsHiScore,tab(w/2-110,110+110*i,insertNameButton,v[1]..": "..v[2]))
  end
  --[[
  for i, v in pairs (values) do
    --print(names[i]..v)
    if value >= v then
      table.insert(values,i,value)
      table.insert(names,i,name)
      break
    end    
  end
  if #values > 3 then
    table.remove(values)
    table.remove(names)
  end
  for i, v in pairs (values) do
    print(names[i]..v)
  end
  for i, v in pairs (names) do
      writing1 = writing1..'"'..v..'"'..","
  end
  writing1 = string.sub(writing1,1,#writing1 - 1).."}"
  for i, v in pairs (values) do
      writing2 = writing2..v..","
  end
  writing2 = string.sub(writing2,1,#writing2 - 1).."}"
  print (writing1)
  print (writing2)
  local write = io.open("hiscores.lua","w")
  io.output(write)
  io.write(writing2)
  io.close(write)
  write = io.open("names.lua","w")
  io.output(write)
  io.write(writing1)
  io.close(write)
  for i, v in ipairs (names) do
    table.insert(thingsHiScore,tab(w/2-110,110+110*i,insertNameButton,v..": "..values[i]))
  end
  --]]
  
end