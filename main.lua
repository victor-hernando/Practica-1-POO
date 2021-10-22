local data = data or require"data"
local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local button = buton or require  "src/button"
local names = names or require "names"
local values = values or require "hiscores"
local background = background or require"src/background"
local player, cpu
local playerScore, cpuScore
local pilota, fons
local start, exit, finish, name, meeting
local thingsToPrint, thingsStart, thingsCatchName, thingsPlay, thingsHiScore
local ballSprite, paddleSprite
local writing1 = "return {"
local writing2 = "return {"

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end
  thingsToPrint = {}
  finish = button(w/2,100,150,50,"")
  name = button(w/2,150,150,50,"")
  meeting = button(w/2,80,100,50,"Name:")
  thingsHiScore = {finish}
  thingsCatchName = {meeting,name}
  
  ballSprite = love.graphics.newImage("sprites/ball.png")
  playerSprite = love.graphics.newImage("sprites/paddle1.png")
  cpuSprite = love.graphics.newImage("sprites/paddle2.png")
  
  start=button(150,h/2,130,40,"Start")
  exit=button(550,h/2,90,40,"Exit")
  thingsStart={start,exit}
  
  fons = background(love.graphics.newImage("sprites/background.png"), love.graphics.newImage("sprites/planets.png"))
  
  player = paddle(margeX,margeY-playerSprite:getHeight()/2,playerSprite:getWidth(),playerSprite:getHeight(),paddleVel,true, playerSprite)
  cpu = paddle(w-(margeX+cpuSprite:getWidth()),margeY-cpuSprite:getHeight()/2,cpuSprite:getWidth(),cpuSprite:getHeight(),paddleVel*0.75,false, cpuSprite)
  
  playerScore = score(initScore,playerScoreX,scoreY)
  cpuScore = score(initScore,cpuScoreX,scoreY)
  
  pilota = ball(xBall,yBall,ballSprite:getWidth(),ballSprite:getHeight(),initBallVel, initBallAng,player,cpu,playerScore,cpuScore, ballSprite)
  
  cpu.setTarget(pilota)
  
  thingsPlay = {player,cpu,playerScore,cpuScore,pilota}
  thingsToPrint = thingsStart
end

function love.mousepressed()
  if start:checkMouse() then
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
end

function love.textinput(text)
    local a = text
  if thingsToPrint == thingsCatchName then
    name.text = name.text..a
    if #name.text >= 6 then
      thingsToPrint = thingsPlay
      playerScore.name = name.text
    end
  end
end

function love.update(dt)
    for i,v in ipairs(thingsToPrint) do
      v:update(dt)
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
    table.insert(thingsHiScore,button(w/2-110,100+50*i,220,40,v..": "..values[i]))
  end
end