# Basic

Repository to create an small image with the ttn-packetforwarder as an docker image. You can create the container by your self with:

`docker build .`

or you can use the prebuild image from the docker hub:

`docker run gewvtudresden/lorapacketforwarder:latest`

The image is tested on Raspberry Pis with the iC880A-SPI LoRaWAN Concentrator.

# TODO

- Find a alternative to Rpi.GPIO so it is possible to use the tool on other platforms like Raspberry Pis.

# Environmentals

You have to control the image with environmentals.

| Key                   | Default                                                           | Explanation                            |
| --------------------- | ----------------------------------------------------------------- | -------------------------------------- |
| HALT                  | -                                                                 | Prevent service from running           |
| GW_EUI                | -                                                                 | Gateway ID (random if unset)           |
| ACCOUNT_SERVER_DOMAIN | account.thethingsnetwork.org                                      | Host to load the frequency plan        |
| GW_DESCRIPTION        | -                                                                 | Description of the gateway             |
| GW_REF_LATITUDE       | 0                                                                 | Latitude of the position               |
| GW_REF_LONGITUDE      | 0                                                                 | Longitude of the position              |
| GW_REF_ALTITUDE       | 0                                                                 | Altitude of the position               |
| FREQ_PLAN_URL         | https://<ACCOUNT_SERVER_DOMAIN>/api/v2/frequency-plans/EU_863_870 | Url to load the frequency plan         |
| GW_GPS                | false                                                             | Exists hardware gps                    |
| GW_GPS_PORT           | /dev/ttyAMA0                                                      | Hardware GPS Port                      |
| GW_ANTENNA_GAIN       | 0                                                                 | Antenna gain in dbi                    |
| GW_CONTACT_EMAIL      | -                                                                 | Email of the user                      |
| GW_LOGGER             | false                                                             | Log messages of the gateway            |
| GW_FWD_CRC_ERR        | false                                                             | Forward messages with CRC-Error        |
| GW_FWD_CRC_VAL        | true                                                              | Forward valid messages                 |
| GW_DOWNSTREAM         | true                                                              | Downstream messages possible           |
| SERVER_0_ENABLED      | true                                                              | Relay messages to first server         |
| SERVER_0_ADDRESS      | localhost                                                         | Address of first server                |
| SERVER_0_PORTUP       | 1700                                                              | Port for uplink messages               |
| SERVER_0_PORTDOWN     | 1700                                                              | Port for downlink messages             |
| GW_RESET_PIN          | 22                                                                | Gpio pin to reset the loraconcentrator |
| SPI_SPEED             | 8000000                                                           | SPI Speed                              |
