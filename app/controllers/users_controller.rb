class UsersController < ApplicationController

  class UserParams
    def self.build params
      filtered_params = params.
        require(:user).
        permit(:name)
    end
  end

  def create
    User.create(UserParams.build(params))
  end

  def update
    User.find(params[:id]).update_attributes(UserParams.build(params))
    redirect_to root_path
  end

end
