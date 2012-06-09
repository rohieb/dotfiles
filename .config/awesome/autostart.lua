--
-- Autostart applications, taken from
-- https://wiki.archlinux.org/index.php/Awesome#Transitioning_away_from_Gnome3
--

procs = {
  "nm-applet",
  "xfce4-power-manager",
  "s0trayicon",
  "blueman",
  "gkrellm",
}

-- start apps only when it is not running
function start_daemon(dae)
  daeCheck = os.execute("ps -eF | grep -v grep | grep -w " .. dae)
  if (daeCheck ~= 0) then
    os.execute(dae .. " &")
  end
end

for k = 1, #procs do
  start_daemon(procs[k])
end

