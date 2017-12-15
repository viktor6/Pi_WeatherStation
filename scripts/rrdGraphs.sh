#!/bin/sh


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempo24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE \
DEF:TempOUTl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE:end=now-24h:start=end-24h \
CDEF:tTempOUT=TempOUT,1800,TRENDNAN \
CDEF:tTempOUTl=TempOUTl,1800,TRENDNAN \
SHIFT:tTempOUTl:86400 \
VDEF:OUTpct=TempOUT,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maksimalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempOUT#3366FF22 \
LINE1:tTempOUTl#BFC8FF::dashes=2,2 \
GPRINT:TempOUT:LAST:"     %6.2lf °C" \
GPRINT:TempOUT:MAX:"%5.2lf °C" \
GPRINT:TempOUT:MIN:"%6.2lf °C" \
GPRINT:TempOUT:AVERAGE:"%6.2lf °C" \
LINE1:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempo7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE \
DEF:TempOUTl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE:end=now-1w:start=end-2w \
CDEF:tTempOUT=TempOUT,12600,TRENDNAN \
CDEF:tTempOUTl=TempOUTl,12600,TRENDNAN \
SHIFT:tTempOUTl:604800 \
VDEF:OUTpct=TempOUT,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maksimalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempOUT#3366FF22 \
LINE1:tTempOUTl#BFC8FF::dashes=2,2 \
GPRINT:TempOUT:LAST:"     %6.2lf °C" \
GPRINT:TempOUT:MAX:"%5.2lf °C" \
GPRINT:TempOUT:MIN:"%6.2lf °C" \
GPRINT:TempOUT:AVERAGE:"%6.2lf °C" \
LINE1:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempo1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE \
DEF:TempOUTl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE:end=now-5w:start=end-5w \
CDEF:tTempOUT=TempOUT,55800,TRENDNAN \
CDEF:tTempOUTl=TempOUTl,55800,TRENDNAN \
SHIFT:tTempOUTl:2678400 \
VDEF:OUTpct=TempOUT,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maksimalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempOUT#3366FF22 \
LINE1:tTempOUTl#BFC8FF::dashes=2,2 \
GPRINT:TempOUT:LAST:"     %6.2lf °C" \
GPRINT:TempOUT:MAX:"%5.2lf °C" \
GPRINT:TempOUT:MIN:"%6.2lf °C" \
GPRINT:TempOUT:AVERAGE:"%6.2lf °C" \
LINE1:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempo1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE \
DEF:TempOUTl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempo:AVERAGE:end=now-52w:start=end-52w \
CDEF:tTempOUT=TempOUT,657000,TRENDNAN \
CDEF:tTempOUTl=TempOUTl,657000,TRENDNAN \
SHIFT:tTempOUTl:31536000 \
VDEF:OUTpct=TempOUT,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maksimalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempOUT#3366FF22 \
LINE1:tTempOUTl#BFC8FF::dashes=2,2 \
GPRINT:TempOUT:LAST:"     %6.2lf °C" \
GPRINT:TempOUT:MAX:"%5.2lf °C" \
GPRINT:TempOUT:MIN:"%6.2lf °C" \
GPRINT:TempOUT:AVERAGE:"%6.2lf °C" \
LINE1:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \



# Graf za notranjo temperaturo s sensorjem BMP180 - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempi24h.png \
--height=150 --width=350 \
--start end-1d \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempIN=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE:end=now-1d:start=end-1d \
CDEF:tTempIN=TempIN,1800,TRENDNAN \
CDEF:tTempINl=TempINl,1800,TRENDNAN \
SHIFT:tTempINl:86400 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE1:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnjih 24h" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 7dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempi7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempIN=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE:end=now-1w:start=end-2w \
CDEF:tTempIN=TempIN,12600,TRENDNAN \
CDEF:tTempINl=TempINl,12600,TRENDNAN \
SHIFT:tTempINl:604800 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE1:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnjih 7 dni" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 1mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempi1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempIN=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE:end=now-5w:start=end-5w \
CDEF:tTempIN=TempIN,55800,TRENDNAN \
CDEF:tTempINl=TempINl,55800,TRENDNAN \
SHIFT:tTempINl:2678400 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE1:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnji mesec" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 1leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/tempi1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempIN=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=/home/pi/project/WeatherStation/weatherRRD.rrd:tempi:AVERAGE:end=now-52w:start=end-52w \
CDEF:tTempIN=TempIN,657000,TRENDNAN \
CDEF:tTempINl=TempINl,657000,TRENDNAN \
SHIFT:tTempINl:31536000 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE1:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnje leto" \




