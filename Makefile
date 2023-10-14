add-backup:
	dolt backup add local file://$(shell pwd)/backup

backup:
	mkdir -p backup
	dolt backup sync local

restore:
	dolt backup restore file://$(shell pwd)/backup .

.PHONY: import-vector add-backup backup restore
