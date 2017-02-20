class WelcomeController < ApplicationController
    def index
        flash[:notice] = '晚安！雪娇！'
    end
end
