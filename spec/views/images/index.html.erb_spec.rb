require 'spec_helper'

describe "images/index.html.erb" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :article_id => 1
      ),
      stub_model(Image,
        :article_id => 1
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
