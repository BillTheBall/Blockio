click = {}

RightClicking = false
LeftClicking = false
ScrollPosition = 0
local CurrentlyRClicking = false
local CurrentlyLClicking = false
local holding = 0
local holdingL
function click:load() end

function click:update(dt)
	if not CurrentlyRClicking then
		holding = 1 / love.timer.getFPS()
	end
	if CurrentlyRClicking and not RightClicking and holding == 1 / love.timer.getFPS() then
		RightClicking = true
	else
		RightClicking = false
	end
	if CurrentlyRClicking then
		holding = holding - dt
	end
	if not CurrentlyLClicking then
		holdingL = 1 / love.timer.getFPS()
	end
	if CurrentlyLClicking and not LeftClicking and holdingL == 1 / love.timer.getFPS() then
		LeftClicking = true
	else
		LeftClicking = false
	end
	if CurrentlyLClicking then
		holdingL = holdingL - dt
	end
	ScrollPosition = 0
end

function love.wheelmoved(x, y)
	ScrollPosition = y
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
		CurrentlyRClicking = true
	end
	if button == 2 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
		CurrentlyLClicking = true
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	holding = 1 / love.timer.getFPS()
	holdingL = 1 / love.timer.getFPS()
	CurrentlyRClicking = false
	CurrentlyLClicking = false
end
