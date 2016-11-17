#!/bin/sh

file="packages.txt"

apm list -ib > "$file"
