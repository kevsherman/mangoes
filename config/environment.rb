# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Mangoes::Application.initialize!

require 'pry' if development?