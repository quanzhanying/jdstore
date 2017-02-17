CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAI7YGBEIBIJKWL4RQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-northeast-1"]

    }
    config.fog_directory  = ENV["fullstack-kai"] 


  else
    config.storage :file
  end
end
