require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do
    before :each do
      visit new_user_path
    end
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'jack'
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign Up'
      expect(page).to have_content('jack')
      expect(current_path).to eq(users_path)
    end

  end
end

feature 'logging in' do
  before :each do
    visit new_user_path
  end
  scenario 'shows username on the homepage after login' do
    fill_in 'Username', with: 'jack'
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign In'
    expect(page).to have_content('jack')
    expect(current_path).to eq(users_path)
  end

end

feature 'logging out' do


  scenario 'begins with a logged out state' do
    fill_in 'Username', with: 'jack'
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign In'
    
    expect(page).to have_button 'Sign Out'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    fill_in 'Username', with: 'jack'
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign In'
    click_button 'Sign Out'
    expect(current_path).to eq(new_session_path)
    expect(page).to have_content 'Sign In'
    expect(page).to have_content 'Username'
  end

end
