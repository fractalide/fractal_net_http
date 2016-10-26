## Fractalide Workbench

![Image Alt](https://www.woodgears.ca/workshop/jacques/004.jpg)

This repository serves as your workbench, this is where you craft new things and try out interesting ideas. A new workspace for a new idea!
Whereas the [canonical](https://github.com/fractalide/fractalide) fractalide repo is your tool rack. The tool rack is where useful, successful ideas forged on your workbench go to live a new life, to be further used and refined by the community! Please consider [plugging](https://github.com/fractalide/fractalide/blob/master/components/example/wrangle/default.nix#L8-L15) your works into fractalide so that we all can benefit from it!

Typically we refer to this repository as a `frac`. It's like a library or module in a programming language, but it's much more nuanced than that! There's a hierarchical naming convention, we as a community should abide by! Please note the repository name starts with `frac`, i.e.: `frac_a_decent_hierarchical_project_name` such as `frac_net_http` or `frac_science_biology_dna_crispr`. This is purely to keep all `fractalide` projects in close proximity to each other on the file system. Within this repo all components and contracts in the `components/` and `contracts/` folders *do not* have the preceding `frac_*`, use names like this: `science_biology_dna_crispr` i.e. `science_biology_dna_crispr_reader` etc.
```
workbench_nand = callPackage ./workbench/nand {};
workbench_test = callPackage ./workbench/test {};
```
You're encouraged to make this repo your own and put it under new version control. It contains 1 rust component, 1 subnet and 1 contract and some `utils` stuff to automate the creation of new components. We're still developing a spiffy terminal based graph editor that'll really make it a lot simpler to design things. Till then python scripts will have to suffice!

We encourage you to use [Mozilla Public License v2](LICENSE) for your project. This makes it very easy for the community to mix and match components, this is key to our success as a community.
We also encourage you to use the [C4](CONTRIBUTING.md) to govern your project, having the same governance across projects means patches will fly fast and efficiently. It would be really nice if everyone was tuned to the same note before we start this symphony!

Feel free to take this code and do what you will with it, even if it means close source it.

If you want to make use of Incremental Builds (you really do) then you'll need to plug this project into a clone of Fractalide and build from within the Fractalide folder. See Fractalide's [README.md](https://github.com/fractalide/fractalide) for more details

---

* Project Description:
... <describe your project>
* Project Problem:
... <clear problem description, the cause for this project>
* Solution:
... <describe solution your project has taken>
* Stability:
Choose one:
[Experimental, Stable, Legacy, Deprecate]

### Build Instructions
Make sure you have installed [nix](https://nixos.org/nix) installed, most likely your package manage has `nix` available, if not you'll need to compile from source.
```
$ NIX_PATH="nixpkgs=https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz:fractalide=https://github.com/fractalide/fractalide/archive/master.tar.gz"
$ git clone git@github.com:fractalide/frac_workbench.git
$ cd frac_workbench
$ nix-build
```
