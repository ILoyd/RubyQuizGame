class ReplaceCategoryStringWithReferenceInQuestions < ActiveRecord::Migration[8.1]
  def change
    remove_column :questions, :category, :string
    add_reference :questions, :category, foreign_key:true
  end
end
