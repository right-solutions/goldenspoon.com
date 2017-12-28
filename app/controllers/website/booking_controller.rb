module Website
  class BookingController < Website::BaseController

    def create
      @booking = Dhatu::Booking.new
      @booking.assign_attributes(permitted_params)
      if @booking.valid?
        @booking.save
        set_flash_message(I18n.translate("forms.save", item: "Booking"), :success) 
      end
      set_resource_notification(@booking)
      render :create, layout: false
    end

    private

    def default_item_name
      "booking"
    end

    def permitted_params
      params.require("dhatu/booking").permit(:name, :service_id, :email, :mobile, :date, :time, :message)
    end

  end
end
