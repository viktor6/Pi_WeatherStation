#!/bin/bash
DIR="/home/pi/bazy" 
DIR2="/var/www/html/web/image" 


# Graf za notranjo temperaturo s sensorjem BMP180 - 4h
/usr/bin/rrdtool graph $DIR2/tempi4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Градусы Цельсия (°C)" \
--title "Температура за последние 4 часа" \
--watermark "`date`" \
DEF:TempIN=$DIR/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=$DIR/weatherRRD.rrd:tempi:AVERAGE:end=now-4h:start=end-4h \
CDEF:tTempIN=TempIN,1800,TRENDNAN \
CDEF:tTempINl=TempINl,1800,TRENDNAN \
SHIFT:tTempINl:86400 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE2:tTempIN#B40404:"Внутренняя температура" \
LINE1:tTempINl#FFBFBF:"Температура за последние 4 часа" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 24h
/usr/bin/rrdtool graph $DIR2/tempi24h.png \
--height=150 --width=350 \
--start end-1d \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempIN=$DIR/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=$DIR/weatherRRD.rrd:tempi:AVERAGE:end=now-1d:start=end-1d \
CDEF:tTempIN=TempIN,1800,TRENDNAN \
CDEF:tTempINl=TempINl,1800,TRENDNAN \
SHIFT:tTempINl:86400 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE2:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnjih 24h" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 7dni
/usr/bin/rrdtool graph $DIR2/tempi7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempIN=$DIR/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=$DIR/weatherRRD.rrd:tempi:AVERAGE:end=now-1w:start=end-2w \
CDEF:tTempIN=TempIN,12600,TRENDNAN \
CDEF:tTempINl=TempINl,12600,TRENDNAN \
SHIFT:tTempINl:604800 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE2:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnjih 7 dni" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 1mesec
/usr/bin/rrdtool graph $DIR2/tempi1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempIN=$DIR/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=$DIR/weatherRRD.rrd:tempi:AVERAGE:end=now-5w:start=end-5w \
CDEF:tTempIN=TempIN,55800,TRENDNAN \
CDEF:tTempINl=TempINl,55800,TRENDNAN \
SHIFT:tTempINl:2678400 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE2:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnji mesec" \

# Graf za notranjo temperaturo s sensorjem BMP180 - 1leto
/usr/bin/rrdtool graph $DIR2/tempi1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Notranja temperatura (°C)" \
--title "Notranja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempIN=$DIR/weatherRRD.rrd:tempi:AVERAGE \
DEF:TempINl=$DIR/weatherRRD.rrd:tempi:AVERAGE:end=now-52w:start=end-52w \
CDEF:tTempIN=TempIN,657000,TRENDNAN \
CDEF:tTempINl=TempINl,657000,TRENDNAN \
SHIFT:tTempINl:31536000 \
VDEF:INpct=TempIN,95,PERCENT \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tTempIN#FF660022 \
LINE1:tTempINl#FFBFBF::dashes=2,2 \
GPRINT:TempIN:LAST:"     %6.2lf °C" \
GPRINT:TempIN:MAX:"%5.2lf °C" \
GPRINT:TempIN:MIN:"%6.2lf °C" \
GPRINT:TempIN:AVERAGE:"%6.2lf °C" \
LINE2:tTempIN#B40404:"Notranja temperatura" \
LINE1:tTempINl#FFBFBF:"Temperatura zadnje leto" \




# Graf za Zracni tlak s sensorjem BMP180 - 4h
/usr/bin/rrdtool graph $DIR2/press4h.png \
--height=150 --width=350 \
--start end-4h \
--upper-limit 1030 \
--lower-limit 950 \
--rigid \
--alt-y-grid \
--units-exponent 0 \
--vertical-label "Zracni tlak (hPa)" \
--title "Zracni tlak - Zadnjih 4h" \
--watermark "`date`" \
DEF:press=$DIR/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=$DIR/weatherRRD.rrd:press:AVERAGE:end=now-4h:start=end-4h \
CDEF:tpress=press,1800,TRENDNAN \
CDEF:tpressl=pressl,1800,TRENDNAN \
SHIFT:tpressl:86400 \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE2:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnjih 4h\n"

# Graf za Zracni tlak s sensorjem BMP180 - 24h
/usr/bin/rrdtool graph $DIR2/press24h.png \
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
DEF:press=$DIR/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=$DIR/weatherRRD.rrd:press:AVERAGE:end=now-1d:start=end-1d \
CDEF:tpress=press,1800,TRENDNAN \
CDEF:tpressl=pressl,1800,TRENDNAN \
SHIFT:tpressl:86400 \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE2:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnjih 24h\n"


# Graf za Zracni tlak s sensorjem BMP180 - 7dni
/usr/bin/rrdtool graph $DIR2/press7d.png \
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
DEF:press=$DIR/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=$DIR/weatherRRD.rrd:press:AVERAGE:end=now-1w:start=end-2w \
CDEF:tpress=press,12600,TRENDNAN \
CDEF:tpressl=pressl,12600,TRENDNAN \
SHIFT:tpressl:604800 \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE2:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnjih 7 dni\n"


# Graf za Zracni tlak s sensorjem BMP180 - zadnji mesec
/usr/bin/rrdtool graph $DIR2/press1m.png \
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
DEF:press=$DIR/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=$DIR/weatherRRD.rrd:press:AVERAGE:end=now-5w:start=end-5w \
CDEF:tpress=press,55800,TRENDNAN \
CDEF:tpressl=pressl,55800,TRENDNAN \
SHIFT:tpressl:2678400 \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE2:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnji mesec\n"


