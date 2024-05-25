FROM dolthub/dolt:1.39.1

COPY backup backup
RUN dolt clone --remote local file://$(pwd)/backup . && dolt remote remove local

CMD ["sql-server", "-r", "--host", "0.0.0.0", "--port 3306"]
