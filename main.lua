function love.load()
  music = love.audio.newSource("ART/maintrack.ogg", "stream")
  music:setLooping(true)
  music:play()
  chunky = love.graphics.newFont("ART/chunkybit.ttf", 40)
  chunky:setFilter("nearest", "nearest")
  love.graphics.setFont(chunky)

  Scene = 0
  love.mouse.setVisible(false)
  MouseX = 0
  MouseY = 0
  CLICK = require("SRC.REQUIRED.keyboard")
  MOUSE = require("SRC.REQUIRED.click")
  STARTSCREEN = require("SRC.menus")
  GAME = require("SRC.game")
  love.graphics.setDefaultFilter("nearest", "nearest")
  cursor = love.graphics.newImage("ART/cursor.png")
  menus:load()
  game:load()
end

function love.update(dt)
  love.audio.setVolume(Volume * 0.1)
  MouseX = love.mouse.getX() / love.graphics.getWidth()
  MouseY = love.mouse.getY() / love.graphics.getHeight()

  click:update(dt)
  keeb:update(dt)
  if Scene <= 2 then
    menus:update(dt)
  elseif Scene == 101 then
    game:update(dt)
  end
  print(MouseX, MouseY, MouseX * love.graphics.getWidth(), MouseY * love.graphics.getHeight())
end

function love.draw()
  if Scene <= 2 then
    menus:draw()
  elseif Scene == 101 then
    game:draw()
  end

  if MouseX > 0 and MouseY > 0 then
    love.graphics.draw(cursor, MouseX * love.graphics.getWidth(), MouseY * love.graphics.getHeight(), 0, 2)
  end
end
