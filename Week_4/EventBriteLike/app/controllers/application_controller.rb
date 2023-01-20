class ApplicationController < ActionController::Base
  include EventsHelper
  include UserHelper
  include AttendanceHelper
  include AdminsHelper
  include ApplicationHelper 

  def authorize_admin
    if user_signed_in?
      redirect_to root_path, status: 401 unless current_user.app_admin
    else
      redirect_to new_user_session_path
    end
  end

end
