class ResponsesController < ApplicationController

    before_action :define_question, :define_response

    def new
      p session[:feedback]
      p "******************at new response **********************"
      p @number_correct = session[:num_correct]
        @feedback = flash[:feedback]
      p "**************************"
    end

    def define_question
        @question = Question.order("RANDOM()").limit(1)[0]
    end

    def define_response
        @questionResponse = Response.new({ question: @question })
    end

    def create
      session[:user_id] = User.first.id
      session[:num_correct] ||= 0
      response = Response.create(response_params)
      if response.question.correct_answer == response.answer
        # Store a new value for num_correct on client
        session[:num_correct] = session[:num_correct] + 1
        p "**************************"
        flash[:feedback] = "Correct"
      else
        p "**************************"
        flash[:feedback] = "Incorrect"
        session[:num_correct] = nil
      end
      redirect_to '/random-question'
    end

    def response_params
        params.require(:response).permit(:answer_id, :question_id)
    end

end
