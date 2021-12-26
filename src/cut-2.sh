#!/bin/bash

# https://www.geeksforgeeks.org/cut-command-linux-examples/

set -euxo pipefail

cut -b 2,7

# Sample Input:
# Hello
# World
# how are you

# Sample Output
# e
# o
# oe
