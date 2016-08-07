class HomepageController < ApplicationController
  before_action :logged_in?

  def index
    render :index
  end

  private

  def logged_in?
    redirect_to user_url(current_user) if current_user
  end
end
