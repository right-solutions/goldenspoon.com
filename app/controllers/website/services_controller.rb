class Website::ServicesController < Website::BaseController

	layout 'website/theme'

	def index
		@categories = Dhatu::Category.published.where(category_type: "Dhatu::Service").order("priority ASC, name ASC").all
		@services_banner = Dhatu::Section.find_by_section_type("SERVICES_BANNER").published.first
		@services = Dhatu::Service.published.order("priority ASC, name ASC").all
	end

	def filter
		@categories = Dhatu::Category.published.where(category_type: "Dhatu::Service").order("priority ASC, name ASC").all
		@services_banner = Dhatu::Section.find_by_section_type("SERVICES_BANNER").published.first
		@category = Dhatu::Category.find_by_permalink(params[:category_id])
		@services = Dhatu::Service.published.where("category_id = ?", @category.try(:id)).order("priority ASC, name ASC").all
		render :index
	end

	def show
		@categories = Dhatu::Category.where(category_type: "Dhatu::Service").order("priority ASC, name ASC").all
		@services_banner = Dhatu::Section.find_by_section_type("SERVICES_BANNER").published.first
		@service = Dhatu::Service.find_by_id(params[:id])
		@services = Dhatu::Service.published.where("category_id = ?", @service.category_id).order("priority ASC, name ASC").all
	end

	private

	def set_navs
  	set_nav("website/services")  
  end
	
end
