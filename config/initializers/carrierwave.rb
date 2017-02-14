CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'fog',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],      # 你的 key


      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],      # 你的 secret key


      region:                'us-west-2' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["fullstack-hn"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
