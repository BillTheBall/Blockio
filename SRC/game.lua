game = {}

function game:load()
  breaking = love.audio.newSource("ART/explosion.wav", "static")
  Score = 0
  HighScore = 0
  math.randomseed(os.time() + math.floor(os.clock() * 1000000))
  currentState = "playing"

  -- Table to hold active pop-up scores
  floatingTexts = {}

  -- Grid structure (7 rows, 9 columns)
  grid = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  }

  gameTime = 0
  spawnTimer = 0
  gravityTimer = 0
  riseTimer = 0
  baseSpawnInterval = 4.0
  minSpawnInterval = 1.5
  baseGravityInterval = 0.8
  minGravityInterval = 0.25
  riseInterval = 7
  for colIndex = 1, #grid do
    local value = math.random(0, 2)
    if value > 0 then
      grid[7][colIndex] = math.random(1, 3) -- FIXED: Pick color 1, 2, or 3 instantly
    end
  end

  gameBackground = love.graphics.newImage("ART/blockiogame.png")
  gamePaused = love.graphics.newImage("ART/blockiopaused.png")
  gameOver = love.graphics.newImage("ART/blockioover.png")
  block = love.graphics.newImage("ART/pointlessblock.png")
end

local BLOCK_WIDTH = 120
local BLOCK_HEIGHT = 120
function game:reset()
  if HighScore < Score then
    HighScore = Score
  end
  grid = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  }
  Score = 0
  gameTime = 0
  spawnTimer = 0
  gravityTimer = 0
  riseTimer = 0
  baseSpawnInterval = 4.0
  minSpawnInterval = 1.5
  baseGravityInterval = 0.8
  minGravityInterval = 0.25
  riseInterval = 7
  currentState = "playing"

  -- Clear all pop-up texts on reset
  floatingTexts = {}

  -- Corrected setup: assign values to grid[7] instead of grid[colIndex]
  for colIndex = 1, #grid[7] do
    local value = math.random(0, 2)
    if value > 0 then
      grid[7][colIndex] = math.random(1, 3) -- FIXED: Pick color 1, 2, or 3 instantly
    end
  end
end

