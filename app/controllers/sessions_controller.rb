class SessionsController < Devise::SessionsController
  after_action :greet_user, only: :create

  def greet_user
    flash[:info] = t '.hello', name: current_user.name
  end
end
