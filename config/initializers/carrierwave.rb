
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAITWSS7ZRV3XQBBAQ"],      # 你的 key


      aws_secret_access_key: ENV["W/5bgUc4SN0REgs+RaVDBUe6mTunLx3HA6isXodz"],      # 你的 secret key


      region:                'ap-northeast-2' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["jdonline-bucket"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
