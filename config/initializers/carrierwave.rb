CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
  provider: 'AWS',
      aws_access_key_id:     ENV["AKIAJB62X4N3ZN6ZFJEA"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-southeast-1"]
}

config.fog_directory  = ENV["jdstore-justin"]


  else
    config.storage :file
  end
end
