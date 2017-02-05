class WelcomeController < ApplicationController
    def  index
        flash[:notice] = "加油,不要心急~"
    end
end
