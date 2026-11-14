class ReplaceDifficultyStringWithReference < ActiveRecord::Migration[8.1]
  def change
    remove_column :questions, :difficulty, :string, if_exists: true
    remove_column :scores, :difficulty, :string, if_exists: true
    add_reference :questions, :difficulty, foreign_key:true
    add_reference :scores, :difficulty, foreign_key:true
  end
end
