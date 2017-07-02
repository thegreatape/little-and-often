class HomeController < ApplicationController
  before_action :redirect_if_authenticated

  def index
  end

  private
  def redirect_if_authenticated
    if current_user.present?
      redirect_to new_activity_entry_path
    end
  end
end
