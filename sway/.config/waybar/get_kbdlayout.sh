#!/bin/bash
language=$(swaymsg -r -t get_inputs | \
    jq -c -r '.[] | select (.type == "keyboard").xkb_active_layout_name' | \
    head -1)
echo $language
