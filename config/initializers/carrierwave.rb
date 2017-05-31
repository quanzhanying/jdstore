CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["04fWYM1u7ZsFZCMMa34XOzGbmmUvUa1iRxxHhLtD"]
  config.qiniu_secret_key    = ENV["72ULQ3TJr6Mfs3S_Q9ZMvMSfPECCfS_-P77D4edw"]
  config.qiniu_bucket        = ENV["aliceguo2017-1"]
  config.qiniu_bucket_domain = ENV["onbqi9gro.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up-z2.qiniu.com"  #华南

end


# AWS::S3::Base.establish_connection!(:access_key_id   => ENV['qiniu_key'],:secret_access_key => ENV['qiniu_secret'])
