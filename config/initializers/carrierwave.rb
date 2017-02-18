CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJILWJQK5CKFNLAGQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-northeast-1"]

    }
    config.fog_directory  = ENV["liulupeng"]


  else
    config.storage :file
  end
end
