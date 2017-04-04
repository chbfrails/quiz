class Admin::QuestionController < Admin::AdminController
  skip_before_filter :verify_authenticity_token

  def index
    @questions = Question.all.includes(:answers)
  end

  def new
    @path = admin_question_index_url
    @redirectpath = admin_question_index_url
  end

  def create
    ActiveRecord::Base.transaction do
      question = Question.new({
        name: params['question'],
        description: '',
        qtype: params['question_type'],
        test_level: params['question_level']
      })
      for i in params['answers'] do
        Answer.create({
          name: i['answer'],
          description: '',
          question: question,
          correct: i['correct']
        })
      end
      render nothing: true, status: 200, content_type: 'application/json'
    end
  end

  def edit
    @question = Question.find(params['id'])
    @path = admin_question_url(@question)
    @redirectpath = admin_question_index_url
  end

  def update
    ActiveRecord::Base.transaction do
      question = Question.update(
        params['id'],
        name: params['question'],
        qtype: params['question_type'],
        test_level: params['question_level']
      )
      params['answers'].each do |answer|
        if answer['markdelete']
          Answer.destroy(answer['id'])
        else
          if answer['id'] > 0
            Answer.update(
              answer['id'],
              name: answer['name'],
              correct: answer['correct']
            )
          else
            Answer.create({
              name: answer['name'],
              correct: answer['correct'],
              description: '',
              question: question
            })
          end
        end
      end
      render nothing: true, status: 200, content_type: 'application/json'
    end
  end

  def destroy
    Question.destroy(params['id'].to_i)
    redirect_to admin_question_index_path
  end

end
