#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

precommand=`cat <<- EOF
echo hello world
echo goodbye world
EOF`

expected_output=$(cat <<- EOF
hello world
goodbye world
EOF
)

@test "Runs precommand" {
  export BUILDKITE_PLUGIN_DOCKER_COMPOSE_PRECOMMAND=$precommand

  run $PWD/hooks/pre-command

  assert_output "$expected_output"
  assert_success
}