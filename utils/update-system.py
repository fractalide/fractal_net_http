#! /usr/bin/env nix-shell
#! nix-shell -i python -p python rustUnstable.cargo git
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz
#! nix-shell -I fractalide=/home/stewart/dev/fractalide/fractalide

import os
import subprocess
import shlex
import sys
import re
import time
import getopt
from itertools import chain

repo = " -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz -I fractalide=/home/stewart/dev/fractalide/fractalide"

def query_yes_no(question, default="no"):
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")

result = query_yes_no(
"This script will update the dependencies of all your rust nodes.\n\
Proceed?")

if result == False:
  exit()

def generate_component_name( path ):
  name_list = path[14:].split("/")
  return '_'.join(map(str, name_list))

# update all the nodes via cargo
print "\n[*] Updating every Cargo.toml via cargo"
for root, dirs, files in os.walk("../nodes"):
  cmd = "cargo generate-lockfile --manifest-path " + root + "/Cargo.toml"
  args = shlex.split(cmd)
  if "Cargo.toml" in files:
    print "[ ] - " + root+"/Cargo.toml"
    output, error = subprocess.Popen(args, stdout = subprocess.PIPE, stderr= subprocess.PIPE).communicate()

print "[*] Checking Rust nodes for new depsSha256"
for root, dirs, files in os.walk("../nodes"):
  if "Cargo.toml" in files:
    name = generate_component_name(root)
    cmd =  "nix-build -A nodes." + name  + repo
    print "[ ] - " + name + " path: " + root
    args = shlex.split(cmd)
    output, error = subprocess.Popen(args, stdout = subprocess.PIPE, stderr= subprocess.PIPE, cwd = "../").communicate()
    if error:
      print error
      if re.search('.*not found', error):
        print error + "\nerror: folder hierarchy != attribute name in nodes/default.nix. Please fix it, commit it, then run again."
        exit()
      if re.search('.*has wrong length for hash type.*', error):
        print error
        exit()
      if re.search('.*invalid base-32 hash.*', error):
        print error
        exit()
      m = re.search('.*hash.*(\w{52}).*when.*', error)
      if m:
        found = m.group(1)
        print "[!] -- " + name + " has a new depsSha256"
        find = r"^.*depsSha256 = .*$";
        replace = "  depsSha256 = \"%s\";" % found
        subprocess.call(["sed","-i","s/"+find+"/"+replace+"/g",root+"/default.nix"])
        #output, error = subprocess.Popen(args, stdout = subprocess.PIPE, stderr= subprocess.PIPE, cwd = "../").communicate()

print "[*] Done"
