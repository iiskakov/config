cmd_ctrl = {"cmd","ctrl"}
cmd = {"cmd"}

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
hs.hotkey.bind(cmd, "`", function()
  hs.applescript(script)
end)

