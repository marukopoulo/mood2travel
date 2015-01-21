require 'spec_helper'

describe "movies/show" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Youtube/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Director/)
    rendered.should match(/Director Url/)
    rendered.should match(/Walker/)
    rendered.should match(/Walker Url/)
  end
end
