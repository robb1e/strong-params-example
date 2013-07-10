class UsersController < ApplicationController

  class UserParams
    def self.clean params
      ActionController::Parameters.new(params).require(:user).permit(:name)
    end
  end

  def create
    User.create(UserParams.clean(params))
  end

end
