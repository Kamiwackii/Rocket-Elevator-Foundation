# ROCKET ELEVATORS FOUNDATION

  Goal for the week : Create Intervention table, implement ZenDesk and a form for it
  
## Week 11 - TDD (update)
  
  - integrated 3 tests for existing code under ./spec/

  - applied TDD to implement a new feature using youtube's search api from google
  
  - the feature is located in ./lib/features/streamer.rb and the tests in ./spec/streamer_spec.rb
  
  - run "bundle exec rspec --format documentation" to run the tests
  
  - also implemented the same feature in python at https://github.com/Kamiwackii/Python_TDD_Example
  
  - visit https://jackielai.xyz/fun to view the feature

## Implementations 
  - migrations, create the intervention table with the correct attributes and foreign keys

  - Zendesk, create a problem type ticket when an intervention is made

  - Rest API, consult this repo: https://github.com/Kamiwackii/Rocket-Elevator-Rest-Api

  - MVC for intervention, including javascript for intervention form 
  
## Back Office Admin Logins 
  
  - Mathieu Houde | coach | mathieu.houde@codeboxx.biz | password: Aa123123123!  
  
  - Patrick Thibault | coach | tiboclan@gmail.com | password: Aa123123123!  
  
  - Philippe Motillon | coach | philippe.motillon@keyrus.ca | password: Aa123123123!  
  
  - Khalid Kjado | coach | kdjado@gmail.com | password: Aa123123123!  
  
  - Antoine Deblonde | coach | antoine.deblonde@keyrus.ca | password: Aa123123123!  
  
  - Ibrahim Mahamane | coach | imahamaneissa@gmail.com | password: Aa123123123!  



  ## SPECIAL INSTRUCTIONS FOR BEGINNERS WHO WANT TO RUN THIS APP

  1 - Clone the repository.

  2 - Create a file named " application.yml " inside the config folder.

  3 - Once you will have your own api key's you can add then inside the "your_api_key" inside the following code.


        # Add configuration values here, as shown below.
        #
        # pusher_app_id: "2954"
        # pusher_key: 7381a978f7dd7f9a1117
        # pusher_secret: abdc3b896a0ffb85d373
        # stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
        # stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
        #
        # production:
        #   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
        #   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU

        Google_API_Key: "your_api_key"       <-------
        Watson_Key: "your_api_key"           <-------
        SENDGRID_API: "your_api_key"         <-------
        SLACK_API_TOKEN: "your_api_key"      <-------
        SLACK_API_WEBHOOK_URL: "your_api_key" <-------
        ZENDESK_URL: "your_api_key"          <-------
        ZENDESK_USERNAME: "your_api_key"     <-------
        ZENDESK_TOKEN: "your_api_key"        <-------
        TWILIO_ACCOUNT_SID: "your_api_key"   <-------
        TWILIO_AUTH_TOKEN: "your_api_key"    <-------
        TWILIO_PHONE_NUMBER: "your_api_key"  <-------


  4 - After implementing your key's, generate a file named " database.yml " and put your own database information inside "your_info"

  - The code will look like that : 
        default: &default
          adapter: mysql2
          encoding: utf8
          pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
          username: root
          password:
          socket: /tmp/mysql.sock

        development:
          <<: *default
          database: "your_info"
        test:
          <<: *default
          database: "your_info"

        production:
          <<: *default
          database: "your_info"
          username: "your_info"
          password: <%= ENV['"YOUR_INFO"'] %>

  
