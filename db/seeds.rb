# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                      { email: 'Bob@email.com', password: '123456' },
                      { email: 'Alice@email.com', password: '123456' },
                      { email: 'Jane@email.com', password: '123456' },
                      { email: 'Tim@email.com', password: '123456' }
                    ])

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Machine Learning' },
                               { title: 'Mobile Development' }
                             ])

tests = Test.create([
                      { title: 'HTML', category_id: categories[0].id, level: 1, author_id: users.last.id },
                      { title: 'CSS', category_id: categories[0].id, level: 1, author_id: users.last.id },
                      { title: 'JS', category_id: categories[0].id, level: 1, author_id: users.last.id },
                      { title: 'Ruby', category_id: categories[1].id, level: 1, author_id: users.last.id },
                      { title: 'Ruby on Rails', category_id: categories[1].id, level: 2, author_id: users.last.id },
                      { title: 'Python', category_id: categories[2].id, level: 1, author_id: users.last.id },
                      { title: 'Android', category_id: categories[3].id, level: 2, author_id: users.last.id }
                    ])

questions = Question.create([
                              { body: 'What does HTML stand for?', test_id: tests[0].id },
                              { body: 'Who is making the Web standards?', test_id: tests[0].id },
                              { body: 'Choose the correct HTML element for the largest heading:', test_id: tests[0].id },
                              { body: 'What does CSS stand for?', test_id: tests[1].id },
                              { body: 'Inside which HTML element do we put the JavaScript?', test_id: tests[2].id },
                              { body: 'How do you insert COMMENTS in Python code?', test_id: tests[2].id }
                            ])

Answer.create([
                { body: 'Hyper Text Markup Language', question_id: questions[0].id, correct: true },
                { body: 'Home Tool Markup Language', question_id: questions[0].id, correct: false },
                { body: 'Hyperlinks and Text Markup Language', question_id: questions[0].id, correct: false },
                { body: 'The World Wide Web Consortium', question_id: questions[0].id, correct: true },
                { body: 'Microsoft', question_id: questions[1].id, correct: false },
                { body: 'Google', question_id: questions[1].id, correct: false },
                { body: 'Mozilla', question_id: questions[1].id, correct: false },
                { body: '<heading>', question_id: questions[2].id, correct: false },
                { body: '<head>', question_id: questions[2].id, correct: false },
                { body: '<h1>', question_id: questions[2].id, correct: true },
                { body: '<h6>', question_id: questions[2].id, correct: false }
              ])

Admin.create([
               { email: 'admin@email.com', password: '123456', first_name: 'ad', last_name: 'min' }
             ])

User.first.tests = tests[0..3]
User.second.tests = tests
