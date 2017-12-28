class Website::PricesController < Website::BaseController

	layout 'website/theme'

	def index
		@banner = Dhatu::Section.find_by_section_type("PRICING_BANNER").published.first
		@prices = Dhatu::Price.published.order("priority ASC, title ASC").page(@current_page).per(@per_page)
		@price_categories = Dhatu::Category.filter_by_category_type("Dhatu::Price").published.order("priority ASC, name ASC").all
	end

	private

	def set_navs
  	set_nav("website/prices")  
  end
	
end
