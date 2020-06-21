# This tool has been deprecated. Please upgrade to [neopo.](https://github.com/nrobinson2000/neopo)

<img src="po-logo.png">

[![Build Status](https://travis-ci.org/nrobinson2000/po.svg?branch=master)](https://travis-ci.org/nrobinson2000/po)
[![Join the chat at https://gitter.im/po-util/Lobby](https://badges.gitter.im/po-util/Lobby.svg)](https://gitter.im/po-util/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![](https://img.shields.io/badge/donate-PayPal-009cde.svg)](https://www.paypal.me/nrobinson2000)
[![](https://img.shields.io/badge/donate-bitcoin-orange.svg)](https://donate.nrobinson.me)
[![](https://img.shields.io/github/issues/nrobinson2000/po.svg)](https://github.com/nrobinson2000/po/issues)
[![](https://img.shields.io/github/stars/nrobinson2000/po.svg)](https://github.com/nrobinson2000/po/stargazers)

# po - The Future of [po-util](https://github.com/nrobinson2000/po-util): Refactored, Modular, and Cross-Compatible

## Why?

When I first created po-util, it was a single script, `po-util.sh`, that could be "installed" on Mac and Linux.
It soon became very cumbersome, and I chose to split po-util into two repositories, [po-util](https://github.com/nrobinson2000/po-util) and [homebrew-po](https://github.com/nrobinson2000/homebrew-po).
Maintaining the two repositories was tedious, as I had to do double the work every time I wanted to release a feature or make a fix.

My solution was to reunite the Mac and Linux versions back into a single repository, breaking the script into several modular files.

```
┌── bin/po
├── share/po-common
├── share/po-linux
└── share/po-mac
```

* `po` is the main file, and the script that gets executed when a user runs `po` at the command line.
* `po-common` is sourced by `po`, and contains all OS independent functions.
* `po-linux` and `po-mac` contain the OS dependent settings and functions.

Regardless of OS:

* `po` is installed at `/usr/local/bin/po`
* `po-common` is installed at `/usr/local/share/po-common`

On Linux:

* `po-linux` is installed at `/usr/local/share/po-linux`

On Mac:

* `po-mac` is installed at `/usr/local/share/po-mac`

## Install:

Universal Installer:

```
$ bash <(curl -sL https://raw.githubusercontent.com/nrobinson2000/po/master/install)
```

## Caveats:
None at the moment. Just make sure to use the Universal Installer.

## FAQ:

**Is this really the future of po-util?**

Yes. All future development will be on po. The legacy po-util repositories will
remain supported, but future work will be focused on po.
