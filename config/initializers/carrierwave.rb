CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["Sk-seimaTqUuB8iKOj2LWPEbBMODXpkrQgKH7oGy"]
  config.qiniu_secret_key    = ENV["0dZ_O2yte6iamd3SzOsVcI0MnWR1k4bXoA-ZQ0yu"]
  config.qiniu_bucket        = ENV["realanalysis"]
  config.qiniu_bucket_domain = ENV["olzw7m80w.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
