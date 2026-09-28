function love.conf(t)
  t.version = "11.4"
  t.window.title = "Blockio"          -- The window title (string)
  t.window.fullscreen = false         -- Set false if using not 1080p
  t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
  t.window.borderless = true
  t.window.width = 1200
  t.window.height = 800
  t.window.vsync = 1 -- Vertical sync mode (number)
  t.modules.joystick = false
end
