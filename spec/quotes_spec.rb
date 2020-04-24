ENV["RAILS_ENV"] = "development"
require 'rails_helper'

RSpec.describe "QuoteController", :type => :controller do
    let!(:quote){Quote.new}
    context "When a new quote is created" do
        it "should first have a response status of 200" do
            expect(@response.status).to eq (200)
        end
        it "after save, it should call create_quote_ticket" do 
            expect(quote).to receive(:create_quote_ticket)
            quote.save
        end
    end
end