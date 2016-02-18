require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    expect(page).to have_content("An entertainment guide for your inbox.")
  end
end
