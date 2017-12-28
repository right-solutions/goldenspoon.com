Pattana::ApplicationController.class_eval do
  
  include Usman::AuthenticationHelper
  
  before_action :current_user
  before_action :require_user
  helper_method :breadcrumb_home_path

  def breadcrumb_home_path
    main_app.dashboard_path
  end

end

Pattana::DashboardController.class_eval do
  
  helper_method :require_site_admin

end

Pattana::ResourceController.class_eval do
  
  include Usman::AuthenticationHelper

  layout 'kuppayam/admin'

  before_action :current_user
  before_action :require_user
  
  before_action :require_read_permission, only: [:index, :show]
  before_action :require_create_permission, only: [:create]
  before_action :require_update_permission, only: [:update, :update_status, :mark_as_featured, :remove_from_featured]
  before_action :require_delete_permission, only: [:destroy]

end

Pattana::Api::V1::DocsController.class_eval do
  
  def set_tab_items
    @tab_items = {
      usman: { nav_class: "docs/usman", icon_class: "fa-group", url: usman.docs_api_v1_register_path, text: "User APIs"},
      pattana: { nav_class: "docs/pattana", icon_class: "fa-globe", url: pattana.docs_api_v1_countries_path, text: "Location APIs"}
    }
  end

end