#!/bin/bash

# $FTPSYNC must be the binary to test
# $FTPURL must be an upload URL with no subdirs: ftp://ftp_20130204_9627:n93cDqnf2t@ftp.dna.ku.dk/

TMP=/tmp/ftpsync-$$
mkdir -p $TMP

# Empty remote
$FTPSYNC $TMP $FTPURL

mkdir -p $TMP/{adir,bdir,cdir}
parallel 'echo Content_of_{} > {}' ::: $TMP/{adir,bdir,cdir}/{afile,bfile,cfile}

# Symlinks
ln -s /etc/hosts $TMP/symlink-absolute-outside-file-exists
ln -s /no/such/file $TMP/symlink-absolute-outside-no-such-file
ln -s ../../etc/hosts $TMP/symlink-relative-outside-file-exists
ln -s ../../no/such/file $TMP/symlink-relative-outside-no-such-file
ln -s $TMP/adir/afile $TMP/symlink-absolute-inside-file-exists
ln -s $TMP/no/such/file $TMP/symlink-absolute-inside-no-such-file
ln -s adir/afile $TMP/symlink-relative-inside-file-exists
ln -s no/such/file $TMP/symlink-relative-inside-no-such-file

# Todo: Permissions
chmod 000 $TMP/adir
chmod 000 $TMP/bdir/bfile

$FTPSYNC $TMP $FTPURL

chmod 777 $TMP/adir
rm -rf $TMP