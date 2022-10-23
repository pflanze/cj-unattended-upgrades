# Chj's unattended upgrade scripts

I just don't know unattended-upgrades yet and there are various things I expect this to do that might not be supported.

My own complexities are the best!

Wanted features:

- use a schedule that suits a laptop user (don't ask, just run)
- report on upgrade success or failure via email to root (remain silent if there were no upgrades)
- have debconf questions go to mail as well
- dpkg conf files: keep old version (and report the need for manual action?)
- do not report failure if (or due to being?) offline
- delay shutdown while upgrades are running
- finish upgrade at boot time if it was interrupted anyway? (Foreground, but interruptible?)

Future:

- Check for and report on the need to reboot
- Run apt-get clean?
- More efficient polling, or some kind of push notification?
- Report when support for the installed release is (soon to be) dropped?
- Report when there was no upgrade in some time (either no access to Debian servers, or none published there?)

## Installation

* Make sure dist-upgrade won't do anything bad, even when a new relase
  has come out (you probably want to configure `/etc/apt/sources.list`
  to refer to a named release).

* Create a file `/etc/cj-unattended-upgrades.sh` that sets the
  `notification_email` shell variable to the email address that should
  be receiving the information emails (Note that `root` does *not*
  work with Debian's default installation of exim! Other local user
  names do work.)

* Install [chj-scripts](https://github.com/pflanze/chj-scripts.git)
  (maybe via [chjize](https://github.com/pflanze/chjize)), as well
  `daemontools` (used for the logging) and `libtime-parsedate-perl`
  (not installed by chjize, currently).

* Start the daemon as root via `init-cj-unattended-upgrades` (e.g. via
  sysv/systemd or root's crontab). Make sure the chj-scripts can be
  found via its `PATH`. Optionally, set
  `CJ_UNATTENDED_UPGRADES_DRY_RUN=1`, and/or set
  `CJ_UNATTENDED_UPGRADES_SLEEPTIME` to a string that is understood by
  `sleep-random`.

## Mail check

Since cj-unattended-upgrades is meant for laptop/desktop installations
of end users, some setup to deal with the mails sent by it may be
needed. One possibility:

- use xfce, and xfce4-mailwatch-plugin
- install claws-mail
- add xfce4-mailwatch-plugin's "Mail Watcher" panel item to the panel, and configure it via right-click -> properties, add local mbox /var/mail/<username> under Mailboxes, interval 1 minute, set "Run on click" to `claws-mail --receive`, and "Run on each change of new message count" to `bash -c 'if test -s /var/mail/chris; then notify-send "new mail"; fi'`

