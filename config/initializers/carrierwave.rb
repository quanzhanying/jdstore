CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
  provider: 'AWS',
      aws_access_key_id:     ENV["AAKIAJP2YTSEUWKB7UASQ"],

      aws_secret_access_key: ENV["oytyH2AJFS/Axl4ZTYk9x/tJk5IE2cT6M+IoDe57"],

      region:                ENV["ap-southeast-1"]
}

config.fog_directory  = ENV["fullstack-justin"]


  else
    config.storage :file
  end
end
