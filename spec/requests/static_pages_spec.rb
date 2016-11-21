require 'spec_helper'


describe "StaticPages" do
 subject {page}

  describe "Home pages" do
    before {visit root_path}
      it { should have_content('Sample App') }
      it { should_not have_title(full_title('| Home')) } 
    end

describe "Help page" do
  before {visit help_path}
    it { should have_content('Help') }
    it { should_not have_title(full_title('| Help')) }
  end

describe "About page" do
  before {visit about_path}
    it { should have_content('About Us') }
    it { should_not have_title(have_title('| About Us')) }
  end

describe "Contact" do
  before {visit contact_path}
    it { should have_content('Contact') }
    it { should_not have_title(have_title('| Contact')) }
  end


it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to  have_title(full_title('Help')) # заполнить
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))# заполнить
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sing up'))# заполнить
    click_link "Home"
    #click_link "sample app"
    expect(page).to have_title(full_title('sample app'))# заполнить
  end


end
