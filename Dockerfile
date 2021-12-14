
FROM debian:stretch-slim AS buildstep

WORKDIR /opt/ttn-gateway/

# downloading utils
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get -y install wget build-essential libc6-dev git pkg-config automake libtool autoconf

COPY build.sh ./
RUN ./build.sh

FROM python:3.7-slim-buster

WORKDIR /opt/ttn-gateway

RUN apt-get update && apt-get install -y apt-transport-https build-essential
RUN apt-get -y install gpsd 
RUN pip3 install certifi

COPY --from=buildstep /opt/ttn-gateway/lora_pkt_fwd ./lora_pkt_fwd
RUN cp ./lora_pkt_fwd/cfg/global_conf.json.PCB_E336.EU868.beacon ./lora_pkt_fwd/global_conf.json

COPY run.py ./
COPY start.sh ./

# run when container lands on device
CMD ["bash", "start.sh"]