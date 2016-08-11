CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage :aws 
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV.fetch("AWS_ACCESS_KEY_ID"),                        # required
      :aws_secret_access_key  => ENV.fetch("AWS_SECRET_ACCESS_KEY"),
      :region  => ENV.fetch("AWS_BUCKET_REGION")                       # required
    }
    config.aws_bucket  = ENV.fetch('AWS_BUCKET_NAME')                     # required
  else
    config.storage :file
  end
end