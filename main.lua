local ball = ball or require"src/ball.lua"

function love.load()
  if arg[#arg] == "-debug" then
    require("moddebug").start()
  end
  
  b=ball(0,0,10,300,0)
    
end

function love.update()
  
end

function love.draw()
end

