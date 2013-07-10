class UsersController < ApplicationController

  class UserParams
    include ActionController::StrongParameters

    attr_reader :request

    def initialize req
      @request = req
    end

    def clean
      params.require(:user).permit(:name)
    end
  end

  def create
    User.create(UserParams.new(request).clean)
  end

end
