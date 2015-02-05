require 'rspec'

require File.expand_path '../spec_helper.rb', __FILE__

#RSpec.describe ArticlesController, :type => :controller do
#end


describe "/" do
  it "should allow accessing the default route" do
    get '/'
    expect(last_response).to be_ok
  end
end



RSpec.describe Article, :type => :model do
  it "orders by input order" do
    first = Article.create!(title: "My first article", text: "Hello everybody")
    second = Article.create!(first_name: "My second article", last_name: "are you here?")

    expect(Article.ordered).to eq([first, second])
  end
end


describe "article" do


  before :all do


# Here I should implement method to add hero with name HERO_NAME to DB without using my app.
    post '/article/?', :title => 'title'
  end

