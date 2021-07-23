#!/bin/bash

nasm -g -f elf64 code/$1.asm -l lst/$1.lst
ld -g -o apps/$1 code/$1.o
rm code/$1.o

# compile object files with with gcc
# gcc -g -no-pie -o example example.o  -- on linux systems
# -no-pie is not required in windows
