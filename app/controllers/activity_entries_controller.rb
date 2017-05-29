class ActivityEntriesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    activity = current_user.activities.find_or_create_by(name: params[:activity_entry][:activity])
    activity.activity_entries.create!(activity_entry_params)
    redirect_to new_activity_entry_path
  end

  private
  def activity_entry_params
    params[:activity_entry].permit(
      :minutes,
      :performed_on
    )
  end
end
