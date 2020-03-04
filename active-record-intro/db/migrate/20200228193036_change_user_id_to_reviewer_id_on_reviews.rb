class ChangeUserIdToReviewerIdOnReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :user_id, :reviewer_id
  end
end
