# Logstash-forwarder Dockerfile

logstash-forwarder 0.3.1

NOTE: First install and run elasticsearch kibana and logstash using Docker, refers to https://github.com/denibertovic/logstash-forwarder-dockerfile

Clone the repo:

    git clone https://github.com/linhaobuaa/logstash-forwarder-dockerfile

Make sure to use the certificates used to start Logstash from logstash-dockerfile

Build docker image: logstash-forwarder
   
    cd logstash-forwarder-dockerfile; docker build -t logstash-forwarder .

Run and test

    mkdir /tmp/test && touch /tmp/test/test.log
    modify `pwd`/conf-example/config.json
    docker run --name forwarder -v /tmp/test:/tmp/test -v `pwd`/conf-example:/opt/conf -v `pwd`/certs:/opt/certs -v /tmp/feeds -d -t logstash-forwarder

    cat >> /tmp/test/test.log
    test
    test
    test
    ^C

    Log in to the Kibana interface, you should see the logs 3 test messages there.

Volumes:

    /opt/conf  - Configuration folder with config.json
    /opt/certs - Certs folder with logstash-forwarder.crt and logstash-forwarder.key (used to start logstash)