# Graf za Zracni tlak s sensorjem BMP180 - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/press24h.png \
--height=150 --width=350 \
--start end-1d \
--upper-limit 1030 \
--lower-limit 950 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Zracni tlak (hPa)" \
--title "Zracni tlak - Zadnjih 24h" \
--watermark "`date`" \
DEF:press=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE:end=now-1d:start=end-1d \
CDEF:tpress=press,1800,TRENDNAN \
CDEF:tpressl=pressl,1800,TRENDNAN \
SHIFT:tpressl:86400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE1:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnjih 24h\n"


# Graf za Zracni tlak s sensorjem BMP180 - 7dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/press7d.png \
--height=150 --width=350 \
--start end-7d \
--upper-limit 1030 \
--lower-limit 950 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Zracni tlak (hPa)" \
--title "Zracni tlak - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:press=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE:end=now-1w:start=end-2w \
CDEF:tpress=press,12600,TRENDNAN \
CDEF:tpressl=pressl,12600,TRENDNAN \
SHIFT:tpressl:604800 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE1:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnjih 7 dni\n"


# Graf za Zracni tlak s sensorjem BMP180 - zadnji mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/press1m.png \
--height=150 --width=350 \
--start end-5w \
--upper-limit 1030 \
--lower-limit 950 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Zracni tlak (hPa)" \
--title "Zracni tlak - Zadnji mesec" \
--watermark "`date`" \
DEF:press=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE:end=now-5w:start=end-5w \
CDEF:tpress=press,55800,TRENDNAN \
CDEF:tpressl=pressl,55800,TRENDNAN \
SHIFT:tpressl:2678400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE1:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnji mesec\n"


# Graf za Zracni tlak s sensorjem BMP180 - zadnje leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/press1y.png \
--height=150 --width=350 \
--start end-52w \
--upper-limit 1030 \
--lower-limit 950 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Zracni tlak (hPa)" \
--title "Zracni tlak - Zadnje leto" \
--watermark "`date`" \
DEF:press=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=/home/pi/project/WeatherStation/weatherRRD.rrd:press:AVERAGE:end=now-52w:start=end-52w \
CDEF:tpress=press,657000,TRENDNAN \
CDEF:tpressl=pressl,657000,TRENDNAN \
SHIFT:tpressl:31536000 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE1:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnje leto\n"





# Graf za Relativna vlaznost s sensorjem DHT11 - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/humidity24h.png \
--height=150 --width=350 \
--start end-1d \
--vertical-label "Relativna vlaznost (%)" \
--title "Relativna vlaznost - Zadnjih 24h" \
--watermark "`date`" \
DEF:humid=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE \
DEF:humidl=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE:end=now-1d:start=end-1d \
CDEF:thumid=humid,1800,TRENDNAN \
CDEF:thumidl=humidl,1800,TRENDNAN \
SHIFT:thumidl:86400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:humid#26990022 \
LINE1:thumidl#7C9972::dashes=2,2 \
GPRINT:humid:LAST:"     %6.2lf%%" \
GPRINT:humid:MAX:"%5.2lf%%" \
GPRINT:humid:MIN:"%5.2lf%%" \
GPRINT:humid:AVERAGE:"%5.2lf%%  " \
LINE1:thumid#269900:"Relativna vlaznost    " \
LINE1:thumidl#7C9972:"Relativna vlaznost zadnjih 24h\n"


