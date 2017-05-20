class WelcomeController < ApplicationController
  def index
    @classfication_pris = ClassficationPri.all
    # @classfication_subs = ClassficationSub.all
  end
end
