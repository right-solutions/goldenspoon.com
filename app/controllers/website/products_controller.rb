class Website::ProductsController < Website::BaseController

	layout 'website/theme_product'
	
	before_action :set_dark_headers

	def index
		@categories = Category.published.where("parent_id IS NULL").order("priority ASC, name ASC").all
		@category = Category.find_by_permalink(params[:ct]) || Category.find_by_id(params[:ct])
		@relation = Product.published.order("priority ASC, name ASC")
		@relation = @relation.where("category_id = ?", @category.id) if @category
		@products = @relation.includes(:product_image).page(@current_page).per(@per_page)
		
		set_title("Red Velvet Salon, Karama - The best salon in Dubai")
		@banner = "/assets/graphics/banners/contact_us.jpg"
    generate_category_breadcrumbs
    @heading = @links[-1][:name]
    @top_category = @category.top_parent
	end

	def show
		@categories = Category.published.where("parent_id IS NULL").order("priority ASC, name ASC").all
		@product = Product.find_by_permalink(params[:permalink]) || Product.find_by_id(params[:permalink])
		@top_category = @product.top_category

		@category = @product.category
		generate_category_breadcrumbs
		
		set_title("#{@product.name} | Golden Pioneer General Trading")
		@banner = "/assets/graphics/banners/contact_us.jpg"
	end

	private

	def set_navs
    set_nav("website/distribution")
  end

  def set_dark_headers
  	@dark_headers = true
  end
	
end
