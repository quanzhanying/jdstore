CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJUSAPJJ6BJKTXQFA"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-northeast-1"]
    }
    config.fog_directory = ENV["lihaihao"]

  else
    config.storage :file
  end
end
