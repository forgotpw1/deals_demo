require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJACI54AAPE37VUKA',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'pvd-photos'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
