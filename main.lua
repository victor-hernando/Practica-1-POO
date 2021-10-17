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
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  player = paddle(30,h/2-50,10,100,150,true)
  cpu = paddle(w-40,h/2-50,10,100,100,false)
  playerScore = score(0,200,100)
  cpuScore = score(3,600,100)
  pilota = ball(w/2,h/2,10,200,0.3,player,cpu,playerScore,cpuScore)
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

