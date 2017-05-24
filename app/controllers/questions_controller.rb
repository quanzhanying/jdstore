class QuestionsController < ApplicationController
    def create
        @test = Test.find(params[:test_id])
        @question = Question.new(question_params)
        @question.test = @test
        redirect_to test_path(@test) if @question.save
      end

    def update
        @test = Test.find(params[:test_id])
        @question = @test.questions.update(question_params)
    end

    def destroy
        @test = Test.find(params[:test_id])
        @question = @test.questions.find(params[:id])
        @question.destroy
        redirect_to test_path(@test)
    end

    private

    def question_params
        params.require(:question).permit(:body, :answer)
    end
end
