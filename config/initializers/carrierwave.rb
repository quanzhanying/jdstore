CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV["AKIAJC74R3NC7ZYFCKZQ"],
      aws_secret_access_key:  ENV["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"],
      region:                 'Tokyo'
    }
    config.fog_directory =     ENV["kevinsun"]

  else
    config.storage :file
  end
end
