module AdminsHelper
  def app_admin?
    return false unless user_signed_in?
    return true if current_user.app_admin == true
  end

  def require_admin
    unless current_user.app_admin?
      redirect_to root_path
    end
  end
end