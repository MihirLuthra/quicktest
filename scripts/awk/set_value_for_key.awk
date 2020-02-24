#! /usr/bin/env awk

#
# This script expects the caller to set
# the following variables:
#  key
#  value
# The script goes through a quicktest user config file
# and prints every line. When it finds the key, it skips
# printing it and its value.
# At the end it prints the updated key-val pair.
#

# skip blank lines

$0 == "" {
	next
}

function print_key_val_pair(key, val) {
	printf "%s   %s\n", key, val
}

#
# MAIN
#
{
	# This is when key is found and next line is
	# part of the key
	if (continued_statements == "1") {

		if ($1 == ">") {
			next
		} else {
			continued_statements="0"
		}

	}

	#
	# If key is found we set continued_statements=1
	# and we skip all subsequent lines starting with >.
	#
	if ($1 == key) {
		continued_statements="1"
		next
	}
	print
}

END {
	print_key_val_pair(key, value)
}
