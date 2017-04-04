class ExamController < ApplicationController

  before_action :authenticate_user!

  def index
    @exam = Question.where(test_level: 4).includes(:answers)
  end

end
