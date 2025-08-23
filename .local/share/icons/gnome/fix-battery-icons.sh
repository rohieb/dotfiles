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
				rm -v "${dst}"
			fi
			mkdir -vp $(dirname "${dst}")
			ln -sv "${src}" "${dst}"
		fi
	done
}


for state in "" "-charging"; do
	make_icon_symlinks status/battery-full"${state}".png              status/battery-level-100"${state}"-symbolic.png
	make_icon_symlinks status/battery-full"${state}".png              status/battery-level-90"${state}"-symbolic.png
	make_icon_symlinks status/battery-good"${state}".png              status/battery-level-80"${state}"-symbolic.png
	make_icon_symlinks status/battery-good"${state}".png              status/battery-level-70"${state}"-symbolic.png
	make_icon_symlinks status/battery-good"${state}".png              status/battery-level-60"${state}"-symbolic.png
	make_icon_symlinks status/battery-low"${state}".png               status/battery-level-50"${state}"-symbolic.png
	make_icon_symlinks status/battery-low"${state}".png               status/battery-level-40"${state}"-symbolic.png
	make_icon_symlinks status/battery-low"${state}".png               status/battery-level-30"${state}"-symbolic.png
	make_icon_symlinks status/battery-caution"${state}".png           status/battery-level-20"${state}"-symbolic.png
	make_icon_symlinks status/battery-caution"${state}".png           status/battery-level-10"${state}"-symbolic.png
	make_icon_symlinks status/battery-caution"${state}".png           status/battery-level-0"${state}"-symbolic.png
done

# special values
make_icon_symlinks status/battery-full-charged.png      status/battery-level-100-charged-symbolic.png
make_icon_symlinks status/battery-missing.png           status/battery-missing-symbolic.png
