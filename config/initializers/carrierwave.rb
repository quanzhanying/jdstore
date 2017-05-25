CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
  provider: 'AWS',
      aws_access_key_id:     ENV["AKIAJOBFSCAOYGYKVVBA"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-southeast-1"]
}

config.fog_directory  = ENV["fullstack-justin"]


  else
    config.storage :file
  end
end
