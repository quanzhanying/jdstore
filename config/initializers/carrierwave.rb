CarrierWave.configure do |config|
  config.storage :fog 
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
    :region  => 'tokyo'                        # required
  }
  config.fog_directory  = ENV["AWS_BUCKET_NAME"]                     # required
end