function game:update(dt)
  print(Score)
  if Esc and currentState ~= "playing" then
    currentState = "playing"
  elseif Esc then
    currentState = "paused"
  end
  if R then
    game:reset()
  end
  if A then
    currentState = "ended"
  end
  if currentState == "paused" then
    if RightClicking then
      if MouseX > 0.11 and MouseX < 0.235 and MouseY > 0.377 and MouseY < 0.415 then
        currentState = "playing"
      end
      if MouseX > 0.11 and MouseX < 0.273 and MouseY > 0.44 and MouseY < 0.482 then
        game:reset()
        Scene = 1
      end
    end
  end

  if currentState == "ended" then
    if RightClicking then
      if MouseX > 0.115 and MouseX < 0.232 and MouseY > 0.377 and MouseY < 0.425 then
        game:reset()
        Scene = 1
      end
      if MouseX > 0.115 and MouseX < 0.298 and MouseY > 0.435 and MouseY < 0.475 then
        game:reset()
      end
    end
  end

  -- Update floating texts countdown (runs even if game state changes so they fade out properly)
  for i = #floatingTexts, 1, -1 do
    local ft = floatingTexts[i]
    ft.timer = ft.timer - dt
    ft.y = ft.y - 60 * dt -- Make the text drift upward slightly over time
    if ft.timer <= 0 then
      table.remove(floatingTexts, i)
    end
  end

  if currentState ~= "playing" then
    return
  end
  for colIndex = 1, #grid[1] do
    if grid[1][colIndex] >= 1 and grid[1][colIndex] <= 3 then -- FIXED: Only check settled colors
      currentState = "ended"
    end
  end
  gameTime = gameTime + dt

  local currentSpawnInterval = math.max(minSpawnInterval, baseSpawnInterval - (gameTime * 0.04))
  local currentGravityInterval = math.max(minGravityInterval, baseGravityInterval - (gameTime * 0.01))

  gravityTimer = gravityTimer + dt
  if gravityTimer >= currentGravityInterval then
    gravityTimer = 0


    for rowIndex = #grid - 1, 1, -1 do
      for colIndex = 1, #grid[rowIndex] do
        local currentBlock = grid[rowIndex][colIndex]


        if currentBlock > 0 then
          local spaceBelow = grid[rowIndex + 1][colIndex]

          if spaceBelow == 0 then
            grid[rowIndex + 1][colIndex] = currentBlock
            grid[rowIndex][colIndex] = 0
          elseif spaceBelow >= 1 and spaceBelow <= 3 and currentBlock >= 4 then
            grid[rowIndex][colIndex] = currentBlock - 3
          end
        end
      end
    end

    for colIndex = 1, #grid[7] do
      if grid[7][colIndex] >= 4 then
        grid[7][colIndex] = grid[7][colIndex] - 3
      end
    end
  end


  riseTimer = riseTimer + dt
  if riseTimer >= riseInterval then
    riseTimer = 0

    for rowIndex = 1, #grid - 1 do
      for colIndex = 1, #grid[rowIndex] do
        if grid[rowIndex + 1][colIndex] >= 1 and grid[rowIndex + 1][colIndex] <= 3 then
          grid[rowIndex][colIndex] = grid[rowIndex + 1][colIndex]
        elseif grid[rowIndex][colIndex] >= 1 and grid[rowIndex][colIndex] <= 3 then
          grid[rowIndex][colIndex] = 0
        end
      end
    end


    for colIndex = 1, #grid[7] do
      local value = math.random(0, 2)
      if value > 0 then
        grid[7][colIndex] = math.random(1, 3)
      else
        if grid[7][colIndex] >= 1 and grid[7][colIndex] <= 3 then
          grid[7][colIndex] = 0
        end
      end
    end
  end


  if RightClicking then
    local mx, my = love.mouse.getPosition()
    for rowIndex, row in ipairs(grid) do
      for colIndex, value in ipairs(row) do
        local blockX = (colIndex - 1) * 125 + 75
        local blockY = (rowIndex * 124) - 205

        if value > 0 and mx >= blockX and mx <= blockX + BLOCK_WIDTH and
            my >= blockY and my <= blockY + BLOCK_HEIGHT then
          grid[rowIndex][colIndex] = 0
          local heightFromBottom = #grid - rowIndex
          local pointsEarned = 10 + (heightFromBottom * 10)
          breaking:clone():play()
          Score = Score + pointsEarned

          -- Create a pop-up score instance
          table.insert(floatingTexts, {
            text = "+" .. tostring(pointsEarned),
            x = blockX + (BLOCK_WIDTH / 2) - 15, -- Centers text roughly over the block
            y = blockY + (BLOCK_HEIGHT / 2),
            timer = 0.5                          -- 0.5 second lifetime
          })
        end
      end
    end
  end


  spawnTimer = spawnTimer + dt
  if spawnTimer >= currentSpawnInterval then
    spawnTimer = 0

    local targetRow = math.random(1, 3)
    local blocksToSpawn = math.min(4, math.floor(1 + (gameTime * 0.02)))

    for i = 1, blocksToSpawn do
      local randomCol = math.random(1, #grid[targetRow])

      if grid[targetRow][randomCol] == 0 then
        grid[targetRow][randomCol] = math.random(4, 6) -- FIXED: Pick random falling color (4, 5, or 6)
      end
    end
  end
end

function game:draw()
  love.graphics.draw(gameBackground, 0, 0, 0, 5)
  for rowIndex, row in ipairs(grid) do
    for colIndex, value in ipairs(row) do
      if value > 0 then
        -- FIXED: Color logic checks structural data ID instead of running math.random
        if value == 1 or value == 4 then
          love.graphics.setColor(251 / 255, 182 / 255, 27 / 255)
        elseif value == 2 or value == 5 then
          love.graphics.setColor(150 / 255, 196 / 255, 116 / 255)
        elseif value == 3 or value == 6 then
          love.graphics.setColor(228 / 255, 135 / 255, 160 / 255)
        end
        love.graphics.draw(block, (colIndex - 1) * 124 + 75, (rowIndex * 125) - 205, 0, 4.7)
      end
    end
  end
  love.graphics.setColor(1, 1, 1)
  local lineSpacing = 36
  local startX = 20
  local startY = 50
  love.graphics.setColor(0, 0, 0)
  ScoreText = "Score" .. tostring(Score)
  for i = 1, #ScoreText do
    local char = ScoreText:sub(i, i)
    local currentY = startY + (i - 1) * lineSpacing
    love.graphics.print(char, startX, currentY)
  end

  local startY = 450

  if HighScore < Score then
    HighScore = Score
  end
  HighScoreText = "High" .. tostring(HighScore)
  for i = 1, #HighScoreText do
    local char = HighScoreText:sub(i, i)
    local currentY = startY + (i - 1) * lineSpacing
    love.graphics.print(char, startX, currentY)
  end
  love.graphics.setColor(1, 1, 1)

  -- Render floating text popups over the game
  love.graphics.setColor(0, 0, 0) -- Change this to color the popup text (e.g. 0, 0, 0 for black)
  for _, ft in ipairs(floatingTexts) do
    love.graphics.print(ft.text, ft.x, ft.y)
  end
  love.graphics.setColor(1, 1, 1) -- Reset color system back to default

  if currentState == "paused" then
    love.graphics.draw(gamePaused, 0, 0, 0, 5)
  end

  if currentState == "ended" then
    love.graphics.draw(gameOver, 0, 0, 0, 5)
  end
end
