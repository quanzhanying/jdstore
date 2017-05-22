CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["w_430qhWjAbbFISus8Ci8Uzh8gixaZzRu44l3PhA"]
  config.qiniu_secret_key    = ENV["aY9et9d109E4ZJqbMMak1hwgjSmLUPNzRjv26Rkl"]
  config.qiniu_bucket        = ENV["jdstore-demo"]
  config.qiniu_bucket_domain = ENV["oqcd7eje4.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
