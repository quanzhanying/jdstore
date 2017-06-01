CarrierWave.configure do |config|
  config.storage                 = :qiniu
  config.qiniu_access_key        = ENV["VsGsUSDxObeoiA6thpLvb3eu5VC7JgktcBqyyBqF"]
  config.qiniu_secret_key        = ENV["P_7O5UN7Ffo8ySmSfwiWMTSw_Gbtx6VhUHmMjMc9"]
  config.qiniu_bucket            = ENV["jdstore-demo"]
  config.qiniu_bucket_domain     = ENV["oqviybjt1.bkt.clouddn.com"]
  config.qiniu_block_size        = 4*1024*1024
  config.qiniu_protocol          = "http"
  config.qiniu_up_host           = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同
end
