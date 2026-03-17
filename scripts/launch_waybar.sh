#!/bin/bash

cp -r ../waybar ~/.config/

killall -9 waybar

waybar & 