# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if ENV['USE_PASSWORDS'] == 'yup'
  use Rack::Auth::Basic, 'omg' do |username, password|
    logins = [
              ['amaze and delight', 'eight dollars for water'], # new
             ]
    
    logins.include? [username, password]
  end
end

run CtfRegistrar::Application
