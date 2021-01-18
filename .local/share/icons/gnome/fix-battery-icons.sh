#!/bin/sh
gnomeiconpath=/usr/share/icons/gnome
usericonpath=~/.local/share/icons/gnome

# params: name in gnome icon path, name in user icon path
make_icon_symlinks() {
	for size in scalable 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 512x512 ; do
		src="${gnomeiconpath}/${size}/${1}"
		dst="${usericonpath}/${size}/${2}"
		if [ -e "${src}" ]; then
			if [ -h "${dst}" ]; then
				rm "${dst}"
			fi
			mkdir -p $(dirname "${dst}")
			ln -sv "${src}" "${dst}"
		fi
	done
}

make_icon_symlinks status/battery-full.png              status/battery-level-100-symbolic.png
make_icon_symlinks status/battery-full.png              status/battery-level-90-symbolic.png
make_icon_symlinks status/battery-good.png              status/battery-level-80-symbolic.png
make_icon_symlinks status/battery-good.png              status/battery-level-70-symbolic.png
make_icon_symlinks status/battery-good.png              status/battery-level-60-symbolic.png
make_icon_symlinks status/battery-low.png               status/battery-level-50-symbolic.png
make_icon_symlinks status/battery-low.png               status/battery-level-40-symbolic.png
make_icon_symlinks status/battery-low.png               status/battery-level-30-symbolic.png
make_icon_symlinks status/battery-low.png               status/battery-level-20-symbolic.png
make_icon_symlinks status/battery-caution.png           status/battery-level-10-symbolic.png
make_icon_symlinks status/battery-empty.png             status/battery-level-0-symbolic.png

make_icon_symlinks status/battery-full-charged.png      status/battery-level-100-charged-symbolic.png
make_icon_symlinks status/battery-full-charging.png     status/battery-level-90-charging-symbolic.png
make_icon_symlinks status/battery-good-charging.png     status/battery-level-80-charging-symbolic.png
make_icon_symlinks status/battery-good-charging.png     status/battery-level-70-charging-symbolic.png
make_icon_symlinks status/battery-good-charging.png     status/battery-level-60-charging-symbolic.png
make_icon_symlinks status/battery-low-charging.png      status/battery-level-50-charging-symbolic.png
make_icon_symlinks status/battery-low-charging.png      status/battery-level-40-charging-symbolic.png
make_icon_symlinks status/battery-low-charging.png      status/battery-level-30-charging-symbolic.png
make_icon_symlinks status/battery-low-charging.png      status/battery-level-20-charging-symbolic.png
make_icon_symlinks status/battery-caution-charging.png  status/battery-level-10-charging-symbolic.png
make_icon_symlinks status/battery-caution-charging.png  status/battery-level-0-charging-symbolic.png

make_icon_symlinks status/battery-missing.png           status/battery-missing-symbolic.png
