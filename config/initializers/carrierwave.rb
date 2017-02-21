CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJVFQF6ZVOEQKU4LQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-northeast-1"]

    }
    config.fog_directory  = ENV["fullstacknata01"] 


  else
    config.storage :file
  end
end
