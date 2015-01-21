require 'spec_helper'

describe "movies/index" do
  before(:each) do
    assign(:movies, [
      stub_model(Movie,
        :videoId => "",
        :youtubeID => "Youtube",
        :city => "City",
        :country => "Country",
        :hour => "",
        :minute => "",
        :director => "Director",
        :directorUrl => "Director Url",
        :walker => "Walker",
        :walkerUrl => "Walker Url"
      ),
      stub_model(Movie,
        :videoId => "",
        :youtubeID => "Youtube",
        :city => "City",
        :country => "Country",
        :hour => "",
        :minute => "",
        :director => "Director",
        :directorUrl => "Director Url",
        :walker => "Walker",
        :walkerUrl => "Walker Url"
      )
    ])
  end

  it "renders a list of movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
    assert_select "tr>td", :text => "Director Url".to_s, :count => 2
    assert_select "tr>td", :text => "Walker".to_s, :count => 2
    assert_select "tr>td", :text => "Walker Url".to_s, :count => 2
  end
end
