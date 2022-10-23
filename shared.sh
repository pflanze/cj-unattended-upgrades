
# A file that survives a reboot, and whose presence indicates at that
# point whether a running installation was interrupted
spoolfile=/var/spool/cj-unattended-upgrades.running

# The email address that should receive notifications. Sadly, `root`
# does not work (by default, on Debian).
#notification_email=

source /etc/cj-unattended-upgrades.sh

if [ "${notification_email-}" = "" ]; then
    echo "$0: missing setting for notification_email"
    exit 1
fi
