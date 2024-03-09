cdbuild() {
	if [ -z "$1" ]; then
		echo Usage: "$0 <packagedir>"
		return 1
	fi

	plat="$(__ptxdist_platform)"
	plat=""
	plat="${plat:-*}"
	case "$1" in
		host-*)		builddir="platform-${plat}/build-host/${1##host-}" ;;
		cross-*)	builddir="platform-${plat}/build-cross/${1##cross-}" ;;
		*)		builddir="platform-${plat}/build-target/$1" ;;
	esac

	# only use first match
	cddir=
	for cddir in ${builddir}*; do break; done

	if [ -d "$cddir" ]; then
		cd "$cddir"
	else
		echo "$cddir" is nonexistent.
	fi
}

_cdbuild_complete() {
	local cur words platformdir
	platformdir=platform-$(__ptxdist_platform)
	cur="${COMP_WORDS[COMP_CWORD]}"
	words=

	if [ -n "$(shopt -s nullglob; echo ${platformdir}/build-target/*)" ]; then
		words="$(basename -a ${platformdir}/build-target/*)"
	fi
	if [ -n "$(shopt -s nullglob; echo ${platformdir}/build-host/*)" ]; then
		words="${words} $(basename -a ${platformdir}/build-host/* | awk '{print "host-" $1}')"
	fi
	if [ -n "$(shopt -s nullglob; echo ${platformdir}/build-cross/*)" ]; then
		words="${words} $(basename -a ${platformdir}/build-cross/* | awk '{print "cross-" $1}')"
	fi

	COMPREPLY=( $(compgen -W "${words}" -- "$cur" ) )
}
complete -F _cdbuild_complete cdbuild
