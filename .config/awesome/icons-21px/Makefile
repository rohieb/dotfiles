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
clean:
	rm -rf $(addsuffix .png,$(ICONNAMES))
.PHONY: clean

%.png: %.svg
	inkscape --export-area-page --export-dpi=90 --export-png=$@ $<

layout/tilebottom.png: layout/tile.png
	convert $< -rotate 90 $@
layout/tileleft.png: layout/tile.png
	convert $< -rotate 180 $@
layout/tiletop.png: layout/tile.png
	convert $< -rotate 270 $@
layout/fairh.png: layout/fairv.png
	convert $< -rotate 90 $@
