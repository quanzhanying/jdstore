CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              "AWS",
      aws_access_key_id:     ENV["pusher_key"],

      aws_secret_access_key: ENV["pusher_secret"],

      region:                'us-west-2'
    }
    config.fog_directory  = ENV["jingdong.mike"]



  else
    config.storage :file
  end
end
