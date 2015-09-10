#!/bin/sh
TAR_FILENAME='tmp.tar.gz'
FOLDER_NAME=$2
SECRET_KEy=secret.key
SUFFIX='_bak'
printf "Moving to backup folder.\n"
mv $FOLDER_NAME $FOLDER_NAME$SUFFIX
printf "Doing decryption of $1.\n"
aescrypt -d -k $SECRET_KEy -o $TAR_FILENAME $1
printf "Doing extraction.\n"
tar -xvf $TAR_FILENAME
printf "Removing $TAR_FILENAME.\n"
rm -v $TAR_FILENAME
printf "Done.\n"
