require 'rails_helper'

describe "Project Paths", type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe "Create and View Project" do
    it "allows the user to create new Project", :js => true do
      visit projects_path
      click_link("New Project")
      fill_in 'Title', :with => 'Code'
      fill_in 'Description', :with => 'Code'
      fill_in 'Link', :with => 'Code'
      click_on 'Create Project'
      expect(page).to have_content 'Code'
    end
  end
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
