# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
end
