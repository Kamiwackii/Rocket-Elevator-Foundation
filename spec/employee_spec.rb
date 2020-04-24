ENV["RAILS_ENV"] = "development"
require 'rails_helper'

RSpec.describe "GET admin#login", :type => :feature do
    context "failed to login" do
        before do
            visit 'admin/login'
            click_button "Login"
        end
        it "flashes Invalid Email or password" do
            expect(page).to have_content('Invalid Email or password.')
        end
    end
    context "successfully logged in" do
        before do
            visit 'admin/login'
            fill_in "Email", with: "admin@example.com"
            fill_in "Password", with: "Password123!"
            click_button "Login"
        end
        it "redirects you to the dashboard" do
            expect(page.current_path).to eq('/admin')
        end
    end
    context "forgotten password" do
        before do
            visit 'admin/login'
            click_link "Forgot your password?"
        end
        it "redirects you to the new password page" do
            expect(page.current_path).to eq('/admin/password/new')
        end
    end
    context "new employee" do
        before do
            visit 'admin/login'
            click_link "Sign up"
        end
        it "redirects you to sign up page" do
            expect(page.current_path).to eq('/admin/sign_up')
        end
    end
end

