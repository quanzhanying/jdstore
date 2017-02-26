CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],

      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],

      region:                ENV["AWS_REGION"]

    }
<<<<<<< HEAD
    config.fog_directory  = ENV["AWS_BUCKET_NAME"]
=======
    config.fog_directory  = ENV["AWS_BUCKET_NAME"] 
>>>>>>> a98bfe1116d5cbaeae93ca81f392eb0ff5a694ab


  else
    config.storage :file
  end
end
