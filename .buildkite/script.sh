#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"

# add a new command step to run the tests in each test directory
for test_file in .test/*.sh; do
  echo "  - command: \"bash "${test_file}"\""
done
