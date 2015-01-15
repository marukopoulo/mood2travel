require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :title => "MyString",
      :place => "MyString",
      :time => "MyString",
      :walker => "MyString",
      :director => "MyString",
      :video => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_place[name=?]", "item[place]"
      assert_select "input#item_time[name=?]", "item[time]"
      assert_select "input#item_walker[name=?]", "item[walker]"
      assert_select "input#item_director[name=?]", "item[director]"
      assert_select "input#item_video[name=?]", "item[video]"
    end
  end
end
