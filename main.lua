local ball = ball or require"C:/Users/bigth/Documents/Universitat/2on/T1/Programacio/Practiques/Prac1/LovePong/Practica 1 POO/src/ball.lua"

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("moddebug").start()
  end
  
  b=ball(0,0,10,300,0)
    
end

function love.update(dt)
  b:update(dt)
end

function love.draw()
  b:draw()
end

