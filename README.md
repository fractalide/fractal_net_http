## External Fractalide Repository Example

This repository demonstrates how to create a specialized repository independent of the Fractalide canonical repo.
You're encouraged to copy this repo and put it under new revision control.

Components may be closed source if needed.

### Contracts

Contracts in this repository are not communicated to the canonical `gitlab.com/fractalide/fractalide` therefore you are encouraged to commit repo boundary crossing contracts to the conanical repo contracts folder.

### Components

Ensure you keep your organization's name in the `components/` directory.
For example `components/<vendor>/...` this is needed to ensure we don't get name collisions upstream.

### Build Instructions

Make sure you have installed `nix`, most likely your package manage has `nix` available, if not you'll need to compile from source.

```
$ git clone git@github.com:fractalide/fractalide_external_repo_example.git
$ cd fractalide_external_repo_example
$ nix-build
downloading ‘https://github.com/fractalide/fractalide/archive/7db197c99f145ee0e7506f8c5f7d71d128dbd67a.tar.gz’... [0/0 KiB, 0.0 KiB/s]
downloading ‘https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz’... [0/0 KiB, 0.0 KiB/s]
/nix/store/sa0nlg8s517j454sdsnfcgl7zsclp82z-vendor_test_nand
```
Note the output is here:

```
$ cat /nix/store/sa0nlg8s517j454sdsnfcgl7zsclp82z-vendor_test_nand/lib/lib.subnet
'/nix/store/i28215d7apcc4xl9ziypdbia9vdbqr1v-vendor_maths_boolean:(boolean=true)' -> a nand(/nix/store/dylrwf445nnnzhl1qq6rhg7j2zhwk1k7-vendor_maths_boolean_nand) output -> input io_print(/nix/store/0hi35sf6acy2n41m3767b03rxx5wjc6n-maths_boolean_print)
'/nix/store/bll8z9s8z2y3g0n6j6wcdk7r5rz8m9yj-maths_boolean:(boolean=true)' -> b nand()
```
This will build your top level subnet you expose on the last line of top level `default.nix`
One cannot execute this directly, you'll need to feed this top level subnet into the `fractalide/components` directory.
