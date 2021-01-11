#!/bin/bash
set -e

fscrypt setup --force

blkid /dev/xvda || mkfs.ext4 /dev/xvda

mkdir -p /data
mount /dev/xvda /data

tune2fs -O encrypt /dev/xvda

test -d /data/.fscrypt || {
	fscrypt setup /data
	mkdir -p /data/postgres
	fscrypt encrypt --source=raw_key --user=root --name=key --key="/secrets/fscrypt_key" --skip-unlock /data/postgres
}

fscrypt unlock --user=root --key="/secrets/fscrypt_key" /data/postgres

export PGDATA="/data/postgres/13"
mkdir -p "${PGDATA}"

exec /docker-entrypoint.sh
