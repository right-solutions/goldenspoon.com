class Website::AboutUsController < Website::BaseController

	layout "website/theme"

	def index
		@banner = Dhatu::Section.find_by_section_type("ABOUT_US_BANNER").published.first
		@about_us = Dhatu::Section.find_by_section_type("ABOUT_US").published.first
	end

	private

	def set_navs
    set_nav("website/about_us")
  end
	
end
