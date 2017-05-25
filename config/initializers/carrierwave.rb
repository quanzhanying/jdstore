CarrierWave.configure  do  | config |
  if  Rails.env.production?
    config.fog_provider  =  'fog'
    config.fog_credentials  =  {
      provider:               'AWS' ,
      aws_access_key_id:      ENV["AKIAJ7QLCDOV3WXSR5CQ"],

      aws_secret_access_key: ENV["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"],

      region:                 ENV["us-east-1"]

    }
    config.fog_directory   =  ENV["timolive"]


  else
    config.storage  :file
  end
end
