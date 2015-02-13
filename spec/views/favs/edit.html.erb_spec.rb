require 'spec_helper'

describe "favs/edit" do
  before(:each) do
    @fav = assign(:fav, stub_model(Fav,
      :user_id => 1,
      :movie_id => 1,
      :value => 1
    ))
  end

  it "renders the edit fav form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fav_path(@fav), "post" do
      assert_select "input#fav_user_id[name=?]", "fav[user_id]"
      assert_select "input#fav_movie_id[name=?]", "fav[movie_id]"
      assert_select "input#fav_value[name=?]", "fav[value]"
    end
  end
end
