#!/bin/sh

# Streams a video with mplayer.
# Tested with: Vimeo, YouTube.
# Needs:
# * mplayer, http://www.mplayerhq.hu/
# * quvi, http://quvi.sourceforge.net/
function webvideo {
	quvi_opts="-v quiet"
	set -e
	format="default"  # for Vimeo, this simply defaults to "sd"
	formats=`quvi $quvi_opts -F "$1"|cut -d ':' -f 1`
	set +e

	# choose YouTube quality
	for f in fmt35_480p fmt44_480p fmt34_360p fmt18_360p fmt43_360p fmt05_240p; do
		if echo $formats|grep -qw $f; then
			format=$f
			break;
		fi;
	done;

	echo Choosing quality $format
	quvi $quvi_opts -f $format --exec 'mplayer %u' "$1"
}

