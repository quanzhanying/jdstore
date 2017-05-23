CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["qRZa6nPupVfm4uvN6S5ijxW0iyY8___XZH3jyW_e"]
  config.qiniu_secret_key    = ENV["jptGFznxuBInxtVBQmPpoV-xodNO_YwpOf248dYI"]
  config.qiniu_bucket        = ENV["jdstore"]
  config.qiniu_bucket_domain = ENV["oq3bof327.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
