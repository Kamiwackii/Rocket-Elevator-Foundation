ENV["RAILS_ENV"] = "development"
require 'rails_helper'
require 'logger'

RSpec.describe InterventionsController, :type => :controller do
    let!(:intervention){Intervention.new}
    context "when creating a new intervention" do
        it "logs an error message when the required attributes are missing" do
            expect(Rails.logger).to receive(:error).with("failed to save intervention, missing params")
            controller.send(:log_error)
        end
    end
end