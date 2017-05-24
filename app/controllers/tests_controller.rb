class TestsController < ApplicationController
    load_and_authorize_resource
    def new; end

    def create
        redirect_to @test if @test.save
    end

    def index; end

    def show; end

    def edit; end

    def update
        redirect_to @test if @test.update(test_params)
    end

    def destroy
        @test.destroy
        redirect_to tests_path
    end

    private

    def test_params
        params.require(:test).permit(:name, :body)
    end
end
