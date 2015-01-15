require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "MyString",
      :place => "MyString",
      :time => "MyString",
      :walker => "MyString",
      :director => "MyString",
      :video => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_place[name=?]", "item[place]"
      assert_select "input#item_time[name=?]", "item[time]"
      assert_select "input#item_walker[name=?]", "item[walker]"
      assert_select "input#item_director[name=?]", "item[director]"
      assert_select "input#item_video[name=?]", "item[video]"
    end
  end
end
