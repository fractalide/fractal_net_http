## Fractalide Template Workspace

This repository serves as a template workspace, the [canonical](https://github.com/fractalide/fractalide) fractalide repo is your tool rack. You're encouraged to make this repo your own and put it under new version control. If you make something useful and beautifully written tools please do plug it into [fractalide](https://github.com/fractalide/fractalide/blob/master/components/example/wrangle/default.nix#L8-L15).

We've lumped the Mozilla Public License v2 in the hopes you'll adopt the license as your own. This makes it very easy for the community to mix and match components and is key to our success as a community.
We also encourage you to use the [C4](CONTRIBUTING.md) to govern your project, having the same governance means patches will flow fast and efficiently. Feel free to take this code and do what you will with it.

### Project Description:
...
#### Project Problem:
...
#### Solution:
...
### Stability:
Choose one:
[Experimental, Stable, Legacy, Deprecate ]

### Build Instructions

Make sure you have installed [nix](https://nixos.org/nix) installed, most likely your package manage has `nix` available, if not you'll need to compile from source.
```
$ NIX_PATH="nixpkgs=https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz:fractalide=https://github.com/fractalide/fractalide/archive/master.tar.gz"
$ git clone git@github.com:fractalide/frac_example_workspace.git
$ cd frac_example_workspace
$ nix-build
```
