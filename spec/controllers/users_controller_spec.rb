require 'spec_helper'

describe UsersController do

  describe "#create" do
    it 'creates a user' do
      User.should_receive(:create).with({name: 'Robbie Clutton'}.with_indifferent_access)
      post :create, user: { first_name: 'Robbie', last_name: 'Clutton', name: 'Robbie Clutton' }
    end
  end

end
