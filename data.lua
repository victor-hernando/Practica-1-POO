--Marc Lloret & Victor Hernando

--Valors pantalla
w, h = love.graphics.getDimensions() -- Get the screen width and height

--Sounds
clickSound = love.audio.newSource("sounds/Click.wav", "static")
soundtrack = love.audio.newSource("sounds/Soundtrack.mp3", "stream")
colisionSound = love.audio.newSource("sounds/BallCollision.mp3", "static")
scoreSound = love.audio.newSource("sounds/MakePoint.mp3", "static")
loseSound = love.audio.newSource("sounds/LosePoint.mp3", "static")
soundtrackVolume = 0.3
scoreSoundVolume = 0.7

--Sprites
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
backgroundSprite = love.graphics.newImage("sprites/background.png")
planets = love.graphics.newImage("sprites/planets.png")

--Buttons
xFinish = w/2-gameOver:getWidth()/2.8
yFinish = -62
emptyText = " "
finishScale = 0.7
xName = w/2 - insertNameButton:getWidth()/2
yName = 200
xMeeting = w/2 - nameButton:getWidth()/2 
yMeeting = 80
xStart = 100
yStart = h/2.35
xExit = 490
yExit = h/2.35

--Valors pilota
xBall = w/2
yBall = h/2
rBall = 10
initBallVel = 200
initBallAng = {0,math.pi * 2}
ballWidth = ballSprite:getWidth()
ballHeight = ballSprite:getHeight()
ballBounceMaxDiff = 1

--Valors paddle
playerMargeX = 30 
playerMargeY = h/2-playerSprite:getHeight()/2
cpuMargeX = w-(30+cpuSprite:getWidth())
cpuMargeY = h/2-cpuSprite:getHeight()/2

paddleWidth = playerSprite:getWidth()
paddleHeight = playerSprite:getHeight()
playerVel = 150
cpuWidth = cpuSprite:getWidth()
cpuHeight = cpuSprite:getHeight()
cpuVel = playerVel * 0.75

--valors score
initScore = 0
scoreY = 100
playerScoreX = 130
cpuScoreX = 525
fontScale = 40

--Lifes
xLife = 60
yLife = 30
lifeScale = 0.065

--
cpuMaxPoints = 3
maxLetters = 7

