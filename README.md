# Chj's unattended upgrade scripts

I just don't know unattended-upgrades yet and there are various things I expect this to do that might not be supported.

My own complexities are the best!

Wanted features:

- use a schedule that suits a laptop user (don't ask, just run)
- mail with success or failures (remain silent if there were no upgrades)
- have debconf questions go to mail as well
- dpkg conf files: keep old version (and report the need for manual action?)
- report failures via local email
- do not report failure if (due to being?) offline
- delay shutdown while upgrades are running
- finish upgrade at boot time if it was interrupted anyway? (Foreground, but interruptible?)

Future:

- Check for and report on the need to reboot
- Run apt-get clean?
- More efficient polling, or some kind of push notification?
