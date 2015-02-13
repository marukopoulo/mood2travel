require 'spec_helper'

describe "favs/index" do
  before(:each) do
    assign(:favs, [
      stub_model(Fav,
        :user_id => 1,
        :movie_id => 2,
        :value => 3
      ),
      stub_model(Fav,
        :user_id => 1,
        :movie_id => 2,
        :value => 3
      )
    ])
  end

  it "renders a list of favs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
