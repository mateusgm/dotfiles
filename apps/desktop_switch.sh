#!/bin/bash 

new_folder=$1

rm ~/desktop
ln -fs $new_folder ~/desktop 
gsettings set org.nemo.preferences desktop-is-home-dir false