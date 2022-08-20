#!/bin/bash

export GIT_REPO_BASE="$(pwd)"
export PATH=/cygdrive/c/Program\ Files/LLVM/bin:$PATH

cp clang-format-test/clang-format-test-before.cpp clang-format-test/clang-format-test-after.cpp
clang-format -i clang-format-test/clang-format-test-after.cpp
