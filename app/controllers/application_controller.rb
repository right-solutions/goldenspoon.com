class ApplicationController < Kuppayam::BaseController

  include Usman::AuthenticationHelper

  layout 'kuppayam/admin'
  
  before_action :current_user
  helper_method :breadcrumb_home_path
    
  private

  def set_default_title
    set_title("SBIDU")
  end

  def breadcrumb_home_path
    main_app.dashboard_path
  end
  
end
