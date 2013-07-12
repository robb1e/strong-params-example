require 'spec_helper'

describe UsersController do

  describe UsersController::UserParams do
    it 'cleans the params' do
      params = ActionController::Parameters.new(user: {foo: 'bar', name: 'baz'})
      user_params = UsersController::UserParams.build(params)
      expect(user_params).to eq({name: 'baz'}.with_indifferent_access)
    end
  end

  describe "#create" do
    let(:http_params) {{ user: { first_name: 'Robbie', last_name: 'Clutton', name: 'Robbie Clutton' }}}
    let(:model_params) { double(:model_params) }

    context 'nodb' do
      before do
        UsersController::UserParams.stub(:build) { model_params }
      end

      it 'creates a user' do
        UsersController::UserParams.stub(:new).with(http_params.merge(controller: 'users', action: 'create').with_indifferent_access) { model_params }
        User.should_receive(:create).with(model_params)
        post :create, http_params
      end

      it 'creates another user' do
        User.should_receive(:create).with(model_params)
        post :create, http_params
      end
    end

    context 'db' do
      it 'creates a real user' do
        post :create, http_params
        expect(User.count).to equal(1)
        expect(User.last.name).to eq('Robbie Clutton')
      end
    end

  end

  describe "#update" do
    let(:http_params) {{ id: user.id, user: { name: 'bar' } }}
    let!(:user) { User.create(name: 'foo') }

    context 'db' do
      it 'updates the user' do
        post :update, http_params
        expect(User.last.name).to eq('bar')
      end
    end
  end

end
