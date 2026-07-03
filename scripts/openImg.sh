#!/usr/bin/env bash

IMG=$(wl-paste)

swayimg "exec://wget -qO- $IMG"

