require 'spec_helper'

describe "AuthenticationPages" do

	subject { page }

  describe "signin" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'sign in') }
  end
end