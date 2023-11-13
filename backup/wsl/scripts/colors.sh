#!/bin/bash
for i in {0..7}; do
  printf "\e[38;5;${i}mForeground Color ${i}\e[0m\n"
done

for i in {8..15}; do
  printf "\e[38;5;${i}mBright Foreground Color ${i}\e[0m\n"
done