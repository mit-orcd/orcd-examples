#!/bin/bash

set -eu

echo "steps:"

# A step for each file in .test/

find .test/* -type f | while read -r FILE; do
  if [[ "$FILE" == *.sh ]]; then
    echo "  - command: \"$FILE\""
    echo "    label: \"$(basename "$FILE")\""
  elif [[ "$FILE" == *.py ]]; then
    echo "  - command: \"python $FILE\""
    echo "    label: \"$(basename "$FILE")\""
  fi
done

# A deploy step only if it's the master branch

if [[ "$BUILDKITE_BRANCH" == "main" ]]; then
  echo "  - wait"
  echo "  - command: \"echo Deploy!\""  
  echo "    label: \":rocket:\""
fi
