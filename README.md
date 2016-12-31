# docker-openvpn-client
OpenVPN client in Docker container

OpenVPN server can use "https://github.com/kylemanna/docker-openvpn"

## Quick start

* Before running the ovpn_client docker continaer, you have to run the ovpn_server by the instruction in https://github.com/kylemanna/docker-openvpn


* Edit the client configuration file.

        set remote, ping, pintout paramters

* Pick a name for the `$OVPN_CLIENT_DATA` data volume container, it will be created automatically.

        OVPN_DATA="ovpn-client-data"

* Initialize the `$OVPN_CLIENT_DATA` container that will hold the configuration files

        docker volume create --name $OVPN_CLIENT_DATA

* Copy the client configuration file to the volume directory

        sudo cp CLIENTNAME.ovpn /var/lib/docker/volumes/ovpn-client-data/_data

* Run the ovpn client

        docker run -v $OVPN_DATA:/etc/openvpn --privileged -d bali2014/openvpn-client ovpn_client_run --config /etc/openvpn/CLIENTNAME.ovpn
