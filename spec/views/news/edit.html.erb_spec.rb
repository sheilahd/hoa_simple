require 'rails_helper'

RSpec.describe "news/edit", type: :view do
  before(:each) do
    @news = assign(:news, News.create!(
      title: "MyString",
      body: "MyText",
      user: nil
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do

      assert_select "input[name=?]", "news[title]"

      assert_select "textarea[name=?]", "news[body]"

      assert_select "input[name=?]", "news[user_id]"
    end
  end
end
