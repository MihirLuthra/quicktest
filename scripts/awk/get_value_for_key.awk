#! /usr/bin/env awk

#
# This script needs the following variables
# set from the caller:
#  key -> the key whose value is needed
#

#
# This script goes through quicktest config file
# and prints value for the desired key.
#

# skip blank lines
$0 == "" {
	next
}

function trim_leading_and_trailing_blanks(arg) {

	# trim leading spaces
	sub(/^[[:blank:]]+/, "", arg)

	# trim trailing spaces
	sub(/[[:blank:]]+$/, "", arg)

	return arg
}

#
# MAIN
#
{
	# This is when key is found and next line is
	# part of the key
	if (key_found == "1") {

		if ($1 == ">") {
			$1=""
			$0=trim_leading_and_trailing_blanks($0)
			print
		} else {
			exit 0
		}
	}

	# strip off comments
	gsub(/\/\/.*$/, "", $0)

	if ($1 == key) {
		$1=""
		$0=trim_leading_and_trailing_blanks($0)
		print
		key_found="1"
	}
}
