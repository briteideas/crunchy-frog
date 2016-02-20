require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_field("user[email]")
    # expect(page).to have_field("user[password]")
    expect(page).to have_content("An entertainment guide for your inbox.")

    fill_in "user[email]", with: "bruce@spam.org"
    click_button "Give me emails!"

    expect(page).to have_content("You've signed up successfully")
    expect(User.count).to eq(1)
  end

  scenario 'with an existing email' do

    2.times do
        visit sign_up_path
        fill_in "user[email]", with: "bruce@spam.org"
        click_button "Give me emails!"
    end

    expect(page).to have_content("Whoops")
    expect(page).to have_content("Email has already been taken")
    expect(User.count).to eq(1)
  end
end
