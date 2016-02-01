class ApplicationController < ActionController::Base

  before_action :allow_cross_domain

  def allow_cross_domain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
  end

  protect_from_forgery with: :exception
end
