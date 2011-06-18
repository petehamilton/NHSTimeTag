class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :text_message, :google_voice
end
