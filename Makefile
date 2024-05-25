import-vector:
	ogr2ogr -overwrite -preserve_fid \
		-s_srs "+proj=latlong +datum=WGS84 +axis=neu +wktext" \
		-t_srs "+proj=latlong +datum=WGS84 +axis=enu +wktext" \
		MYSQL:"template-db,host=127.0.0.1,port=3306,user=root" full-vector.gpkg

add-backup:
	dolt remote add local file://$(shell pwd)/backup

backup:
	dolt push --all --force --set-upstream local

restore:
	dolt clone --remote local file://$(shell pwd)/backup .

start-server:
	dolt sql-server -r

.PHONY: import-vector add-backup backup restore start-server
