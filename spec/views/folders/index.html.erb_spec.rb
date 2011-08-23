require 'spec_helper'

describe "folders/index.html.erb" do
  before(:each) do
    assign(:folders, [
      stub_model(Folder),
      stub_model(Folder)
    ])
  end

  it "renders a list of folders" do
    render
  end
end
