require "socket"
require "./osc_class_require"

udp = UDPSocket.new
udp.connect("127.0.0.1", 4001)

osc_message = Osc::Message.new( "/ogawa" , "helloworld" )
    
udp.send(osc_message.encode, 0)
