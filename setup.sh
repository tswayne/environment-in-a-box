#!/bin/bash       
   
ln -s $PWD/.bashrc ~/.${1:-bashrc}
touch ~/.bash_local  
