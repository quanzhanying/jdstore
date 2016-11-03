CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAI5WNMT3E6COMPHIQ"],      # 你的 key


      aws_secret_access_key: ENV["ReXihnh9CurSAELNuus4vx7dj5sATbT7bCVBfrKm"],      # 你的 secret key


      region:                'eu-central-1	' # 你的 S3 bucket 的 Region 位置


    }
    config.fog_directory  = ENV["jdstore-bucket"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
