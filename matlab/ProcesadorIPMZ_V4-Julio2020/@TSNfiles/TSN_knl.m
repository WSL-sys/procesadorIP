function MAC=getMAC()
IP = java.net.InetAddress.getLocalHost;
MAC = java.net.NetworkInterface.getByInetAddress(IP).getHardwareAddress;

if MAC ==    [0;33;112;-116;33;-117]
    MAC = 1;
else
    MAC = 0;
end