#!/bin/bash

apt-get update
apt-get install wget -y
apt-get install unzip

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1' -O output.zip

unzip output.zip
rm -r output.zip