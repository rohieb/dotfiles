#!/usr/bin/make -f

ICONNAMES = \
	awesome \
	square_sel \
	square_unsel \
	submenu \
	\
	fairh \
	fairv \
	floating \
	fullscreen \
	magnifier \
	max \
	tile \
	tilebottom \
	tileleft \
	tiletop \
	\
	pause \
	play \
	stop \
	consume \
	random \
	repeat \
	single \
	repeat_single \
	\
	cpu \
	load \
	mem \
	net \
	net_wired \
	task \


all: $(addsuffix .png,$(ICONNAMES))

tilebottom.png: tile.png
	convert $< -rotate 90 $@
tileleft.png: tile.png
	convert $< -rotate 180 $@
tiletop.png: tile.png
	convert $< -rotate 270 $@

fairh.png: fairv.png
	convert $< -rotate 90 $@

%.png: %.svg
	inkscape --export-area-page --export-dpi=90 --export-png=$@ $<


