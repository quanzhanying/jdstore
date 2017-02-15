require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["S3_KEY"],      # 你的 key


      aws_secret_access_key: ENV["S3_SECRET"],      # 你的 secret key


      region:                ENV['S3_REGION'] # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["S3_BUCKET_NAME"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
