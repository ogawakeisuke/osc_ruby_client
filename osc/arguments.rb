あああ
module Osc
  class Argument
    attr_accessor :val

    def initialize(val) 
      @val = val 
    end

  private
    # うーん
    def padding(s)
      s + ("\000" * ((4 - (s.size % 4)) % 4))
    end
  end


  #
  # valに対し型に応じたエンコードを提供するクラスたち
  # ここが核。ここでOSCメッセージをエンコードする。
  # 見てみるとつまり、packとforce_encodingを行うということであった
  #
  class OSCInt32 < Argument
    def tag() 'i' end
    def encode() [@val].pack('N').force_encoding("BINARY") end
  end

  class OSCFloat32 < Argument
    def tag() 'f' end
    def encode() [@val].pack('g').force_encoding("BINARY") end 
  end

  class OSCString < Argument
    def tag() 's' end
    def encode() padding(@val.sub(/\000.*\z/, '') + "\000").force_encoding("BINARY") end
  end

  class OSCBlob < Argument
    def tag() 'b' end
    def encode() padding([@val.size].pack('N') + @val).force_encoding("BINARY") end
  end

end