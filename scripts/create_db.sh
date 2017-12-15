#!/bin/bash

if [ ! -e /home/pi/bazy/weatherRRD.rrd ]
then { echo "Создаю базу данных";

# Procesor
rrdtool create weatherRRD.rrd --start N --step 300 \
DS:tempo:GAUGE:600:U:U \
DS:tempi:GAUGE:600:U:U \
DS:humid:GAUGE:600:U:U \
DS:press:GAUGE:600:U:U \
DS:altit:GAUGE:600:U:U \
DS:luxmeter:GAUGE:600:U:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MIN:0.5:1:600 \
RRA:MIN:0.5:6:700 \
RRA:MIN:0.5:24:775 \
RRA:MIN:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797 \

}
else 
{ 
echo "База существует";
}
fi