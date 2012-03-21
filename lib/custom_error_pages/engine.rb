require 'custom_error_pages/controller_helper'

module CustomErrorPages
  class Engine < Rails::Engine
    initializer 'custom_error_pages.controller_helper' do
      ActiveSupport.on_load :action_controller do
        include ControllerHelper
      end
    end
  end
end
