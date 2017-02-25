CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["DVVXE1vJb84CmQwdXqwoZ9aRWcgPL1l908luYdzB"]
  config.qiniu_secret_key    = ENV["nU5L2BMQ2WG_tDlXKNdKcD3F1EJkgs2mfW8-ciwx"]
  config.qiniu_bucket        = ENV["fullstack"]
  config.qiniu_bucket_domain = ENV["olvk3tr4z.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同
end
