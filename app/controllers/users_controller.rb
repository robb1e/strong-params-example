class UsersController < ApplicationController

  class UserParams < ActionController::Parameters
    def initialize params
      filtered_params = params.
        require(:user).
        permit(:name)
      super(filtered_params)
    end
  end

  def create
    User.create(UserParams.new(params))
  end

end
