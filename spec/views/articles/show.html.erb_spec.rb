require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :article_id => 1,
      :name => "Name",
      :description => "Description",
      :price => 1.5,
      :total_in_shelf => 2,
      :total_in_vault => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/1.5/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
