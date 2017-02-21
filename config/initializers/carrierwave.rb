CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJGGKYVHEQESJLYGQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["us-east-1"]

    }
    config.fog_directory  = ENV["superlei"] 


  else
    config.storage :file
  end
end
