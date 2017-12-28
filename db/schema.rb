# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171228072985) do

  create_table "blog_posts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "slug", limit: 64
    t.string "author", limit: 256
    t.string "meta_description", limit: 512
    t.text "description"
    t.datetime "posted_at"
    t.boolean "featured", default: false
    t.string "status", limit: 16, default: "unpublished", null: false
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_blog_posts_on_category_id"
    t.index ["status"], name: "index_blog_posts_on_status"
  end

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 256, null: false
    t.bigint "service_id"
    t.string "email", limit: 256
    t.string "mobile", limit: 16
    t.date "date"
    t.string "time", limit: 16
    t.string "message", limit: 1048
    t.boolean "featured", default: false
    t.string "status", limit: 16, default: "new", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_bookings_on_service_id"
    t.index ["status"], name: "index_bookings_on_status"
  end

  create_table "branches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "address_1", limit: 256
    t.string "address_2", limit: 256
    t.string "address_3", limit: 256
    t.string "email", limit: 256
    t.string "landline", limit: 16
    t.string "fax", limit: 16
    t.string "mobile", limit: 16
    t.string "facebook", limit: 256
    t.string "twitter", limit: 256
    t.string "google_plus", limit: 256
    t.string "linked_in", limit: 256
    t.string "youtube", limit: 256
    t.string "instagram", limit: 256
    t.string "tumblr", limit: 256
    t.string "pinterest", limit: 256
    t.string "blog", limit: 256
    t.string "status", limit: 16, null: false
    t.boolean "featured", default: false
    t.boolean "main_branch", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 128, null: false
    t.string "category_type", limit: 64, null: false
    t.string "one_liner"
    t.string "permalink", limit: 128, null: false
    t.text "description"
    t.bigint "parent_id"
    t.bigint "top_parent_id"
    t.string "status", limit: 16, default: "unpublished", null: false
    t.boolean "featured", default: false
    t.boolean "end_node", default: true
    t.integer "priority", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["permalink"], name: "index_categories_on_permalink", unique: true
    t.index ["status"], name: "index_categories_on_status"
    t.index ["top_parent_id"], name: "index_categories_on_top_parent_id"
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 128
    t.string "alternative_names", limit: 256
    t.string "iso_code", limit: 128
    t.integer "country_id"
    t.integer "region_id"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "population"
    t.integer "priority", default: 1000
    t.boolean "show_in_api", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "operational", default: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["iso_code"], name: "index_cities_on_iso_code"
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 512
    t.string "account_type", limit: 256
    t.string "email", limit: 256
    t.string "address", limit: 512
    t.bigint "owner_id"
    t.bigint "done_deal_user_id"
    t.bigint "registration_id"
    t.bigint "device_id"
    t.string "contact_number_2", limit: 24
    t.string "contact_number_3", limit: 24
    t.string "contact_number_4", limit: 24
    t.string "contact_number", limit: 24, null: false
    t.index ["device_id"], name: "index_contacts_on_device_id"
    t.index ["done_deal_user_id"], name: "index_contacts_on_done_deal_user_id"
    t.index ["owner_id"], name: "index_contacts_on_owner_id"
    t.index ["registration_id"], name: "index_contacts_on_registration_id"
  end

  create_table "countries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 128
    t.string "official_name", limit: 128
    t.string "iso_name", limit: 128
    t.string "fips", limit: 56
    t.string "iso_alpha_2", limit: 5
    t.string "iso_alpha_3", limit: 5
    t.string "itu_code", limit: 5
    t.string "dialing_prefix", limit: 56
    t.string "tld", limit: 16
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "capital", limit: 64
    t.string "continent", limit: 64
    t.string "currency_code", limit: 16
    t.string "currency_name", limit: 64
    t.string "is_independent", limit: 56
    t.string "languages", limit: 256
    t.integer "priority", default: 1000
    t.boolean "show_in_api", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "operational", default: false
    t.index ["fips"], name: "index_countries_on_fips"
    t.index ["iso_alpha_2"], name: "index_countries_on_iso_alpha_2"
    t.index ["iso_alpha_3"], name: "index_countries_on_iso_alpha_3"
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "registration_id"
    t.string "uuid", limit: 1024
    t.string "device_token", limit: 1024
    t.string "device_name", limit: 64
    t.string "device_type", limit: 64
    t.string "operating_system", limit: 64
    t.string "software_version", limit: 64
    t.datetime "last_accessed_at"
    t.string "last_accessed_api", limit: 1024
    t.integer "otp"
    t.datetime "otp_sent_at"
    t.string "api_token", limit: 256
    t.datetime "token_created_at"
    t.string "status", limit: 16, default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "otp_verified_at"
    t.datetime "tac_accepted_at"
    t.index ["registration_id"], name: "index_devices_on_registration_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "documents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "document"
    t.string "document_type"
    t.integer "documentable_id"
    t.string "documentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type"], name: "index_documents_on_document_type"
    t.index ["documentable_id", "documentable_type"], name: "index_documents_on_documentable_id_and_documentable_type"
  end

  create_table "events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "venue", limit: 256, null: false
    t.text "description"
    t.date "date"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "featured", default: false
    t.string "status", limit: 16, default: "unpublished", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1000
    t.bigint "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["status"], name: "index_events_on_status"
  end

  create_table "features", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "status", limit: 16, default: "unpublished", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "categorisable", default: false
  end

  create_table "images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.string "image_type"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_type"], name: "index_images_on_image_type"
    t.index ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
  end

  create_table "import_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "importable_id"
    t.string "importable_type"
    t.string "data_type"
    t.string "status", limit: 16, default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_type"], name: "index_import_data_on_data_type"
    t.index ["importable_id", "importable_type"], name: "index_import_data_on_importable_id_and_importable_type"
    t.index ["status"], name: "index_import_data_on_status"
  end

  create_table "offers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "offer_text", limit: 64, null: false
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "featured", default: false
    t.string "status", limit: 16, default: "unpublished", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1000
    t.bigint "category_id"
    t.index ["category_id"], name: "index_offers_on_category_id"
    t.index ["status"], name: "index_offers_on_status"
  end

  create_table "permissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "feature_id"
    t.boolean "can_create", default: false
    t.boolean "can_read", default: true
    t.boolean "can_update", default: false
    t.boolean "can_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["user_id", "feature_id"], name: "index_permissions_on_user_id_and_feature_id", unique: true
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 128, null: false
    t.string "sub_title"
    t.text "price"
    t.bigint "category_id"
    t.string "status", limit: 16, default: "unpublished", null: false
    t.boolean "featured", default: false
    t.integer "priority", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_prices_on_category_id"
    t.index ["status"], name: "index_prices_on_status"
  end

  create_table "promotion_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 64, null: false
    t.string "data_type", limit: 24, default: "text", null: false
    t.text "values"
    t.boolean "mandatory", default: false, null: false
    t.boolean "display", default: false, null: false
    t.string "status", limit: 16, default: "unpublished", null: false
    t.integer "priority", default: 1, null: false
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_attributes_on_promotion_id"
  end

  create_table "promotion_enquiries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 256, null: false
    t.string "email", limit: 256
    t.string "phone", limit: 24
    t.bigint "promotion_id"
    t.string "status", limit: 16, default: "new", null: false
    t.text "additional_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_enquiries_on_promotion_id"
  end

  create_table "promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "short_description", limit: 512
    t.string "code", limit: 64
    t.boolean "display_name", default: true, null: false
    t.boolean "display_email", default: true, null: false
    t.boolean "display_phone", default: true, null: false
    t.boolean "name_mandatory", default: true, null: false
    t.boolean "email_mandatory", default: false, null: false
    t.boolean "phone_mandatory", default: false, null: false
    t.boolean "featured", default: false
    t.string "status", limit: 16, default: "unpublished", null: false
    t.integer "priority", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_popup", default: true, null: false
    t.boolean "show_only_on_homepage", default: true, null: false
    t.integer "popup_lifespan_in_minutes", default: 60, null: false
  end

  create_table "regions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 128
    t.string "iso_code", limit: 128
    t.integer "country_id"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "priority", default: 1000
    t.boolean "show_in_api", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "operational", default: false
    t.index ["country_id"], name: "index_regions_on_country_id"
    t.index ["iso_code"], name: "index_regions_on_iso_code"
  end

  create_table "registrations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "country_id"
    t.bigint "city_id"
    t.string "dialing_prefix"
    t.string "mobile_number"
    t.string "status", limit: 16, default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_registrations_on_city_id"
    t.index ["country_id"], name: "index_registrations_on_country_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "section_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 64, null: false
    t.string "code", limit: 64, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 256, null: false
    t.string "sub_title", limit: 256, null: false
    t.string "short_description", limit: 1048
    t.text "long_description"
    t.string "button_one_text", limit: 64
    t.string "button_two_text", limit: 64
    t.string "button_one_link", limit: 512
    t.string "button_two_link", limit: 512
    t.string "status", limit: 16, default: "unpublished", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "section_type_id"
    t.index ["section_type_id"], name: "index_sections_on_section_type_id"
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 128, null: false
    t.string "permalink", limit: 128, null: false
    t.text "description"
    t.text "price"
    t.text "duration"
    t.bigint "category_id"
    t.string "status", limit: 16, default: "unpublished", null: false
    t.boolean "featured", default: false
    t.integer "priority", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meta_description", limit: 512
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["permalink"], name: "index_services_on_permalink", unique: true
    t.index ["status"], name: "index_services_on_status"
  end

  create_table "team_members", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "designation"
    t.string "status"
    t.boolean "featured"
    t.text "description"
    t.string "linked_in_url"
    t.string "google_plus_url"
    t.string "facebook_url"
    t.string "twitter_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1000
  end

  create_table "testimonials", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 256, null: false
    t.string "designation", limit: 256
    t.string "organisation", limit: 256
    t.string "status", limit: 64, null: false
    t.boolean "featured", default: false
    t.text "statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1000
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "username", limit: 32, null: false
    t.string "email", null: false
    t.string "phone", limit: 24
    t.string "designation", limit: 56
    t.boolean "super_admin", default: false
    t.string "status", limit: 16, default: "pending", null: false
    t.string "password_digest", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "auth_token"
    t.datetime "token_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender", default: "nogender"
    t.date "date_of_birth"
    t.boolean "dummy", default: false
    t.integer "country_id"
    t.integer "city_id"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
