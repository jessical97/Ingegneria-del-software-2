# Base application class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end