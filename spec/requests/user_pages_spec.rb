require 'spec_helper'

describe "UserPages" do
 subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end


  describe "Signup page" do
    before { visit signup_path}
    it { should have_content('Sing up') }
    it { should have_title(full_title('Sing up')) }
    end

  describe "signup page" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Dmitry"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
    
    describe "after saving the user" do
      before {click_button submit}
      let(:user) {User.find_by(email: 'example@example.com')}

      it {should have_link ('Sign out')}
      it {should have_title (user.name)}
      it {should have_selector('div.alert.alert-success', text: 'Welcome')}
    end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
  describe "signup" do
    before { visit signup_path }
    describe "with invalid information" do
      before do
        fill_in "Name",         with: ""
        fill_in "Email",        with: ""
        fill_in "Password",     with: ""
        fill_in "Confirmation", with: ""
      end

    describe "after submission" do
        before { click_button "Create my account" }

        it { should have_title('Sing up') }
        it { should have_content('The form contains 5 errors.') }
        it { should have_content('Name can\'t be blank') }
        it { should have_content('Email is invalid') }
      end
    end
  end
end
