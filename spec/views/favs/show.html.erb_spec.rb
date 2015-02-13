require 'spec_helper'

describe "favs/show" do
  before(:each) do
    @fav = assign(:fav, stub_model(Fav,
      :user_id => 1,
      :movie_id => 2,
      :value => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
