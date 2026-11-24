class MakeRequiredFieldsNotNull < ActiveRecord::Migration[8.1]
  def change
    %i[text answer1 answer2 answer3 answer4 correct_answer category_id difficulty_id].each { |col| change_column_null :questions, col, false}
    %i[name categories difficulty_id].each { |col| change_column_null :scores, col, false}
  end
end
