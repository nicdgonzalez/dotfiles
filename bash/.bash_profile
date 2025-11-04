#!/bin/bash

# Executed by login shells.
#
# Test with:
#
#   bash --login
#

if [ -r "$HOME"/.bashrc ]; then
	source "$HOME"/.bashrc
fi
