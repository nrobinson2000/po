# Contributing to po:

First off, thank you for considering contributing to po. It's people like you that make po such a great tool.

Whenever possible, please follow these guidelines for contributions:

- Keep each pull request small and focused on a single feature or bug fix.
- Familiarize yourself with the code base, and follow the formatting principles adhered to in the surrounding code.
- Wherever possible, test your contributions.
- If the changes have an impact on developers, then those changes should be described in the documentation.
- If you are adding a new feature please make an effort to add it to both the Linux and macOS versions of po-util.

# Introduction to the po code base:

```
┌── bin/
│   └── po # Entry point of po, modules are loaded and arguments are parsed
├── ci/
│   ├── ci-install       # Used to install po in travis-ci when testing project
│   ├── config-expect.sh # Automates the po configuration prior to installation
│   ├── linux            # Script to install po for travis-ci testing on Linux
│   └── mac              # Script to install po for travis-ci testing on macOS
├── completion/
│   └── po # Provides tab completion for the po command in bash
├── install # Universal installer: bash <(curl -sL get.po-util.com)
├── man/
│   └── po.1 # Manual page for po, what shows up when you do: man po
├── po.rb # macOS Homebrew formula for po
└── share/
    ├── po-common # Common module for po
    ├── po-linux  # Linux specific module for po
    └── po-mac    # macOS specific module for po
```

# Conventions:

- Please use [Shellcheck](https://www.shellcheck.net/) to test your contributions.
- All variables must be in `UPPER_CAMEL_CASE`
- Your contributions must be compatible with older versions of bash. On macOS Sierra for example, bash `3.2.57(1)-release` is installed by default and your contributions must operate correctly.
