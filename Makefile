
default:  # there is no default.
	@egrep '^[[:alnum:]]+:' Makefile

backupv:  # backup verbose to /media/allan/backups
	bin/backups.sh verbose
	sync

backups3: # backup to S3://zirpu
	bin/s3.backups.sh
