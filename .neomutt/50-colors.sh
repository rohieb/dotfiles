#!/bin/sh
# generator for Solarized-compatible color scheme
readonly  S_base0='color12'
readonly  S_base1='color14'
readonly  S_base2='color7'
readonly  S_base3='color15'
readonly S_base00='color11'
readonly S_base01='color10'
readonly S_base02='color0'
readonly S_base03='color8'

. ~/.neomutt/colors.solarized.sh

cat <<EOF
uncolor index *
uncolor body *
uncolor header *

#			fgcolor		bgcolor
# general
color normal		default		default
color indicator		$S_bg		$S_hl
color status		$S_hl		$S_bg
color tree		default		$S_bg
color prompt		$S_hl		default
color message		$S_hl		default

# sidebar
color sidebar_divider	$S_dim		default
color sidebar_divider	default		default
color sidebar_ordinary	default		default
color sidebar_new	bright$S_hl	default
color sidebar_flagged	default		default

# index
color index		default		default		"~A"	# all mail by default
color index		$S_dim		default		"~P"	# from me
color index		blue		default		"~F"	# flagged messages
color index		yellow		default		"~T"	# tagged messages
color index		bright$S_hl	default		"~N|~O"	# new/unread messages
color index		$S_bg		red		"~D"	# deleted messages

# pager
color attachment	$S_dim		default
color markers		$S_bg		default		# invisible pls

# mail headers
color hdrdefault	default		default
color header		bright$S_hl	default		"^Subject:"
color header		bright$S_hl	default		"^From:"

# mail body
color quoted		blue		default
color quoted1		cyan		default
color quoted2		yellow		default
color quoted3		red		default
color quoted4		magenta		default
color signature		$S_dim		default		# mail signatures
color tilde		default		default

# mail: gpg
color attach_headers	bright$S_hl	default		"^\\\\[-- The following data is signed --\\\\].*$"
color attach_headers	bright$S_hl	default		"^\\\\[-- End of signed data --\\\\\.*$"
color body		green		default		"^(gpg: )?Good signature from.*$"
color body		red		default		"^(gpg: )?B[Aa][Dd] signature from.*$"
color body		red		default		"^(gpg: )?Note: This key has expired!.*$"
color body		color9		default		"^(gpg: )?Problem signature from.*"
color body		color9		default		"^(gpg: )?Can't verify due to a missing key.*"
color body		color9		default		"^(gpg: )?WARNING: This key is not certified with .*!"
color body		color9		default		"^(gpg: )? .* that the signature belongs to the owner."
color body		color9		default		"^(gpg: )?WARNING: We have NO indication whether the key belongs.*"
color body		color9		default		"^(gpg: )?Can't check signature:.*"
color body		color9		default		"^(gpg: )?can't handle these multiple signatures"
color body		color9		default		"^(gpg: )?signature verification suppressed"
color body		color9		default		"^(gpg: )?invalid node with packet of type"
EOF
