require 'spec_helper'

describe "SigninPages" do
  describe "when visiting website" do
    it "should find dialog" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      page.status_code.should be 200
    end
  end
end
