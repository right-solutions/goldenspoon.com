class Website::CategoriesController < Website::BaseController

	layout 'website/theme_product'

	def index
		@categories = Category.published.where("parent_id IS NULL").order("priority ASC, name ASC").all
		set_title("Red Velvet Salon, Karama - The best salon in Dubai")
		@banner = "/assets/graphics/banners/contact_us.jpg"
    @links = [{name: "Home", link: root_path}, {name: "Distribution", link: categories_path}]
    @heading = "Browse Categories"
	end

	def show

		@categories = Category.includes(:parent).published.where("parent_id IS NULL").order("priority ASC, name ASC").all
		@category = Category.find_by_permalink(params[:permalink])
		@sub_categories = @category.sub_categories
		@top_category = @category.top_parent

		title = @category.name + (@category.one_liner.blank? ? " | Golden Pioneer General Trading" : (" | " + @category.one_liner))
		set_title(title)
		@banner = "/assets/graphics/banners/contact_us.jpg"
    
    generate_category_breadcrumbs
    @heading = @links[-1][:name]

	end

	private

	def set_navs
    set_nav("website/distribution")
  end

  def set_dark_headers
  	@dark_headers = true
  end
	
end
