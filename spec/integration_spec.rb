require('spec_helper')
require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('survey', {:type => :feature}) do
  it "allows designer to add a survey and add questions to that survey" do
    visit('/')
    click_link('Add Survey')
    fill_in('survey_title', :with=>'how are we doing')
    click_button('Submit')
    expect(page).to have_content('How Are We Doing')
    click_link('How Are We Doing')
    expect(page).to have_content('How Are We Doing')
  end
end
