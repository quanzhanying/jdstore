CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["p28gRNWX54KxzPNDVIUIfyiLyI380uk3yRfBGPFa"]
  config.qiniu_secret_key    = ENV["gSmYFopOi2uyL3NrhGhWpN1QrINzfy_UL88sC-u3"]
  config.qiniu_bucket        = ENV["jdstore-demo"]
  config.qiniu_bucket_domain = ENV["oqkgc7nbu.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up-z2.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
