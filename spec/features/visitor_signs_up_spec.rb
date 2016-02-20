require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_field("user[email]")
    # expect(page).to have_field("user[password]")
    expect(page).to have_content("An entertainment guide for your inbox.")

    fill_in "user[email]", with: "bruce@spam.org"
    click_button "Give me emails!"

    expect(User.count).to eq(1)
    # Should redirect to thank you page
  end
end
