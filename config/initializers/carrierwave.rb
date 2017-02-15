require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJXMYA22FVX6OLASQ"],      # 你的 key


      aws_secret_access_key: ENV["r0+tD8b+fJQr8c3UC7GoJVyrX058Hoq32wXVSmMY"],      # 你的 secret key


      region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置


    }

    config.fog_directory  = ENV["fullstack-dong"] # 你设定的 bucket name
    config.storage :fog



  else
    config.storage :file
  end
end
