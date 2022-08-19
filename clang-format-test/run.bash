#!/bin/bash

cp clang-format-test-before.cpp clang-format-test-after.cpp
clang-format -i clang-format-test-after.cpp
