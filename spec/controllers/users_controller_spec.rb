require 'spec_helper'

describe UsersController do

  describe UsersController::UserParams do
    it 'cleans the params' do
      cleaned = UsersController::UserParams.clean(user: { foo: 'bar', name: 'baz' })
      expect(cleaned).to eq({name: 'baz'}.with_indifferent_access)
    end
  end

  describe "#create" do
    let(:http_params) {{ user: { first_name: 'Robbie', last_name: 'Clutton', name: 'Robbie Clutton' }}}
    let(:model_params) { double(:model_params) }

    it 'creates a user' do
      UsersController::UserParams.stub(:clean).with(http_params.merge(controller: 'users', action: 'create').with_indifferent_access) { model_params }
      User.should_receive(:create).with(model_params)
      post :create, http_params
    end

    it 'creates another user' do
      UsersController::UserParams.stub(:clean) { model_params }
      User.should_receive(:create).with(model_params)
      post :create, http_params
    end
  end

end
