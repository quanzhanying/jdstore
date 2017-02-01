class WelcomeController < ApplicationController
    def index
        flash[:notice] = '早安！小笨蛋！'
    end
end
