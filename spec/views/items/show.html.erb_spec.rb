require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "Title",
      :place => "Place",
      :time => "Time",
      :walker => "Walker",
      :director => "Director",
      :video => "Video"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Place/)
    rendered.should match(/Time/)
    rendered.should match(/Walker/)
    rendered.should match(/Director/)
    rendered.should match(/Video/)
  end
end
