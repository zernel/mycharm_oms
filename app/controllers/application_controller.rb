class ApplicationController < ActionController::Base
  include SelectTab
  protect_from_forgery with: :null_session
  before_filter :authenticate_admin!
end
