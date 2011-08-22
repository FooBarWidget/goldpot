require 'spec_helper'

describe "spendings/index.html.erb" do
  before(:each) do
    assign(:spendings, [
      stub_model(Spending),
      stub_model(Spending)
    ])
  end

  it "renders a list of spendings" do
    render
  end
end
