# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(user_name: 'CJ')
user2 = User.create!(user_name: 'Flarnie')
user3 = User.create!(user_name: 'Jeff')
user4 = User.create!(user_name: 'Georges St. Pierre')
user5 = User.create!(user_name: 'Ned')

poll = Poll.create!({title: "New Student Poll", user_id: 1 })

question1 = Question.create!({text: "What is your favorite color?", poll_id: poll.id})
question2 = Question.create!({text: "Do you like cats or dogs?", poll_id: poll.id})

answer1 = AnswerChoice.create!({text: "Red", question_id: question1.id})
answer2 = AnswerChoice.create!({text: "Blue", question_id: question1.id})
answer3 = AnswerChoice.create!({text: "Green", question_id: question1.id})

answer4 = AnswerChoice.create!({text: "I like cats", question_id: question2.id})
answer5 = AnswerChoice.create!({text: "I like dogs", question_id: question2.id})

response1 = Response.create!({user_id: user3.id, answer_choice_id: answer1.id})
response2 = Response.create!({user_id: user4.id, answer_choice_id: answer2.id})
response3 = Response.create!({user_id: user5.id, answer_choice_id: answer5.id})
response4 = Response.create!({user_id: user3.id, answer_choice_id: answer5.id})
