# CarrierWave.configure do |config|
#   config.storage             = :qiniu
#   config.qiniu_access_key    = ENV["qiniu_access_key"]
#   config.qiniu_secret_key    = ENV["qiniu_secret_key"]
#   config.qiniu_bucket        = ENV["qiniu_bucket"]
#   config.qiniu_bucket_domain = ENV["qiniu_bucket_domain"]
#   config.qiniu_block_size    = 4*1024*1024
#   config.qiniu_protocol      = "http"
#   config.qiniu_up_host       = "http://up-z2.qiniu.com"  #选择不同的区域时，"up.qiniug.com" 不同
#
# end
# 
CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],

      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],

      region:                ENV["AWS_REGION"]

    }
    config.fog_directory  = ENV["AWS_BUCKET_NAME"]


  else
    config.storage :file
  end
end
