#!/bin/sh
set -e

SYSTEMD_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_DIR"

cp mc* "$SYSTEMD_DIR/"

systemctl --user daemon-reload
systemctl --user enable --now mc-restart.timer

echo "Done. Next restart:"
systemctl --user list-timers mc-restart.timer --no-pager
