# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter, ENV["TWITTER_ID_PRODUCTION"], ENV["TWITTER_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter, ENV["TWITTER_ID_DEVELOPMENT"], ENV["TWITTER_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
  end

  config.mailer_sender = 'noreply@yourdomain'

  config.secret_key = ENV["DEVISE_SECRET_KEY"]

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [:email]



  config.skip_session_storage = [:http_auth]


  config.stretches = Rails.env.test? ? 1 : 11

  # Set up a pepper to generate the hashed password.
  # config.pepper = 'b141187cf91d746148b55d433437235de6dbe7f879e6d53bd9f4b0fe7654e9b6045ed66fec50a10bf4c2987a2b9d192e93180ccffc916906ffa75f23df66c486'

  # Send a notification email when the user's password is changed
  # config.send_password_change_notification = false

  config.reconfirmable = true

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 6..128

  # Email regex used to validate email formats. It simply asserts that
  # one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/




  config.reset_password_within = 6.hours


  config.sign_out_via = :delete

end
