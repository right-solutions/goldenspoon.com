module Website
  class PromotionEnquiriesController < Website::BaseController

    def create
      @promotion_enquiry = Dhatu::PromotionEnquiry.new
      @promotion_enquiry.assign_attributes(permitted_params)
      if params[:promotion_attributes]
        params[:promotion_attributes].each do |k, v|
          @promotion_enquiry.additional_attributes[k] = v
        end
      end

      if @promotion_enquiry.valid?
        @promotion_enquiry.save
        set_flash_message(I18n.translate("forms.save", item: "Booking"), :success)
      end
      set_resource_notification(@promotion_enquiry)
      render :create, layout: false
    end

    private

    def default_item_name
      "promotion_enquiry"
    end

    def permitted_params
      params.require("dhatu/promotion_enquiry").permit(:name, :promotion_id, :email, :phone, :date, :time, :message)
    end

  end
end
