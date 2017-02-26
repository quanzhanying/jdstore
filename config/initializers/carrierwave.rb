CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["4dg8_gZJ_RwL4t847hd8NdAM0sP6ewKWoA80wtEx"]
  config.qiniu_secret_key    = ENV["OJYnRHwHD7ndG8vwSRwEjO0weJRt-wUwHSqrLvIi"]
  config.qiniu_bucket        = ENV["jdstore-demo"]
  config.qiniu_bucket_domain = ENV["ols6vd1wm.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
