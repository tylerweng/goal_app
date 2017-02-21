require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Register")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up_new_user("bob", "password")
      expect(page).to have_content "bob"
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    visit new_session_url
    expect(page).to have_content("Log In")
  end

    feature "logging in a user" do

      scenario "shows username on the homepage after signup" do
        sign_up_new_user("steve", "password")
        click_button "Log Out"
        log_in_existing_user("steve", "password")
        expect(page).to have_content "steve"
      end

    end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to have_content("Log In")
    expect(page).to have_content("Register")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_user_url
    sign_up_new_user("steve", "password")
    expect(page).to have_button("Log Out")
    click_button "Log Out"
    expect(page).to_not have_content("steve")
  end

end
