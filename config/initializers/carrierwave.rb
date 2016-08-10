CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('AWS_BUCKET_NAME')
    config.aws_acl    = 'public-read' 

                        
    config.aws_credentials = {
                     
      access_key_id:     ENV.fetch["AWS_ACCESS_KEY_ID"],           

      secret_access_key: ENV.fetch["AWS_SECRET_ACCESS_KEY"],          

      region:                'Tokyo' 

    }


  else
    config.storage :file
  end
end