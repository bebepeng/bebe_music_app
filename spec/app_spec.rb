require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Bebe's Favorite Music Site" do
  before do
    DB[:songlist].delete
  end

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

    click_on "Edit Song"
    fill_in "title", :with => "Blah Title"
    click_on "Submit"
    expect(page).to have_content("Blah Title")
    #can sort by sort title, or artist
    #can search for specific song/artist
    #can display youtube videos
  end

  scenario "user sees an error if the link entered is not a valid Youtube link" do
    visit '/'
    click_on "click to enter"
    click_on "Add to List"
    fill_in "title", :with => "Whatever Title"
    fill_in "youtube", :with => "blah.com/whatever"
    click_on "Submit"
    expect(page).to have_content("Please Enter a Valid Youtube Link")

    fill_in "youtube", :with => "http://youtu.be/6hhkblKij7w"
    click_on "Submit"
    expect(page).to have_content("List of Bebe's Favorite Songs:")
    expect(page).to have_content("Whatever Title")

    click_on "Edit Song"
    fill_in "youtube", :with => ("other link")
    click_on "Submit"
    expect(page).to have_content("Please Enter a Valid Youtube Link")
  end
end