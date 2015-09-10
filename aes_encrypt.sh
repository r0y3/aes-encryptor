#!/bin/sh

# Sample Usage
# ./aes_encrypt.sh test.tar.gz test

TAR_FILENAME=$1
TARGET=$2
SECRET_KEY=secret.key
AES_FILENAME="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)".aes
rm $TAR_FILENAME
printf "Doing compression.\n"
tar -cvf $TAR_FILENAME $TARGET
printf "Doing encryption.\n"
aescrypt -e -k $SECRET_KEY -o $AES_FILENAME $TAR_FILENAME
printf "Done.\n"
printf $AES_FILENAME" successfully created.\n"
printf "Removing $TAR_FILENAME.\n"
rm -v $TAR_FILENAME
printf "Done.\n"
