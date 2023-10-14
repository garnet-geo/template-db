# GarnetGeo template database

Dolt database backup with some simple spatial data for testing purposes.

You can view and test this data at demo server `db.garnet-geo.org:3306`.
For GDAL use, you can configure all connection string as `MYSQL:"dolt,host=db.garnet-geo.org,port=3306,user=root"`

## Restoring backup

You can restore it from backup by running following command in repository directory:

```bash
make restore
```

If you wish to restore it to other specific directory, here is the command:

```bash
dolt backup restore file://$(pwd)/backup <path/to/directory>
```

## Running in Docker

This repository also contains docker images with Dolt MySQL server running in read-only mode with this template data.

You can pull and use already created docker images from GitHub registry:

```bash
# Pull latest docker image from "main" branch
docker pull ghcr.io/garnet-geo/template-db:main

# Run image with MySQL port opened
docker run -p 3306:3306 ghcr.io/garnet-geo/template-db:main
```

Or you can build and run this by yourself:

```bash
docker build -t "garnet-geo/template-db" .
docker run -p 3306:3306 garnet-geo/template-db
```
