CarrierWave.cofigure do |config|
  if Rails.evn.production?
    config.fog_provider = "fog"
    config.fog_credentials = {
      provider:               "AWS",
      aws_access_key_id:      EVN["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key:         EVN["AWS_SECRET_ACCESS_KEY"],
      region:                 EVN["AWS_REGION"]
    }
    config.fog_directory = EVN["AWS_BUCKET_NAME"]
  else
    config.storeage :file
  end

end
