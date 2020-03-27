# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET New' do
    it 'should render the new template' do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template('new')
    end
  end

  describe 'POST Create' do
    it 'should create a new user' do
      expect(logged_in?).to be(false)
      expect do
        post :create, params: { user: { name: 'Yair' } }
      end.to(change { User.count })
      expect(logged_in?).to be(true)
      expect(response).to redirect_to root_path
    end

    it 'should render new template again with invalid attributes' do
      expect(logged_in?).to be(false)
      post :create, params: { user: { name: '' } }
      expect(response).to render_template('new')
      expect(logged_in?).to be(false)
    end
  end

  describe 'GET Show' do
    it 'should render the show template' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe 'GET External Transactions' do
    it 'should render the external transactions that belongs to that user' do
      user = create(:user)
      log_in user
      get :external_transactions
      expect(response.status).to eq(200)
      expect(response).to render_template :external_transactions
    end
  end
end
