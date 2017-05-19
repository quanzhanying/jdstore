class WelcomeController < ApplicationController
  before_action :authenticate_user! , only: [:new]
end
