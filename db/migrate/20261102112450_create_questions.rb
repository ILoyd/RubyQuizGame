class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.integer :correct_answer
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
