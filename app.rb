require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/survey')
require('./lib/question')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/survey/new') do
  erb(:survey_form)
end

post('/surveys') do
  @survey = Survey.create({:name => params.fetch('survey_title')})
  @surveys = Survey.all()
  erb(:survey)
end
