class Website::HomeController < Website::BaseController

	layout 'website/theme'

	def index
    @slider_sections = Dhatu::Section.find_by_section_type("HOME_PAGE_SLIDE").published.all
    @footer_section = Dhatu::Section.find_by_section_type("ABOUT_US_FOOTER").published.first
		@categories = Dhatu::Category.published.filter_by_category_type("Dhatu::BlogPost").order("priority ASC, name ASC").all
    get_collections
	end

	def get_collections
    @relation = Dhatu::BlogPost.published.includes(:cover_image).where("")
    parse_filters
    apply_filters
    @blog_posts = @r_objects = @relation.page(@current_page).per(@per_page)
    return true
  end

  def apply_filters
    @relation = @relation.search(@query) if @query
    @order_by = "created_at desc" unless @order_by
    @relation = @relation.order(@order_by)
  end

	private

	def set_navs
    set_nav("website/home")
  end
	
end
