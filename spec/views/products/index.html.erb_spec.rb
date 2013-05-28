require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :description => "MyText",
        :serves => 1
      ),
      stub_model(Product,
        :name => "Name",
        :description => "MyText",
        :serves => 1
      )
    ])
  end

  it "renders a list of products" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div.main>div.body", :count => 1
  end
end
