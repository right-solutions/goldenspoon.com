Rails.application.routes.draw do
  
  mount Usman::Engine => "/"
  mount Pattana::Engine => "/"
  mount Dhatu::Engine => "/"

  # Default Landing Page after successful signin
  get   '/landing', to: "landing#index",  as: :user_landing

  # Dashboard Page - Landing Page Redirects to this page
  get   '/dashboard',   to: "dashboard#index",  as:   :dashboard

  # Website Pages
  root 	'website/home#index'

  get   '/about_us',   		to: "website/about_us#index",  as: :about_us
  get   '/contact_us',   	to: "website/contact_us#index", as: :contact_us

  get   '/blogs',         to: "website/blog#index",       as: :blogs
  get   '/blog/:slug',    to: "website/blog#show",        as: :blog

  get   '/services',      to: "website/services#index",   as: :services
  get   '/services/:id',  to: "website/services#show",   as: :service
  get   '/services/filter/:category_id',  to: "website/services#filter",    as: :services_filter
  
  get   '/offers',        to: "website/offers#index",    as: :offers
  get   '/pricing',       to: "website/offers#index",    as: :prices
  
  post  '/booking/create',        to: "website/booking#create",   as:   :create_booking
  post  '/promotion_enquiries',   to: "website/promotion_enquiries#create",   as:   :promotion_enquiries
  
end