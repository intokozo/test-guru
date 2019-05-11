module QuestionsHelper
  def form_header(question)
    title = question.new_record? ? 'Создать' : 'Редактировать'
    "#{title} #{question.test.title} вопрос"
  end
end
