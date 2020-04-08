class Intervention < ApplicationRecord
    # belongs_to :author, class_name: "Employee"
    belongs_to :employee, optional: true
    belongs_to :customer
    belongs_to :building
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true

    after_save :create_intervention_ticket

    def create_intervention_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{Employee.find(self.author).first_name} #{Employee.find(self.author).last_name}", 
            :comment => { 
                :value => "The contact company #{Customer.find(self.customer_id).company_name} 
                    has a problem in building ##{self.building_id}
                    #{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators.
                    \n\n
                    Project Description
                    #{self.project_desc}\n\n
                    Attached Message: #{self.message}"
            }, 
            :requester => { 
                "name": Employee.find(self.author).first_name
                "email": Employee.find(self.author).email 
            },
            :priority => "normal",
            :type => "question"
        )
    end
end