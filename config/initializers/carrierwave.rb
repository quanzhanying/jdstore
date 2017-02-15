CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAIIRDV4223L5RC3RQ"],      # 你的 key


      aws_secret_access_key: ENV["UnN5/lDKPPdQNy1CMURf+m4VOCcpBaJXrzFnCsIj"],      # 你的 secret key


      region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["fullstack-wx"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
