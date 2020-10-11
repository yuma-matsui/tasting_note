class UsersController < ApplicationController
before_action :user_find, only:[:show]
  
  private

  def user_find
    @user = User.find(current_user.id)
  end

end
