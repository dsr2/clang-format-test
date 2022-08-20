#!/bin/bash

export PATH=/cygdrive/c/Program\ Files/LLVM/bin:$PATH

cp clang-format-test-before.cpp clang-format-test-after.cpp
clang-format -i clang-format-test-after.cpp
