require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns all users" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'signs the user in' do
        post :create, params: { user: {username: 'jack', password: 'abcdef' } }
        user = User.find_by(username: 'jack')
        expect(session[:session_token]).to eq(user.session_token)

      end
      it 'redirects to the user\'s show page ' do
        post :create, params: { user: {username: 'jack', password: 'abcdef' } }
        user = User.find_by(username: 'jack')
        expect(response).to redirect_to(users_path)
      end
    end
    context 'with invalid params' do
      it 'validates the presence and length of password and render new template' do
        post :create, params: { user: {username: 'jack', password: '' } }
        expect(flash[:errors]).to be_present
        expect(response).to render_template(:new)
      end
    end

  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #show" do
    it "shows the user's profile" do
      user = User.create!(username: 'jack', password: 'abcdef')
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
