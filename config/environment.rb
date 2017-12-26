# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require_relative 'active_record_fk_hack'