# Graf za Relativna vlaznost s sensorjem DHT11 - 7 dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/humidity7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Relativna vlaznost (%)" \
--title "Relativna vlaznost - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:humid=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE \
DEF:humidl=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE:end=now-1w:start=end-2w \
CDEF:thumid=humid,12600,TRENDNAN \
CDEF:thumidl=humidl,12600,TRENDNAN \
SHIFT:thumidl:604800 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:humid#26990022 \
LINE1:thumidl#7C9972::dashes=2,2 \
GPRINT:humid:LAST:"     %6.2lf%%" \
GPRINT:humid:MAX:"%5.2lf%%" \
GPRINT:humid:MIN:"%5.2lf%%" \
GPRINT:humid:AVERAGE:"%5.2lf%%  " \
LINE1:thumid#269900:"Relativna vlaznost    " \
LINE1:thumidl#7C9972:"Relativna vlaznost zadnjih 7 dni\n"


# Graf za Relativna vlaznost s sensorjem DHT11 - 1 mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/humidity1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Relativna vlaznost (%)" \
--title "Relativna vlaznost - Zadnji mesec" \
--watermark "`date`" \
DEF:humid=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE \
DEF:humidl=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE:end=now-5w:start=end-5w \
CDEF:thumid=humid,55800,TRENDNAN \
CDEF:thumidl=humidl,55800,TRENDNAN \
SHIFT:thumidl:2678400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:humid#26990022 \
LINE1:thumidl#7C9972::dashes=2,2 \
GPRINT:humid:LAST:"     %6.2lf%%" \
GPRINT:humid:MAX:"%5.2lf%%" \
GPRINT:humid:MIN:"%5.2lf%%" \
GPRINT:humid:AVERAGE:"%5.2lf%%  " \
LINE1:thumid#269900:"Relativna vlaznost    " \
LINE1:thumidl#7C9972:"Relativna vlaznost zadnjem mescu\n"


# Graf za Relativna vlaznost s sensorjem DHT11 - 1 leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/humidity1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Relativna vlaznost (%)" \
--title "Relativna vlaznost - Zadnje leto" \
--watermark "`date`" \
DEF:humid=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE \
DEF:humidl=/home/pi/project/WeatherStation/weatherRRD.rrd:humid:AVERAGE:end=now-52w:start=end-52w \
CDEF:thumid=humid,657000,TRENDNAN \
CDEF:thumidl=humidl,657000,TRENDNAN \
SHIFT:thumidl:31536000 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:humid#26990022 \
LINE1:thumidl#7C9972::dashes=2,2 \
GPRINT:humid:LAST:"     %6.2lf%%" \
GPRINT:humid:MAX:"%5.2lf%%" \
GPRINT:humid:MIN:"%5.2lf%%" \
GPRINT:humid:AVERAGE:"%5.2lf%%  " \
LINE1:thumid#269900:"Relativna vlaznost    " \
LINE1:thumidl#7C9972:"Relativna vlaznost zadnjem letu\n"




# Graf za osvetljenost s sensorjem GY30/BH1750FVI - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/luxmeter24h.png \
--height=150 --width=350 \
--start end-1d \
--upper-limit 3000 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Osvetljenost (lux)" \
--title "Osvetljenost - Zadnjih 24h" \
--watermark "`date`" \
DEF:luxmeter=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE \
DEF:luxmeterl=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE:end=now-1d:start=end-1d \
CDEF:tluxmeter=luxmeter,1800,TRENDNAN \
CDEF:tluxmeterl=luxmeterl,1800,TRENDNAN \
SHIFT:tluxmeterl:86400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tluxmeter#FF00DC22 \
LINE1:tluxmeterl#FFB2F4::dashes=2,2 \
GPRINT:luxmeter:LAST:"    %6.2lf lux" \
GPRINT:luxmeter:MAX:"%1.2lf lux" \
GPRINT:luxmeter:MIN:"%3.2lf lux" \
GPRINT:luxmeter:AVERAGE:"%5.2lf lux" \
LINE1:tluxmeter#FF00DC:"Svetilnost                   " \
LINE1:tluxmeterl#FFB2F4:"Osvetljenost zadnjih 24h\n"


