require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :title => "Title",
        :place => "Place",
        :time => "Time",
        :walker => "Walker",
        :director => "Director",
        :video => "Video"
      ),
      stub_model(Item,
        :title => "Title",
        :place => "Place",
        :time => "Time",
        :walker => "Walker",
        :director => "Director",
        :video => "Video"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "Time".to_s, :count => 2
    assert_select "tr>td", :text => "Walker".to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
  end
end
