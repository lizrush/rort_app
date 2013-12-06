# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
RortApp::Application.config.secret_key_base = '12a7d3dab7508b241725d4c8e07964b1518f691746cf54985012646f65ac971fda7b3cf3308179300709c42dc3cc73567cb4345c7c06846aa38085049854b51d'


require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token