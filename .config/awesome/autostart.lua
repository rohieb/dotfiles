--
-- Autostart applications, taken from
-- https://wiki.archlinux.org/index.php/Awesome#Transitioning_away_from_Gnome3
--
procs = {
  { "setscreens-daystar", },
  { "nm-applet", },
  { "start-power-manager", },
  { "s0trayicon", },
  { "blueman-applet", },
  { "gkrellm", },
  { "pasystray", },
  { "setkeymap", },
  { "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1", },
  { "udiskie", "udiskie --smart-tray" },
  { "hamster-time-tracker", },
--  { "ibus-daemon", "ibus-ademon --xim" },
}

-- start apps only when it is not running
for k = 1, #procs do
  local daemon_name, daemon_cmdline = procs[k][1], procs[k][2]
  if not daemon_cmdline then
    daemon_cmdline = daemon_name
  end
  if daemon_name then
    local running = os.execute("ps -eF | grep -v grep | grep -w " .. daemon_name)
    if (running ~= 0) then
      os.execute(daemon_cmdline .. " &")
    end
  end
end

-- vim: set ts=2 sw=2 et:
