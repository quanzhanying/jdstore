CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["QZxWi9mlcvVBMqfkUoC4sdnQ25lC45WyEoRbCvEa"]
  config.qiniu_secret_key    = ENV["0T4EAOp4nDpCdyWqDu7PswCLjymmGwUc01bXCLNz"]
  config.qiniu_bucket        = ENV["jdstore-demo"]
  config.qiniu_bucket_domain = ENV["oqg7yz139.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up-z1.qiniu.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
