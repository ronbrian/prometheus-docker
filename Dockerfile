FROM bitnami/prometheus:2.37.0

EXPOSE 9090

WORKDIR /opt/bitnami/prometheus
COPY ./prometheus.yml ./web-config.yml /opt/bitnami/prometheus/conf/
USER 1001
ENTRYPOINT [ "/opt/bitnami/prometheus/bin/prometheus" ]
CMD [   "--config.file=/opt/bitnami/prometheus/conf/prometheus.yml", \
	"--web.config.file=/opt/bitnami/prometheus/conf/web-config.yml", \
	"--storage.tsdb.path=/opt/bitnami/prometheus/data", \
	"--storage.tsdb.retention=2d", \
	"--storage.tsdb.wal-compression", \
	"--web.console.libraries=/opt/bitnami/prometheus/conf/console_libraries", \
	"--web.console.templates=/opt/bitnami/prometheus/conf/consoles" ]