# Graf za Zracni tlak s sensorjem BMP180 - zadnje leto
/usr/bin/rrdtool graph $DIR2/press1y.png \
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
DEF:press=$DIR/weatherRRD.rrd:press:AVERAGE \
DEF:pressl=$DIR/weatherRRD.rrd:press:AVERAGE:end=now-52w:start=end-52w \
CDEF:tpress=press,657000,TRENDNAN \
CDEF:tpressl=pressl,657000,TRENDNAN \
SHIFT:tpressl:31536000 \
COMMENT:"     Последняя" \
COMMENT:"Максимальна" \
COMMENT:"Минимальна" \
COMMENT:"Среднее" \
AREA:tpress#FF7F0022 \
LINE1:tpressl#FFEC00::dashes=2,2 \
GPRINT:press:LAST:"    %6.2lf hPa" \
GPRINT:press:MAX:"%5.2lf hPa" \
GPRINT:press:MIN:"%6.2lf hPa" \
GPRINT:press:AVERAGE:"%6.2lf hPa" \
LINE2:tpress#FF7F00:"Zracni tlak                   " \
LINE1:tpressl#FFEC00:"Zracni tlak zadnje leto\n"

################### a
# Graf za zunanjo temperaturo s sensorjem DS18b20 - 4h
/usr/bin/rrdtool graph $DIR2/tempta4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 4h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:tempta:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:tempta:AVERAGE:end=now-4h:start=end-4h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 4h" \

# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph $DIR2/tempta24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:tempta:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:tempta:AVERAGE:end=now-24h:start=end-24h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph $DIR2/tempta7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:tempta:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:tempta:AVERAGE:end=now-1w:start=end-2w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph $DIR2/tempta1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:tempta:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:tempta:AVERAGE:end=now-5w:start=end-5w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph $DIR2/tempta1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:tempta:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:tempta:AVERAGE:end=now-52w:start=end-52w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \


################### b
# Graf za zunanjo temperaturo s sensorjem DS18b20 - 4h
/usr/bin/rrdtool graph $DIR2/temptb4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 4h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptb:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptb:AVERAGE:end=now-4h:start=end-4h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 4h" \

# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph $DIR2/temptb24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptb:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptb:AVERAGE:end=now-24h:start=end-24h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph $DIR2/temptb7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptb:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptb:AVERAGE:end=now-1w:start=end-2w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph $DIR2/temptb1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptb:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptb:AVERAGE:end=now-5w:start=end-5w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph $DIR2/temptb1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptb:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptb:AVERAGE:end=now-52w:start=end-52w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \


################### c
# Graf za zunanjo temperaturo s sensorjem DS18b20 - 4h
/usr/bin/rrdtool graph $DIR2/temptc4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 4h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptc:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptc:AVERAGE:end=now-4h:start=end-4h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 4h" \

# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph $DIR2/temptc24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptc:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptc:AVERAGE:end=now-24h:start=end-24h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph $DIR2/temptc7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptc:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptc:AVERAGE:end=now-1w:start=end-2w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph $DIR2/temptc1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptc:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptc:AVERAGE:end=now-5w:start=end-5w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph $DIR2/temptc1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptc:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptc:AVERAGE:end=now-52w:start=end-52w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \


################### d
# Graf za zunanjo temperaturo s sensorjem DS18b20 - 4h
/usr/bin/rrdtool graph $DIR2/temptd4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 4h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptd:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptd:AVERAGE:end=now-4h:start=end-4h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 4h" \

# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph $DIR2/temptd24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptd:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptd:AVERAGE:end=now-24h:start=end-24h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph $DIR2/temptd7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptd:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptd:AVERAGE:end=now-1w:start=end-2w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph $DIR2/temptd1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptd:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptd:AVERAGE:end=now-5w:start=end-5w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph $DIR2/temptd1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptd:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptd:AVERAGE:end=now-52w:start=end-52w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \


################### g
# Graf za zunanjo temperaturo s sensorjem DS18b20 - 4h
/usr/bin/rrdtool graph $DIR2/temptg4h.png \
--height=150 --width=350 \
--start end-4h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 4h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptg:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptg:AVERAGE:end=now-4h:start=end-4h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 4h" \

# Graf za zunanjo temperaturo s sensorjem DS18b20 - 24h
/usr/bin/rrdtool graph $DIR2/temptg24h.png \
--height=150 --width=350 \
--start end-24h \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja Temperatura - Zadnjih 24h" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptg:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptg:AVERAGE:end=now-24h:start=end-24h \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 24h" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 7dni
/usr/bin/rrdtool graph $DIR2/temptg7d.png \
--height=150 --width=350 \
--start end-7d \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnjih 7 dni" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptg:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptg:AVERAGE:end=now-1w:start=end-2w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnjih 7 dni" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1mesec
/usr/bin/rrdtool graph $DIR2/temptg1m.png \
--height=150 --width=350 \
--start end-5w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnji mesec" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptg:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptg:AVERAGE:end=now-5w:start=end-5w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnji mesec" \


# Graf za zunanjo temperaturo s sensorjem DS18b20 - 1leto
/usr/bin/rrdtool graph $DIR2/temptg1y.png \
--height=150 --width=350 \
--start end-52w \
--vertical-label "Zunanja temperatura (°C)" \
--title "Zunanja temperatura - Zadnje leto" \
--watermark "`date`" \
DEF:TempOUT=$DIR/weatherRRD.rrd:temptg:AVERAGE \
DEF:TempOUTl=$DIR/weatherRRD.rrd:temptg:AVERAGE:end=now-52w:start=end-52w \
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
LINE2:tTempOUT#0400ff:"Zunanja temperatura" \
LINE1:tTempOUTl#BFC8FF:"Temperatura zadnje leto" \

