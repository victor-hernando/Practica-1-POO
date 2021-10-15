local ball = ball or require"src/ball"
local paddle = paddle or require"src/paddle"
local score = score or require"src/score"
local player, cpu
local playerScore, cpuScore

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("moddebug").start()
  end
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  pilota=ball(0,0,10,300,0)
  player=paddle()
  cpu=paddle()
  playerScore=score()
  cpuScore=score()
end

function love.update(dt)
  b:update(dt)
end

function love.draw()
  b:draw()
end

