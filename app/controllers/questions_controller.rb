class QuestionsController < ApplicationController
    load_and_authorize_resource :test
    load_and_authorize_resource :question, through: :test
    def create
        redirect_to test_path(@test) if @question.save
      end

    def update
        redirect_to test_path(@test) if @question.update(question_params)
    end

    def destroy
        @question.destroy
        redirect_to test_path(@test)
    end

    def show; end

    private

    def question_params
        params.require(:question).permit(:body, :answer)
    end
end
