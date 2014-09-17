#!/bin/bash
rm packer_$1_virtualbox.box || true
packer build $1.json
vagrant box remove $1 || true
vagrant box add $1 packer_$1_virtualbox.box

