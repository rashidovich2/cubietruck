SERIAL_DEVICE=${SERIAL_DEVICE:-"/dev/ttyUSB0"} # Assuming Prolific PL2303 like chip

echo "Set write permission (temporary)"
sudo chmod 666 ${SERIAL_DEVICE}
ls -l ${SERIAL_DEVICE}

echo "Turning off output hardware flow control on ${SERIAL_DEVICE} - No RTS and no CTS wires on PL2303 cables."
# See also http://www.tldp.org/HOWTO/Serial-HOWTO-4.html"

stty -F ${SERIAL_DEVICE} -crtscts  #echo "Connecting to serial device"

echo "Connecting to ${SERIAL_DEVICE} ... "
sudo cu -s 115200 -l ${SERIAL_DEVICE} 
