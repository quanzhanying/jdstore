CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAJFU4P4O4RNSYDNLA"],      # 你的 key

      aws_secret_access_key: ENV["AKIAJFU4P4O4RNSYDNLA"],      # 你的 secret key

      region:                'us-west-2' # 你的 S3 bucket 的 Region 位置

    }
    config.fog_directory  = ENV["zmlfdogw"] # 你設定的 bucket name


  else
    config.storage :file
  end
end
