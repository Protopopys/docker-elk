elk=docker-compose -f compose/elk.yml --project-name elk
filebeat=docker-compose -f compose/filebeat.yml --project-name filebeat
metricbeat=docker-compose -f compose/metricbeat.yml --project-name metricbeat
heartbeat=docker-compose -f compose/heartbeat.yml --project-name heartbeat
packetbeat=docker-compose -f compose/packetbeat.yml --project-name packetbeat
curator=docker-compose -f compose/curator.yml --project-name curator

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