class CreateScores < ActiveRecord::Migration[8.1]
  def change
    create_table :scores do |t|
      t.string :name
      t.string :difficulty
      t.integer :remaining_tokens
      t.string :categories
      t.datetime :date

      t.timestamps
    end
  end
end
