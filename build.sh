#! /bin/bash

INSTALL_DIR="/opt/ttn-gateway"

mkdir -p $INSTALL_DIR/dev
cd $INSTALL_DIR/dev

if [ ! -d lora_gateway ]; then
    git clone https://github.com/Lora-net/lora_gateway.git  || { echo 'Cloning lora_gateway failed.' ; exit 1; }
else
    cd lora_gateway
    git reset --hard
    git pull
    cd ..
fi

# if [ ! -d paho.mqtt.embedded-c ]; then
#     git clone https://github.com/kersing/paho.mqtt.embedded-c.git  || { echo 'Cloning paho mqtt failed.' ; exit 1; }
# else
#     cd paho.mqtt.embedded-c
#     git reset --hard
#     git pull
#     cd ..
# fi

# if [ ! -d ttn-gateway-connector ]; then
#     git clone https://github.com/kersing/ttn-gateway-connector.git  || { echo 'Cloning gateway connector failed.' ; exit 1; }
# else
#     cd ttn-gateway-connector
#     git reset --hard
#     git pull
#     cd ..
# fi

# if [ ! -d protobuf-c ]; then
#     git clone https://github.com/kersing/protobuf-c.git  || { echo 'Cloning protobuf-c failed.' ; exit 1; }
# else
#     cd protobuf-c
#     git reset --hard
#     git pull
#     cd ..
# fi

if [ ! -d packet_forwarder ]; then
    git clone https://github.com/Lora-net/packet_forwarder.git  || { echo 'Cloning packet forwarder failed.' ; exit 1; }
else
    cd packet_forwarder
    git reset --hard
    git pull
    cd ..
fi

# if [ ! -d protobuf ]; then
#     git clone https://github.com/google/protobuf.git  || { echo 'Cloning protobuf failed.' ; exit 1; }
# else
#     cd protobuf
#     git reset --hard
#     git pull
#     cd ..
# fi

echo "Compile Lora Gateway"
cd $INSTALL_DIR/dev/lora_gateway
make all

# cd $INSTALL_DIR/dev/protobuf-c
# ./autogen.sh
# ./configure
# make protobuf-c/libprotobuf-c.la
# mkdir bin
# ./libtool install /usr/bin/install -c protobuf-c/libprotobuf-c.la `pwd`/bin
# rm -f `pwd`/bin/*so*

# cd $INSTALL_DIR/dev/paho.mqtt.embedded-c/
# make
# make install

# cd $INSTALL_DIR/dev/ttn-gateway-connector
# cp config.mk.in config.mk
# make -j$(nproc)
# cp bin/libttn-gateway-connector.so /usr/lib/

echo "Compile Packet Forwarder"
cd $INSTALL_DIR/dev/packet_forwarder/lora_pkt_fwd/
make all

# Copy things needed at runtime to where they'll be expected
cp -r $INSTALL_DIR/dev/packet_forwarder/lora_pkt_fwd $INSTALL_DIR/lora_pkt_fwd

echo "Build & Installation Completed."