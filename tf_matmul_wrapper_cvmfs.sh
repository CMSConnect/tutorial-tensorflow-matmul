#!/bin/bash


printf "Hostname:"; hostname
echo "Operative system:"
if [ -f /etc/redhat-release ]; then
  cat /etc/redhat-release
else
  cat /etc/issue
fi


# Setup CMSSW release with tensorflow support
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh
release=CMSSW_10_6_13
export SCRAM_ARCH=slc7_amd64_gcc820
scramv1 project -f $release
cd $release
eval $(scramv1 runtime -sh)
cd -

# Check for tensorflow module
python -c 'import tensorflow' > /dev/null 2>&1
res=$?
if [ $res -ne 0 ]; then
  echo "Could not find tensorflow. Exit code: $res"
  exit $res
fi

python tf_matmul.py
exit $?
