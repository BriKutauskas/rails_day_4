require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature, :js=>true do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and model year' do
        save_and_open_page
          fill_in 'make', with: 'DeLorean'
          fill_in 'year', with: '1985'
          fill_in 'model', with: 'model'
          # fill_in 'color', with: 'blue'
      end
      And 'I can submit the information' do
        click_button 'Create new car'
      end

      Then "I can see the car's info" do
       expect(page).to have_content('DeLorean')
       expect(page).to have_content('1985')
       expect(page).to have_content('model')
      end
      And 'I can see the speed of the car' do
       expect(page).to have_content('Speed: 0Km/h')
      end
      When "I can click the accelerate button" do
        click_button 'Accelerate'
      end
      Then 'the speed of the car should be 10Km/h higher' do
        expect(page).to have_content('Speed: 10Km/h')
      end
      When "I can click the brake button" do
        click_button 'Brake'
      end
      Then 'the speed of the car should be 7Km/h lower' do
        expect(page).to have_content('Speed: 3Km/h')
      end
      When "I can click the brake button multiple times" do
        3.times do
          click_button 'Brake'
        end
      end
      Then 'the speed of the car should be 0Km/h' do
        expect(page).to have_content('Speed: 0Km/h')
      end
      When "I can click a button that toggles lights on and off" do
        click_button 'Lights'
      end
      Then "The lights should be on" do
        expect(page).to have_content('Lights : true')
      end
      When "I can select radio button on" do
        choose 'on'
        click_button 'Submit'
      end
      Then "The parking brake will be on" do
        expect(page).to have_content('Parking Brake: true')
      end
      When "Speed is greater than zero, parking brake can't be turned on"  do
        click_button 'Accelerate'
        choose 'on'
      end
      Then "parking brake will be unable to be turned on" do
        expect(page).has_no_checked_field?("on")
      end

    end
  end
end
