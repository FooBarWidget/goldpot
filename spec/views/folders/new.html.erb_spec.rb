require 'spec_helper'

describe "folders/new.html.erb" do
  before(:each) do
    assign(:folder, stub_model(Folder).as_new_record)
  end

  it "renders new folder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => folders_path, :method => "post" do
    end
  end
end
