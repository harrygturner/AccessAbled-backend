class AddLikeCountToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :like_count, :integer, default: 0
  end
end
