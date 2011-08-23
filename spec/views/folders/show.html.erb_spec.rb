require 'spec_helper'

describe "folders/show.html.erb" do
  before(:each) do
    @folder = assign(:folder, stub_model(Folder))
  end

  it "renders attributes in <p>" do
    render
  end
end
