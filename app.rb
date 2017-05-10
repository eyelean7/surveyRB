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

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

post('/surveys') do
  @survey = Survey.create({:name => params.fetch('survey_title')})
  @surveys = Survey.all()
  erb(:surveys)
end

get('/survey/:id') do
  # 'hello world'
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

get ('/survey/:id/questions') do
  @survey = Survey.find(params.fetch("id").to_i)
  @questions = Question.all()
  erb(:questions)
end

post ('/survey/:id/questions') do
  @survey = Survey.find(params.fetch("id").to_i)
  @question = Question.create({:question => params.fetch('question'), :survey_id => @survey.id()})
  @questions = Question.all()
  erb(:questions)
end
