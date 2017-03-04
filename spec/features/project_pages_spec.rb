require 'rails_helper'

describe "Project Paths", type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe "Create and View Project", :vcr => true do
    it "allows the user to create new Project" do
      visit projects_path
      click_link("New Project")
      fill_in 'Title', :with => 'Code'
      fill_in 'Description', :with => 'Code'
      fill_in 'Link', :with => 'Code'
      click_on 'Create Project'
      expect(page).to have_content 'Code'
    end
    it "allows the user to fail at creating a project" do
      visit projects_path
      click_link("New Project")
      fill_in 'Title', :with => 'Code'
      fill_in 'Description', :with => 'Code'
      click_on 'Create Project'
      expect(page).to have_content 'Please fill everything in'
    end
  end
  describe "DELETES", :vcr => true do
    it "delete a job" do
      visit projects_path
      click_link("New Project")
      fill_in 'Title', :with => 'BIG'
      fill_in 'Description', :with => 'BIG'
      fill_in 'Link', :with => 'BIG'
      click_on 'Create Project'
      click_on 'Delete Project'
      expect(page).to_not have_content 'BIG'
    end
  end
  describe "basic pathing", :vcr => true do
    it "about pathing" do
      visit root_path
      click_link "About"
      expect(page).to have_content 'About'
    end
  end
  describe "filtering projects", :vcr => true do
    it "All projects" do
      visit projects_path
      click_link "View Complete"
      expect(page).to have_content 'All My Github Projects'
    end
    it "starred projects" do
      visit projects_path
      click_link "View Starred"
      expect(page).to have_content 'Starred Github Projects'
    end
  end
end
