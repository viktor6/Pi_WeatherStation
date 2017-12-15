#! /usr/bin/env python
# -*- coding: utf-8 -*-
import commands
import os
import sys
sys.path.append("/home/pi/bazy/library/Adafruit_BMP085")
import re
import datetime
import subprocess
import time
import smbus
import Adafruit_BMP.BMP085 as BMP085


#------------------------------------------------------------------------
# readsensors.py
#------------------------------------------------------------------------

#Enable 1-wire GPIO
os.system("modprobe w1-gpio")
os.system("modprobe w1-therm")
#Enabled automatically adding these 2 lines to /etc/modules:
#   w1-gpio
#   w1-therm
#------------------------------------------------------------------------
# dbgprint - Print debug info (if program is started widh "-d" parameter
#------------------------------------------------------------------------
def dbgprint (vString):
	if len(sys.argv) > 1:
		if sys.argv[1] == "-d": 	#debug mode
			timestamp = datetime.datetime.now()
			print str(timestamp) + " - " + vString

#------------------------------------------------------------------------
# readDS18B20 - Read DS18B20 sensor (exterior temperature)
#------------------------------------------------------------------------
def readDS18B20a():
	
	tempRead = -100.0
	cmdStat, cmdOut = commands.getstatusoutput("cat /sys/bus/w1/devices/28-ab4058126461/w1_slave")
	dbgprint("DS18B20 output: " + str(cmdOut))

	# Parse output
	if cmdStat == 0:
		matchObj = re.search(r'.*crc=\S*\s(\S*)[\n].*t=(.*)',cmdOut,re.I)
		if matchObj:
			if matchObj.group(1) == 'YES':
				tempRead = float(int(matchObj.group(2))/1000.0)
				dbgprint("Exterior Temperature: "+str(tempRead))
			else:
				dbgprint("DS18B20 returned CRC error.")
		else:
			dbgprint("No match during DS18B20 output parse!!")
	else:
		dbgprint("Error reading DS18B20 sensor")
	return tempRead

#------------------------------------------------------------------------
# readDS18B20 - Read DS18B20 sensor (exterior temperature)
#------------------------------------------------------------------------
def readDS18B20b():
	
	tempRead = -100.0
	cmdStat, cmdOut = commands.getstatusoutput("cat /sys/bus/w1/devices/28-7d4358126461/w1_slave")
	dbgprint("DS18B20 output: " + str(cmdOut))

	# Parse output
	if cmdStat == 0:
		matchObj = re.search(r'.*crc=\S*\s(\S*)[\n].*t=(.*)',cmdOut,re.I)
		if matchObj:
			if matchObj.group(1) == 'YES':
				tempRead = float(int(matchObj.group(2))/1000.0)
				dbgprint("Exterior Temperature: "+str(tempRead))
			else:
				dbgprint("DS18B20 returned CRC error.")
		else:
			dbgprint("No match during DS18B20 output parse!!")
	else:
		dbgprint("Error reading DS18B20 sensor")
	return tempRead	
	
#------------------------------------------------------------------------
# readBMP085 - Read BMP085 sensor or BMP180 (Interior temperature, atmospheric pressure and altitude sensor)
#------------------------------------------------------------------------
def readBMP085():
	bmp = BMP085.BMP085()
	tempiRead = bmp.read_temperature()
	dbgprint("Interior Temperature: " + str(tempiRead))
	pressRead = bmp.read_pressure()/100.0
	dbgprint("Pressure: " + str(pressRead))
	altitRead = bmp.read_altitude()
	dbgprint("Altitude: " + str(altitRead))
	return tempiRead, pressRead, altitRead
	    
#------------------------------------------------------------------------
# writeHTML - Write HTML block to show current values
#------------------------------------------------------------------------
def writeHTML(to, ti, hu, pa, al, lu, tb):
    vNow = datetime.datetime.now().strftime("%d-%m-%Y %H:%M:%S")
    html = open("/var/www/html/web/current.html", "w")	
	
    html.write('    	<div class="row">\n')
    html.write('			<div class="col-md-12">\n')
    html.write('  				<div class="panel panel-primary">\n')
    html.write('  	  				<div class="panel-heading" style="text-align:left">Дата и время последнего обновления1: '+str(vNow)+'</div>\n')
    html.write('					<div class="panel-body">\n')
    html.write('		<div class="row">\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-info">\n')
    html.write('  	  				<div class="panel-heading">Наружная температура</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(to,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Температура в комнате</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(ti)+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('    		<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-danger">\n')
    html.write('  	  				<div class="panel-heading">Давление воздуха</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(pa,1))+'<small> hPa</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-danger">\n')
    html.write('  	  				<div class="panel-heading">Наружная температура1</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(hu)+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Наружная температура2</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(al))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Наружная температура tb</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(tb,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-info">\n')
    html.write('  	  				<div class="panel-heading">Наружная температура3</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(lu,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.close()

    curr = open("/var/www/html/web/current.txt", "w")
    curr.write(str(vNow)+';'+str(round(to,1))+';'+str(ti)+';'+str(round(pa))+';'+str(hu)+';'+str(al)+';'+str(lu)+';'+str(tb)+'\n')
    curr.close()

#------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------

tempExt = readDS18B20a()
humid = readDS18B20a()
tempi, press, altit = readBMP085()
luxmeter = readDS18B20a()
temptb = readDS18B20b()
#write to RRD archive
cmd = '/usr/bin/rrdtool update /home/pi/bazy/weatherRRD.rrd -t tempo:tempi:press:humid:altit:luxmeter:temptb N:'
cmd = cmd +str(tempExt)+':'+str(tempi)+':'+str(press)+':'+str(humid)+':'+str(altit)+':'+str(luxmeter)+':'+str(temptb)
cmdStat, cmdOut = commands.getstatusoutput(cmd)
dbgprint("RRD write result: "+str(cmdStat))

writeHTML(tempExt, tempi, humid, press, altit, luxmeter, temptb)

dbgprint ("End!")