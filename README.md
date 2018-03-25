# po
## The Future of [po-util](https://github.com/nrobinson2000/po-util): Refactored, Modular, and Cross-Compatible
**Po is in beta, but fully functional.**

## Why?

When I first created po-util, it was a single script, `po-util.sh`, that could be "installed" on Mac and Linux.
It soon became very cumbersome, and I chose to split po-util into two repositories, [po-util](https://github.com/nrobinson2000/po-util) and [homebrew-po](https://github.com/nrobinson2000/homebrew-po).
Maintaining the two repositories was tedious, as I had to do double the work every time I wanted to release a feature or make a fix.

My solution was to reunite the Mac and Linux versions back into a single repository, breaking the script into several modular files.

```
├── po
├── po-common
├── po-linux
├── po-mac
```

* `po` is the main file, and the script that gets executed when a user runs `po` at the command line.
* `po-common` is sourced by `po`, and contains all of the OS independent functions.
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
