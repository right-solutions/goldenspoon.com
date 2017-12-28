class Website::OffersController < Website::BaseController

	layout 'website/theme'

	def index
		@banner = Dhatu::Section.find_by_section_type("OFFERS_BANNER").published.first
		@offers = Dhatu::Offer.published.order("priority ASC, title ASC").page(@current_page).per(@per_page)
	end

	private

	def set_navs
  	set_nav("website/offers")  
  end
	
end
