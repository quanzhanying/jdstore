CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'fog/aws',
      aws_access_key_id:     ENV["AKIAJLL3VYVMDV654LXA"],      # 你的 key


      aws_secret_access_key: ENV["ShXLSCQaab33IvdyJlEC9u9cm2hDqgjE49/UVT8B"],      # 你的 secret key


      region:                'us-west-2' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["fullstack-hn"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
