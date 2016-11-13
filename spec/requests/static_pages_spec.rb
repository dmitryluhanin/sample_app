require 'spec_helper'

describe "StaticPages" do
 let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "GET /static_pages" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the title" do
      visit '/static_pages/home'
      expect(page).not_to have_title("| Home")
    end

    it "should have the title" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

  end


describe "Help page" do
 it "should have the content" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title" do
      visit '/static_pages/help'
      expect(page).not_to have_title("Help")
    end
    it "should have the title" do
      visit '/static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

  end

describe "About page" do

    it "should have the content" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    it "should have the title" do
      visit '/static_pages/about'
      expect(page).not_to have_title("About Us")
    end
    it "should have the title" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

  end

describe "Contact" do

    it "should have the content" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
    it "should have the title" do
      visit '/static_pages/contact'
      expect(page).not_to have_title("Contact")
    end
    it "should have the title" do
      visit '/static_pages/contact'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

  end


end
