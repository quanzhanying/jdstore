CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider: 'ASW'
      aws_access_key_id: ENV[AKIAITWSS7ZRV3XQBBAQ],
      aws_secret_acess_key: ENV[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]

      region: 'ap-northeast-2

    }
    config.fog_directory = EVN(jdonline-bucket)


  else
    config.storage :files
  end
end
