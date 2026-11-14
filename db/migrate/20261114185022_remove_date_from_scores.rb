class RemoveDateFromScores < ActiveRecord::Migration[8.1]
  def change
    remove_column :scores, :date, :date
  end
end
