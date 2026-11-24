# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Question.destroy_all
Score.destroy_all
Category.destroy_all
Difficulty.destroy_all

cat_film = Category.find_or_create_by!(name: "Film")
cat_history = Category.find_or_create_by!(name: "Történelem")
cat_literature = Category.find_or_create_by!(name: "Irodalom")

diff_easy = Difficulty.find_or_create_by!(name: "Könnyű")
diff_med = Difficulty.find_or_create_by!(name: "Közepes")
diff_hard = Difficulty.find_or_create_by!(name: "Nehéz")

Question.create!(text: "Hol lakik Spongyabob?", answer1: "Egy kő alatt", answer2: "Egy levegővel teli házban", answer3: "Egy ananászban", answer4: "Egy moai-fejben", correct_answer: 3, category: cat_film, difficulty: diff_easy)
Question.create!(text: "Ki írta a Himnuszt?", answer1: "Petőfi Sándor", answer2: "Kölcsey Ferenc", answer3: "Vörösmarty Mihály", answer4: "Arany János", correct_answer: 2, category: cat_literature, difficulty: diff_med)
Question.create!(text: "Hány magyar királyt avattak szentté?", answer1: "egyet", answer2: "kettőt", answer3: "hármat", answer4: "négyet", correct_answer: 2, category: cat_history, difficulty: diff_hard)


Score.create!(name: "Peter Griffin", difficulty: diff_easy, categories: "Film", remaining_tokens: 100)
Score.create!(name: "Eric Cartman", difficulty: diff_med, categories: "Történelem, Irodalom", remaining_tokens: 0)
