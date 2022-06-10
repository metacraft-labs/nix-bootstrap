# nix-bootstrap

A zero-to-hero script for bringing Nix development environments to life

## Supported platforms

So far the script has been verified to work on the following platforms:

* macOS (12.x)

## Usage

Simply open a terminal and run:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/metacraft-labs/nix-bootstrap/master/nix-bootstrap)
```

### Options (configured via environment variables)

* `FORCE_UNINSTALL` - if set to `true`, the script uninstall Nix, even if it was
  already installed
* `DRY_RUN` - if set to `true`, the script will only print what commands would
  be executed without actually executing them
* `AUTO_CONFIRM` - if set to `true`, the script will will assume that the user
  answers 'yes' to every question
* `USE_NIX_HM` - see [How it works](#how-it-works), step 3

### Example

```sh
env USE_NIX_HM=true FORCE_UNINSTALL=true DRY_RUN=true bash <(curl -fsSL https://raw.githubusercontent.com/metacraft-labs/nix-bootstrap/master/nix-bootstrap)
```

## How it works

This line will perform the following:

* Download the latest version of the `nix-bootstrap` script
* Run the script after the download is complete

The script itself does the following:

1. Ensures that Nix is is installed
   1. Checks if there's an existing Nix installation
      * If yes and it is functional proceeds to step 2.
      * If yes, but it is not functional it removes any remaining artifacts from it
   2. Downloads the official Nix install script and runs it
2. Ensures that the experimental options `command` `flakes` are enabled
3. Checks value of the `USE_NIX_HM` environment variable
   * If it is set to `true`:
     1. Generates a [`flake.nix`][nix-flakes]-based [Home Manager][home-manager] configuration
     2. Applies the configuration
   * Otherwise:
     1. Imperatively installs [`direnv`][direnv]
     2. Modifies `$HOME/.{base,zsh}rc` to integrate direnv

[nix-flakes]: https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html
[home-manager]: https://github.com/nix-community/home-manager
[direnv]: https://direnv.net/
