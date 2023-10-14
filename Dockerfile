FROM dolthub/dolt

COPY backup backup
RUN dolt backup restore file://$(pwd)/backup .

CMD ["sql-server", "-r", "--host", "0.0.0.0", "--port 3306"]
