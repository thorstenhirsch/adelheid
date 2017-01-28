module Api
  class BaseController < ApplicationController
    skip_before_action :authenticate_user! # disable devise auth
    protect_from_forgery with: :null_session # disable csrf protection in api
    before_action :authenticate_api

    protected

    def authenticate_api
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token|
        @current_user = ApiKey.find_by(key: token).try(:user)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Bad credentials', status: :unauthorized
    end

  end
end
