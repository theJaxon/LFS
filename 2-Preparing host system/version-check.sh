#!/bin/bash
# Simple script to list version numbers of critical development tools

bash --version | head -n1 | cut -d " " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH
echo -n "Binutils: "; ld --version | head -n1 | cut -d " " -f3-
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
# [ -h FILE ]	True if FILE exists and is a symbolic link
if [ -h /usr/bin/yacc ]; then
    echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
# True if FILE exists and is executable.
elif [ -x /usr/bin/yacc ]; then
    echo yacc is `/usr/bin/yacc --version | head -n1`
else
    echo "yacc not found"
fi
# https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean
bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2

if [ -h /usr/bin/awk ]; then
    echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
    echo awk is `/usr/bin/awk --version | head -n1`
else
    echo "awk not found"
fi

ldd --version | head -n1 | cut -d" " -f2- # glibc version
cat /proc/version
echo Perl `perl -V:version`

utilites=(bison diff find gawk gcc g++ grep gzip m4 make makeinfo patch sed tar   xz) 
for i in "${utilites[@]}"
do 
    echo `$i --version | head -n1` 
done 

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ] then 
    echo "g++ compilation OK";
else 
    echo "g++ compilation failed"; 
fi
rm -f dummy.c dummy