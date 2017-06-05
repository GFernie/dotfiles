# `rm` moves things to trash, rather than deleting;
# they will persist until the next reboot.
mkdir -p /tmp/trash
bin () { mv $* /tmp/trash/ }
