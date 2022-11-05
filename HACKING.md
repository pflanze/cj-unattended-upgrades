# Hacking

## Design

### Network errors

There is no need for network check, as apt does not report a failure in this
case. We run apt-get upgrade afterwards which does nothing,
too. (Although, could optimize, but should probably find a way for
faster (and more reliable) polling anyway.)

### Finish/fix interrupted installation on boot

- The script `cj-unattended-upgrades-run` creates a spoolfile with the
  current date while running the upgrade.

- `cj-unattended-upgrades-daemon` checks for that file before going
  into the main loop, and runs the fixing if necessary (different
  commands than those in `cj-unattended-upgrades-run`, thus not a
  duplication; the email creation code is somewhat duplicated within
  `cj-unattended-upgrades-daemon`, though).

