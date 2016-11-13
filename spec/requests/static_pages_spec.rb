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


end
