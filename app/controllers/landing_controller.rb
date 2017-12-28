class LandingController < ApplicationController

	def index
    if @current_user.super_admin? || @current_user.has_role?("Site Admin")
     redirect_to dashboard_url  
    else
     redirect_to usman.my_account_url
    end
  end

end

