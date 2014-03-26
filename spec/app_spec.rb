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

    click_on "Add to List"
    fill_in "title", :with => "Song Title"
    fill_in "artist", :with => "Artist Blah"
    fill_in "language", :with => "Blah Language"
    click_on "Submit"
    expect(page).to have_content("Song Title")
    expect(page).to have_content("Artist Blah")
    expect(page).to have_content("Blah Language")

    #can add to the list via form
    #can sort by sort title, or artist
    #can search for specific song/artist
    #can display youtube videos
  end
end