# 現状ここが実行ポイントになっている
require "./osc_class_require"


c = Osc::Client.new("127.0.0.1", 4001)
c.send("/test", "helloworld")