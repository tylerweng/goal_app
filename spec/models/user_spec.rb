# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "password_encryption" do
    it "does not save passwords to the database" do
      User.create!(username: "user", password:
      "password")
      user = User.find_by(username: "user")
      expect(user.password).not_to be("password")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "user", password: "password")
    end

    describe "session token" do
      it "assigns a sesssion token if one is not given" do
        user = User.create(username: "user", password: "password")
        expect(user.session_token).not_to be_nil
      end
    end

    describe "::find_by_credentials" do

      before do
        user = User.create(username: "user", password: "password")

        it "with valid credentials" do
          expect(User.find_by_credentials(user.username, user.password)).to eq(user)
        end

        it "with invalid credentials" do
          expect(User.find_by_credentials(user.username, "bogus_password")).to be(nil)
        end
      end

    end

  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

end
