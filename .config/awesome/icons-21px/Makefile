#!/usr/bin/make -f

ICONNAMES = \
	awesome \
	square_sel \
	square_unsel \
	submenu \
	\
	layout/fairh \
	layout/fairv \
	layout/floating \
	layout/fullscreen \
	layout/magnifier \
	layout/max \
	layout/tile \
	layout/tilebottom \
	layout/tileleft \
	layout/tiletop \
	\
	widget/pause \
	widget/play \
	widget/stop \
	widget/consume \
	widget/random \
	widget/repeat \
	widget/single \
	widget/repeat_single \
	\
	widget/cpu \
	widget/load \
	widget/mem \
	widget/net \
	widget/net_wired \
	widget/task \


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


