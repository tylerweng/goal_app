require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders the new session template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end
