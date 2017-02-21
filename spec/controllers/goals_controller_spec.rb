require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #new" do
    it "renders the new goal template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      before(:each) do
        sign_up_new_user("user", "password")
      end
      it "validates the presence of the goal's title" do
        post :create, goal: {body: "Twice daily",
                             user_id: 1}
        expect(flash[:errors]).to be_present
      end

      it "validates the presence of the goal's body" do
        post :create, goal: {title: "Kappa",
                             user_id: 1}
        expect(flash[:errors]).to be_present
      end
      it "validates the presence of the goal's user" do
        post :create, goal: {title: "Kappa",
                             body: "Twice daily"}
        expect(flash[:errors]).to be_present
      end
    end

  end

end
