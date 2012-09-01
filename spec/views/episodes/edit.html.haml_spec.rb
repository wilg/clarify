require 'spec_helper'

describe "episodes/edit" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :name => "MyString",
      :permalink => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => episodes_path(@episode), :method => "post" do
      assert_select "input#episode_name", :name => "episode[name]"
      assert_select "input#episode_permalink", :name => "episode[permalink]"
      assert_select "textarea#episode_description", :name => "episode[description]"
    end
  end
end
