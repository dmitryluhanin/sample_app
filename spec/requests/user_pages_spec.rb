require 'spec_helper'

describe "UserPages" do
 subject { page }

  describe "Singup page" do
    before { visit singup_path}
    it { should have_content('Sing Up') }
    it { should have_title(full_title('Sign up')) }
    end
  end