# Graf za osvetljenost s sensorjem GY30/BH1750FVI - 7dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/luxmeter7d.png \
--height=150 --width=350 \
--start end-7d \
--upper-limit 3000 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Osvetljenost (lux)" \
--title "Osvetljenost - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:luxmeter=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE \
DEF:luxmeterl=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE:end=now-1w:start=end-2w \
CDEF:tluxmeter=luxmeter,12600,TRENDNAN \
CDEF:tluxmeterl=luxmeterl,12600,TRENDNAN \
SHIFT:tluxmeterl:604800 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tluxmeter#FF00DC22 \
LINE1:tluxmeterl#FFB2F4::dashes=2,2 \
GPRINT:luxmeter:LAST:"    %6.2lf lux" \
GPRINT:luxmeter:MAX:"%1.2lf lux" \
GPRINT:luxmeter:MIN:"%3.2lf lux" \
GPRINT:luxmeter:AVERAGE:"%5.2lf lux" \
LINE1:tluxmeter#FF00DC:"Svetilnost                 " \
LINE1:tluxmeterl#FFB2F4:"Osvetljenost zadnjih 7 dni\n"


# Graf za osvetljenost s sensorjem GY30/BH1750FVI - 1 mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/luxmeter1m.png \
--height=150 --width=350 \
--start end-5w \
--upper-limit 3000 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Osvetljenost (lux)" \
--title "Osvetljenost - Zadnji mesec" \
--watermark "`date`" \
DEF:luxmeter=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE \
DEF:luxmeterl=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE:end=now-5w:start=end-5w \
CDEF:tluxmeter=luxmeter,55800,TRENDNAN \
CDEF:tluxmeterl=luxmeterl,55800,TRENDNAN \
SHIFT:tluxmeterl:2678400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tluxmeter#FF00DC22 \
LINE1:tluxmeterl#FFB2F4::dashes=2,2 \
GPRINT:luxmeter:LAST:"    %6.2lf lux" \
GPRINT:luxmeter:MAX:"%1.2lf lux" \
GPRINT:luxmeter:MIN:"%3.2lf lux" \
GPRINT:luxmeter:AVERAGE:"%5.2lf lux" \
LINE1:tluxmeter#FF00DC:"Svetilnost                  " \
LINE1:tluxmeterl#FFB2F4:"Osvetljenost zadnji mesec\n"


# Graf za osvetljenost s sensorjem GY30/BH1750FVI - 1 leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/luxmeter1y.png \
--height=150 --width=350 \
--start end-52w \
--upper-limit 3000 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Osvetljenost (lux)" \
--title "Osvetljenost - Zadnje leto" \
--watermark "`date`" \
DEF:luxmeter=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE \
DEF:luxmeterl=/home/pi/project/WeatherStation/weatherRRD.rrd:luxmeter:AVERAGE:end=now-52w:start=end-52w \
CDEF:tluxmeter=luxmeter,657000,TRENDNAN \
CDEF:tluxmeterl=luxmeterl,657000,TRENDNAN \
SHIFT:tluxmeterl:31536000 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:tluxmeter#FF00DC22 \
LINE1:tluxmeterl#FFB2F4::dashes=2,2 \
GPRINT:luxmeter:LAST:"    %6.2lf lux" \
GPRINT:luxmeter:MAX:"%1.2lf lux" \
GPRINT:luxmeter:MIN:"%3.2lf lux" \
GPRINT:luxmeter:AVERAGE:"%5.2lf lux" \
LINE1:tluxmeter#FF00DC:"Svetilnost                  " \
LINE1:tluxmeterl#FFB2F4:"Osvetljenost zadnje leto\n"





# Graf za nadmorsko visino s sensorjem BMP180 - 24h
/usr/bin/rrdtool graph /var/www/WeatherStation/image/altit24h.png \
--height=150 --width=350 \
--start end-1d \
--upper-limit 500 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Nadmorska visina (m)" \
--title "Nadmorska visina - Zadnjih 24h" \
--watermark "`date`" \
DEF:altit=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE \
DEF:altitl=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE:end=now-1d:start=end-1d \
CDEF:taltit=altit,1800,TRENDNAN \
CDEF:taltitl=altitl,1800,TRENDNAN \
SHIFT:taltitl:86400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:taltit#00000022 \
LINE1:taltitl#ADADAD::dashes=2,2 \
GPRINT:altit:LAST:"     %6.1lf m" \
GPRINT:altit:AVERAGE:"%4.1lf m" \
GPRINT:altit:MIN:"%3.1lf m" \
GPRINT:altit:MAX:"%4.1lf m" \
LINE1:taltit#000000:"Nadmorska visina         " \
LINE1:taltitl#ADADAD:"Nadmorska visina zadnjih 24h\n"


