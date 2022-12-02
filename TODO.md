- Store sleep time in a file (make a `sleep-until -f file` program, change `sleep-better` to store and then run that, which will also save on RAM)

- When disk runs full, the daemon stops. Change and use `loop` program to retry only when there's disk space again?

- Show message to user when a reboot is needed (as per `lsof-deleted`). Make a GUI program that shows the programs nicely and allows to kill them or reboot. Only use that when a user desktop is running (by the configured user?), otherwise send by email, or reboot right away?

- Store results in a non-tmp queue and pick messaging up on restart.

