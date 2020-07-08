#!/bin/bash

printf "Hostname:"; hostname
echo "Operative system:"
if [ -f /etc/redhat-release ]; then
  cat /etc/redhat-release
else
  cat /etc/issue
fi

# Print nvidia-smi output, if present
nvidia-smi 2>/dev/null
echo

# Check for tensorflow module
python3 -c 'import tensorflow' > /dev/null 2>&1
res=$?
if [ $res -ne 0 ]; then
  echo "Could not find tensorflow. Exit code: $res"
  exit $res
fi

python3 tf_matmul.py
exit $?
