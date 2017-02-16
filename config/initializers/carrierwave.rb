CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],      # AKIAIFV2ZEV6UVHJRQHA


      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],      # zBWsBZRNxeKFfrnNlwgVWPzzMZLkiBsrtqodyfCw


      region:                'eu-west-1' # Tokyo


    }
    config.fog_directory  = ENV["AWS_BUCKET_NAME"] # kevinyu



  else
    config.storage :file
  end
end
