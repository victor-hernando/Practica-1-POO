local ball = ball or require"C:/Users/bigth/Documents/Universitat/2on/T1/Programacio/Practiques/Prac1/LovePong/Practica 1 POO/src/ball.lua"
local paddle = paddle or require("")
local score = socre or require("")
local pilota
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

