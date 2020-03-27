require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

  before(:each) do
    @user = create(:user)
    log_in @user
    @group = create(:group, creator_id: @user.id)
  end

  describe "GET Index" do
    it 'should render the Index template' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET Show" do
    it 'should render the show template' do
      purchase = create(:purchase, author_id: @user.id, group_id: @group.id)
      get :show, params: { id: purchase.id }
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe "GET New" do
    it 'should render the new template' do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template :new
    end
  end

  describe "POST Create" do
    it 'should create a new purchase' do
      expect do
        post :create, params: { purchase: {
          name: "New purchase",
          amount: 23,
          creator_id: @user.id,
          group_id: @group.id
        }}
      end.to change { Purchase.count() }
      expect(response.status).to eq(302)
      expect(response).to redirect_to purchases_path
    end

    it 'should render the render template with an invalid name' do
      expect do
        post :create, params: { purchase: {
          name: "",
          amount: 23,
          creator_id: @user.id,
          group_id: @group.id
        }}
      end.not_to change { Purchase.count() }
      expect(response).to render_template :new
    end

    it 'should render the render template with an invalid amount' do
      expect do
        post :create, params: { purchase: {
          name: "New transaction",
          amount: nil,
          creator_id: @user.id,
          group_id: @group.id
        }}
      end.not_to change { Purchase.count() }
      expect(response).to render_template :new
    end
  end
  
  
end