require 'spec_helper'

describe "UserPages" do
 subject { page }

    describe "index" do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        sign_in user
        visit users_path
      end
      it { should have_title('All users') }
      it { should have_content('All users') }

      describe "pagination" do
        before(:all) { 30.times { FactoryGirl.create(:user) } }
        after(:all)  { User.delete_all }
        it { should have_selector('div.pagination') }
      end
    
    it "should list each user" do
       User.all.each do |user|
         expect(page).to have_selector('li', text: user.name)
       end
    end
  end
 


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
   end 
    describe "after saving the user" do
      before {click_button submit}
      let(:user) {User.find_by(email: 'example@example.com')}

      it {should have_link ('Sign out')}
      it {should have_title (user.name)}
      it {should have_selector('div.alert.alert-success', text: 'Welcome')}
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

    describe "edit" do 
      let(:user) { FactoryGirl.create(:user) }
      before do 
        sign_in user
        visit edit_user_path(user)
      end   
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end
    end
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }



  before { visit edit_user_path(user) }

      describe "page" do
        it { should have_content ("Update your profile") }
        it { should have_title ("Edit user") }
        it { should have_link('change', href: 'http://gravatar.com/emails') }

      describe "with invalid information" do
        before {click_button "Save changes" }
        it {should have_content('error')}

      end
      end
 end

end

