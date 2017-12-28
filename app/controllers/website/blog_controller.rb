class Website::BlogController < Website::BaseController

	layout "website/theme"

	def index
		@banner = Dhatu::Section.find_by_section_type("BLOG_BANNER").published.first

		@categories = Dhatu::Category.where(category_type: "Dhatu::BlogPost").all
		@relation = Dhatu::BlogPost.published.includes(:cover_image).where("")
		
		@relation = @relation.search(params[:query]) if params[:query]
		@relation = @relation.where("category_id = ?", params[:category_id]) if params[:category_id]

    @blog_posts = @r_objects = @relation.page(@current_page).per(1)
	end

	def show
		@categories = Dhatu::Category.where(category_type: "Dhatu::BlogPost").all
		@blog_post = Dhatu::BlogPost.published.find_by_slug(params[:slug])
		@recent_posts = Dhatu::BlogPost.published.order("created_at desc").limit(5)
	end

	private

	def set_navs
    set_nav("website/blog")
  end
	
end
