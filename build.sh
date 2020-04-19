#!/bin/bash

echo -e "file_name : \c"
read file_name
echo $file_name".asm"
nasm -f elf64 $file_name".asm" -o $file_name".o" -w-other
gcc -no-pie $file_name".o" -o $file_name
rm $file_name".o"
