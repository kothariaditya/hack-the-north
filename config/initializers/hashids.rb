Hashid::Rails.configure do |config|
  # The salt to use for generating hashid. Prepended with table name.
  config.salt = ENV['hashids_salt'] || "a9sfj8923jw9jfw393je"

  # The minimum length of generated hashids
  config.min_hash_length = 10

  # The alphabet to use for generating hashids
  config.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

  # Whether to override the `find` method
  config.override_find = true
end
