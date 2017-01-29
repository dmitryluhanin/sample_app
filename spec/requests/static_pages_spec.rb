require 'spec_helper'


describe "StaticPages" do
 subject {page}

  describe "Home pages" do
    before {visit root_path}
      it { should have_content('Sample App') }
      it { should_not have_title(full_title('| Home')) } 

      describe "for signed-in users" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem")
          FactoryGirl.create(:micropost, user: user, content: "Ipsum")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            expect(page).to have_selector("li##{item.id}", text: item.content)
          end
        end

        describe "follower/following counts" do
          let(:other_user) { FactoryGirl.create(:user) }
          before do
            other_user.follow!(user)
            visit root_path
          end

          it { should have_link("0 following", href: following_user_path(user)) }
          it { should have_link("1 followers", href: followers_user_path(user)) }
        end
      end

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


  describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end



it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to  have_title(full_title('Help')) 
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "Home"
    #click_link "sample app"
    expect(page).to have_title(full_title('sample app'))# заполнить
  end


end
