CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAI2UKHWBJLVXFRMSQ"],

      aws_secret_access_key: ENV["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"],

      region:                ENV["ap-northeast-1"]

    }
    config.fog_directory  = ENV["jdstore2"] 


  else
    config.storage :file
  end
end
