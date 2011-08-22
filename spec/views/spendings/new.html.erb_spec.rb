require 'spec_helper'

describe "spendings/new.html.erb" do
  before(:each) do
    assign(:spending, stub_model(Spending).as_new_record)
  end

  it "renders new spending form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => spendings_path, :method => "post" do
    end
  end
end
