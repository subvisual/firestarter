if Rails.env.production? || Rails.env.staging?
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
    config.host    = ENV['AIRBRAKE_HOST']
    config.port    = ENV['AIRBRAKE_PORT'] || 443
    config.secure  = (config.port == 443)
  end
end
