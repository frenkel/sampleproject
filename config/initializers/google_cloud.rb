require 'google/cloud/error_reporting'

Google::Cloud.configure do |config|
  config.use_error_reporting = true
end
Google::Cloud::ErrorReporting.configure do |config|
  config.ignore_classes = [ActionController::RoutingError]
end
