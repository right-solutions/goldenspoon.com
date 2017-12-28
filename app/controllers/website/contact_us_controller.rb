class Website::ContactUsController < Website::BaseController

	layout "website/theme"

	def index
		@banner = Dhatu::Section.find_by_section_type("CONTACT_US_BANNER").published.first
		@contact_us = Dhatu::Section.find_by_section_type("CONTACT_US").published.first
		@enquiry = Enquiry.find_by_id(params[:id]) if params[:id]
	end
	
	def create
		@enquiry = Enquiry.new
		@enquiry.assign_attributes(permitted_params)
		@enquiry.save
    set_flash_message(:enquiry, :success) if @enquiry.errors.blank?
	end

	private

	def set_show_book_now_form
    @show_book_now_form = true
  end

	def permitted_params
    params["enquiry"].permit(:name, :email, :phone, :subject, :message)
  end

  def configure_popup
    @show_popup = false
  end

  def set_navs
    set_nav("website/contact_us")
  end
	
end
