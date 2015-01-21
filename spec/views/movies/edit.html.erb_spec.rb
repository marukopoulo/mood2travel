require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :videoId => "",
      :youtubeID => "MyString",
      :city => "MyString",
      :country => "MyString",
      :hour => "",
      :minute => "",
      :director => "MyString",
      :directorUrl => "MyString",
      :walker => "MyString",
      :walkerUrl => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_videoId[name=?]", "movie[videoId]"
      assert_select "input#movie_youtubeID[name=?]", "movie[youtubeID]"
      assert_select "input#movie_city[name=?]", "movie[city]"
      assert_select "input#movie_country[name=?]", "movie[country]"
      assert_select "input#movie_hour[name=?]", "movie[hour]"
      assert_select "input#movie_minute[name=?]", "movie[minute]"
      assert_select "input#movie_director[name=?]", "movie[director]"
      assert_select "input#movie_directorUrl[name=?]", "movie[directorUrl]"
      assert_select "input#movie_walker[name=?]", "movie[walker]"
      assert_select "input#movie_walkerUrl[name=?]", "movie[walkerUrl]"
    end
  end
end
