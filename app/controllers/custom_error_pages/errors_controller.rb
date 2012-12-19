module CustomErrorPages
  class ErrorsController < ApplicationController
    unloadable
    layout false
    before_filter :html_format

    def not_found
      @not_found_path = params[:not_found]
      render status: :not_found
    end

    def internal_server_error
      render status: :internal_server_error
    end

    protected

    def html_format
      request.format = :html
    end
  end
end
