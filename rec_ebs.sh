#!/bin/bash
# execute rec_ebs_radio with logging

BASEDIR=$(dirname $0)
${BASEDIR}/rec_ebs_radio.sh $* > ${BASEDIR}/log/`date +%Y-%m-%d-%H%M`.log 2>&1
