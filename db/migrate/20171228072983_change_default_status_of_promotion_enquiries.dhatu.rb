# This migration comes from dhatu (originally 20171203114528)
class ChangeDefaultStatusOfPromotionEnquiries < ActiveRecord::Migration[5.1]
  def up
    change_column_default :promotion_enquiries, :status, "new"
  end
  def down
    change_column_default :promotion_enquiries, :status, "unpublished"
  end
end
