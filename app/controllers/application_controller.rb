class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include StudentDataHelper
  config.time_zone = 'Central Time (US & Canada)'
end
