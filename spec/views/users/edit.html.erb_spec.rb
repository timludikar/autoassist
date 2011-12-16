require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first => "MyString",
      :last => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_first", :name => "user[first]"
      assert_select "input#user_last", :name => "user[last]"
      assert_select "input#user_email", :name => "user[email]"
    end
  end
end
