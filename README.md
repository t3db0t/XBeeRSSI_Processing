##XBee ZB RSSI Reader
---

A super simple XBee ZB RSSI Reader for Processing/Java that uses the [XBee-API library](https://github.com/eatnumber1/xbee-api) by Andrew Rapp.  Given 2 XBees, this program will tell you the RSSI (Received Signal Strength Indicator) in dBm between them.

This repo contains the compiled jars in the code/ folder for convenience.

##How to Use
---

1. Clone or [download this repo](https://github.com/virgildisgr4ce/XBeeRSSI_Processing/zipball/master) and put it in your Processing sketches folder.
1. You need two XBees, a power source for the remote XBee, and some way of talking to one of them over serial (such as a [USB Explorer](http://www.sparkfun.com/products/8687)).  No Arduino or microcontroller of any kind is necessary.
1. The remote XBee just needs power and ground connected—nothing else.  Do this however you want, just remember that the voltage CANNOT EXCEED 3.3V or it will damage the module.
1. Get the address of the remote XBee by plugging it into your Explorer, opening a serial terminal to it (I use [CoolTerm](http://freeware.the-meiers.org/)), entering command mode (+++, no return), and typing ATSH and ATSL.  These are the high and low components of the 64-bit address (like a serial number).  Write them down.
1. While your remote XBee is plugged in, set its PAN ID to whatever you want by doing ATID5555 and then ATWR to save it.
1. The local XBee—the one that will stay connected to your computer via the USB Explorer—needs to be running Coordinator firmware.  Digi forces you to use X-CTU to do that, sadly.  (The remote XBee can be running any non-Coordinator firmware, such as what it shipped with, which is usually router firmware.)
1. Change your serial port in XBeeZB_RSSI_Reader.pde to whatever port your Explorer is plugged into.  On *nix / OSX, run ls /dev/tty.usb* in a terminal.  (If you have other FTDI-based serial devices plugged in you'll see those too, so you need to figure out which is which.)
1. Put your remote XBee address in.  The first 4 hex numbers will always be 0, 0x13, 0xa2, 0.
1. Power up your remote XBee and make sure the local XBee is plugged into your USB Explorer, which should be plugged into your computer. Use your serial terminal to change this XBee's PAN ID to the same you used before.
1. Start the Processing sketch.
1. You will see some warnings saying that log4j isn't configured and so forth.  Setting up log4j adds needless complexity for this task so ignore it.
1. Assuming both XBees are powered and associated with each other, you should start seeing "DB is -something" printed out repeatedly.  If you see a runtime error, it's because the remote XBee isn't reachable for one reason or another (so start testing with them close to each other to make sure they work).
1. Have fun, let me know it worked for you on my blog, and show me what cool stuff you make!