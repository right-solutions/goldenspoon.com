class DashboardController < ApplicationController

  before_action :require_site_admin
  
	# GET /dashboard
  def index
  end

  private

  def breadcrumbs_configuration
    {
      heading: "Dashboard",
      description: "A Quick view for admin",
      links: [{name: "Dashboard", link: dashboard_path, icon: 'fa-dashboard'}]
    }
  end

  def set_navs
    set_nav("dashboard")
  end

end

