#! /usr/bin/env python
# -*- coding: utf-8 -*-
import commands
import os
import sys
sys.path.append("/home/pi/scripts/library/Adafruit_BMP085")
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
# readDS18B20 - Read DS18B20 sensor (exterior temperature) Температура на Улице
#------------------------------------------------------------------------
def readDS18B20a():
	
	tempRead = -0
	cmdStat, cmdOut = commands.getstatusoutput("cat /sys/bus/w1/devices/28-1f653c126461/w1_slave")
	dbgprint("DS18B20 output: " + str(cmdOut))

	# Parse output
	if cmdStat == 0:
		matchObj = re.search(r'.*crc=\S*\s(\S*)[\n].*t=(.*)',cmdOut,re.I)
		if matchObj:
			if matchObj.group(1) == 'YES':
				tempRead = float(int(matchObj.group(2))/1000.0-1)
				dbgprint("Exterior Temperature: "+str(tempRead))
			else:
				dbgprint("DS18B20 returned CRC error.")
		else:
			dbgprint("No match during DS18B20 output parse!!")
	else:
		dbgprint("Error reading DS18B20 sensor")
	return tempRead

#------------------------------------------------------------------------
# readDS18B20 - Read DS18B20 sensor (exterior temperature) Температура на Балконе
#------------------------------------------------------------------------
def readDS18B20b():
	
	tempRead = -0
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
# readDS18B20 - Read DS18B20 sensor (exterior temperature) Температура на Кухне
#------------------------------------------------------------------------
def readDS18B20c():
	
	tempRead = -0
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
# readDS18B20 - Read DS18B20 sensor (exterior temperature) Температура в комнатной батареи
#------------------------------------------------------------------------
def readDS18B20d():
	
	tempRead = -0
	cmdStat, cmdOut = commands.getstatusoutput("cat /sys/bus/w1/devices/28-5ee327126461/w1_slave")
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
# readDS18B20 - Read DS18B20 sensor (exterior temperature) Температура на Кухне в батареи
#------------------------------------------------------------------------
def readDS18B20g():
	
	tempRead = 0
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
# readBMP085 - Read BMP085 sensor or BMP180 (Interior temperature, atmospheric pressure and altitude sensor)
#------------------------------------------------------------------------
def readBMP085():
	bmp = BMP085.BMP085()
	tempiRead = bmp.read_temperature()
	dbgprint("Interior Temperature: " + str(tempiRead))
	pressRead = bmp.read_pressure()* 0.75 / 100.0
	dbgprint("Pressure: " + str(pressRead))
	altitRead = bmp.read_altitude()
	dbgprint("Altitude: " + str(altitRead))
	return tempiRead, pressRead, altitRead
	    
#------------------------------------------------------------------------
# writeHTML - Write HTML block to show current values
#------------------------------------------------------------------------
def writeHTML(ti, pa, ta, tb, tc, td, tg):
    vNow = datetime.datetime.now().strftime("%d-%m-%Y %H:%M:%S")
    html = open("/var/www/html/current.html", "w")	
	
    html.write('    	<div class="row">\n')
    html.write('			<div class="col-md-12">\n')
    html.write('  				<div class="panel panel-primary">\n')
    html.write('  	  				<div class="panel-heading" style="text-align:left">Дата и время последнего обновления: '+str(vNow)+'</div>\n')
    html.write('					<div class="panel-body">\n')
    html.write('		<div class="row">\n')
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
    html.write('						<h1>'+str(round(pa,1))+'<small> mmHg</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Температура на Улице</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(ta,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Температура на Балконе</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(tb,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Температура на Кухне</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(tc,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Температура в комнатной батареи</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(td,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')	
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-info">\n')
    html.write('  	  				<div class="panel-heading">Температура на Кухне в батареи</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(tg,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.close()

    curr = open("/var/www/html/current.txt", "w")
    curr.write(str(vNow)+';'+str(ti)+';'+str(round(pa))+';'+str(round(ta,1))+';'+str(round(tb,1))+';'+str(round(tc,1))+';'+str(round(td,1))+';'+str(round(tg,1))+'\n')
    curr.close()

#------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------

tempta = readDS18B20a()
temptb = readDS18B20b()
temptc = readDS18B20c()
temptd = readDS18B20d()
temptg = readDS18B20g()
tempi, press, altit = readBMP085()
#write to RRD archive
cmd = '/usr/bin/rrdtool update /home/pi/scripts/weatherRRD.rrd -t tempi:press:tempta:temptb:temptc:temptd:temptg N:'
cmd = cmd +str(tempi)+':'+str(press)+':'+str(tempta)+':'+str(temptb)+':'+str(temptc)+':'+str(temptd)+':'+str(temptg)
cmdStat, cmdOut = commands.getstatusoutput(cmd)
dbgprint("RRD write result: "+str(cmdStat))

writeHTML(tempi, press, tempta, temptb, temptc, temptd, temptg)

dbgprint ("End!")