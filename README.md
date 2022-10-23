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

* Make sure mail for `root` is going to some useful place.

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

