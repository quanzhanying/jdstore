CarrierWave.configure  do  | config |
  if  Rails.env.production?
    config.fog_provider  =  'fog'
    config.fog_credentials  =  {
      provider:               'AWS' ,
      aws_access_key_id:      ENV [ "AKIAIB3AVHH5B4R6W4WQ" ],

      aws_secret_access_key: ENV [ "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" ],

      region:                 ENV [ "us-east-1" ]

    }
    config.fog_directory   =  ENV [ "timolive" ]


  else
    config.storage  :file
  end
end
