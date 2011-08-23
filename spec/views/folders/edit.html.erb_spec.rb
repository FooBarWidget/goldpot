require 'spec_helper'

describe "folders/edit.html.erb" do
  before(:each) do
    @folder = assign(:folder, stub_model(Folder))
  end

  it "renders the edit folder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => folders_path(@folder), :method => "post" do
    end
  end
end
