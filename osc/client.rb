require "socket"
module Osc
  class Client

    def initialize(host, port)
      @udp = UDPSocket.new
      @udp.connect(host, port)

    end

    def send(address, messages)
      osc_message = Osc::Message.new(address, messages)
      @udp.send(osc_message.encode, 0)
    end
  end
end