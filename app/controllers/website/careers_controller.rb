class Website::CareersController < Website::BaseController

	def index
		@events = []
		set_title("Red Velvet Salon, Karama - The best salon in Dubai")
	end

	private

	def set_navs
    set_nav("website/careers")
  end
	
end
