module Osc
  class Message
    
    #
    # OSC::Message.new( "/greeting" , "hullo!" )
    #
    def initialize(address, *args)
      @address = address
      #ここではまだ引数を代入しない
      @args = []

      args.each do |arg|
        case arg
        when Integer
          @args << OSCInt32.new(arg)
        when Float
          @args << OSCFloat32.new(arg)
        when String
          @args << OSCString.new(arg)
        when OSCArgument
          @args << arg
        end
      end
      
    end

    def tags() @args.collect{|x| x.tag}.join end


    def encode
      s = OSCString.new( @address ).encode
      s << OSCString.new( ',' + tags ).encode
      s << @args.collect{|x| x.encode}.join
    end



  end
end








#
# @client.send( OSC::Message.new( "/greeting" , "hullo!" ))
#
