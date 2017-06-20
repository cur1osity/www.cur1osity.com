if Rails.env.production?

Recaptcha.configure do |config|
 config.site_key = ENV['site_key']
  end

else

Recaptcha.configure do |config|
  config.site_key  = '6LcKMyYUAAAAAGfXJba8V7f98UIH6Kt1RWszGGXm'

end

 end

