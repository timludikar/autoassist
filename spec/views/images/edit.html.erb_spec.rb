require 'spec_helper'

describe "images/edit.html.erb" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :article_id => 1
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path(@image), :method => "post" do
      assert_select "input#image_article_id", :name => "image[article_id]"
    end
  end
end
