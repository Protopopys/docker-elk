elk=docker-compose -f compose/elk_base.yml -f compose/elk_local.yml --project-name elk
filebeat=docker-compose -f compose/filebeat_base.yml -f compose/filebeat_local.yml --project-name filebeat
metricbeat=docker-compose -f compose/metricbeat_base.yml -f compose/metricbeat_local.yml --project-name metricbeat
heartbeat=docker-compose -f compose/heartbeat_base.yml -f compose/heartbeat_local.yml --project-name heartbeat
packetbeat=docker-compose -f compose/packetbeat_base.yml -f compose/packetbeat_local.yml --project-name packetbeat
curator=docker-compose -f compose/curator_base.yml --project-name curator

include compose/.env
export

elk:
	$(elk) up --build -d

fb:
	$(filebeat) up --build -d

mb:
	$(metricbeat) up --build -d

hb:
	$(heartbeat) up --build -d

pb:
	$(packetbeat) up --build -d

curator:
	$(curator) up --build -d