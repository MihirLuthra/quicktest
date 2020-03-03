#! /bin/sh

if [ -n "${__source_guard__tosourcebash__}" ] ; then
	return 0
else
	readonly __source_guard__to_source_bash__="1"
fi


if [ -n "${BASH_VERSION}" ] ; then
	SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE}" )" ; pwd )"
elif [ -n "${ZSH_VERSION}" ] ; then
	SCRIPT_PATH=$( dirname "$0:A" )
fi


if [ -z "${QUICKTEST_PATH}" ] ; then
	export QUICKTEST_PATH="${SCRIPT_PATH}"
	export PATH="${QUICKTEST_PATH}/commands:${PATH}"
fi

if [ -z "${QUICKTEST_BASH}" ] ; then
	export QUICKTEST_BASH="bash"
fi

check_version() {
	local base_desired_version="4"
	local bash_ver_used="$( "${QUICKTEST_BASH}" -c 'echo "${BASH_VERSINFO}"' )"
	local bash_version="$( "${QUICKTEST_BASH}" -c 'echo "${BASH_VERSION}"' )"

	if [ "${bash_ver_used:-0}" -lt "${base_desired_version}" ] ; then
		printf "%s\n" \
			"bash version ${base_desired_version}+ required" \
			"Your bash version is ${bash_version}" \
			"Set QUICKTEST_BASH to bash's path (ver ${base_desired_version}+)" \
			"before this script gets sourced."
		return 1
	fi
}

check_version || return 1
