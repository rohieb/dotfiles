# Add an SSH key to the agent if it does not exist yet
# Parameters: 
#  1. key file
insert_ssh_key() {
	if [ ! -r "$1" ]; then echo "Invalid keyfile: '$1'!"; return 1; fi
	keyfile="$1"
	fp=$(ssh-keygen -E sha1 -lf "$keyfile" | cut -d' ' -f2)
	case "$fp" in
		SHA1:*)	;;
		*)	
			echo "Key '$keyfile' has unexpected fingerprint: '$fp'"
			return 2
			;;
	esac
	if ! ssh-add -l -E sha1 | grep -q -F "$fp"; then
		ssh-add "$keyfile"
	fi
}
