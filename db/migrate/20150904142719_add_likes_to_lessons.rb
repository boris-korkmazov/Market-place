class AddLikesToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :likes, :integer, default: 0
  end
end
