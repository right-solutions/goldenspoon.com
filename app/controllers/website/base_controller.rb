class Website::BaseController < ApplicationController
  
  layout 'website/home'

  before_action :get_promotion, :configure_popup, :get_general_data, :set_show_book_now_form
  
  private

  def stylesheet_filename
    @stylesheet_filename = "starter_kit"
  end

  def javascript_filename
    @javascript_filename = "starter_kit"
  end

  def get_general_data
    @footer_section = Dhatu::Section.find_by_section_type("ABOUT_US_FOOTER").published.first
    @book_now_section = Dhatu::Section.find_by_section_type("BOOK_NOW").published.first
    @main_branch = Dhatu::Branch.published.main_branch.first
    @service_categories = Dhatu::Category.where("category_type = 'Dhatu::Service'").published.all
  end

  def get_promotion
    @promotion = Dhatu::Promotion.published.first
  end

  def configure_popup
    @show_popup = true
    if @promotion
      @show_popup = false and return unless @promotion.show_popup
      @show_popup = false and return if @promotion.show_only_on_homepage and params["controller"] != "website/home"
      if @promotion.popup_lifespan_in_minutes > 0
        cookie_name = "popup-#{@promotion.id}"
        @show_popup = false and return if cookies[cookie_name] && cookies[cookie_name].to_s == "#{@promotion.updated_at.to_i}"
        i = @promotion.popup_lifespan_in_minutes.to_i
        cookies[cookie_name] = { :value => "#{@promotion.updated_at.to_i}", :expires => i.hours.from_now }
      end
    else
      @show_popup = false and return
    end
  end

  def set_show_book_now_form
    @show_book_now_form = true
  end

  def generate_category_breadcrumbs
    @links = [{name: "Home", link: root_path}, 
              {name: "Distribution", link: categories_path}]
    
    # Generating Dynamic Breadcrumbs with category heirarchy
    @parent_categories = []
    parent_category = @category

    loop do
      @parent_categories << parent_category
      break if parent_category.parent_id.blank?
      parent_category = parent_category.parent
    end if parent_category

    @parent_categories.reverse.each do |c|
      @links << {name: c.name, link: category_path(permalink: c.permalink)}
    end
  end
  
end