# Graf za nadmorsko visino s sensorjem BMP180 - 7 dni
/usr/bin/rrdtool graph /var/www/WeatherStation/image/altit7d.png \
--height=150 --width=350 \
--start end-7d \
--upper-limit 500 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Nadmorska visina (m)" \
--title "Nadmorska visina - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:altit=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE \
DEF:altitl=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE:end=now-1w:start=end-2w \
CDEF:taltit=altit,12600,TRENDNAN \
CDEF:taltitl=altitl,12600,TRENDNAN \
SHIFT:taltitl:604800 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:taltit#00000022 \
LINE1:taltitl#ADADAD::dashes=2,2 \
GPRINT:altit:LAST:"     %6.1lf m" \
GPRINT:altit:AVERAGE:"%4.1lf m" \
GPRINT:altit:MIN:"%3.1lf m" \
GPRINT:altit:MAX:"%4.1lf m" \
LINE1:taltit#000000:"Nadmorska visina         " \
LINE1:taltitl#ADADAD:"Nadmorska visina zadnjih 7 dni\n"


# Graf za nadmorsko visino s sensorjem BMP180 - 1 mesec
/usr/bin/rrdtool graph /var/www/WeatherStation/image/altit1m.png \
--height=150 --width=350 \
--start end-5w \
--upper-limit 500 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Nadmorska visina (m)" \
--title "Nadmorska visina - Zadnji mesec" \
--watermark "`date`" \
DEF:altit=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE \
DEF:altitl=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE:end=now-5w:start=end-5w \
CDEF:taltit=altit,55800,TRENDNAN \
CDEF:taltitl=altitl,55800,TRENDNAN \
SHIFT:taltitl:2678400 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:taltit#00000022 \
LINE1:taltitl#ADADAD::dashes=2,2 \
GPRINT:altit:LAST:"     %6.1lf m" \
GPRINT:altit:AVERAGE:"%4.1lf m" \
GPRINT:altit:MIN:"%3.1lf m" \
GPRINT:altit:MAX:"%4.1lf m" \
LINE1:taltit#000000:"Nadmorska visina         " \
LINE1:taltitl#ADADAD:"Nadmorska visina zadnji mesec\n"


# Graf za nadmorsko visino s sensorjem BMP180 - 1 leto
/usr/bin/rrdtool graph /var/www/WeatherStation/image/altit1y.png \
--height=150 --width=350 \
--start end-52w \
--upper-limit 500 \
--lower-limit 0 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Nadmorska visina (m)" \
--title "Nadmorska visina - Zadnje leto" \
--watermark "`date`" \
DEF:altit=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE \
DEF:altitl=/home/pi/project/WeatherStation/weatherRRD.rrd:altit:AVERAGE:end=now-52w:start=end-52w \
CDEF:taltit=altit,657000,TRENDNAN \
CDEF:taltitl=altitl,657000,TRENDNAN \
SHIFT:taltitl:31536000 \
COMMENT:"     Trenutna" \
COMMENT:"Maximalna" \
COMMENT:"Minimalna" \
COMMENT:"Povprecna" \
AREA:taltit#00000022 \
LINE1:taltitl#ADADAD::dashes=2,2 \
GPRINT:altit:LAST:"     %6.1lf m" \
GPRINT:altit:AVERAGE:"%4.1lf m" \
GPRINT:altit:MIN:"%3.1lf m" \
GPRINT:altit:MAX:"%4.1lf m" \
LINE1:taltit#000000:"Nadmorska visina         " \
LINE1:taltitl#ADADAD:"Nadmorska visina zadnje leto\n"

