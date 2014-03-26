require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Bebe's Favorite Music Site" do
  scenario "displays a list of my favorite music" do

    visit '/'
    expect(page).to have_content("Welcome")

    click_on "click to enter"
    expect(page).to have_content("List of Bebe's Favorite Songs")
    #can add to the list via form
    #can sort by sort title, or artist
    #can search for specific song/artist
    #can display youtube videos
  end
end