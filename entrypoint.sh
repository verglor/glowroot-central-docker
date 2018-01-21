#/bin/sh

if [ ! -f config/glowroot-central.properties ]; then
    echo "Creating default glowroot-central.properties"
    cp glowroot-central.properties.default config/glowroot-central.properties
    if [ -n "$CASSANDRA_HOST"  ]; then
        echo "Setting cassandra.contactPoints=${CASSANDRA_HOST}"
        sed -i "s/^\s*cassandra\.contactPoints\s*=.*/cassandra.contactPoints=${CASSANDRA_HOST}/g" config/glowroot-central.properties
    fi
fi

java -jar glowroot-central.jar
