class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  config.time_zone = 'Central Time (US & Canada)'
end
