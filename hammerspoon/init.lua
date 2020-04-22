cmd_ctrl = {"cmd","ctrl"}
cmd = {"cmd"}
--[===[ 
script = [[ 
set appName to "kitty"
set startIt to false
tell application "System Events"
	if not (exists process appName) then
		set startIt to true
	else if visible of process appName then
		set visible of process appName to false
	else
		set visible of process appName to true
		set frontmost of process appName to true
	end if
end tell
if startIt then
	tell application appName to activate
end if ]]
hs.hotkey.bind('', 'f1', function()
  hs.applescript(script)
end)
]===]
hs.hotkey.bind('', 'f1', function()
  if hs.application.title(hs.application.frontmostApplication()) == "kitty" then
  hs.eventtap.keyStroke('cmd', 'h')
  else
  hs.application.launchOrFocus("kitty.app")
  end
  end)

hs.hotkey.bind('', 'f2', function()
  if hs.application.title(hs.application.frontmostApplication()) == "Emacs" then
  hs.eventtap.keyStroke('cmd', 'h')
  else
  hs.application.launchOrFocus("Emacs.app")
  end
  end)

hs.hotkey.bind('', 'f3', function()
  if hs.application.title(hs.application.frontmostApplication()) == "Firefox" then
  hs.eventtap.keyStroke('cmd', 'h')
  else
  hs.application.launchOrFocus("Firefox.app")
  end
  end)
  
hs.hotkey.bind('', 'f5', function()
  if hs.application.title(hs.application.frontmostApplication()) == "Marta" then
  hs.eventtap.keyStroke('cmd', 'h')
  else
  hs.application.launchOrFocus("Marta.app")
  end
  end)
 
hs.hotkey.bind('', 'f4', function()
  if hs.application.title(hs.application.frontmostApplication()) == "Telegram" then
  hs.eventtap.keyStroke('cmd', 'h')
  else
  hs.application.launchOrFocus("Telegram.app")
  end
  end)
 