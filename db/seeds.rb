# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  { name: 'Alex', email: 'Alex@email.com' },
  { name: 'Ann', email: 'Ann@email.com' },
  { name: 'Victoria', email: 'Victoria@email.com' },
  { name: 'Sam', email: 'Sam@email.com' }
])


categories = Category.create([
  { title: 'HTML' },
  { title: 'Ruby' },
  { title: 'CSS' },
  { title: 'Python' }
])

tests = Test.create([
  { title: 'Forms HTML', category_id: categories[0].id, level: 0, author_id: users.last.id },
  { title: 'Color in HTML', category_id: categories[0].id, level: 0, author_id: users.last.id },
  { title: 'Array', category_id: categories[1].id, level: 1, author_id: users.last.id },
  { title: 'Metaprogramming', category_id: categories[1].id, level: 1, author_id: users.last.id },
  { title: 'Filers in CSS', category_id: categories[2].id, level: 2, author_id: users.last.id },
  { title: 'Tuple', category_id: categories[3].id, level: 2, author_id: users.last.id }
])

questions = Question.create([
  { body: 'Which attribute changes the color of the text', test_id: tests[1].id },
  { body: 'Which attribute changes the color of the background?', test_id: tests[1].id },
  { body: 'What does the collect method do?', test_id: tests[2].id },
  { body: 'What does the each method do?', test_id: tests[2].id },
  { body: 'What does the count method do?', test_id: tests[2].id },
  { body: 'A single item tuple is created as', test_id: tests[5].id }
])

Answer.create([
  { body: "a = ('s')", question_id: questions[5].id, correct: false },
  { body: "a = ('s', )", question_id: questions[5].id, correct: true },
  { body: '<font color>', question_id: questions[0].id, correct: true },
  { body: '<font size>', question_id: questions[0].id, correct: false },
  { body: '<body bgcolor>', question_id: questions[1].id, correct: true },
  { body: '<body text>', question_id: questions[1].id, correct: false },
  { body: 'Returns a new array with the results of running block once for every
    element in enum', question_id: questions[2].id, correct: true },
  { body: 'Returns the number of items in enum through enumeration.',
    question_id: questions[2].id, correct: false },
  { body: 'Calls block for each element of enum repeatedly n times or forever if
    none or nil is given.', question_id: questions[3].id, correct: false },
  { body: 'Iterates over the block according to how this Enumerator was
    constructed.', question_id: questions[3].id, correct: true },
  { body: 'Iterates over the block according to how this Enumerator was
    constructed.', question_id: questions[4].id, correct: false },
  { body: 'Returns the number of items in enum through enumeration.',
    question_id: questions[4].id, correct: true },
])

User.first.tests = tests[0..3]
User.second.tests = tests
