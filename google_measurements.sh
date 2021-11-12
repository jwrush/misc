#!/bin/bash
#usage ./google_measurements.sh "name" weight|height|iq

NAME="$1"
MEASUREMENT="$2"

case $MEASUREMENT in
        h* | H* )
                UNIT="cm"
                QUERY="how tall is $NAME"
                NUMBER="[0-9.]{3,}"
                ;;
        w* | W* )
                UNIT="kg"
                QUERY="$NAME weigh"
                NUMBER="[0-9.]{2,}"
                ;;
        iq | IQ )
                UNIT=""
                QUERY="$NAME iq"
                NUMBER='[1-2][0-9]{2}'
                ;;
        *)
                echo "Unknown measurement type: $MEASUREMENT"
                exit 1
esac                

echo "\n\n" | googler -C $QUERY $UNIT | grep -oP "$NUMBER *$UNIT" | awk '{ sum += $1 } END { if (NR > 0) print sum / NR }'
