#!/bin/bash


if pgrep -x "thunar" > /dev/null; then

    pkill -x thunar
    thunar ~ & disown
fi

#if pgrep -x "brave" > /dev/null; then

  #  pkill -x brave
 #   brave --restore-last-session & disown
#fi
