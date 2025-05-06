#!/bin/bash
# linux-setup.sh

set -e  # stop on error

sudo apt-get update
sudo apt-get install -y \
    libjpeg-dev
