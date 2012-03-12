module CustomErrorPages
  module ControllerHelper
    extend ActiveSupport::Concern

    included do
      unless Rails.application.config.consider_all_requests_local
        rescue_from Exception, :with => :render_server_error
        rescue_from *not_found_exceptions, :with => :render_not_found
      end
    end

    module ClassMethods
      def not_found_exceptions
        result = [
          ActionController::RoutingError,
          ActionController::UnknownController,
          ActionController::UnknownAction,
        ]

        result << ActiveRecord::RecordNotFound if defined? ActiveRecord
        result << Mongoid::Errors::DocumentNotFound if defined? Mongoid

        result
      end
    end

    def render_not_found exception
      @not_found_path = exception
      respond_to do |format|
        format.html do
          render :template => 'custom_error_pages/errors/not_found',
            :layout => false, :status => :not_found
        end
        format.all{render :nothing => true, :status => :not_found}
      end
    end

    def render_server_error exception
      @error = exception
      notify_about_exception!
      respond_to do |format|
        format.html do
          render :template => 'custom_error_pages/errors/internal_server_error',
            :layout => false, :status => :internal_server_error
        end
        format.all{render :nothing => true, :status => :internal_server_error}
      end
    end

    def notify_about_exception!
      if defined? ExceptionNotifier
        ExceptionNotifier::Notifier.exception_notification(env, @error).deliver
        env['exception_notifier.delivered'] = true
      end
    rescue => exception
      Rails.logger.error exception.inspect.red
    end
  end
end
