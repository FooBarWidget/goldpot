require 'spec_helper'

describe "spendings/show.html.erb" do
  before(:each) do
    @spending = assign(:spending, stub_model(Spending))
  end

  it "renders attributes in <p>" do
    render
  end
end
