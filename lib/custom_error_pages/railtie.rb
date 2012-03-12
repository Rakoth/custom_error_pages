require 'custom_error_pages/controller_helper'

module CustomErrorPages
  class Railtie < Rails::Railtie
    initializer 'custom_error_pages.controller_helper' do
      ActiveSupport.on_load :action_controller do
        include ControllerHelper
      end
    end
  end
end
