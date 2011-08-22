require 'spec_helper'

describe "spendings/edit.html.erb" do
  before(:each) do
    @spending = assign(:spending, stub_model(Spending))
  end

  it "renders the edit spending form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => spendings_path(@spending), :method => "post" do
    end
  end
end
