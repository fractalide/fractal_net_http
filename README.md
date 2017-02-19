# Net HTTP

## Project Description:

HTTP in Flow-based programming.

## Stability Status:

- [x] Raw
- [ ] Draft
- [ ] Stable
- [ ] Deprecated
- [ ] Legacy

## Build Instructions
Ensure you've installed [nix](https://nixos.org/nix).
```
$ export NIX_PATH+=:fractalide=https://github.com/fractalide/fractalide/archive/v20170218.tar.gz
$ git clone git://github.com/fractalide/fractal_net_http.git
$ cd fractal_net_http
$ nix-build --argstr rs test
```
