module WelcomeHelper
  def index
    flashes[:notice] = "good morning"
  end
end
