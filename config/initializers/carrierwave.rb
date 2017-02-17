require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJN2J2W3R2GXFJKEQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["Tokyo"]

    }
    config.storage :fog
    config.fog_directory  = ENV["qingqing-fullstack"]


  else
    config.storage :file
  end
end
