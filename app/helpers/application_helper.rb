module ApplicationHelper
  def get_user(object)
    @user = User.find(object.user_id)
  end
end
