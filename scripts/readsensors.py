#!/usr/bin/python
import commands
import os
import sys
sys.path.append("/home/pi/project/WeatherStation/library/Adafruit_BMP085")
import re
import datetime
import subprocess
import time
import smbus
from Adafruit_BMP085 import BMP085


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
def readDS18B20():
	
	tempRead = -100.0
	cmdStat, cmdOut = commands.getstatusoutput("cat /sys/bus/w1/devices/28-000005f40f1c/w1_slave")
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
# readDHT11 - Read DHT11 sensor (Humidity)
#------------------------------------------------------------------------
def readDHT11():
	humRead = -100.0
	reading = 0
	while (humRead == -100.0 and reading < 10):	
		#try to read 10 times, because sometimes it get errors
		cmdStat, cmdOut = commands.getstatusoutput("sudo python /home/pi/project/WeatherStation/library/Adafruit_Python_DHT/examples/AdafruitDHT.py 11 17")
		dbgprint("DHT11 output: " + str(cmdOut))
	
		# Parse output
		if cmdStat == 0:
			matchObj = re.search( r'(.*) Humidity=(.*)%', cmdOut, re.M|re.I)
			if matchObj:
				humRead = float(matchObj.group(2))
				dbgprint("Humidity: " + str(humRead))
			else:
				dbgprint("No match during DHT11 output parse!!")
		else:
			dbgprint("Error reading DHT11 sensor")
		reading += 1
	return humRead

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
# readGY30 - Read GY30/BH1750FVI digital light sensor (Digital light sensor)
#------------------------------------------------------------------------
def readBH1750():	
	bus = smbus.SMBus(1) # (1)for RasPi 512MB or (0) for RasPi 256MB
	addr = 0x23 # i2c address
	luxRead = bus.read_i2c_block_data(addr,0x11)
	##dbgprint("Luminosity " + str((luxRead[1] + (256 * readlux[0])) / 1.2) + "lx")
	dbgprint("Lux: "+str(luxRead[1]* 10))
	return luxRead[1]*10
    
#------------------------------------------------------------------------
# writeHTML - Write HTML block to show current values
#------------------------------------------------------------------------
def writeHTML(to, ti, hu, pa, al, lu):
    vNow = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    html = open("/var/www/WeatherStation/current.html", "w")	
	
    html.write('    	<div class="row">\n')
    html.write('			<div class="col-md-12">\n')
    html.write('  				<div class="panel panel-primary">\n')
    html.write('  	  				<div class="panel-heading" style="text-align:left">Datum in cas zadnje osvezitve: '+str(vNow)+'</div>\n')
    html.write('					<div class="panel-body">\n')
    html.write('		<div class="row">\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-info">\n')
    html.write('  	  				<div class="panel-heading">Zunanja temepratura</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(to,1))+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Notranja temperatura</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(ti)+'<small> &deg;C</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('    		<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-danger">\n')
    html.write('  	  				<div class="panel-heading">Zracni tlak</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(pa,1))+'<small> hPa</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-danger">\n')
    html.write('  	  				<div class="panel-heading">Vlaznost</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(hu)+'<small> %</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-warning">\n')
    html.write('  	  				<div class="panel-heading">Nadmorska visina</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(round(al))+'<small> m</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.write('			</div>\n')
    html.write('			<div class="col-md-2">\n')
    html.write('  				<div class="panel panel-info">\n')
    html.write('  	  				<div class="panel-heading">Osvetljenost</div>\n')
    html.write('					<div class="panel-body" style="text-align: center">\n')
    html.write('						<h1>'+str(lu)+'<small> lx</small></h1>\n')
    html.write('					</div>\n')
    html.write('				</div>\n')
    html.close()

    curr = open("/var/www/WeatherStation/current.txt", "w")
    curr.write(str(vNow)+';'+str(round(to,1))+';'+str(ti)+';'+str(round(pa))+';'+str(hu)+';'+str(al)+';'+str(lu)+'\n')
    curr.close()

#------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------

tempExt = readDS18B20()
humid = readDHT11()
tempi, press, altit = readBMP085()
luxmeter = readBH1750()
#write to RRD archive
cmd = '/usr/bin/rrdtool update /home/pi/project/WeatherStation/weatherRRD.rrd -t tempo:tempi:press:humid:altit:luxmeter N:'
cmd = cmd +str(tempExt)+':'+str(tempi)+':'+str(press)+':'+str(humid)+':'+str(altit)+':'+str(luxmeter)
cmdStat, cmdOut = commands.getstatusoutput(cmd)
dbgprint("RRD write result: "+str(cmdStat))

writeHTML(tempExt, tempi, humid, press, altit, luxmeter)

dbgprint ("End!")