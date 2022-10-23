# Hacking

## Design

- No need for network check, as apt does not report a failure in this
  case. We run apt-get upgrade afterwards which does nothing,
  too. (Although, could optimize, but should probably find a way for
  faster (and more reliable) polling anyway.)

