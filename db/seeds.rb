# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  { title: 'HTML' },
  { title: 'Ruby'},
  { title: 'CSS' },
  { title: 'Python' }
])

Test.create([
  { title: 'Forms HTML', category_id: 1, level: 0 },
  { title: 'Color in HTML', category_id: 1, level: 0 },
  { title: 'Array', category_id: 2, level: 1 },
  { title: 'Metaprogramming', category_id: 2, level: 1 },
  { title: 'Filers in CSS', category_id: 3, level: 2 },
  { title: 'Tuple', category_id: 4, level: 2 }
])

Question.create([
  { body: 'Which attribute changes the color of the text', test_id: '2' },
  { body: 'Which attribute changes the color of the background?', test_id: '2' },
  { body: 'What does the collect method do?', test_id: '3' },
  { body: 'What does the each method do?', test_id: '3' },
  { body: 'What does the count method do?', test_id: '3' },
  { body: 'A single item tuple is created as', test_id: '6' }
])

Answer.create([
  { body: "a = ('s')", question_id: 6, correct: false },
  { body: "a = ('s', )", question_id: 6, correct: true },
  { body: '<font color>', question_id: 1, correct: true },
  { body: '<font size>', question_id: 1, correct: false },
  { body: '<body bgcolor>', question_id: 2, correct: true },
  { body: '<body text>', question_id: 2, correct: false },
  { body: 'Returns a new array with the results of running block once for every
    element in enum', question_id: 3, correct: true },
  { body: 'Returns the number of items in enum through enumeration.',
    question_id: 3, correct: false },
  { body: 'Calls block for each element of enum repeatedly n times or forever if
    none or nil is given.', question_id: 4, correct: false },
  { body: 'Iterates over the block according to how this Enumerator was
    constructed.', question_id: 4, correct: true },
  { body: 'Iterates over the block according to how this Enumerator was
    constructed.', question_id: 5, correct: false },
  { body: 'Returns the number of items in enum through enumeration.',
    question_id: 5, correct: true },
])

User.create([
  { name: 'Alex', email: 'Alex@email.com' },
  { name: 'Ann', email: 'Ann@email.com' },
  { name: 'Victoria', email: 'Victoria@email.com' },
  { name: 'Sam', email: 'Sam@email.com' }
])
