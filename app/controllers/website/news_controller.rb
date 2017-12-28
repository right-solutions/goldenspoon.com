class Website::EventsController < Website::BaseController

	def index
		@per_page = 5
		@events = Event.published.order("created_at desc").page(@current_page).per(@per_page)
		set_title("Red Velvet Salon, Karama - The best salon in Dubai")
	end

	private

	def set_navs
    set_nav("website/events")
  end
	
end
