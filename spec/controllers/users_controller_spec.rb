require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new users template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "user"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: {username: "user", password: "a"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to user's SHOW page" do
        post :create, user: {username: "user", password: "password"}
        user = User.find_by_username("user")
        expect(response).to redirect_to(user_url(user))
      end

      it "logs in the user" do
        post :create, user: {username: "user", password: "password"}
        user = User.find_by_username("user")
        expect(session[:session_token]).to eq(user.session_token)
      end
    end
  end


end
