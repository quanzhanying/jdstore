class TestsController < ApplicationController
    def new
        @test = Test.new
     end

    def create
        @test = Test.new(test_params)
        redirect_to @test if @test.save
    end

    def index
        @tests = Test.all
    end

    def show
        @test = Test.find(params[:id])
    end

    def edit
        @test = Test.find(params[:id])
    end

    def update
        @test = Test.find(params[:id])
        redirect_to @test if @test.update(test_params)
    end

    def destroy
        @test = Test.find(params[:id])
        @test.destroy
        redirect_to tests_path
    end

    private

    def test_params
        params.require(:test).permit(:name, :body)
    end
end
