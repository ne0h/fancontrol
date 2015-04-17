import serial
import datetime

logFilePath = "temperature.log"

def main():

	# get current temperature and read temperature until newline appears
	# send command 'get' to micro controller and what for answer
	port = serial.Serial("/dev/ttyACM0", 38400)
	port.write("get\n")

	buffer = "";
	while (c = port.read()) == '\n':
		buffer += c;
	port.close()

	# calculate actual temperature from raw sensor output
	# sensor outputs 10mV per degree including 500mV offset for negative values
	# calculation considers 5V ADC input
	temperature = (((buffer * 5) / 1024) - 0.5) * 100

	# write temperature to log file
	logFile = open(logFilePath, "a")
	logFile.write(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " " + temperature + "\n")
	logFile.close()

if __name__ == "__main__":
	main()
