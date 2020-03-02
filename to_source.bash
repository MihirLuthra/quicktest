#! /usr/bin/env bash

if [ -n "${__source_guard__tosourcebash__}" ] ; then
	return 0
else
	readonly __source_guard__to_source_bash__="1"
fi


if [ -z "${QUICKTEST_PATH}" ] ; then
	export QUICKTEST_PATH="$( cd "$( dirname "${BASH_SOURCE}" )" ; pwd )"
	export PATH="${QUICKTEST_PATH}/commands:${PATH}"
fi

if [ -z "${QUICKTEST_BASH}" ] ; then
	export QUICKTEST_BASH="bash"
fi
