require('spec_helper')

describe('#save') do
  it "capitalizes the first letter of each word before saving" do
    survey = Survey.create({:name => 'how are we doing'})
    expect(Survey.find(survey.id()).name()).to eq("How Are We Doing")
  end
end
