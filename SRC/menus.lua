menus = {}

function menus:load()
  correctScene = false
  Volume = 5
  timer = 3
  timer2 = 0
  menuLogo = love.graphics.newImage("ART/logo.png")

  menuBackground = love.graphics.newImage("ART/blockio.png")
  menuOptions = love.graphics.newImage("ART/blockiooptions.png")
end

function menus:update(dt)
  if Scene == 0 then
    timer = timer - dt
    if timer < 0 then
      Scene = 1
    end
    if E then
      timer = -1
    end
  end
  if Scene == 1 then
    if RightClicking and correctScene then
      if MouseX > 0.115 and MouseX < 0.232 and MouseY > 0.377 and MouseY < 0.425 then
        Scene = 101
      end
      if MouseX > 0.115 and MouseX < 0.298 and MouseY > 0.435 and MouseY < 0.475 then
        Scene = 2
        correctScene = false
        timer2 = 0.5
      end
      if MouseX > 0.115 and MouseX < 0.298 and MouseY > 0.486 and MouseY < 0.528 then
        love.event.quit()
      end
    end
  end
  timer2 = timer2 - dt
  if timer2 < 0 then
    correctScene = true
  end
  if Scene == 2 then
    if MouseX > 0.3 and MouseX < 0.32 and MouseY > 0.435 and MouseY < 0.475 then
      if RightClicking and Volume < 9 then
        Volume = Volume + 1
      elseif LeftClicking and Volume > 0 then
        Volume = Volume - 1
      end
    end

    if RightClicking then
      if MouseX > 0.11 and MouseX < 0.235 and MouseY > 0.377 and MouseY < 0.415 then
        Scene = 1
        correctScene = false
        timer2 = 0.5
      end
    end
  end
end

function menus:draw()
  if Scene == 0 then
    love.graphics.draw(menuLogo, 0, 0, 0, 5)
  end
  if Scene == 1 then
    love.graphics.draw(menuBackground, 0, 0, 0, 5)
  end
  if Scene == 2 then
    love.graphics.draw(menuOptions, 0, 0, 0, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(Volume, 360, 365)
    love.graphics.setColor(1, 1, 1)
  end
end
