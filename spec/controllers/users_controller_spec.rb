require 'spec_helper'

describe UsersController do

  describe UsersController::UserParams do
    it 'cleans the params' do
      request = double(:request, parameters: { user: { foo: 'bar', name: 'baz' } }) 
      user_params = UsersController::UserParams.new(request)
      expect(user_params.clean).to eq({name: 'baz'}.with_indifferent_access)
    end
  end

  describe "#create" do
    let(:http_params) {{ user: { first_name: 'Robbie', last_name: 'Clutton', name: 'Robbie Clutton' }}}
    let(:model_params) { double(:model_params) }
    let(:user_params) { double(:user_params, clean: model_params) }

    before do
      UsersController::UserParams.stub(:new) { user_params }
    end

    it 'creates a user' do
      User.should_receive(:create).with(model_params)
      post :create, http_params
    end

    it 'creates another user' do
      User.should_receive(:create).with(model_params)
      post :create, http_params
    end
  end

end
