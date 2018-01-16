require 'seo_helper/helper'

module SeoHelper
  class Railtie < Rails::Railtie
    initializer 'seo_helper.view_helpers' do
      ActionView::Base.send :include, SeoHelper::Helper
      ActionView::Base.send :include, SeoHelper::ControllerHelper
    end

    initializer 'seo_helper.controller_helpers' do
      ActionController::Base.send :include, SeoHelper::ControllerHelper
    end
  end
end
