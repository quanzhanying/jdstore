CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["-kWYVXiAAbnt5y9JFYHfmnmSwLSMAS3CyHbBpA7X"]
  config.qiniu_secret_key    = ENV["QMUwH7J2OmkmjVlxg6FGB35H836mzYmSGkFOOG6a"]
  config.qiniu_bucket        = ENV["jdstore666"]
  config.qiniu_bucket_domain = ENV["oqvoq8jf8.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up-z2.qiniu.com"  #华南

end
