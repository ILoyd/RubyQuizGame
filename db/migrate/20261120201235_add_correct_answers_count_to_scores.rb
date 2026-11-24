class AddCorrectAnswersCountToScores < ActiveRecord::Migration[8.1]
  def change
    add_column :scores, :correct_answers_count, :integer, default: 0, null: false
  end
end
