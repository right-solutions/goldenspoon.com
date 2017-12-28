Dhatu::ApplicationController.class_eval do
  
  def breadcrumb_home_path
    main_app.dashboard_path
  end

end
