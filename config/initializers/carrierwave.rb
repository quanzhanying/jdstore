CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
  provider: 'AWS',
      aws_access_key_id:     ENV["AKIAIAXRUSY6PENWBMMA"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-southeast-1"]
}

config.fog_directory  = ENV["fullstack-justin"]


  else
    config.storage :file
  end
end
