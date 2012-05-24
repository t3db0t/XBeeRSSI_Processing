import processing.serial.*;

XBee xbee;
XBeeResponse response;
XBeeAddress64 addr64;

void setup() {
  println("STARTING");
  try { 
    // Receiver's address
    addr64 = new XBeeAddress64(0, 0x13, 0xa2, 0, 0x40, 0x77, 0x5e, 0x1c);
    
    xbee = new XBee();
    // replace with your serial port
    xbee.open("/dev/tty.usbserial-A7004noc", 9600);
  } 
  catch (Exception e) {
    println("XBee failed to initialize");
    e.printStackTrace();
    System.exit(1);
  }
}

void draw() {
  try {
    RemoteAtRequest request = new RemoteAtRequest(addr64, "DB");
    RemoteAtResponse response = (RemoteAtResponse) xbee.sendSynchronous(request, 10000);

    if (response.isOk()) {
        String val = ByteUtils.toBase10(response.getValue());
        println("DB is -" + val);
    } else {
        throw new RuntimeException("error " + response.getStatus());
     }
    
    delay(1000);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
}
