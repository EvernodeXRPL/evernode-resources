#!/bin/bash

repo_owner="EvernodeXRPL"
repo_name="evernode-resources"
file="index.js"

export SASHIMONO_BIN=/usr/bin/sashimono
export MB_XRPL_SERVICE="sashimono-mb-xrpl"
export MB_XRPL_USER="sashimbxrpl"
export MB_XRPL_BIN=$SASHIMONO_BIN/mb-xrpl

curl "https://raw.githubusercontent.com/$repo_owner/$repo_name/main/sashimono/pathches/resources/mb-xrpl/$file" > "$MB_XRPL_BIN/$file" && echo "$file update failed"

local mb_user_id=$(id -u "$MB_XRPL_USER")
local mb_user_runtime_dir="/run/user/$mb_user_id"

sudo -u "$MB_XRPL_USER" XDG_RUNTIME_DIR="$mb_user_runtime_dir" systemctl --user restart $MB_XRPL_SERVICE
