require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit the home page" do
    describe 'I select grejoy from a drop down box' do
      describe 'and I click on get members' do
        before :each do
          @user = User.create(name: "Bob")
        end

        it 'then my path should be /search with house=joy in the parameters' do


          visit root_path

          select "Greyjoy", from: :house

          click_on "Get Members"

          expect(current_path).to eq(search_path)
          save_and_open_page
          expect(page).to have_content("7 Members of House Greyjoy")

          expect(page).to have_css(".member", count: 7)
        end
      end
    end
  end
end

# ```As a user
# When I visit "/"
# And I select "Greyjoy" from the dropdown
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.```
#
#
# Your key is: egg
