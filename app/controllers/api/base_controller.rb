module Api
  class BaseController < ApplicationController
    before_action :restrict_access

    def restrict_access
      authenticate_or_request_with_http_token do |token|
        ak = ApiKey.find_by(key: token)
        if ak.present?
          true
        else
          false
        end
      end
    end

  end
end
