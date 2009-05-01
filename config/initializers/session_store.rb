# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_amf_session',
  :secret      => 'c9714fe08d4a475308ddb2df2da5abd669fb185d7b1d1b439fb692b1ae2ab010bd3a6c6759402a2ef0691347700a29d4785a8bf631039768cbd5188391dc51eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
