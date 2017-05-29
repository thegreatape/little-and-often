class ActivityEntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entries = current_user.activity_entries
  end

  def create
    activity = find_or_create_activity
    activity.activity_entries.create!(activity_entry_params)
    redirect_to new_activity_entry_path
  end

  private

  def find_or_create_activity
    activity_param = params[:activity_entry][:activity]
    if activity_param =~ /^\d+$/
      current_user.activities.find(activity_param)
    else
      current_user.activities.find_or_create_by(name: activity_param)
    end
  end
  def activity_entry_params
    params[:activity_entry].permit(
      :minutes,
      :performed_on
    )
  end
end
