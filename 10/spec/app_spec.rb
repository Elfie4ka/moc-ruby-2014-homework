require 'rspec'

require File.expand_path '../spec_helper.rb', __FILE__

#RSpec.describe ArticlesController, :type => :controller do
#end

RSpec.describe Article, :type => :model do


  it "loads all of the posts into @posts" do
    first = Article.create!(title: "My first article", text: "Hello everybody")
    second = Article.create!(title: "My second article", text: "are you here?")
    third = Article.create!(title: "My third article", text: "Party hard")

    expect(Article.all).to match_array([first, second, third])
  end

  describe ArticlesController, :type => :controller do
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do``
        post :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end



    end
  end

end