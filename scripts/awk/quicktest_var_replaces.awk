#! /usr/bin/env awk

#
# This awk script needs BASH_QUICKTEST_VARS variable to be set
# by the caller containing space separated variables.
#
# This script will print an updated input with all quicktest
# variables replaced.
# The variables are replaced by calling `get_quicktest_var_value`
#

BEGIN {
	split(BASH_QUICKTEST_VARS, QUICKTEST_VARS, " ")
}

function get_quicktest_var_replacement(quicktest_var) {

	#
	# well just calling get_quicktest_var_value to get value for key
	# and then printing exit status on last line which is then captured
	# and if it is non-zero, awk script terminates
	#
	cmd = "get_quicktest_var_value "quicktest_var" ; printf \"\n$?\""

	res = ""
	last_res = ""
	value = ""

	while ( ( cmd | getline res ) > 0 ) {

		if (value == "") {
			value = last_res
		} else {
			value=value"\n"last_res
		}

		last_res = res
	}

	# res contains the exit status
	if (res != 0) {
		exit 1
	}

	return value
}

#
# MAIN
#
{
	for (idx in QUICKTEST_VARS) {
		var = QUICKTEST_VARS[idx]
		if ( match($0, var) ) {
			replacement = get_quicktest_var_replacement(var)
			gsub(var, replacement, $0)
		}
	}
	print
}
