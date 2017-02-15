CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV["AKIAJEMWUUAHFHYSDGPQ"],

      aws_secret_access_key: ENV["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"],

      region:                 'ap-northeast-1'
    }
    config.fog_directory = ENV["bookstore001"]

  else
    config.storage :file

  end
end
