require 'spec_helper'

describe "UserPages" do
  
  subject {page}

  describe "signup page" do
  	befor {visit signup_page}

  	it {should have_selector('h1', text: 'Sign up')}
  	it {should have_selector('title', text: full_title('Sign up'))}
  end
end