FROMalpine:latest

RUNapk add --no-cache shadowsocks-libev netcat-openbsd

ENVSERVER_ADDR=0.0.0.0
ENVSERVER_PORT=10000
ENVPASSWORD=mypassword123
ENVMETHOD=chacha20-ietf-poly1305

EXPOSE10000 8080

CMDss-server -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD -u & while true; do { echo -e 'HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK'; } | nc -l -p 8080; done
