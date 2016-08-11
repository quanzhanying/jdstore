CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAIW3GYLQCG5SHDP2Q"],      # 你的 key

      aws_secret_access_key: ENV["pJnzJIfDtdU/cZQvl7GZVrvp4z4zE2YRhr7vbvKo"],      # 你的 secret key

      region:                'us-east-1' # 你的 S3 bucket 的 Region 位置

    }
    config.fog_directory  = ENV["jdstore-li"] # 你設定的 bucket name


  else
    config.storage :file
  end
end
